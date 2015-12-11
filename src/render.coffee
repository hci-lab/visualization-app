remote     = require('electron').remote
Menu       = remote.Menu
MenuItem   = remote.MenuItem
ipc_render = require('electron').ipcRenderer

menu       = new Menu()
menu.append(new MenuItem({ label: 'Split', click: ()->
  console.log('Split clicked')
} ))
menu.append(new MenuItem({ type: 'separator' }))
menu.append(new MenuItem({ label: 'Close', click: ()->
  console.log('Close clicked')
} ))



document.addEventListener 'contextmenu', (e)->
  e.preventDefault();
  menu.popup(remote.getCurrentWindow())
, false


ipc_render.send 'asyn-msg' , 'ping'
ipc_render.on 'asyn-reply', (event,arg)->
  console.log arg


$ ->
  $('#newWindow').click ->
    if $('#newWindow').hasClass("active")
      $('#newWindow').removeClass("active");
      ipc_render.send 'close_window' , 'newWindow'
    else
      $('#newWindow').addClass("active");
      ipc_render.send 'open_window' , 'newWindow'
  return



