import 'package:flutter/material.dart';
import 'card.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (arguments == null) {
      const String tripType = "Bus";
      const String from = "Source";
      const String to = "Destination";
      const String date = "DD-MM-YYYY";
      const String name = "John Doe";
      return Scaffold(
        appBar: AppBar(
          title: const Text('Bookings'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: const [
            Text(
              "Upcoming (1)",
              style: TextStyle(
                fontSize: 11.0, 
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 68, 145)
              ),
            ),
            BookingCard(
              icon: tripType == 'Bus' ? Icons.directions_bus : Icons.local_taxi,
              from: from,
              to: to,
              date: date,
              name: name,
            ),
            SizedBox(height: 5.0),
            BookingCard(
              icon: tripType == 'Bus' ? Icons.directions_bus : Icons.local_taxi,
              from: from,
              to: to,
              date: date,
              name: name,
            ),
            SizedBox(height: 5.0),
            Text(
              "Last Month",
              style: TextStyle(
                fontSize: 11.0, 
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 68, 145)
              ),
            ),
            BookingCard(
              icon: tripType == 'Bus' ? Icons.directions_bus : Icons.local_taxi,
              from: from,
              to: to,
              date: date,
              name: name,
            ),
            SizedBox(height: 5.0),
            BookingCard(
              icon: tripType == 'Bus' ? Icons.directions_bus : Icons.local_taxi,
              from: from,
              to: to,
              date: date,
              name: name,
            ),
            SizedBox(height: 5.0),
            BookingCard(
              icon: tripType == 'Bus' ? Icons.directions_bus : Icons.local_taxi,
              from: from,
              to: to,
              date: date,
              name: name,
            ),
            SizedBox(height: 5.0),
            BookingCard(
              icon: tripType == 'Bus' ? Icons.directions_bus : Icons.local_taxi,
              from: from,
              to: to,
              date: date,
              name: name,
            ),
            SizedBox(height: 5.0),
            BookingCard(
              icon: tripType == 'Bus' ? Icons.directions_bus : Icons.local_taxi,
              from: from,
              to: to,
              date: date,
              name: name,
            ),
            SizedBox(height: 5.0),
            BookingCard(
              icon: tripType == 'Bus' ? Icons.directions_bus : Icons.local_taxi,
              from: from,
              to: to,
              date: date,
              name: name,
            ),
            SizedBox(height: 5.0),
            BookingCard(
              icon: tripType == 'Bus' ? Icons.directions_bus : Icons.local_taxi,
              from: from,
              to: to,
              date: date,
              name: name,
            ),
          ],
        ),
      );
    }

    final String tripType = arguments['tripType'] ?? '';
    final String from = arguments['from'] ?? '';
    final String to = arguments['to'] ?? '';
    final String date = arguments['date'] ?? '';
    final String name = arguments['name'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          BookingCard(
            icon: tripType == 'Bus' ? Icons.directions_bus : Icons.local_taxi,
            from: from,
            to: to,
            date: date,
            name: name,
          ),
          const SizedBox(height: 5.0),
          BookingCard(
            icon: tripType == 'Bus' ? Icons.directions_bus : Icons.local_taxi,
            from: from,
            to: to,
            date: date,
            name: name,
          ),
          const SizedBox(height: 5.0),
          BookingCard(
            icon: tripType == 'Bus' ? Icons.directions_bus : Icons.local_taxi,
            from: from,
            to: to,
            date: date,
            name: name,
          ),
          const SizedBox(height: 5.0),
          BookingCard(
            icon: tripType == 'Bus' ? Icons.directions_bus : Icons.local_taxi,
            from: from,
            to: to,
            date: date,
            name: name,
          ),
        ],
      ),
    );
  }
}
