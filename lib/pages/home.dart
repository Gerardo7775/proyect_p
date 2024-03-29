import 'package:flutter/material.dart';
import 'package:proyect_p/pages/add_venta.dart';
import 'package:proyect_p/pages/tickets_historial.dart';
import 'package:proyect_p/pages/ventas.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:proyect_p/pages/pageHome.dart';

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
    setState(
      () {
        bottomSelectedIndex = index;
        pageController.animateToPage(
          bottomSelectedIndex,
          duration: const Duration(
            milliseconds: 500,
          ),
          curve: Curves.ease,
        );
        switch (bottomSelectedIndex) {
          case (0):
            title = "Home";
          case (1):
            title = "Registrar venta";
          case (2):
            title = "Historial";
          case (3):
            title = "Tickes";
        }
      },
    );
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
        sliderOpenSize: 270,
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
            setState(
              () {
                this.title = title;
              },
            );
          },
        ),
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(
              () {
                bottomSelectedIndex = index;
                switch (bottomSelectedIndex) {
                  case (0):
                    title = "Pagina principal";
                  case (1):
                    title = "Registrar venta";
                  case (2):
                    title = "Historial";
                  case (3):
                    title = "Tickes";
                }
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
            bottomTapped(
              index,
            );
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

class _SliderView extends StatelessWidget {
  final Function(String)? onItemClick;

  const _SliderView({Key? key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.only(top: 10),
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 8,
          ),
          const CircleAvatar(
            radius: 55,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 50,
              child: Icon(//Aqui ira la foto de perfil del empleado
                IconlyLight.user,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Nombre del empleado',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...[
            Menu(
              Icons.home,
              'Pagina principal',
            ),
            Menu(
              Icons.monetization_on,
              'Finanzas',
            ),
            Menu(
              Icons.person_pin,
              'Clientes',
            ),
            Menu(
              Icons.local_pizza_outlined,
              'Inventario',
            ),
            Menu(
              Icons.arrow_back_ios,
              'Cerrar sesion',
            )
          ]
              .map(
                (menu) => _SliderMenuItem(
                  title: menu.title,
                  iconData: menu.iconData,
                  onTap: onItemClick,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

class _SliderMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function(String)? onTap;

  const _SliderMenuItem(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'BalsamiqSans_Regular',
        ),
      ),
      leading: Icon(
        iconData,
        color: Colors.black,
      ),
      onTap: () => onTap?.call(
        title,
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
