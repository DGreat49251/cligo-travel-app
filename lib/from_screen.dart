import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FromScreen extends StatefulWidget {
  final TextEditingController textController;

  const FromScreen({Key? key, required this.textController}) : super(key: key);

  @override
  _FromScreenState createState() => _FromScreenState();
}

class _FromScreenState extends State<FromScreen> {
  List<String> suggestions = [];

  _FromScreenState() {
    _fetchSuggestions();
  }

  Future<void> _fetchSuggestions() async {
    const apiUrl =
        'https://dzwwjt49od.execute-api.ap-south-1.amazonaws.com/cligoapi/cligodb?tb_name=destinations';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data is List<dynamic>) {
        setState(() {
          suggestions = data
              .map<String>((item) => '${item[1]} (${item[2]})')
              .toList();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Source'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TypeAheadField<String>(
              textFieldConfiguration: TextFieldConfiguration(
                controller: widget.textController,
                decoration: const InputDecoration(
                  labelText: 'Source',
                ),
              ),
              suggestionsCallback: (pattern) {
                if (pattern.isEmpty) {
                  return [];
                }
                return suggestions
                    .where((suggestion) =>
                        suggestion.toLowerCase().contains(pattern.toLowerCase()))
                    .toList();
              },
              itemBuilder: (context, suggestion) {
                final placeName = suggestion.split(' (')[0];
                final shorthand = suggestion.split(' (')[1].split(')')[0];
                return ListTile(
                  title: Text(placeName),
                  subtitle: Text(shorthand),
                );
              },
              onSuggestionSelected: (suggestion) {
                // widget.textController.text = suggestion.split(' (')[1].split(')')[0];
                widget.textController.text = suggestion;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, widget.textController.text);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
