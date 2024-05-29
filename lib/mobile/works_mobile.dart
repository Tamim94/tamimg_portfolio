import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tamimg_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class WorksMobile extends StatefulWidget {
  const WorksMobile({Key? key}) : super(key: key);

  @override
  _WorksMobileState createState() => _WorksMobileState();
}

class _WorksMobileState extends State<WorksMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            'Experience Pro',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white, size: 30.0),
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
                  'assets/blackwatermike-yukhtenko-wfh8dDlNFOk-unsplash.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7),
                BlendMode.darken,
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/works.jpg",
                  width: double.infinity, // Full width
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      AnimatedCard(
                        imagePath: "assets/fedhubs.png",
                        height: 150.0, // Reduced size for mobile
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      SansBold2(
                          "Stage Developpeur Flutter - Fedhubs - 2023  ", 20.0),
                      SizedBox(
                        height: 16.0,
                      ),
                      Sans2(
                          """Mon stage de  Juin 2023 à Aout  m'a permis de me familiariser avec Flutter, un framework  pour le développement d'applications cross-platflorm. J'ai conçu des interfaces utilisateur (UI) intuitives et esthétiques, tout en m'assurant de leur adaptabilité aux différents formats (mobile et web). J'ai eu l'opportunité de collaborer avec d'autres développeurs, stagiaires et  d'échanger sur la plateforme Nifty et de renforcer mes compétences en résolution de problèmes techniques. Ce stage a également été l'occasion de développer mon autonomie, mon sens de l'initiative et ma rigueur dans la gestion de mes tâches.""",
                          15.0),
                      SizedBox(
                        height: 16.0,
                      ),
                      AnimatedCard(
                        imagePath: "assets/laptop.png",
                        height: 150.0,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      SansBold2(
                        "Stage Developpeur Front - Fortunity - 2022",
                        20.0,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Sans2(
                          """Mon stage chez fortunify m'a permis d'acquerir des bases en WordPress notamment Front-end.""",
                          15.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
