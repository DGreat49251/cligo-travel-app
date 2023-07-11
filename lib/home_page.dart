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
          preferredSize: const Size.fromHeight(500),
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
            title: Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  height: 100,
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text('Cligo'),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications, size: 20, color: Colors.black,),
                  onPressed: () {
                    Navigator.pushNamed(context, '/notifications');
                  },
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(520),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
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
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3), // changes the position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: fromController,
                            decoration: InputDecoration(
                              hintText: 'FROM',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: Color.fromARGB(255, 0, 68, 145), width: 2),
                              ),
                              prefixIcon: const Icon(Icons.location_on),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: toController,
                            decoration: InputDecoration(
                              hintText: 'TO',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: Color.fromARGB(255, 0, 68, 145), width: 2),
                              ),
                              prefixIcon: const Icon(Icons.location_on),
                            ),
                          ),
                          const SizedBox(height: 16),
                          FormBuilderDateTimePicker(
                            name: 'date',
                            controller: dateController,
                            inputType: InputType.date,
                            format: DateFormat('yyyy-MM-dd'),
                            decoration: InputDecoration(
                              hintText: 'DATE',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: Color.fromARGB(255, 0, 68, 145), width: 2),
                              ),
                              prefixIcon: const Icon(Icons.calendar_today),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity, // Set width to 100%
                            child: ElevatedButton.icon(
                              onPressed: _handleSearch,
                              icon: const Icon(Icons.search),
                              label: const Text('SEARCH'),
                            ),
                          ),
                        ],
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
