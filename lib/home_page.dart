import 'package:flutter/material.dart' hide CarouselController;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:portafolilo/style/app_colors.dart';
import 'package:portafolilo/style/app_size.dart';
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
    return Column(
      children: [
        articleCard(),
        //altura del carusel en comparacion con la del cuadro de arriba
        SizedBox(height: 10),
        CarouselSlider(
          items: carouselTexts.map((text) {
            return Container(
              width: Insets.maxWidth,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: AppColors.darkgreen,
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
                      style: const TextStyle(
                        fontSize: 25,
                        color: AppColors.text,
                        fontFamily: 'texto',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        AppColors.primaryColor,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Ver más",
                      style: SmallTextStyles().bodyLgMedium.copyWith(
                        color: AppColors.darkgreen,
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
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 600),
            enlargeCenterPage: true,
          ),
        ),
        SizedBox(height: 30),
        Container(
          width: double.infinity,
          //color del fondo
          color: AppColors.darkblue,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    //este margen mueve el texto a la derecha
                    vertical: 80,
                    horizontal: 80,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mi vida escolar:',
                        style: SmallTextStyles().bodyMdMedium.copyWith(
                          color: AppColors.plane,
                          fontFamily: 'titulo',
                        ),
                      ),
                      Text(
                        'Actualmente soy estudiante de informática en IPISA, '
                            'soy de la promoción del año 2022 llamada NAUTAE.',
                        style: SmallTextStyles().bodyLgBold.copyWith(
                          color: AppColors.plane,
                          fontFamily: 'texto',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Center(child: PolaroidStack()),
                ),
              ),
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
