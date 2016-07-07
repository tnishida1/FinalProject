jQuery(document).on 'turbolinks:load', ->
  $('.multiple-items').slick({
    variableWidth: true,
    infinite: true,
    slidesToShow: 3,
    slidesToScroll: 3
  }); 
