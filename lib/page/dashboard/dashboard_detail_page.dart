import 'package:farmbroapk/util/reusable/color.dart';
import 'package:flutter/material.dart';

class DashboardDetail extends StatelessWidget {
  final String nameDetail;

  const DashboardDetail({super.key, required this.nameDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navbar,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.arrow_back),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          nameDetail,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 24
          ),
        )
      ),
      body: const Placeholder(),
    );
  }
}
