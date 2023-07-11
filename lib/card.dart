import 'package:flutter/material.dart';

class YellowBox extends StatelessWidget {
  final IconData icon;
  final String from;
  final String to;
  final String date;
  final String available;

  const YellowBox({super.key, 
    required this.icon,
    required this.from,
    required this.to,
    required this.date,
    required this.available,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 105.0,
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 227, 216, 65),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.black,
                    size: 24.0,
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Scheduled | $date',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 11.0,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                from,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Icon(
                              Icons.send,
                              color: Color.fromARGB(255, 0, 68, 145),
                              size: 22,
                            ),
                            Expanded(
                              child: Text(
                                to,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        const Row(
                          children: [
                            Expanded(
                              child: Text(
                                '09.30 AM',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                '4hr 30 min',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 7.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                '12.30 PM',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 80.0,
            height: 105.0,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 225, 239, 255),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  available.toString(),
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                const Text(
                  'Available',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 11.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final IconData icon;
  final String from;
  final String to;
  final String date;
  final String name;

  const BookingCard({super.key, 
    required this.icon,
    required this.from,
    required this.to,
    required this.date,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 105.0,
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 227, 216, 65),
                borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.black,
                    size: 24.0,
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Scheduled | $date',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 11.0,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                from,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Icon(
                              Icons.send,
                              color: Color.fromARGB(255, 0, 68, 145),
                              size: 22,
                            ),
                            Expanded(
                              child: Text(
                                to,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            const Icon(Icons.person, color: Colors.black, size: 11.0),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.0,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

