import 'package:flutter/material.dart';
import '../pages/home.dart';


void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const PagePrincipal(),
    );
  }
}

class PagePrincipal extends StatefulWidget {
  const PagePrincipal({super.key});

  @override
  State<PagePrincipal> createState() => _PagePrincipal();
}

class _PagePrincipal extends State<PagePrincipal> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      body: HomePage(),
    );
  }
}
