import React, { Component } from 'react';
import CanvasJSReact from "../lib/canvasjs.react";
//https://canvasjs.com/docs/charts/chart-types/html5-pie-chart/
var CanvasJSChart = CanvasJSReact.CanvasJSChart;
var dataPoints = [];

class Chart extends Component {

    componentDidMount() {
        var webServiceURL = window.webServiceURL;
        var pieChart = this.pieChart;
        var tempurl = webServiceURL !== undefined? webServiceURL: "http://localhost:8080/PIS/rest/top5?userName=Mcsammer&password=tset";
        fetch(tempurl)
            .then(function (response) {
                return response.json();
            }).then(function (data) {
                for (var i = 0; i < data.length; i++) {
                    dataPoints.push({
                        y: data[i].totalCost,
                        name: data[i].name,
                        address: data[i].address,
                        dob: data[i].dob,
                        insurance: data[i].insurance,
                        medRecNo: data[i].medRecNo,
                        click: function (e) {
                            alert(
                                "Name: " + e.dataPoint.name + "\n" +
                                "Address: " + e.dataPoint.address + "\n" +
                                "Dob: " + e.dataPoint.dob + "\n" +
                                "Insurance: " + e.dataPoint.insurance + "\n" +
                                "Med Rec No: " + e.dataPoint.medRecNo
                            );
                        }
                    });
                }

                pieChart.render();
            });        
    }

    render() {
        const pieChart = {
            exportEnabled: true,
            animatedEnabled: true,
            backgroundColor: "#5E4485",
            theme: "dark2",
            title: {
                text: "Top 5 Patients"
            },
            data: [
                {
                    type: "pie",
                    startAngle: 75,
                    toolTipContent: "<b>{name}</b>: {y}",
                    showLegend: "true",
                    legendText: "{name}",
                    indexLabelFontSize: 16,
                    indexLabel: "{name} - {y}",
                    dataPoints: dataPoints
                }
            ]
        };

        return (
            <div id="pieChart">
                <CanvasJSChart options={pieChart}  onRef={ref => (this.pieChart = ref)} />
            </div>
        );
    }
}

export default Chart;
