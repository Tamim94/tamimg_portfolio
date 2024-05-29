import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tamimg_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjetWeb extends StatefulWidget {
  const ProjetWeb({super.key});

  @override
  State<ProjetWeb> createState() => _ProjetWebState();
}

class _ProjetWebState extends State<ProjetWeb> {
  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          elevation: 0.0,
          iconTheme: IconThemeData(size: 25.6, color: Colors.white),
          title: Row(
            children: [
              Spacer(flex: 3),
              TabsWeb(
                title: "Home",
                route: '/',
              ),
              Spacer(),
              TabsWeb(
                title: "About",
                route: '/about',
              ),
              Spacer(),
              TabsWeb(
                title: "Experience",
                route: '/projet',
              ),
              Spacer(),
              TabsWeb(
                title: "Experience Pro ",
                route: '/works',
              ),
              Spacer(),
              TabsWeb(
                title: "Contact",
                route: '/contact',
              ),
              Spacer(),
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.black87,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 72,
                backgroundColor: Colors.deepOrangeAccent,
                child: CircleAvatar(
                  radius: 70.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                      "assets/t-high-resolution-logo-transparent.png"),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text('Tamim GOLAM ',
                  style: TextStyle(fontSize: 30.0, color: Colors.white)),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/linkedin.svg",
                      width: 35.0,
                    ),
                    onPressed: () {
                      launchUrl(
                          'https://www.linkedin.com/in/tamim-golam-16ab1322a/');
                    },
                  ),
                  /*  IconButton(
                    icon: SvgPicture.asset(
                      "assets/twitter.svg",
                      color: Colors.black,
                      width: 35.0,
                    ),
                    onPressed: () {
                      launchUrl('www.linkedin.com');
                    }),*/
                  IconButton(
                      icon: SvgPicture.asset(
                        "assets/github.svg",
                        color: Colors.white,
                        width: 35.0,
                      ),
                      onPressed: () {
                        launchUrl('https://github.com/Tamim94');
                      }),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            // Remove the Stack
            children: [
              // Hero Section (Full-width background image)
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/new_york2.webp",
                    width: double.infinity, // Full width
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                  // Add your hero section content (title, description, etc.) here
                  // Make sure to style the text for readability against the image
                  Text(
                    "Projets",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              // Wrap the project grid in a Center widget

              Container(
                // Add a container to hold the background image and project grid
                width: double.infinity,

                decoration: BoxDecoration(
                  // Add background image here
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/webworkblackniek-doup-OuuMTjwEP-o-unsplash.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken),
                  ),
                ),
                child: Center(
                  // Put the project grid back to center
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: 1200), // Set your desired maxWidth
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        alignment: WrapAlignment.center,
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
                            technologies: [
                              'Flutter',
                              'Dart',
                              'OOP',
                              'Firebase',
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
                            imageHeight: 200.0,
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
                            projetUrl:
                                ' https://tamim94.itch.io/tamimstrangegame',
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
                            technologies: [
                              'Flutter',
                              'Dart',
                              'Firebase',
                              'OOP',
                            ],
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
                            imagePath:
                                "assets/Capture d'écran 2024-05-29 130625.png",
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
                            projetUrl:
                                'https://golamtamim94.wixsite.com/portfolio',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
