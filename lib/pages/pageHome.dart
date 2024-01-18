import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});
  @override
  State<PageHome> createState() => _PageHome();
}

class _PageHome extends State<PageHome> {
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
              "Pagina principal",
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