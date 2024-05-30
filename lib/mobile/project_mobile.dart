import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamimg_portfolio/mobile/about_mobile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tamimg_portfolio/components.dart';

class ProjetMobile extends StatefulWidget {
  const ProjetMobile({super.key});

  @override
  State<ProjetMobile> createState() => _ProjetMobileState();
}

class _ProjetMobileState extends State<ProjetMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white, size: 30.0),
          title: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(3.0),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 4.0,
            ),
          ),
        ),
        endDrawer: Drawer(
          backgroundColor: Colors.black.withOpacity(0.8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DrawerHeader(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 2.0, color: Colors.deepOrangeAccent)),
                  child: Image.asset(
                      'assets/t-high-resolution-logo-transparent.png'),
                ),
              ),
              TabsMobile(
                text: "Home",
                route: '/home',
              ),
              SizedBox(height: 20.0),
              TabsMobile(text: "About", route: '/about'),
              SizedBox(height: 20.0),
              TabsMobile(text: "Experience", route: '/projet'),
              SizedBox(height: 20.0),
              TabsMobile(text: "Experience Pro", route: '/works'),
              SizedBox(height: 15.0),
              TabsMobile(text: "Contact", route: '/contact'),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () async => await launch(
                        "https://www.linkedin.com/in/tamim-golam-16ab1322a/"),
                    icon: SvgPicture.asset(
                      "assets/linkedin.svg",
                      width: 35.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () async =>
                        await launch("https://github.com/Tamim94"),
                    icon: SvgPicture.asset(
                      "assets/github.svg",
                      color: Colors.white,
                      width: 35.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            Image.asset(
              "assets/webworkblackniek-doup-OuuMTjwEP-o-unsplash.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            // Text overlay
            Container(
              alignment: Alignment.center,
              child: Text(
                'Experience & Projets',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ProjetPost(
                      title: 'Projet Front - end  avec API',
                      description:
                          """Pour ce projet j'ai  crée une application front User management utilisant  une  API sur le  web  en Typescript et React """,
                      imagePath: 'assets/PROJET-TS.png',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      imageHeight: 200.0,
                      imageWidth: 350.0,
                      technologies: [
                        'Typescript',
                        'React',
                        'HTML',
                        'CSS',
                        'MVC',
                        'API',
                        'CRUD',
                        'PROJET Ecole'
                      ],
                      projetUrl:
                          'https://github.com/Tamim94/Tamim_users-managementReact_TS.git',
                    ),
                    ProjetPost(
                      title: 'Projet Backend  avec API',
                      description:
                          '''Pour ce projet j'ai  crée une API de task manager  en Javascript Node.js  ''',
                      imagePath: 'assets/PROJET-API.png',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      imageHeight: 200.0,
                      imageWidth: 350.0,
                      technologies: [
                        'Node.js',
                        'Javascript',
                        'Mongodb',
                        'Express',
                        'Postman',
                        'CRUD',
                        'API',
                        'PROJET Ecole'
                      ],
                      projetUrl:
                          'https://github.com/Tamim94/Tamimtaskmanagerapp.git',
                    ),
                    ProjetPost(
                      title: 'Portfolio Tamim  V3(Le site actuel)',
                      description:
                          "J'ai créé ce portfolio pour développer mes compétences en dev  cross-plateform avec flutter  et pour présenter mes projets et mes compétences",
                      imagePath: 'assets/project2.png',
                      filterQuality: FilterQuality.high,
                      imageHeight: 200.0,
                      imageWidth: 350.0,
                      technologies: [
                        'Flutter',
                        'Dart',
                        'OOP',
                        'Firebase',
                        'Cross-platform',
                        'Personnel',
                      ],
                      projetUrl:
                          ' https://github.com/Tamim94/tamimg_portfolio.git',
                    ),
                    ProjetPost(
                      title: 'Chatbot avec API OPENAI',
                      description:
                          "J'ai crée un chatbot avec l'API d'openai pour apprendre a utiliser les API avec flutter (La clé api a expiré donc ne fonctionne plus)",
                      imagePath: 'assets/tamimgpt3.png',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      imageHeight: MediaQuery.of(context).size.height * 0.3,
                      imageWidth: 350.0,
                      technologies: [
                        'Flutter',
                        'Dart',
                        'API',
                        'OOP',
                        'Personnel',
                      ],
                      projetUrl:
                          ' https://github.com/Tamim94/tamimchatbotgpt.git',
                    ),
                    ProjetPost(
                      title: 'HACKATHON 2023-Jeux avec Unity',
                      description:
                          "Nous devions crée un jeux en Unity C# avec plusieurs map et une representation de couleur ,",
                      imagePath: 'assets/HACKATHON2023.png',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      imageHeight: 200.0,
                      imageWidth: 350.0,
                      technologies: [
                        'Unity',
                        'C#',
                        'Game design',
                        'OOP',
                        'PROJET Ecole',
                      ],
                      projetUrl:
                          ' https://github.com/Tamim94/tamimchatbotgpt.git',
                    ),
                    ProjetPost(
                      title: 'Projet Jeux avec Unity ',
                      description:
                          "Pour ce projet j'ai crée un jeux de tir avec unity pour apprendre a utiliser unity et C#",
                      imagePath: 'assets/tamimgame.png',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      imageHeight: 200.0,
                      imageWidth: 350.0,
                      technologies: [
                        'Unity',
                        'C#',
                        'OOP',
                        'PROJET Ecole',
                      ],
                      projetUrl: ' https://tamim94.itch.io/tamimstrangegame',
                    ),
                    ProjetPost(
                      title: "Projet Student Manager ReactJS & NodeJS",
                      description:
                          "Pour ce projet j'ai crée une application de student management avec un front react et back-end nodejs et BDD mongodb  ",
                      imagePath: 'assets/studentnodejsreactapp.png',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      imageHeight: 200.0,
                      imageWidth: 350.0,
                      technologies: [
                        'NodeJS',
                        'Javascript',
                        'ReactJS',
                        'MongoDB',
                        'PROJET Ecole',
                      ],
                      projetUrl:
                          'https://github.com/Tamim94/tamimjsstudentapp.git',
                    ),
                    ProjetPost(
                      title: 'Projet Contact Form JS & NodeJS',
                      description:
                          "Pour ce projet j'ai crée un exemple d'application formulaire de contact avec ExpressJS et NodeJS ",
                      imagePath: 'assets/contactformnodejs.png',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      imageHeight: 200.0,
                      imageWidth: 350.0,
                      technologies: [
                        'NodeJS',
                        'Javascript',
                        'MySQL',
                        'ExpressJS',
                        'PROJET Ecole',
                      ],
                      projetUrl:
                          ' https://github.com/Tamim94/tamimexemplenodejsapp.git',
                    ),
                    ProjetPost(
                      title: "Portfolio V2 (ancien portfolio) ",
                      description:
                          "Ce premier porfolio était mon début en flutter web et m'a permis de me familiariser avec le framework et de présenter mes projets",
                      imagePath: 'assets/exportfolio.png',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      imageHeight: 200.0,
                      imageWidth: 350.0,
                      technologies: ['Flutter', 'Dart', 'Firebase', 'OOP'],
                      projetUrl:
                          'https://github.com/Tamim94/PortfolioGolamTamim.git',
                    ),
                    ProjetPost(
                      title: "Projet Jeux JAVA ",
                      description:
                          "Pour ce projet nous devions créer un jeu de BlackJack en JAVA avec le framework Swing",
                      imagePath: 'assets/blackjack.png',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      imageHeight: 200.0,
                      imageWidth: 350.0,
                      technologies: [
                        'Java',
                        'Swing',
                        'OOP',
                        'PROJET Ecole',
                      ],
                      projetUrl:
                          'https://github.com/Tamim94/TAMIMBLACKJACKCARD.git',
                    ),
                    ProjetPost(
                      title:
                          "Projet Page student management avec une page d'inscription, Python Django ",
                      description:
                          "Pour ce projet nous devions créer un site 'estiamflix'  en python avec le framework Django",
                      imagePath: 'assets/estiamflix.png',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      imageHeight: 200.0,
                      imageWidth: 350.0,
                      technologies: [
                        'Python',
                        'Django',
                        'PROJET Ecole',
                      ],
                      projetUrl:
                          'https://github.com/Tamim94/Tamimestiamflix1.git',
                    ),
                    ProjetPost(
                      title:
                          "Projet Page student management avec Base de données, Python Django ",
                      description:
                          "Pour ce projet nous devions créer une page de student management   en python avec le framework Django",
                      imagePath: 'assets/pyetudiantmanager.png',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      imageHeight: 200.0,
                      imageWidth: 350.0,
                      technologies: [
                        'Python',
                        'Django',
                        'PROJET Ecole',
                      ],
                      projetUrl:
                          'https://github.com/Tamim94/pythonESTIAMminiprojet.git',
                    ),
                    ProjetPost(
                      title:
                          "Projet IOT Arduino avec envoi de data sur un site",
                      description:
                          "Projet Estiam Arduino Projet Arduino IOT , nous devions programmé une carte arduino a envoyé du data sur un site de feed(adafruit)",
                      imagePath: 'assets/iotproj.jpg',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      imageHeight: 200.0,
                      imageWidth: 350.0,
                      technologies: ['Arduino ', 'PROJET Ecole'],
                      projetUrl:
                          'https://github.com/Tamim94/Tamim_Projet_IOT_Arduino.git',
                    ),
                    ProjetPost(
                      title: "HACKATHON 2022- Projet IOT  MBOT Arduino",
                      description:
                          "Projet de groupe en groupe avec mblock ( Projet Arduino pendant le Hackathon 2022 ou nous devions programmé un MBOT a marqué des buts.)",
                      imagePath: 'assets/hackathon2022.png',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      imageHeight: 200.0,
                      imageWidth: 350.0,
                      technologies: [
                        'Arduino',
                        'PROJET Ecole',
                      ],
                      projetUrl:
                          ' https://github.com/Tamim94/Tamim_Projet_Arduino_HACKATHON2022.git',
                    ),
                    ProjetPost(
                      title:
                          "Projet Web CVEN formulaire de reservation en PHP SQL ",
                      description: "Projet Groupe BTS SIO fin d'année ",
                      imagePath: "assets/Capture d'écran 2024-05-29 130625.png",
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      imageHeight: 200.0,
                      imageWidth: 350.0,
                      technologies: [
                        'PHP',
                        'SQL',
                        'PROJET BTS SIO ',
                      ],
                      projetUrl: ' https://github.com/Tamim94/CVEN.git',
                    ),
                    ProjetPost(
                      title: "Portfolio avec Wix (ancien portfolio) ",
                      description:
                          "Ce premier portfolio pendant mon 1ere année de BTS SIO était mon début en développement web et m'a permi  de présenter mes projets",
                      imagePath: 'assets/exxportfolio.png',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      imageHeight: 200.0,
                      imageWidth: 350.0,
                      technologies: [
                        'Wix',
                        'No Code',
                        'Personnel',
                      ],
                      projetUrl: 'https://golamtamim94.wixsite.com/portfolio',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
