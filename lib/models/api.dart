import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Api {
  dynamic chartData = {};
  int maxValue = 0;
  dynamic getApiData(String url) {
    String jsonStr = '[]';

    switch (url) {
      case "GetOccupancyDailyLastGivenDayDataGridOverview":
        jsonStr = '''
          [
              {
                  "governmentHospitalId": 0,
                  "departmentName": null,
                  "amountOfPatients": 21,
                  "departmentCapacity": 29,
                  "reportedOn": "0001-01-01T00:00:00",
                  "id": 0,
                  "governmentHospital": null,
                  "hospital": "Hospital1"
              },
              {
                  "governmentHospitalId": 0,
                  "departmentName": null,
                  "amountOfPatients": 24,
                  "departmentCapacity": 40,
                  "reportedOn": "0001-01-01T00:00:00",
                  "id": 0,
                  "governmentHospital": null,
                  "hospital": "Hospital2"
              }
          ]  
        ''';
        break;
      case "GetOccupancyDailyLast28DaysChart/0":
        jsonStr = '''
          [{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":22,"departmentCapacity":69,"reportedOn":"2022-11-02T02:00:01.45","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":26,"departmentCapacity":69,"reportedOn":"2022-11-03T02:00:00.863","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":31,"departmentCapacity":69,"reportedOn":"2022-11-04T02:00:15.803","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":34,"departmentCapacity":69,"reportedOn":"2022-11-05T02:00:12.263","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":27,"departmentCapacity":69,"reportedOn":"2022-11-06T02:00:13.6","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":21,"departmentCapacity":69,"reportedOn":"2022-11-07T02:00:16.833","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":39,"departmentCapacity":69,"reportedOn":"2022-11-08T09:48:59.99","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":43,"departmentCapacity":69,"reportedOn":"2022-11-09T02:00:11.303","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":39,"departmentCapacity":69,"reportedOn":"2022-11-10T02:00:05.093","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":48,"departmentCapacity":69,"reportedOn":"2022-11-11T02:00:08.553","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":46,"departmentCapacity":69,"reportedOn":"2022-11-12T02:00:08.963","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":32,"departmentCapacity":69,"reportedOn":"2022-11-13T02:00:08.29","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":24,"departmentCapacity":69,"reportedOn":"2022-11-14T02:00:09.337","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":29,"departmentCapacity":69,"reportedOn":"2022-11-15T02:00:09.36","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":28,"departmentCapacity":69,"reportedOn":"2022-11-16T02:00:03.76","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":42,"departmentCapacity":69,"reportedOn":"2022-11-17T02:00:05.973","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":46,"departmentCapacity":69,"reportedOn":"2022-11-18T02:00:10.577","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":61,"departmentCapacity":69,"reportedOn":"2022-11-19T02:00:12.677","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":43,"departmentCapacity":69,"reportedOn":"2022-11-20T02:00:10.203","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":19,"departmentCapacity":69,"reportedOn":"2022-11-21T02:00:06.763","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":26,"departmentCapacity":69,"reportedOn":"2022-11-22T02:00:10.21","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":40,"departmentCapacity":69,"reportedOn":"2022-11-23T02:00:01.693","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":45,"departmentCapacity":69,"reportedOn":"2022-11-24T02:00:00.88","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":46,"departmentCapacity":69,"reportedOn":"2022-11-25T02:00:08.637","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":30,"departmentCapacity":69,"reportedOn":"2022-11-26T02:00:06.693","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":20,"departmentCapacity":69,"reportedOn":"2022-11-27T02:00:05.033","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":17,"departmentCapacity":69,"reportedOn":"2022-11-28T02:00:02.26","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":30,"departmentCapacity":69,"reportedOn":"2022-11-29T02:00:07.41","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":45,"departmentCapacity":69,"reportedOn":"2022-11-30T02:00:08.873","id":0,"governmentHospital":null,"hospital":null}]
        ''';
        break;
      case "GetOccupancyDailyLast28DaysChart/Hospital1":
        jsonStr = '''
          [{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":4,"departmentCapacity":29,"reportedOn":"2022-11-02T02:00:01.45","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":16,"departmentCapacity":29,"reportedOn":"2022-11-03T02:00:00.863","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":19,"departmentCapacity":29,"reportedOn":"2022-11-04T02:00:15.803","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":18,"departmentCapacity":29,"reportedOn":"2022-11-05T02:00:12.263","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":9,"departmentCapacity":29,"reportedOn":"2022-11-06T02:00:13.6","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":5,"departmentCapacity":29,"reportedOn":"2022-11-07T02:00:16.833","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":19,"departmentCapacity":29,"reportedOn":"2022-11-08T09:48:59.99","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":19,"departmentCapacity":29,"reportedOn":"2022-11-09T02:00:11.303","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":19,"departmentCapacity":29,"reportedOn":"2022-11-10T02:00:05.093","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":23,"departmentCapacity":29,"reportedOn":"2022-11-11T02:00:08.553","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":20,"departmentCapacity":29,"reportedOn":"2022-11-12T02:00:08.963","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":9,"departmentCapacity":29,"reportedOn":"2022-11-13T02:00:08.29","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":5,"departmentCapacity":29,"reportedOn":"2022-11-14T02:00:09.337","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":15,"departmentCapacity":29,"reportedOn":"2022-11-15T02:00:09.36","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":19,"departmentCapacity":29,"reportedOn":"2022-11-16T02:00:03.76","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":23,"departmentCapacity":29,"reportedOn":"2022-11-17T02:00:05.973","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":19,"departmentCapacity":29,"reportedOn":"2022-11-18T02:00:10.577","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":26,"departmentCapacity":29,"reportedOn":"2022-11-19T02:00:12.677","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":14,"departmentCapacity":29,"reportedOn":"2022-11-20T02:00:10.203","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":8,"departmentCapacity":29,"reportedOn":"2022-11-21T02:00:06.763","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":15,"departmentCapacity":29,"reportedOn":"2022-11-22T02:00:10.21","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":25,"departmentCapacity":29,"reportedOn":"2022-11-23T02:00:01.693","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":27,"departmentCapacity":29,"reportedOn":"2022-11-24T02:00:00.88","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":27,"departmentCapacity":29,"reportedOn":"2022-11-25T02:00:08.637","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":23,"departmentCapacity":29,"reportedOn":"2022-11-26T02:00:06.693","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":14,"departmentCapacity":29,"reportedOn":"2022-11-27T02:00:05.033","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":7,"departmentCapacity":29,"reportedOn":"2022-11-28T02:00:02.26","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":15,"departmentCapacity":29,"reportedOn":"2022-11-29T02:00:07.41","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":21,"departmentCapacity":29,"reportedOn":"2022-11-30T02:00:08.873","id":0,"governmentHospital":null,"hospital":null}]
        ''';
        break;
      case "GetOccupancyDailyLast28DaysChart/Hospital2":
        jsonStr = '''
          [{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":18,"departmentCapacity":40,"reportedOn":"2022-11-02T02:00:01.45","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":10,"departmentCapacity":40,"reportedOn":"2022-11-03T02:00:00.863","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":12,"departmentCapacity":40,"reportedOn":"2022-11-04T02:00:15.803","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":16,"departmentCapacity":40,"reportedOn":"2022-11-05T02:00:12.263","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":18,"departmentCapacity":40,"reportedOn":"2022-11-06T02:00:13.6","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":16,"departmentCapacity":40,"reportedOn":"2022-11-07T02:00:16.833","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":20,"departmentCapacity":40,"reportedOn":"2022-11-08T09:48:59.99","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":24,"departmentCapacity":40,"reportedOn":"2022-11-09T02:00:11.303","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":20,"departmentCapacity":40,"reportedOn":"2022-11-10T02:00:05.093","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":25,"departmentCapacity":40,"reportedOn":"2022-11-11T02:00:08.553","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":26,"departmentCapacity":40,"reportedOn":"2022-11-12T02:00:08.963","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":23,"departmentCapacity":40,"reportedOn":"2022-11-13T02:00:08.29","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":19,"departmentCapacity":40,"reportedOn":"2022-11-14T02:00:09.337","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":14,"departmentCapacity":40,"reportedOn":"2022-11-15T02:00:09.36","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":9,"departmentCapacity":40,"reportedOn":"2022-11-16T02:00:03.76","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":19,"departmentCapacity":40,"reportedOn":"2022-11-17T02:00:05.973","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":27,"departmentCapacity":40,"reportedOn":"2022-11-18T02:00:10.577","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":35,"departmentCapacity":40,"reportedOn":"2022-11-19T02:00:12.677","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":29,"departmentCapacity":40,"reportedOn":"2022-11-20T02:00:10.203","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":11,"departmentCapacity":40,"reportedOn":"2022-11-21T02:00:06.763","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":11,"departmentCapacity":40,"reportedOn":"2022-11-22T02:00:10.21","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":15,"departmentCapacity":40,"reportedOn":"2022-11-23T02:00:01.693","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":18,"departmentCapacity":40,"reportedOn":"2022-11-24T02:00:00.88","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":19,"departmentCapacity":40,"reportedOn":"2022-11-25T02:00:08.637","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":7,"departmentCapacity":40,"reportedOn":"2022-11-26T02:00:06.693","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":6,"departmentCapacity":40,"reportedOn":"2022-11-27T02:00:05.033","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":10,"departmentCapacity":40,"reportedOn":"2022-11-28T02:00:02.26","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":15,"departmentCapacity":40,"reportedOn":"2022-11-29T02:00:07.41","id":0,"governmentHospital":null,"hospital":null},{"governmentHospitalId":0,"departmentName":null,"amountOfPatients":24,"departmentCapacity":40,"reportedOn":"2022-11-30T02:00:08.873","id":0,"governmentHospital":null,"hospital":null}]
        ''';
        break;
      default:
        return null;
    }
    return jsonDecode(jsonStr);
  }

  Widget getBottomSheet(BuildContext context, String title, dynamic chartData) {
    this.chartData = chartData;
    List<FlSpot> chartSpots = <FlSpot>[];

    for (int i = 0; i < chartData.length; i++) {
      if (chartData[i]['amountOfPatients'] > maxValue) {
        maxValue = chartData[i]['amountOfPatients'];
      }
      chartSpots.add(
          FlSpot(i.toDouble(), chartData[i]['amountOfPatients'].toDouble()));
    }

    print(chartSpots);
    List<Color> gradientColors = [
      const Color(0xff23b6e6),
      const Color(0xff02d39a),
    ];

    return SizedBox(
      height: 450,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.grey[200],
                  child: FaIcon(
                    FontAwesomeIcons.hospital,
                    size: 22,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(title,
                    style: TextStyle(
                      color: Color(0xff68737d),
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    )),
              ],
            ),
          ),
          Divider(),
          AspectRatio(
            aspectRatio: 1.5,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 18,
                  left: 12,
                  top: 24,
                  bottom: 12,
                ),
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: false,
                      drawVerticalLine: false,
                      horizontalInterval: 1,
                      verticalInterval: 1,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Color.fromARGB(255, 224, 224, 224),
                          strokeWidth: 1,
                        );
                      },
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color: Color.fromARGB(255, 233, 240, 247),
                          strokeWidth: 1,
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 50,
                          interval: 1,
                          getTitlesWidget: bottomTitleWidgets,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          getTitlesWidget: leftTitleWidgets,
                          reservedSize: 30,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                      border: Border.all(color: const Color(0xff37434d)),
                    ),
                    minX: 0,
                    maxX: 28,
                    minY: 0,
                    maxY: maxValue.toDouble(),
                    lineBarsData: [
                      LineChartBarData(
                        spots: chartSpots,
                        isCurved: true,
                        gradient: LinearGradient(
                          colors: gradientColors,
                        ),
                        barWidth: 5,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: false,
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: gradientColors
                                .map((color) => color.withOpacity(0.3))
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    Widget text;
    text = SizedBox(
      width: 16,
      height: 40,
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
            chartData[value.toInt()]['reportedOn'].toString().substring(5, 10),
            style: style),
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    if (value % 10 == 0) {
      text = ((value / 10).toInt() * 10).toString();
    } else {
      return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
