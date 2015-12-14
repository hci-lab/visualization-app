ipc_render = require('electron').ipcRenderer



split_editor = (calling_div)->
  hidden_pane_elements = $("body").find( ":hidden" ).not("script")
  console.log hidden_pane_elements
  $(hidden_pane_elements[0]).show()
  visible_pane_elements = $( "div:visible" )
  console.log visible_pane_elements

ipc_render.send 'asyn-msg' , 'ping'
ipc_render.on 'asyn-reply', (event,arg)->
  console.log arg


$ ->
  $('#pane_2').hide()
  $('#pane_3').hide()
  $('#pane_4').hide()
  $('#newWindow').click ->
    if $('#newWindow').hasClass("active")
      $('#newWindow').removeClass("active");
      ipc_render.send 'close_window' , 'newWindow'
    else
      $('#newWindow').addClass("active");
      ipc_render.send 'open_window' , 'newWindow'
  return



