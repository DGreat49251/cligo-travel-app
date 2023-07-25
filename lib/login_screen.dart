import 'package:flutter/material.dart';

void main() {
  runApp(const LoginScreen());
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Image.asset(
              'assets/images/logo.png', // Replace this with your app logo image path
              height: 100,
            ),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(
                    child:
                        Text('Login', style: TextStyle(color: Color.fromARGB(255, 0, 68, 145)))),
                Tab(
                    child:
                        Text('Sign Up', style: TextStyle(color: Color.fromARGB(255, 0, 68, 145)))),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              // Login Tab Content
              LoginForm(),
              // Sign Up Tab Content
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Username'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Perform login action
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 0, 68, 145)),
            ),
            child: const Text('LOGIN'),
          ),
          TextButton(
            onPressed: () {
              // Forgot password action
            },
            child: const Text('Forgot Password?'),
          ),
        ],
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Username'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Confirm Password'),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Perform sign up action
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 0, 68, 145)),
            ),
            child: const Text('SIGN UP')
          ),
          ElevatedButton(
            onPressed: () {
              // Perform sign up with Google action
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('SIGN UP WITH GOOGLE'),
          ),
        ],
      ),
    );
  }
}
