import 'package:flutter/material.dart';

import 'card.dart';

class BusPage extends StatelessWidget {
  const BusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: const [
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