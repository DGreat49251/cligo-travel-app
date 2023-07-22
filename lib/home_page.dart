import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;


import 'bus_page.dart';
import 'cab_page.dart';
import 'from_screen.dart';
import 'to_screen.dart';

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

  void _handleSearch() async {
  final String from = fromController.text;
  final String to = toController.text;
  final String date = dateController.text;

  // Replace 'your_api_endpoint' with the actual API endpoint for fetching available data
  const String apiUrl = 'https://dzwwjt49od.execute-api.ap-south-1.amazonaws.com/cligoapi/cligodb?tb_name=trip';

  try {
    // Make the API call
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      // Parse the response data (assuming the API returns JSON data)
      final List<dynamic> responseData = json.decode(response.body);
      // Assuming the API returns an array of objects, each representing a trip
      // We'll consider the first trip from the response for sending as an object of trip type
      if (responseData.isNotEmpty) {
        // Navigate to the "/available" route with the trip object as an argument
        Navigator.pushNamed(context, '/available', arguments: responseData);
      } else {
        // Handle the case where no trips are available in the response
        log('No available trips found in the response.');
      }
    } else {
      // Handle API error or bad response
      throw Exception('Failed to fetch data from the API');
    }
  } catch (e) {
    // Handle any exceptions or errors that occur during the API call
    log('API call error: $e');
    // Show an error message or handle the error as needed
  }
}


  Future<void> _navigateAndReturnData(String field) async {
    final TextEditingController textController = TextEditingController(
        text: field == 'from' ? fromController.text : toController.text);

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          if (field == 'from') {
            return FromScreen(textController: textController);
          } else if (field == 'to') {
            return ToScreen(textController: textController);
          }
          return Container();
        },
      ),
    );

    if (result != null && result is String) {
      if (field == 'from') {
        setState(() {
          fromController.text = result;
        });
      } else if (field == 'to') {
        setState(() {
          toController.text = result;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(450),
          child: AppBar(
            leadingWidth: 0,
            leading: Container(),
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
                                GestureDetector(
                                  onTap: () => _navigateAndReturnData('from'),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 16),
                                    child: Text(
                                      fromController.text.isNotEmpty
                                          ? fromController.text
                                          : 'Enter Source',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: fromController.text.isNotEmpty
                                            ? Colors.black
                                            : Colors.grey,
                                      ),
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
                                GestureDetector(
                                  onTap: () => _navigateAndReturnData('to'),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 16),
                                    child: Text(
                                      toController.text.isNotEmpty
                                          ? toController.text
                                          : 'Enter Destination',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: toController.text.isNotEmpty
                                            ? Colors.black
                                            : Colors.grey,
                                      ),
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
