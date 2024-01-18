import 'package:flutter/material.dart';

class AddVentaPage extends StatefulWidget {
  const AddVentaPage({super.key});

  @override
  State<AddVentaPage> createState() => _AddVentaPage();
}

class _AddVentaPage extends State<AddVentaPage> {
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
              "Añadair ventas",
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