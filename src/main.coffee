electron       = require 'electron'
app            = electron.app
browser_window = electron.BrowserWindow
ipc_main       = require('electron').ipcMain
electron.crashReporter.start()

main_window = null

app.on 'window-all-closed', ()->
  if process.platform isnt 'darwin'
    app.quit()


app.on 'ready', ()->
  main_window     = new browser_window {width: 800, height: 600}
  main_window.loadURL 'file:///' + __dirname + '/index.html'
  main_window.webContents.openDevTools()

  main_window.on 'closed', ()->
    main_window  = null



ipc_main.on 'asyn-msg', (event,arg)->
  console.log arg
  event.sender.send 'asyn-reply', 'pong'


ipc_main.on 'open_window', (event,arg)->
  tool_box       = null
  tool_box       = new browser_window {width: 200, height: 500, frame: false}