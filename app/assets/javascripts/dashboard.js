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
    };

    var chart = new google.visualization.ComboChart(document.getElementById('chart-container'));
    chart.draw(data, options);
}
