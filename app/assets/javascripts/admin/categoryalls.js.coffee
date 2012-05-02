# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(".class_admin_choise_category").ready ->
    if $(".class_admin_choise_category").length > 0 
      set_choise_categoryall(parseInt($($(".class_admin_choise_category").children()).find(':radio:checked')[0].value))     

jQuery ->
  $("#panel_contents_attributes_0_border").click ->
    if this.checked
      $($("#panel_contents_attributes_0_border").parent().parent().children()[5]).show() 
    else 
      $($("#panel_contents_attributes_0_border").parent().parent().children()[5]).hide() 
  
jQuery ->
  $(".class_admin_choise_category").children().children().click ->
    switch this.value
      when '0'
        set_choise_categoryall(0)
      when '1'
        set_choise_categoryall(1)
      when '2'
        set_choise_categoryall(2)

set_choise_categoryall = (value_choise_categoryall) ->
  console.log(value_choise_categoryall)
  $($("#id_categoryall").children().children()[value_choise_categoryall + 6]).show()
  cpt = 5 
  while cpt < 9
    $($("#id_categoryall").children().children()[cpt]).hide() unless value_choise_categoryall + 6 == cpt
    cpt += 1  
