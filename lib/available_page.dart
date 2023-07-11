import 'package:flutter/material.dart';
import 'card.dart';

class AvailablePage extends StatelessWidget {
  const AvailablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (arguments == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Available'),
        ),
        body: const Center(
          child: Text('No search parameters found.'),
        ),
      );
    }

    final String tripType = arguments['tripType'] ?? '';
    final String from = arguments['from'] ?? '';
    final String to = arguments['to'] ?? '';
    final String date = arguments['date'] ?? '';
    final String available = arguments['available'].toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Available'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          YellowBox(
            icon: tripType == 'Bus' ? Icons.directions_bus : Icons.local_taxi,
            from: from,
            to: to,
            date: date,
            available: available,
          ),
          const SizedBox(height: 5.0),
          YellowBox(
            icon: tripType == 'Bus' ? Icons.directions_bus : Icons.local_taxi,
            from: from,
            to: to,
            date: date,
            available: available,
          ),
          const SizedBox(height: 5.0),
          YellowBox(
            icon: tripType == 'Bus' ? Icons.directions_bus : Icons.local_taxi,
            from: from,
            to: to,
            date: date,
            available: available,
          ),
          const SizedBox(height: 5.0),
          YellowBox(
            icon: tripType == 'Bus' ? Icons.directions_bus : Icons.local_taxi,
            from: from,
            to: to,
            date: date,
            available: available,
          ),
        ],
      ),
    );
  }
}

