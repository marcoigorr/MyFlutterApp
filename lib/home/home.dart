// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  String encryptedText = 'waiting for input';

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
              encrypt(_controller.text);
            },
            child: const Text('Encrypt')),
        const Spacer(
          flex: 5,
        ),
        const Text('Encrypted Message:'),
        const Spacer(
          flex: 1,
        ),
        Text(
          encryptedText,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const Spacer(
          flex: 15,
        ),
      ],
    );
  }

  void encrypt(String message) {
    encryptedText = '';

    // Cesar Code (key=3)
    if (cipher == _list[0]) {
      final runes =
          message.runes.toList(); // Contains dec code of message characters

      for (int i = 0; i < runes.length; i++) {
        // if char is space (' ') skip shift, add space
        if (runes[i] == ' '.runes.toList()[0]) {
          encryptedText += ' ';
          continue;
        }
        runes[i] += 3;
        encryptedText += String.fromCharCode(runes[i]);
      }

      setState(() {
        encryptedText;
      });
    } else if (cipher == _list[1]) {
      var lowerCase = [
        'z',
        'y',
        'x',
        'w',
        'v',
        'u',
        't',
        's',
        'r',
        'q',
        'p',
        'o',
        'n',
        'm',
        'l',
        'k',
        'j',
        'i',
        'h',
        'g',
        'f',
        'e',
        'd',
        'c',
        'b',
        'a'
      ];

      int asciiChar;
      for (int i = 0; i < message.length; i++) {
        asciiChar =
            message[i].toLowerCase().codeUnitAt(0); // Get char ascii value

        // If char is space continue
        if (asciiChar == 32) {
          encryptedText += ' ';
          continue;
        }

        // If character is in lower case(minus 97 from its ASCII value to get reversed character)
        if (asciiChar >= 'a'.codeUnitAt(0) && asciiChar <= 'z'.codeUnitAt(0)) {
          encryptedText += lowerCase[asciiChar - 97];
        }
      }

      setState(() {
        encryptedText;
      });
    }
  }
}
