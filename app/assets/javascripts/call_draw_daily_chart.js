$(function(){ //the same as $(document).ready
  var d = $('.temp_information').data('temp');
  daily = d.list;
  showDailyChart(daily);
});
