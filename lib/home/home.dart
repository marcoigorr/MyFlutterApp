// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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

  final List<String> _list = ['Option 1', 'Option 2', 'Option 3'];
  String option = 'Choose option';
  String message = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Insert number'),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        DropdownButton<String>(
          items: _list.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: (String? newValue) {},
          value: _list[0],
          icon: const Icon(Icons.arrow_drop_down_rounded),
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const Spacer(
          flex: 2,
        ),
        ElevatedButton(
            onPressed: () {
              print('Result: ${calcController.text}');
            },
            child: const Text('Calculate')),
        const Spacer(
          flex: 6,
        ),
      ],
    );
  }
}
