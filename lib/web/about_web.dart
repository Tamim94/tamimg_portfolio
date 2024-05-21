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

launchUrl(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _AboutWebState extends State<AboutWeb> {
  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(url);
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
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 72,
              backgroundColor: Colors.tealAccent,
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
            Text('Tamim', style: TextStyle(fontSize: 30.0)),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/instagram2.svg",
                    color: Colors.black,
                    width: 35.0,
                  ),
                  onPressed: () {
                    launchUrl('https://www.instagram.com/');
                  },
                ),
                IconButton(
                    icon: SvgPicture.asset(
                      "assets/twitter.svg",
                      color: Colors.black,
                      width: 35.0,
                    ),
                    onPressed: () {
                      launchUrl('www.linkedin.com');
                    }),
                IconButton(
                    icon: SvgPicture.asset(
                      "assets/github.svg",
                      color: Colors.black,
                      width: 35.0,
                    ),
                    onPressed: () {
                      launchUrl('www.github.com');
                    }),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 25.6, color: Colors.black),
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
              title: "Projets",
              route: '/projet',
            ),
            Spacer(),
            TabsWeb(
              title: "Experience ",
              route: '/work',
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
      body: ListView(
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
                    SansBold("About me ", 40.0),
                    SizedBox(
                      height: 15.0,
                    ),
                    Sans("Hello im tamim im a flutter dev ", 15.0),
                    Sans("I strive to ensure performance ", 15.0),
                    Sans(
                        "and user experience in my work ios windows linux android ",
                        15.0),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        tealContainer("Flutter"),
                        SizedBox(
                          width: 7.0,
                        ),
                        tealContainer("Firebase"),
                        SizedBox(
                          width: 7.0,
                        ),
                        tealContainer("Dart"),
                        SizedBox(
                          width: 7.0,
                        ),
                        tealContainer("Javascript"),
                      ],
                    )
                  ],
                ),
                CircleAvatar(
                  radius: 147.0,
                  backgroundColor: Colors.tealAccent,
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
                imagePaths: "assets/webL.png",
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold("Web dev", 30.0),
                    SizedBox(
                      height: 10.0,
                    ),
                    Sans("im here to build the app", 20.0),
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
                    SansBold("App development", 30.0),
                    SizedBox(
                      height: 15.0,
                    ),
                    Sans("im here to build the app", 15.0),
                  ],
                ),
              ),
              AnimatedCard(
                imagePaths: "assets/app.png",
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
                imagePaths: "assets/firebase.png",
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold("Back end development ", 30.0),
                    SizedBox(
                      height: 15.0,
                    ),
                    Sans("J'ai de l'experience sur le back-end", 15.0),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
