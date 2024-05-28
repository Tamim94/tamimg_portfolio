import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tamimg_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class WorksMobile extends StatefulWidget {
  const WorksMobile({super.key});

  @override
  State<WorksMobile> createState() => _WorksMobileState();
}

class _WorksMobileState extends State<WorksMobile> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
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
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 500.0,
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(
                    size: 35.0,
                    color: Colors.black,
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      "assets/works.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ];
            },
            body: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    SansBold("Works", 30.0),
                    SizedBox(
                      height: 20.0,
                    ),
                    AnimatedCard(
                      imagePath: "assets/firebase.png",
                      fit: BoxFit.contain,
                      height: 150.0,
                      width: 300.0,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    SansBold("Portfolio", 20.0),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Sans("sdjfhdizsguohsfrirsdt", 15.0),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
