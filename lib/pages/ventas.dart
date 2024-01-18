import 'package:flutter/material.dart';

class VerVentas extends StatefulWidget {
  const VerVentas ({super.key});

  @override
  State<VerVentas > createState() => _VerVentas ();
}

class _VerVentas  extends State<VerVentas > {
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
              "Pagina pde historial de ventas",
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