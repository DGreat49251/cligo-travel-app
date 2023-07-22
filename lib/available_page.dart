import 'dart:developer';

import 'package:flutter/material.dart';
import 'card.dart';

class AvailablePage extends StatelessWidget {
  final dynamic tripObject;

  const AvailablePage({Key? key, this.tripObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<dynamic>? responseData = 
        ModalRoute.of(context)?.settings.arguments as List<dynamic>?;
    log(responseData.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          for (final tripData in responseData!)
            YellowBox(
              tripId: tripData[0].toString(),
              icon: Icons.directions_bus,
              from: tripData[2].toString(),
              to: tripData[3].toString(),
              date: tripData[1].toString(),
              available: tripData[8].toString(),
              busNumber: tripData[4].toString(),
              departureTime: tripData[5].toString(),
              arrivalTime: tripData[6].toString(),
            ),
          const SizedBox(height: 5.0),
        ],
      ),
    );
  }
}
