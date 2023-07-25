import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

import 'models/passenger.dart';

class ConfirmationPage extends StatelessWidget {
  final List<Passenger> passengers;
  final String busNumber; // Add tfields
  final String arrivalTime;
  final String date;
  final String departureTime;
  final String from;
  final String to;
  final String tripId;
  final double price;

  const ConfirmationPage(
      {Key? key,
      required this.busNumber,
      required this.arrivalTime,
      required this.date,
      required this.departureTime,
      required this.from,
      required this.to,
      required this.tripId,
      required this.passengers,
      required this.price})
      : super(key: key);

  // // Function to format the date
  // String _formatDate(String date) {
  //   final parsedDate = DateTime.parse(date);
  //   final dateFormat = DateFormat('dd MMM, EEE');
  //   return dateFormat.format(parsedDate);
  // }

  Row buildCircleAvatarRow(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        count,
        (index) => const Column(
          children: [
            CircleAvatar(backgroundColor: Colors.grey, radius: 4),
            Divider(color: Color.fromARGB(255, 0, 68, 145)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final formattedDate = _formatDate(date);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Booking Confirmation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Container(
                    color: const Color.fromARGB(255, 0, 68, 145),
                    padding: const EdgeInsets.all(16.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'JK TRAVELS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'PNR: HQ12R75',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          from.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 26,
                              color: Color.fromARGB(255, 0, 68, 145),
                              fontWeight: FontWeight.bold),
                        ),
                        const Icon(Icons.directions_bus, size: 32),
                        Text(
                          to.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 26,
                              color: Color.fromARGB(255, 0, 68, 145),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: buildCircleAvatarRow(
                        20), // Change 10 to the number of CircleAvatars you want
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        columnWidths: const {
                          0: FlexColumnWidth(2),
                          1: FlexColumnWidth(2)
                        },
                        children: [
                          TableRow(children: [
                            const TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Date',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  date,
                                  style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ]),
                          TableRow(children: [
                            const TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Boarding Time',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  departureTime,
                                  style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ]),
                          const TableRow(children: [
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Passenger',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Seat',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ]),
                          //Add each row iteratively based on the number of passengers
                          for (Passenger passenger in passengers)
                            TableRow(children: [
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    passenger.name,
                                    style: const TextStyle(fontSize: 13),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              const TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    '11',
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ]),
                        ]),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  //Download the ticket in PDF format
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 0, 68, 145)),
                ),
                child: const Text('Download PDF'))
          ],
        ),
      ),
    );
  }
}
