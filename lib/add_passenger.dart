import 'package:cligo/payment_page.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'models/passenger.dart';

class AddPassengerPage extends StatelessWidget {
  final String busNumber; // Add tfields
  final String arrivalTime;
  final String date;
  final String departureTime;
  final String from;
  final String to;
  final String tripId;
  final String price;

  const AddPassengerPage({
    Key? key,
    required this.busNumber,
    required this.arrivalTime,
    required this.date,
    required this.departureTime,
    required this.from,
    required this.to,
    required this.tripId,
    required this.price,
  }) : super(key: key);

  // // Function to format the date
  // String _formatDate(String date) {
  //   final parsedDate = DateTime.parse(date);
  //   final dateFormat = DateFormat('dd MMM, EEE');
  //   return dateFormat.format(parsedDate);
  // }

  @override
  Widget build(BuildContext context) {
    // final formattedDate = _formatDate(date);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 68, 145),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    busNumber,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    departureTime,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Text(
                '$from - $to',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    date,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: PassengerPage(
          busNumber: busNumber,
          arrivalTime: arrivalTime,
          date: date,
          departureTime: departureTime,
          from: from,
          to: to,
          tripId: tripId,
          price: price
        ),
      ),
    );
  }
}

class PassengerPage extends StatefulWidget {
  final String busNumber; // Add the fields
  final String arrivalTime;
  final String date;
  final String departureTime;
  final String from;
  final String to;
  final String tripId;
  final String price;

  const PassengerPage({
    Key? key,
    required this.busNumber,
    required this.arrivalTime,
    required this.date,
    required this.departureTime,
    required this.from,
    required this.to,
    required this.tripId,
    required this.price,
  }) : super(key: key);

  @override
  _PassengerPageState createState() => _PassengerPageState(
        busNumber: busNumber,
        arrivalTime: arrivalTime,
        date: date,
        departureTime: departureTime,
        from: from,
        to: to,
        tripId: tripId,
        price: price,
  );
}

class _PassengerPageState extends State<PassengerPage> {
  final List<Passenger> passengers = [];
  final String busNumber; // Add the fields
  final String arrivalTime;
  final String date;
  final String departureTime;
  final String from;
  final String to;
  final String tripId;
  final String price;

  bool showForm = false;

  _PassengerPageState({
    required this.busNumber,
    required this.arrivalTime,
    required this.date,
    required this.departureTime,
    required this.from,
    required this.to,
    required this.tripId, 
    required this.price,
  });

  void _handleAddPassenger(Passenger? newPassenger) {
    setState(() {
      passengers.add(newPassenger!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Material(
            borderRadius: BorderRadius.circular(8.0),
            elevation: 4.0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showForm = !showForm;
                  });
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add Passengers',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 68, 145),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 0, 68, 145),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Divider(
          height: 1,
          color: Color.fromARGB(
              255, 0, 68, 145), // Customize separator color as needed
        ),
        Expanded(
          child: ListView.separated(
            itemCount: passengers.length,
            separatorBuilder: (context, index) => const Divider(
              height: 1,
              color: Color.fromARGB(
                  255, 0, 68, 145), // Customize separator color as needed
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: const TableBorder(
                        horizontalInside: BorderSide(
                      color: Color.fromARGB(255, 0, 68, 145),
                      width: 1.0,
                      style: BorderStyle.solid,
                    )),
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                passengers[index].name,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                passengers[index].age,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                passengers[index].gender,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          TableCell(
                            child: IconButton(
                              icon: const Icon(Icons.edit,
                                  color: Color.fromARGB(255, 0, 68, 145),
                                  size: 16),
                              onPressed: () {
                                // Implement delete functionality here
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Visibility(
          visible: showForm,
          child: PassengerForm(
            onAddPassenger: (newPassenger) {
              if (newPassenger != null) {
                setState(() {
                  passengers.add(newPassenger);
                });
              }
              setState(() {
                showForm = false;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaymentPage(
                        busNumber: busNumber,
                        arrivalTime: arrivalTime,
                        date: date,
                        departureTime: departureTime,
                        from: from,
                        to: to,
                        tripId: tripId,
                        passengers: passengers,
                        price: price)),
              );
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 68, 145),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 16.0),
                    Text(
                      'Next',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PassengerForm extends StatefulWidget {
  final void Function(Passenger?) onAddPassenger;

  const PassengerForm({Key? key, required this.onAddPassenger})
      : super(key: key);

  @override
  _PassengerFormState createState() => _PassengerFormState();
}

class _PassengerFormState extends State<PassengerForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String? _gender;

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Set the border radius here
      ),
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 0, 68, 145))),
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _ageController,
              decoration: const InputDecoration(
                  labelText: 'Age',
                  labelStyle: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 0, 68, 145))),
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            height: 60, // Set the desired height here
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Text("Gender",
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 0, 68, 145))),
                const SizedBox(width: 32.0),
                Radio<String>(
                  value: 'Male',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
                const Text('Male'),
                Radio<String>(
                  value: 'Female',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
                const Text('Female'),
                Radio<String>(
                  value: 'Other',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
                const Text('Other'),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 68, 145),
              ),
              onPressed: () {
                final name = _nameController.text;
                final age = _ageController.text;
                Passenger passenger =
                    Passenger(name: name, age: age, gender: _gender ?? '');
                if (name.isNotEmpty) {
                  widget.onAddPassenger(passenger);
                }
              },
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
