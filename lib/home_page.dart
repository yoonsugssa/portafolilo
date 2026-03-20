import 'package:flutter/material.dart' hide CarouselController;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:portafolilo/style/app_colors.dart';
import 'package:portafolilo/style/app_size.dart';
import 'extensions.dart';
import 'style/app_text_styles.dart';
import 'widgets/appbar/my_app_bar.dart';
import 'package:portafolilo/widgets/polaroid_stack.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(child: content(context)),
    );
  }

  static const List<String> carouselTexts = [
    'Sobre este proyecto:\nEstaré describiendo y poniendo en práctica todas las cosas que he aprendido a lo largo de los años.',
    "Sobre Mí:\nSoy una estudiante de 6to de Informática interesada en el diseño de base de datos.",
    "Experiencia:\nActualmente estoy aprendiendo sobre la vida laboral haciendo pasantía en QJM.",
    "Habilidades:\nCuento con un nivel decente sobre el desarrollo de páginas web y base de datos.",
    "Contacto:\nMi número de teléfono es 809-456-1634.",
  ];

  Widget content(BuildContext context) {
    // Detectar si la pantalla es pequeña (ej. móviles)
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return Column(
      children: [
        articleCard(),
        const SizedBox(height: 10),
        CarouselSlider(
          items: carouselTexts.map((text) {
            return Container(
              width: Insets.maxWidth,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: context.colorScheme.onSecondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: context.colorScheme.primary,
                        fontFamily: 'texto',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colorScheme.primary,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Ver más",
                      style: SmallTextStyles().bodyLgMedium.copyWith(
                        color: context.colorScheme.onSecondary,
                        fontFamily: 'texto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 260,
            autoPlay: true,
            enlargeCenterPage: true,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          width: double.infinity,
          color: context.colorScheme.surface,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 750),
                child: Column(
                  children: [
                    Text(
                      'Mi vida escolar:',
                      textAlign: TextAlign.center,
                      style: SmallTextStyles().bodyMdMedium.copyWith(
                        color: context.colorScheme.primary,
                        fontFamily: 'titulo',
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Espacio mínimo entre títulos
                    Text(
                      'Hice la primaria en la escuela Monte Adentro Puñal. '
                          'Después, curcé la secundaria en la escuela Cecilia Aurora Baez Collado. '
                          'Actualmente, estoy en el Politécnico Insdustrial de Santiago (IPISA)',
                      textAlign: TextAlign.center,
                      style: SmallTextStyles().bodyLgBold.copyWith(
                        color: context.colorScheme.primary,
                        fontFamily: 'texto',
                      ),
                    ),
                  ],
                ),
              ),
              // Reducido de 40 a 10 para pegar el Polaroid al texto
              const SizedBox(height: 10),
              const Center(child: PolaroidStack()),
            ],
          ),
        ),
      ],
    );
  }

  Widget articleCard() {
    return Container(
      width: double.infinity,
      height: 400.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/fondDeWindows.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.darken,
          ),
        ),
      ),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Alessandra Del Carmen Val García",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'titulo',
              fontSize: 60,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Estudiante de informática",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 25,
              fontFamily: 'texto',
            ),
          ),
          SizedBox(height: 10),
          Text(
            "(809) 456-1634 | alessandravg2228@gmail.com",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 20,
              fontFamily: 'texto',
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
