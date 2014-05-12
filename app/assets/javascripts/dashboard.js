// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
function drawChart() {
	var data = google.visualization.arrayToDataTable(chart_data);

    var options = {
      curveType: 'function',
      explorer: {axis: 'horizontal', keepInBounds: true},
      vAxis: {minValue:0, maxValue:5, ticks: [0,1,2,3,4,5]},
      pointSize: 3,
      chartArea: {'width': '95%', 'height': '80%'},
      legend: {'position': 'none'}
    };

    var chart = new google.visualization.ComboChart(document.getElementById('chart-container'));
    chart.draw(data, options);
}

$(function() {
    $('.indicator').each(function() {
          var value = $(this).attr('data-indicator-value');
          var colour = "#C0C0C0";

          if(value == 5) {
            colour = '#6CF556';
          } else if(value >= 4.5) {
            colour = '#89F556';
          } else if(value >= 4) {
            colour = '#A7F556';
          } else if(value >= 3.5) {
            colour = '#C5F556';
          } else if(value >= 3) {
            colour = '#E3F556';
          } else if(value >= 2.5) {
            colour = '#F5E856';
          } else if(value >= 2) {
            colour = '#F5CA56';
          } else if(value >= 1.5) {
            colour = '#F5AC56';
          } else if(value >= 1) {
            colour = '#F58E56';
          } else if(value >= 0.5) {
            colour = '#F57156';
          } 

          $(this).css('background', colour);
    });
  });