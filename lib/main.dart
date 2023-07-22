import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'profile_page.dart';
import 'bookings_page.dart';
import 'home_page.dart';
import 'available_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final MaterialColor deepBlue = const MaterialColor(
    0xFF004491,
    <int, Color>{
      50: Color.fromRGBO(0, 68, 145, 0.1),
      100: Color.fromRGBO(0, 68, 145, 0.2),
      200: Color.fromRGBO(0, 68, 145, 0.3),
      300: Color.fromRGBO(0, 68, 145, 0.4),
      400: Color.fromRGBO(0, 68, 145, 0.5),
      500: Color.fromRGBO(0, 68, 145, 0.6),
      600: Color.fromRGBO(0, 68, 145, 0.7),
      700: Color.fromRGBO(0, 68, 145, 0.8),
      800: Color.fromRGBO(0, 68, 145, 0.9),
      900: Color.fromRGBO(0, 68, 145, 1.0),
    },
  );
  static const Color deepBlueLabel = Color.fromARGB(255, 0, 68, 145);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cligo',
      theme: ThemeData(
        primarySwatch: deepBlue,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: deepBlueLabel,
          unselectedLabelColor: Colors.grey,
          indicator: BoxDecoration(
            color: Colors.white,
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/bookings': (context) => const BookingsPage(),
        '/home': (context) => const HomePage(),
        '/available': (context) => const AvailablePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/profile') {
          final Map<String, dynamic> arguments =
              settings.arguments as Map<String, dynamic>;
          final String imagePath = arguments['imagePath'] ?? '';
          final String name = arguments['name'] ?? '';
          final String phoneNumber = arguments['phoneNumber'] ?? '';
          return MaterialPageRoute(
            builder: (context) => ProfilePage(
              imagePath: imagePath,
              name: name,
              phoneNumber: phoneNumber,
            ),
            settings: settings,
          );
        }
        return null;
      },
      home: const BottomNavigationWrapper(),
    );
  }
}

class BottomNavigationWrapper extends StatefulWidget {
  const BottomNavigationWrapper({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavigationWrapperState();
}

class _BottomNavigationWrapperState extends State<BottomNavigationWrapper> {
  int _selectedIndex = 0;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  final List<String> _pageKeys = [
    '/home',
    '/bookings',
    '/profile',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      _navigatorKey.currentState?.pushNamedAndRemoveUntil(_pageKeys[_selectedIndex], ModalRoute.withName('/'));
    } else {
      _navigatorKey.currentState?.pushNamed(_pageKeys[_selectedIndex]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: _navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/home':
              builder = (BuildContext context) => const HomePage();
              break;
            case '/bookings':
              builder = (BuildContext context) => const BookingsPage();
              break;
            case '/profile':
              builder = (BuildContext context) => const ProfilePage(
                    name: 'John Doe',
                    imagePath: 'assets/images/logo.png',
                    phoneNumber: '+1 234 5678 90',
                  );
              break;
            case '/':
              builder = (BuildContext context) => const HomePage();
              break;
            case '/available':
              builder = (BuildContext context) => const AvailablePage();
              break;
            case '/login':
              builder = (BuildContext context) => const LoginScreen();
              break;
            case '/bnav':
              builder = (BuildContext context) => const BottomNavigationWrapper();
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute<void>(
            builder: builder,
            settings: settings,
          );
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_online),
              label: 'My Bookings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
