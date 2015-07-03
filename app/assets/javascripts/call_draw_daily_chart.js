
$(document).on('ready page:load', function(){ //the same as $(document).ready
//$(window).on load
  var d = $('.temp_information').data('temp');
  daily = d.list;
  showDailyChart(daily);
});
