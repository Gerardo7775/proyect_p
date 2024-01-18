import 'package:flutter/material.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _Ticket();
}

class _Ticket extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pagina de tickets",
              style: TextStyle(
                color: Colors.red,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}