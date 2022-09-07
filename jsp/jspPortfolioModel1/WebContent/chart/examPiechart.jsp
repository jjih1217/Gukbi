<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "_inc_top.jsp" %>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load("current", {packages:["corechart"]});
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ['Task111', 'Hours per Day'],
      ['Work',     11],
      ['Eat',      2],
      ['Commute333',  2],
      ['Watch TV444', 2],
      ['Sleep555',    7]
    ]);

    var options = {
      title: '샘플차트 01',
      pieHole: 0.4,
    };

    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
</script>
<div id="chart_div" style="width: 900px; height: 500px;"></div>
