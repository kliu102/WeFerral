$(document).ready($(function () {
  // Hide flash messages after timeout
  setTimeout('$(".flash").fadeOut(1000)', 5000);

  // carousel
  if ($('#myCarousel').length > 0) {
    $('#myCarousel .item')[0].setAttribute("class", "item active");
    $('.carousel-indicators li')[0].setAttribute("class", "active");
  }
  // tabbable
  if ($('.tabbable').length > 0) {
    $('.nav-tabs li')[0].setAttribute("class", "active");
    $('#tab0')[0].setAttribute("class", "tab-pane active");
  }
}));