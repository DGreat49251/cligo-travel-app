import 'package:flutter/material.dart';

import 'card.dart';

class CabPage extends StatelessWidget {
  const CabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: const [
        BookingCard(
          icon: Icons.local_taxi,
          from: "from",
          to: "to",
          date: "date",
          name: "name",
        ),
        SizedBox(height: 5.0),
        BookingCard(
          icon: Icons.local_taxi,
          from: "from",
          to: "to",
          date: "date",
          name: "name",
        ),
      ],
    );
  }
}