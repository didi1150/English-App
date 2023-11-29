import 'package:flutter/material.dart';

class SecScaffold extends StatelessWidget {
  final Widget body;
  final String title;

  const SecScaffold(
      {super.key, required this.body, this.title = 'Leftovers Store'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.blue, fontSize: 25)),
        shadowColor: Colors.black,
        elevation: 5,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new, color: Colors.grey,)),
      ),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: body),
    );
  }
}
