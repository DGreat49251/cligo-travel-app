import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import 'bus_page.dart';
import 'cab_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const BusPage(),
    const CabPage(),
  ];

  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  String tripType = 'Bus';

  void _handleSearch() {
    final String from = fromController.text;
    final String to = toController.text;
    final String date = dateController.text;

    // Perform API call with search parameters

    // Navigate to the "/available" route with the fetched result
    Navigator.pushNamed(context, '/available', arguments: {
      'tripType': tripType,
      'from': from,
      'to': to,
      'date': date,
      'available': 10
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(450),
          child: AppBar(
            leading: null,
            backgroundColor: Colors.white,
            elevation: 10,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 40),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                    height: 100,
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(''),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      size: 20,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/notifications');
                    },
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(300),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: TabBar(
                      onTap: (index) {
                        setState(() {
                          _selectedIndex = index;
                          tripType = _selectedIndex == 0 ? 'Bus' : 'Taxi';
                        });
                      },
                      tabs: const [
                        Tab(
                          icon: Icon(Icons.directions_bus, size: 40),
                          child: Text(
                            'BUS',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Tab(
                          icon: Icon(Icons.directions_car, size: 40),
                          child: Text(
                            'TAXI',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Color.fromARGB(255, 0, 68, 145),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 30, right: 16, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes the position of shadow
                          ),
                        ],
                      ),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          border: TableBorder(
                            top: BorderSide(
                                color: Colors.grey.withOpacity(0.5), width: 1),
                            right: BorderSide(
                                color: Colors.grey.withOpacity(0.5), width: 1),
                            bottom: BorderSide(
                                color: Colors.grey.withOpacity(0.5), width: 1),
                            left: BorderSide(
                                color: Colors.grey.withOpacity(0.5), width: 1),
                            horizontalInside: BorderSide(
                              width: 1,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          columnWidths: const {
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(3),
                          },
                          children: [
                            TableRow(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 16, top: 0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on),
                                      SizedBox(width: 8),
                                      Text(
                                        'From',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: TextFormField(
                                    controller: fromController,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Source',
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 16, top: 0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on),
                                      SizedBox(width: 8),
                                      Text(
                                        'To',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: TextFormField(
                                    controller: toController,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Destination',
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 16, top: 0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.calendar_today),
                                      SizedBox(width: 8),
                                      Text(
                                        'Date',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: FormBuilderDateTimePicker(
                                    name: 'date',
                                    controller: dateController,
                                    inputType: InputType.date,
                                    format: DateFormat('dd MMM, EEE'),
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Date of Journey',
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity, // Set width to 100%
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 20),
                      child: ElevatedButton.icon(
                        onPressed: _handleSearch,
                        icon: const Icon(Icons.search),
                        label: const Text('SEARCH'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: _pages,
        ),
      ),
    );
  }
}
