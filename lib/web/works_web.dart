import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tamimg_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class WorksWeb extends StatefulWidget {
  const WorksWeb({super.key});

  @override
  State<WorksWeb> createState() => _WorksWebState();
}

class _WorksWebState extends State<WorksWeb> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

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
      backgroundColor: Colors.black,
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
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/blackwatermike-yukhtenko-wfh8dDlNFOk-unsplash.jpg"),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.7),
              BlendMode.darken,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/works.jpg",
                    width: double.infinity, // Full width
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "Experience Pro",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedCard(
                    imagePath: "assets/fedhubs.png",
                    height: 200.0,
                    width: 200.0,
                  ),
                  SizedBox(
                    width: widthDevice / 3,
                    child: Column(
                      children: [
                        SansBold2(
                            "Stage Developpeur Flutter - Fedhubs - 2023", 30.0),
                        SizedBox(
                          height: 15.0,
                        ),
                        Sans2(
                            """Mon stage de  Juin 2023 à Aout  m'a permis de me familiariser avec Flutter, un framework  pour le développement d'applications cross-platflorm. J'ai conçu des interfaces utilisateur (UI) intuitives et esthétiques, tout en m'assurant de leur adaptabilité aux différents formats (mobile et web). J'ai eu l'opportunité de collaborer avec d'autres développeurs, stagiaires et  d'échanger sur la plateforme Nifty et de renforcer mes compétences en résolution de problèmes techniques. Ce stage a également été l'occasion de développer mon autonomie, mon sens de l'initiative et ma rigueur dans la gestion de mes tâches.""",
                            15.0)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedCard(
                    imagePath: "assets/laptop.png",
                    height: 200.0,
                    width: 200.0,
                  ),
                  SizedBox(
                    width: widthDevice / 3,
                    child: Column(
                      children: [
                        SansBold2("Stage - Fortunity - 2022", 30.0),
                        SizedBox(
                          height: 15.0,
                        ),
                        Sans2(
                            """Mon stage chez fortunify m'a permis d'acquerir des bases en WordPress notamment Front-end.""",
                            15.0)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
