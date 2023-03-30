import 'package:flutter/material.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:vamonos_mgp/src/components/onboard/view.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({
    super.key,
  });

  @override
  State<OnboardingPage> createState() => OnboardingPageController();
}

class OnboardingPageController extends State<OnboardingPage> {
  int page = 0;
  bool isLastPage = false;
  late LiquidController liquidController;
  late UpdateType updateType;
  List<OnboardingData> pagesData = [
    OnboardingData(
        assetLocation: 'assets/images/intro_1.png',
        color: Colors.blueAccent,
        text: "VAMONOS es un app que utiliza los datos GPS oficiales del"
            " Municpio para la flota urbana, de forma facil y accesible."),
    OnboardingData(
        assetLocation: 'assets/images/intro_2.png',
        color: Colors.greenAccent,
        text: "Encontrá todas las paradas cercanas usando el mapa interactivo. "
            "Mové el mapa para mostrar las paradas alrededor del indicador central."),
    OnboardingData(
        assetLocation: 'assets/images/intro_3.png',
        color: Colors.purpleAccent,
        text:
            "Consultá el arribo de todas las paradas cercanas al instante, al seleccionar una ruta."),
    OnboardingData(
        assetLocation: 'assets/images/intro_4.png',
        color: Colors.orangeAccent,
        text:
            "En el menú también podés consultar rutas por dirección y sus paradas con respectivos arribos."),
  ];

  @override
  Widget build(BuildContext context) {
    return OnboardingPageView(this);
  }

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  pageChangeCallback(int currPage) {
    setState(() {
      page = currPage;
      isLastPage = currPage == pagesData.length - 1;
    });
  }
}

class OnboardingData {
  final String assetLocation;
  final Color color;
  final String text;

  OnboardingData(
      {required this.assetLocation, required this.color, required this.text});
}
