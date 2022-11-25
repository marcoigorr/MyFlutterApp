// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  String cipher = 'Cesar Code';
  final List<String> _list = ['Cesar Code', 'Atbash', 'Vignere'];
  String encryptedText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: 'Insert your message',
                hintStyle: Theme.of(context).textTheme.headline1),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        DropdownButton<String>(
          value: cipher,
          items: _list.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              cipher = newValue!;
            });
          },
          icon: const Icon(Icons.arrow_drop_down_rounded),
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const Spacer(
          flex: 2,
        ),
        ElevatedButton(
            onPressed: () {
              print('Result: ${_controller.text}');
            },
            child: const Text('Encrypt')),
        const Spacer(
          flex: 6,
        ),
      ],
    );
  }
}
