class BoardsView
  constructor: () ->
     @run()

   run: =>
    jQuery(document).ready ($) ->

      # Autofocus on the input for easy of use
      $('#myModal').on 'shown.bs.modal', ->
        $('#title').focus()
        return
      return

if window.BoardApp.view == 'boards'
  new BoardsView()
  
