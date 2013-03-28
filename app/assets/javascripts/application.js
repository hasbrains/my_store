//= require jquery
//= require jquery_ujs
//= require_tree .

jQuery(function($) {
  
  $('#crop_image').Jcrop({
    onSelect: writeCoordinates,
    boxWidth: 400,
    aspectRatio: 1,
    minSize: [400,400],
    setSelect: [0,0,400,400]
  });

  function writeCoordinates(c) {
    $('#item_image_crop_data_x').val(c.x);
    $('#item_image_crop_data_y').val(c.y);
    $('#item_image_crop_data_width').val(c.w);
    $('#item_image_crop_data_height').val(c.h);
  }

});
