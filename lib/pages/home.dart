import 'package:flutter/material.dart';
import 'package:proyect_p/pages/add_venta.dart';
import 'package:proyect_p/pages/tickets_historial.dart';
import 'package:proyect_p/pages/ventas.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  late String title;
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();
  int bottomSelectedIndex = 0;
  @override
  void initState() {
    title = "Home";
    super.initState();
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(bottomSelectedIndex,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SliderDrawer(
        sliderOpenSize: 200,
        slideDirection: SlideDirection.TOP_TO_BOTTOM,
        appBar: SliderAppBar(
          appBarColor: Colors.white,
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        slider: _SliderView(
          onItemClick: (title) {
            _sliderDrawerKey.currentState!.closeSlider();
            setState(() {
              this.title = title;
            });
          },
        ),
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(
              () {
                bottomSelectedIndex = index;
              },
            );
          },
          scrollDirection: Axis.horizontal,
          children: const [
            PageHome(),
            AddVentaPage(),
            VerVentas(),
            Ticket(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: CrystalNavigationBar(
          currentIndex: bottomSelectedIndex,
          onTap: (index) {
            bottomTapped(index);
          },
          height: 10,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.black,
          items: [
            CrystalNavigationBarItem(
              icon: IconlyBold.home,
              unselectedIcon: IconlyLight.home,
              selectedColor: Colors.white,
            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.activity,
              unselectedIcon: IconlyLight.activity,
              selectedColor: Colors.white,
            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.buy,
              unselectedIcon: IconlyLight.buy,
              selectedColor: Colors.white,
            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.ticket_star,
              unselectedIcon: IconlyLight.ticket_star,
              selectedColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

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

class _SliderView extends StatelessWidget {
  final Function(String)? onItemClick;

  const _SliderView({
    Key? key,
    this.onItemClick,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: Image.asset(
                          'images/pizza.jpg',
                        ).image,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 8.0, top: 0.0, right: 5.0, bottom: 0.0),
                      child: Text(
                        'Pizzas \nLaurita',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.leaderboard,
                          color: Colors.black87,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Estadisticas',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Home'),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Home'),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Home'),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Home'),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Home'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Quotes {
  final MaterialColor color;
  final String author;
  final String quote;

  Quotes(
    this.color,
    this.author,
    this.quote,
  );
}

class Menu {
  final IconData iconData;
  final String title;

  Menu(
    this.iconData,
    this.title,
  );
}
