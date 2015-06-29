var d_string = $('.temp_information').data('temp');
//var myName = $('meta[bubbling=bubbling_variable]').attr('content');
d_json = JSON.parse(d_string);
daily = d_json.list;
showDailyChart(daily);
