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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(size: 25.0, color: Colors.black),
          title: Row(
            children: [
              Spacer(flex: 3),
              TabsWeb(
                title: "home",
                route: '/',
              ),
              Spacer(),
              TabsWeb(
                title: "Works",
                route: '/works',
              ),
              Spacer(),
              TabsWeb(
                title: "Exp",
                route: "/blog",
              ),
              Spacer(),
              TabsWeb(
                title: "About",
                route: "/about",
              ),
              Spacer(),
              TabsWeb(
                title: ' Contact',
                route: '/contact',
              ),
              Spacer(),
            ],
          ),
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
                child: Image.asset(
                  't-high-resolution-logo-transparent.png',
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            SizedBox(height: 20.0),
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
        )),
        body: SingleChildScrollView(
          child: Column(
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

              Center(
                // Wrap the project grid in a Center widget
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth:
                          1200), // Add back the maxWidth constraint for the project grid
                  padding: EdgeInsets.all(20),
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      ProjetPost(
                        title: 'Project Title 1',
                        description: 'Description for project 1',
                        imagePath: 'assets/webL.png',
                        imageHeight: 200,
                        imageWidth: 200,
                        technologies: ['Flutter', 'Dart', 'Firebase'],
                        projetUrl: 'https://yourproject1url.com',
                      ),
                      ProjetPost(
                        title: 'Project Title 2',
                        description: 'Description for project 2',
                        imagePath: 'assets/project2.png',
                        technologies: ['Python', 'Django', 'React'],
                        projetUrl: 'https://yourproject2url.com',
                      ),
                      // ... More ProjetPost widgets
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// ... (Social Icon Button and ProjetPost code remain the same)
}
