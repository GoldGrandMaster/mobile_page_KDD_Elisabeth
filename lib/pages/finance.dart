import 'package:flutter/material.dart';
import 'package:kdd_health/models/api.dart' as api;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FinanceWidget extends StatefulWidget {
  const FinanceWidget({Key? key}) : super(key: key);

  @override
  _FinanceWidgetState createState() => _FinanceWidgetState();
}

class _FinanceWidgetState extends State<FinanceWidget> {
  dynamic hotelList = {};
  dynamic dayChartList0 = {};
  dynamic dayChartHList1 = {};
  dynamic dayChartHList2 = {};
  int departmentCapacity = 0;
  int amountOfPatients = 0;
  String selectedHospital = '';
  dynamic selectedChartData = {};

  @override
  void initState() {
    super.initState();
    hotelList =
        api.Api().getApiData('GetOccupancyDailyLastGivenDayDataGridOverview');
    dayChartList0 = api.Api().getApiData('GetOccupancyDailyLast28DaysChart/0');
    dayChartHList1 =
        api.Api().getApiData('GetOccupancyDailyLast28DaysChart/Hospital1');
    dayChartHList2 =
        api.Api().getApiData('GetOccupancyDailyLast28DaysChart/Hospital2');
    departmentCapacity = 0;
    departmentCapacity = hotelList
        .map((e) => e['departmentCapacity'])
        .toList()
        .reduce((a, b) => a + b);
    amountOfPatients = hotelList
        .map((e) => e['amountOfPatients'])
        .toList()
        .reduce((a, b) => a + b);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: const Text('Locations:'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("kapazität:" + departmentCapacity.toString()),
                    Text("Belegt:" + amountOfPatients.toString()),
                  ],
                ),
                tileColor: Colors.white,
                onTap: () {
                  dynamic chartData = api.Api()
                      .getApiData('GetOccupancyDailyLast28DaysChart/0');
                  // print('GetOccupancyDailyLast28DaysChart/' +
                  //     hotelList[index]['hospital']);
                  // print(chartData);
                  showModalBottomSheet(
                    context: context,
                    // color is applied to main screen when modal bottom screen is displayed
                    // barrierColor: Colors.greenAccent,
                    //background color for modal bottom screen
                    backgroundColor: Colors.white,
                    //elevates modal bottom screen
                    elevation: 10,
                    // gives rounded corner to modal bottom screen
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    builder: (BuildContext context) {
                      // UDE : SizedBox instead of Container for whitespaces
                      return api.Api()
                          .getBottomSheet(context, 'Hospitals', chartData);
                    },
                  );
                },
              ),
            ),
            const Divider(),
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                itemCount: hotelList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.grey[200],
                              child: FaIcon(
                                FontAwesomeIcons.hospital,
                                size: 14,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(hotelList[index]['hospital']),
                          ],
                        ),
                        // subtitle: Text(hotelList[index]['reportedOn']),
                        trailing: SizedBox(
                          width: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.warehouse,
                                    size: 14,
                                    color: Theme.of(context)
                                        .secondaryHeaderColor
                                        .withAlpha(150),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(hotelList[index]['departmentCapacity']
                                      .toString()),
                                ],
                              ),
                              Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.bed,
                                    size: 14,
                                    color: Theme.of(context)
                                        .secondaryHeaderColor
                                        .withAlpha(150),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(hotelList[index]['amountOfPatients']
                                      .toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                        tileColor: Colors.white,
                        onTap: () {
                          dynamic chartData = api.Api().getApiData(
                              'GetOccupancyDailyLast28DaysChart/' +
                                  hotelList[index]['hospital']);
                          // print('GetOccupancyDailyLast28DaysChart/' +
                          //     hotelList[index]['hospital']);
                          // print(chartData);
                          showModalBottomSheet(
                            context: context,
                            // color is applied to main screen when modal bottom screen is displayed
                            // barrierColor: Colors.greenAccent,
                            //background color for modal bottom screen
                            backgroundColor: Colors.white,
                            //elevates modal bottom screen
                            elevation: 10,
                            // gives rounded corner to modal bottom screen
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            builder: (BuildContext context) {
                              // UDE : SizedBox instead of Container for whitespaces
                              return api.Api().getBottomSheet(context,
                                  hotelList[index]['hospital'], chartData);
                            },
                          );
                        },
                      ),
                      const Divider(
                        height: 1,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
