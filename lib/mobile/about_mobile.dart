import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tamimg_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

tealContainer(String text, {required List<BoxShadow> boxShadow}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.deepOrangeAccent,
        style: BorderStyle.solid,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(5.0),
      boxShadow: boxShadow,
    ),
    padding: EdgeInsets.all(7.0),
    child: Text(
      text,
      style: GoogleFonts.openSans(
        fontSize: 13.0,
        color: Colors.white,
      ),
    ),
  );
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Wrap with SafeArea
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(size: 35.0, color: Colors.white),
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
                      border: Border.all(width: 2.0, color: Colors.black)),
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
              TabsMobile(text: "Projets", route: '/projet'),
              SizedBox(height: 20.0),
              TabsMobile(text: "Contact", route: '/contact'),
              SizedBox(height: 20.0),
              TabsMobile(text: "Works", route: '/works'),
              SizedBox(height: 15.0),
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
                  /*  IconButton(
                  onPressed: () async => await launch("http://twitter.com"),
                  icon: SvgPicture.asset(
                    "assets/twitter.svg",
                    color: Colors.black,
                    width: 35.0,
                  ),
                ),*/
                ],
              )
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/blacksand-cat-han-W_5Eakb1598-unsplash.jpg'),
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), // Adjust opacity as needed
                BlendMode.darken,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: [
                //Intro Section
                CircleAvatar(
                  radius: 117.0,
                  backgroundColor: Colors.deepOrangeAccent,
                  child: CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 110.0,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        'assets/t-high-resolution-logo-transparent.png',
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('About me',
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.white,
                            shadows: [
                              BoxShadow(
                                color: Colors.deepOrangeAccent
                                    .withOpacity(0.9), // Glow color
                                spreadRadius: 7,
                                blurRadius: 10,
                                offset: Offset(0, 0),
                              ),
                            ],
                          )),
                      SizedBox(height: 10.0),
                      Sans2(
                          """Bonjour je suis Tamim , 22 ans étudiant / developpeur  \nJe suis passionné par le développement cross-plateforme et mobile. J’aime également m’investir dans le design, la programmation de jeux, ainsi que le low code / no code, surtout pour la facilité de développement d’applications cross-platform.\n Passionné par le monde anglophone, notamment dans les domaines de l’informatique, de la technologie et du divertissement, je maîtrise l’anglais avec aisance, ce qui me permet de suivre et d’interagir efficacement au sein de ces sphères internationales.  """,
                          15.0),
                      SansBold2(
                          "Actuellement en dernière année de Bachelor en développement et data  à l’ESTIAM, je me prépare à entamer un Master en Développement Web et Mobile dès octobre 2024.",
                          15.0),
                      SizedBox(height: 15.0),
                      ElevatedButton(
                        onPressed: () async {
                          const url =
                              'https://www.estiam.education/fr/formation-web-mobile-development-alternance';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.purple),
                        ),
                        child: Text(
                          'Brochure Estiam',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          tealContainer(
                            "Master\nDeveloppeur \nWeb & Mobile\n2024-2026",
                            boxShadow: [
                              BoxShadow(
                                color: Colors.deepOrangeAccent
                                    .withOpacity(0.5), // Shadow color
                                spreadRadius: 5, // Spread radius
                                blurRadius: 7, // Blur radius
                                offset:
                                    Offset(0, 3), // Changes position of shadow
                              ),
                            ],
                          ),
                          Icon(Icons.arrow_upward, color: Colors.white),
                          tealContainer(
                            "Bachelor\nDev/Data \n2022-2024",
                            boxShadow: [
                              BoxShadow(color: Colors.transparent),
                            ],
                          ),
                          Icon(Icons.arrow_upward, color: Colors.white),
                          tealContainer(
                            "BTS \nSIO SLAM\n2020-2022",
                            boxShadow: [
                              BoxShadow(color: Colors.transparent),
                            ],
                          ),
                          Icon(Icons.arrow_upward, color: Colors.white),
                          tealContainer(
                            "BAC ES\n2020",
                            boxShadow: [
                              BoxShadow(color: Colors.transparent),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                //web dev , backend
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Center content
                  children: [
                    AnimatedCard(
                      imagePath: "assets/flutter.png",
                      width: 200.0,
                    ),
                    SizedBox(height: 30.0),
                    SansBold2("Web Development & Mobile development ", 20.0),
                    SizedBox(height: 10.0),
                    Sans2(
                      "Je possède une expérience personnelle et professionnelle (stage) en Flutter, avec une spécialisation particulière pour Flutter Web.",
                      15.0,
                    ),
                  ],
                ),

                //app dev
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedCard(
                      imagePath: "assets/Web-dev.png",
                      width: 200.0,
                      reverse: true,
                    ),
                    SizedBox(height: 30.0),
                    SansBold2("Web Development", 20.0),
                    SizedBox(height: 10.0),
                    Sans2(
                      // Correct the syntax error here
                      "J’ai acquis une solide expérience grâce aux projets étudiants et professionnels dans le domaine du Web, notamment en utilisant les méthodes MVC et CRUD.",
                      15.0,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedCard(
                      imagePath: "assets/back-end.png",
                      width: 200.0,
                      reverse: true,
                    ),
                    SizedBox(height: 30.0),
                    SansBold2("back-end development", 20.0),
                    SizedBox(height: 10.0),
                    Sans2(
                      // Correct the syntax error here
                      "J’ai également acquis une solide expérience grâce aux projets étudiants en back-end, notamment en utilisant les requêtes API avec Postman.",
                      15.0,
                    ),
                    SizedBox(height: 15.0),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedCard(
                      imagePath: "assets/Devsops.png",
                      width: 200.0,
                      reverse: true,
                    ),
                    SizedBox(height: 30.0),
                    SansBold2("DevOps", 20.0),
                    SizedBox(height: 10.0),
                    Sans2(
                      // Correct the syntax error here
                      "J’ai acquis une solide expérience en DevOps et en conteneurisation grâce à des projets étudiants . Je possède egalement des certifications Cisco ",
                      15.0,
                    ),
                    SizedBox(height: 15.0),
                    InkWell(
                      onTap: () async {
                        const url =
                            'https://drive.google.com/file/d/1HITh2_VXhX1FysC8SoUURKG9FjRadSOw/view?usp=sharing';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Text(
                        'Cisco-Cybersecurity Essentials',
                        style: TextStyle(
                          color: Colors
                              .deepOrangeAccent, // This makes the text blue
                          decoration: TextDecoration
                              .underline, // This makes the text underlined
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    InkWell(
                      onTap: () async {
                        const url =
                            'https://drive.google.com/file/d/1J_l6bjPOBbtyhdNkPlEVQ1XgFO25NGL8/view?usp=sharing';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Text(
                        'Cisco-IoT Fundamentals: Connecting Things',
                        style: TextStyle(
                          color: Colors
                              .deepOrangeAccent, // This makes the text blue
                          decoration: TextDecoration
                              .underline, // This makes the text underlined
                        ),
                      ),
                    ),
                  ], // Close the children array for the main Column
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
//Back-end development
}

/*import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tamimg_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 35.0, color: Colors.black),
    ),
    endDrawer: Drawer(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    DrawerHeader(
    padding: EdgeInsets.only(bottom: 20.0),
    child: Container(
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(width: 2.0, color: Colors.black)),
    child: Image.asset('t-high-resolution-logo-transparent.png'),
    ),
    ),
    TabsMobile(
    text: "Home",
    route: ('/home'),
    ),
    SizedBox(height: 20.0),
    TabsMobile(text: "Works", route: '/works'),
    SizedBox(height: 20.0),
    TabsMobile(text: "Blog", route: '/blog'),
    SizedBox(height: 20.0),
    TabsMobile(text: "Contact", route: '/contact'),
    SizedBox(height: 20.0),
    TabsMobile(text: "Works", route: '/works'),
    SizedBox(
    height: 40.0,
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    IconButton(
    onPressed: () async => await launch("http:instagram.com"),
    icon: SvgPicture.asset(
    "assets/instagram2.svg",
    color: Colors.black,
    width: 35.0,
    ),
    ),
    IconButton(
    onPressed: () async => await launch("http:github.com"),
    icon: SvgPicture.asset(
    "assets/github.svg",
    color: Colors.black,
    width: 35.0,
    ),
    ),
    IconButton(
    onPressed: () async => await launch("http:twitter.com"),
    icon: SvgPicture.asset(
    "assets/twitter.svg",
    color: Colors.black,
    width: 35.0,
    ),
    ),
    ],
    )
    ],
    )),,
    );
  }
}
*/
