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
        backgroundColor: Colors.white,
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
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.white, size: 35.0),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.0,
                    ),
                    child: AbelCustom(
                      text: "Projet",
                      color: Colors.white,
                      size: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  background: Image.asset(
                    "assets/new_york2.webp",
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
                expandedHeight: 500.0,
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ProjetPost(
                    title: 'Project Title 1',
                    description: 'Description for project 1',
                    imagePath: 'assets/project1.png',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

// ... (_buildSocialIconButton function remains the same)
}
