import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tamimg_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    tealContainer(String text) {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.tealAccent,
              style: BorderStyle.solid,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(5.0)),
        padding: EdgeInsets.all(7.0),
        child: Text(
          text,
          style: GoogleFonts.openSans(fontSize: 15.0),
        ),
      );
    }

    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
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
                backgroundImage:
                    AssetImage("assets/t-high-resolution-logo-transparent.png"),
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
      backgroundColor: Colors.black87,
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
              title: "Experience Pro",
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
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/balcksandaboutadrien-olichon-ilVYjf0J378-unsplash.jpg', // replace with your image path
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          ListView(
            children: [
              //about me
              SizedBox(
                height: 500.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
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
                        SizedBox(
                          height: 15.0,
                        ),
                        Sans2(
                            """Bonjour je suis Tamim , 22 ans étudiant / developpeur Web & Mobile \nJe suis passionné par le développement cross-plateforme et mobile(surtout en Flutter). \nJ’aime également m’investir dans le design, la programmation de jeux, ainsi que le low code / no code,\nsurtout pour la facilité de développement d’applications cross-platform.\n Passionné par le monde anglophone, notamment dans les domaines de l’informatique, de la technologie et du divertissement,\n je maîtrise l’anglais avec aisance, ce qui me permet de suivre et d’interagir efficacement au sein de ces sphères internationales.  """,
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
                        SizedBox(height: 10.0),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.deepOrangeAccent,
                                    style: BorderStyle.solid,
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.deepOrangeAccent
                                        .withOpacity(0.5), // Shadow color
                                    spreadRadius: 5, // Spread radius
                                    blurRadius: 7, // Blur radius
                                    offset: Offset(
                                        0, 3), // Changes position of shadow
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(7),
                              child: Text(
                                  "Master\nDeveloppeur \nWeb & Mobile \n2024-2026",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white)),
                            ),

                            Icon(Icons.arrow_back,
                                color: Colors.white), // Add this line

                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.deepOrangeAccent,
                                    style: BorderStyle.solid,
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              padding: EdgeInsets.all(7),
                              child: Text(
                                  "Bachelor\nDev/Data Estiam \n2022-2024",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white)),
                            ),
                            Icon(Icons.arrow_back, color: Colors.white),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.deepOrangeAccent,
                                    style: BorderStyle.solid,
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              padding: EdgeInsets.all(7),
                              child: Text("BTS SIO SLAM\n2020-2022",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white)),
                            ),
                            Icon(Icons.arrow_back, color: Colors.white),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.deepOrangeAccent,
                                    style: BorderStyle.solid,
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              padding: EdgeInsets.all(7),
                              child: Text("BAC ES\n2020 ",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 147.0,
                      backgroundColor: Colors.deepOrangeAccent,
                      child: CircleAvatar(
                        radius: 143.0,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 140.0,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/t-high-resolution-logo-transparent.png',
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //web dev
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedCard(
                    imagePath: "assets/flutter.png",
                    height: 250.0,
                    width: 250.0,
                  ),
                  SizedBox(
                    width: widthDevice / 3,
                    child: Column(
                      children: [
                        SansBold2("Developpement Cross-Platform", 30.0),
                        SizedBox(
                          height: 10.0,
                        ),
                        Sans2(
                            "Je possède une expérience personnelle et professionnelle (stage) en Flutter, avec une spécialisation particulière pour Flutter Web. ",
                            20.0),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              //app dev
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: widthDevice / 3,
                    child: Column(
                      children: [
                        SansBold2("Web Development ", 30.0),
                        SizedBox(
                          height: 15.0,
                        ),
                        Sans2(
                            "J’ai acquis une solide expérience grâce aux projets étudiants et professionnels dans le domaine du Web, notamment en utilisant les méthodes MVC et CRUD.",
                            15.0),
                      ],
                    ),
                  ),
                  AnimatedCard(
                    imagePath: "assets/Web-dev.png",
                    height: 250.0,
                    width: 250.0,
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedCard(
                    imagePath: "assets/back-end.png",
                    height: 250.0,
                    width: 250.0,
                  ),
                  SizedBox(
                    width: widthDevice / 3,
                    child: Column(
                      children: [
                        SansBold2("Back end development ", 30.0),
                        SizedBox(
                          height: 15.0,
                        ),
                        Sans2(
                            "J’ai également acquis une solide expérience grâce aux projets étudiants en back-end, notamment en utilisant les requêtes API avec Postman.",
                            15.0),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: widthDevice / 3,
                    child: Column(
                      children: [
                        SansBold2("DevOps ", 30.0),
                        SizedBox(
                          height: 15.0,
                        ),
                        Sans2(
                            "J’ai acquis une solide expérience en DevOps et en conteneurisation grâce à des projets étudiants . Je possède egalement des certifications Cisco ",
                            15.0),
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
                      ],
                    ),
                  ),
                  AnimatedCard(
                    imagePath: "assets/Devsops.png",
                    height: 250.0,
                    width: 250.0,
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              )
            ],
          ),
        ],
      ),
    );
  }
}
