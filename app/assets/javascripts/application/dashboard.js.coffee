class DashboardView
  constructor: () ->
     @run()

   run: =>
    jQuery(document).ready ($) ->

      ###** ToolTips **###

      if $('[data-toggle="tooltip"]').length
        $('[data-toggle="tooltip"]').each (i, item) ->
          $(item).tooltip()
          return

      ###** PopOvers **###

      if $('[data-toggle="popover"]').length
        $('[data-toggle="popover"]').each (i, item) ->
          $(item).popover()
          return

      ###** Vertical Tabs **###

      if $('.vertical-tabs').length
        $('.vertical-tabs').tabs().addClass 'ui-tabs-vertical ui-helper-clearfix'
        $('.vertical-tabs li').removeClass('ui-corner-top').addClass 'ui-corner-left'

      ###** Accordions **###

      if $('.collapsible-accordion').length
        $('.collapsible-accordion').accordion collapsible: true

      ###** Main Menu Animation **###

      $('li.has-submenu>a', 'ul.main-menu').click ->
        link = $(this)
        obj = $(this).parent()
        child = $('ul.submenu', obj)
        $('li.active', 'ul.main-menu').each (i, item) ->
          $(item).removeClass 'active'
          $('ul.submenu', item).slideUp 400
          return
        if $(child).is(':visible')
          $(child).slideUp 400
          $(link).removeClass('close-child').parent().removeClass 'active'
        else
          $(child).slideDown 400
          $(link).addClass('close-child').parent().addClass 'active'
        false

      ###** Sidebar Collapse **###

      $('.sidebar-collapse').on 'click', ->
        $('body').toggleClass 'sidebar-collapsed'
        return

      ###** Remove Box **###

      $('a>i.fa-times', '.box-title').on 'click', ->
        box = $(this).parent().parent().parent()
        $(box).slideUp 600
        false

      ###** Responsive Menu **###

      $('.logo-container').append '<a href="#" class="responsive-menu-trigger"></a>'
      responsive = '<ul class="responsive-menu">'
      $('.main-menu>li').each (i, item) ->
        responsive += '<li><a href="' + $('a', item).attr('href') + '">' + $('a', item).html() + '</a></li>'
        if $('ul.submenu', item).length
          sub = $('ul.submenu', item)
          $('li', sub).each (isa, sub_item) ->
            responsive += '<li class="child"><a href="' + $('a', sub_item).attr('href') + '">' + $('a', sub_item).html() + '</a></li>'
            return
        return
      responsive += '</ul>'
      $(responsive).insertAfter '.logo-container'
      $('.responsive-menu-trigger').on 'click', ->
        $('.responsive-menu').toggle 500
        false
      return

if window.BoardApp.layout == 'dashboard'
  new DashboardView()
  
