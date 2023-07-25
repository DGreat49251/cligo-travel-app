import 'package:flutter/material.dart';

import 'card.dart';

class BusPage extends StatelessWidget {
  const BusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: const [
        Text(
          "Upcoming (1)",
          style: TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 68, 145)),
        ),
        BookingCard(
          icon: Icons.directions_bus,
          from: "from",
          to: "to",
          date: "date",
          name: "name",
        ),
        SizedBox(height: 5.0),
        BookingCard(
          icon: Icons.directions_bus,
          from: "from",
          to: "to",
          date: "date",
          name: "name",
        ),
        SizedBox(height: 5.0),
      ],
    );
  }
}
