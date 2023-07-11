import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfilePage extends StatelessWidget {
  final String? imagePath;
  final String? name;
  final String? phoneNumber;

  const ProfilePage({
    Key? key,
    this.imagePath,
    this.name,
    this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String displayedName = name ?? 'John Doe';
    final String displayedPhoneNumber = phoneNumber ?? '+1 234 5678 90';

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            SizedBox(
              height: 160,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 48,
                            backgroundImage: imagePath != null
                                ? AssetImage(imagePath!)
                                : null,
                            child: imagePath == null
                                ? const Icon(Icons.person, size: 48)
                                : null,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  displayedName,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  displayedPhoneNumber,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: IconButton(
                        icon: const Icon(Icons.edit, size: 18,),
                        onPressed: () {
                          // Handle edit button press
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 160,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'My Account',
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                // Handle settings button press
                              },
                              icon: const Icon(Icons.settings, size: 32),
                              color: const Color.fromARGB(255, 0, 68, 145),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Settings',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                // Handle log out button press
                              },
                              icon: const Icon(Icons.logout, size: 32),
                              color: const Color.fromARGB(255, 0, 68, 145),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Log Out',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                // Handle support button press
                              },
                              icon: const Icon(Icons.call, size: 32),
                              color: const Color.fromARGB(255, 0, 68, 145),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Support',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(bottom: 16, left: 96, right: 96),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'User Agreement, ',
                    style: const TextStyle(color: Colors.blue,
                    fontSize: 11
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle User Agreement tap
                        launchUrlString('https://example.com/user-agreement');
                      },
                    children: [
                      TextSpan(
                        text: 'Terms of Services',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 11
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle Terms of Services tap
                            launchUrlString('https://example.com/terms');
                          },
                      ),
                      const TextSpan(text: ' & ', style: TextStyle(
                        color: Colors.black,
                        fontSize: 11)),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 11
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle Privacy Policy tap
                            launchUrlString('https://example.com/privacy');
                          },
                      ),
                      const TextSpan(text: ' of ', style: TextStyle(color: Colors.black,
                      fontSize: 11)),
                      TextSpan(
                        text: 'CliGo',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 11
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle CliGo tap
                            launchUrlString('https://example.com/cligo');
                          },
                      ),
                    ],
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
