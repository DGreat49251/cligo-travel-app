import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'confirmation_page.dart';
import 'models/passenger.dart';

class PaymentPage extends StatelessWidget {
  static const gstRate = 18;
  final List<Passenger> passengers;
  final String busNumber; // Add tfields
  final String arrivalTime;
  final String date;
  final String departureTime;
  final String from;
  final String to;
  final String tripId;
  final String price;

  const PaymentPage({
    Key? key,
    required this.busNumber,
    required this.arrivalTime,
    required this.date,
    required this.departureTime,
    required this.from,
    required this.to,
    required this.tripId,
    required this.passengers, 
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
    final grossPrice = passengers.length * double.parse(price);
    final nettPrice = (1 + gstRate / 100) * grossPrice;
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
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    departureTime,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              Text(
                '$from - $to',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    date,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Summary',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 68, 145),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 2,
                        width: double.infinity,
                        color: const Color.fromARGB(255, 0, 68, 145),
                      ),
                      const SizedBox(height: 8),
                      Table(
                        columnWidths: const <int, TableColumnWidth>{
                          0: FractionColumnWidth(0.4),
                          1: FractionColumnWidth(0.3),
                          2: FractionColumnWidth(0.3),
                        },
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(
                            children: [
                              const TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Passengers",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    passengers.length.toString(),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Rs. ${grossPrice.toStringAsFixed(2)}",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "GST",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              const TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "$gstRate%",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Rs. ${(nettPrice - grossPrice).toStringAsFixed(2)}",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmationPage(
                        busNumber: busNumber,
                        arrivalTime: arrivalTime,
                        date: date,
                        departureTime: departureTime,
                        from: from,
                        to: to,
                        tripId: tripId,
                        passengers: passengers,
                        price: nettPrice
                      ),
                    )
                  );
                },
                child: Container(
                  height: 60,
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
                          'Proceed to Payment',
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
        ),
      ),
    );
  }
}
