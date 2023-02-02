// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CipherPage extends StatelessWidget {
  const CipherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Cipher'),
      ),
      body: const CipherScreen(),
    );
  }
}

class CipherScreen extends StatefulWidget {
  const CipherScreen({Key? key}) : super(key: key);

  @override
  State<CipherScreen> createState() => _CipherScreenState();
}

class _CipherScreenState extends State<CipherScreen> {
  final TextEditingController _controller = TextEditingController();

  String cipher = 'Cesar Code';
  final List<String> _list = ['Cesar Code', 'Atbash', 'Vigenère'];
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

        // Bottom Navigation Bar
        BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.enhanced_encryption,
                size: 20,
              ),
              label: 'Cipher',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.http,
                size: 20,
              ),
              label: 'Http',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.work,
                size: 20,
              ),
              label: 'WIP',
            ),
          ],
          fixedColor: Colors.blue[200],
          onTap: (int idx) {
            switch (idx) {
              case 0:
                // do nothing
                break;
              case 1:
                Navigator.pushNamed(context, '/http');
                break;
              case 2:
                // do nothing
                break;
            }
          },
        )
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
    }
    // Atbash
    else if (cipher == _list[1]) {
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
    // Vigenère
    else if (cipher == _list[2]) {
      String key = "SOMEKEY";
      message = message.toUpperCase();

      for (var i = 0; i < message.length; i++) {
        var textCharCode = message.codeUnitAt(i) - 65;
        var keyCharCode = key.codeUnitAt(i % key.length) - 65;
        var encryptedCharCode = (textCharCode + keyCharCode) % 26 + 65;
        encryptedText += String.fromCharCode(encryptedCharCode);
      }

      setState(() {
        encryptedText;
      });
    }
  }
}
