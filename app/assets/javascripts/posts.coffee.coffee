# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# coffeescript code
$(document).on 'turbolinks:before-cache', ->
  KindEditor.remove('.rails_kindeditor')

$(document).on 'turbolinks:load', ->
  $('.rails_kindeditor').each ->
    KindEditor.create "##{$(this).attr('id')}", "allowFileManager": true, "uploadJson": $(this).data('upload'), "fileManagerJson": $(this).data('filemanager'), "width": '100%', "height": '300'