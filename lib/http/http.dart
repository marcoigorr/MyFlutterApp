import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class HttpPage extends StatelessWidget {
  const HttpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP request'),
      ),
      body: const HttpScreen(),
    );
  }
}

class HttpScreen extends StatefulWidget {
  const HttpScreen({Key? key}) : super(key: key);

  @override
  State<HttpScreen> createState() => _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen> {
  final TextEditingController _controller = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 1,
        ),
        Container(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 30.0),
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hintText: 'Insert your research',
                hintStyle: Theme.of(context).textTheme.headline1),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              search(_controller.text);
              super.initState();
            },
            child: const Text('Search')),
        const Spacer(
          flex: 1,
        ),
        Text(result),
        const Spacer(
          flex: 1,
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
          currentIndex: 1,
          onTap: (int idx) {
            switch (idx) {
              case 0:
                Navigator.pushNamed(context, '/cipher');
                break;
              case 1:
                // do nothing
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

  @override
  void initState() {
    search(_controller.text);
    super.initState();
  }

  Future search(String research) async {
    String message = 'query = $research';

    const domain = 'www.googleapis.com';
    const path = 'books/v1/volumes';
    Map<String, dynamic> parameters = {'q': research};
    final Uri url = Uri.https(domain, path, parameters);
    http.get(url).then((res) {
      message += "\nreasonPhrase = ${res.reasonPhrase!}";
      message += "\nrequest = ${res.request?.url}";

      setState(() {
        result = message;
      });
    });
  }
}
