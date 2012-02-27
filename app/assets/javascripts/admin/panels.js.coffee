# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(document).ready ->
    $("#admin_panels").sortable({
      items: '.panel',
      update: ->
        $.ajax({
          url: "/admin/panels/sort",
          type: "POST",
          data: $(this).sortable('serialize'),
          failure: ->
            alert("Problem sortable list panel")
        })
    })

jQuery ->
  $(".class_admin_panel_categoryall_or_content").children().children().click ->
    if $(this)[0].checked
      switch $(this)[0].value
        when '3'
          set_choise_panel(3)
        when '2'
          set_choise_panel(2)
        when '1' 
          set_choise_panel(1)

jQuery ->
  $(".class_admin_panel_categoryall_or_content").children().children().ready ->
    if $(".class_admin_panel_categoryall_or_content").length > 0
      id_choise_category = parseInt($($(".class_admin_panel_categoryall_or_content").children()).find(':radio:checked')[0].value)
      set_choise_panel(id_choise_category)
     
       
set_choise_panel = (value_choise_panel) ->
      $($(".class_admin_panel_categoryall_or_content").parent().children()[value_choise_panel + 4]).show()
      cpt = 5
      while cpt < 8
        $($(".class_admin_panel_categoryall_or_content").parent().children()[cpt]).hide() unless value_choise_panel + 4 == cpt
        cpt += 1
