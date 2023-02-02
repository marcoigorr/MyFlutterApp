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
      body: SingleChildScrollView(child: HttpScreen()),
    );
  }
}

class HttpScreen extends StatefulWidget {
  const HttpScreen({Key? key}) : super(key: key);

  @override
  State<HttpScreen> createState() => _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(result)
      ],
    );
  }

  @override
  void initState() {
    search('Oceano Mare');
    super.initState();
  }

  Future search(String research) async {
    const domain = 'www.googleapis.com';
    const path = 'books/v1/volumes';
    Map<String, dynamic> parameters = {'q': research};
    final Uri url = Uri.https(domain, path, parameters);
    http.get(url).then((res) {
      setState(() {
        result = res.body;
      });
    });
  }
}
