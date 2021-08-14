import 'package:flutter/material.dart';

class ShowsScreen extends StatelessWidget {
  const ShowsScreen({Key? key}) : super(key: key);

  static const routeName = '/shows';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shows'),
        toolbarHeight: 100.0,
      ),
      body: const Center(
        child: Text('Show screen'),
      ),
    );
  }
}
