// install flutter SDK (latest version) & attach to (project_name/lib) & adjust settings as needed 

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _ledColor = 'off';

  Future<void> _toggleLed(String color) async {
    String baseUrl = 'http://192.168.1.104';
    String endpoint = '/?led=$color';
    String url = baseUrl + endpoint;
    setState(() {
      _ledColor = color;
    });
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode != 200) {
        throw Exception('Failed to toggle LED');
      }
    } catch (e) {
      throw Exception('Failed to toggle LED');
    }
  }

  String _ledStateMessage() {
    switch (_ledColor) {
      case 'off':
        return 'off';
      case 'on':
        return 'on';
      case 'pink':
        return 'pink';
      case 'rainbow':
        return 'rainbow';
      default:
        return 'unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home LED Control',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home LED Control'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LED is ${_ledStateMessage()}',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _toggleLed('off'),
                child: Text('Turn Off'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _toggleLed('on'),
                child: Text('Turn On'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _toggleLed('pink'),
                child: Text('Pink LED'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _toggleLed('rainbow'),
                child: Text('Rainbow LED'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}