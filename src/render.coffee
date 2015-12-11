remote     = require('electron').remote
Menu       = remote.Menu
MenuItem   = remote.MenuItem
ipc_render = require('electron').ipcRenderer

menu       = new Menu()
menu.append(new MenuItem({ label: 'MenuItem1', click: ()->
  console.log('item 1 clicked')
} ))
menu.append(new MenuItem({ type: 'separator' }))
menu.append(new MenuItem({ label: 'MenuItem2', type: 'checkbox', checked: true }))

window.addEventListener 'contextmenu', (e)->
  e.preventDefault();
  menu.popup(remote.getCurrentWindow())
, false


ipc_render.send 'asyn-msg' , 'ping'
ipc_render.on 'asyn-reply', (event,arg)->
  console.log arg


$ ->
  $('#newWindow').click ->
    ipc_render.send 'open_window' , 'newWindow'
  return



