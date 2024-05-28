import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamimg_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  @override
  Widget build(BuildContext context) {
    var withDevice = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 72.0,
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
            SansBold("TAMIM", 30.0),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    await launch("https://www.instagram.com");
                  },
                  icon: SvgPicture.asset(
                    "assets/instagram2.svg",
                    color: Colors.black,
                    width: 35.0,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await launch("https://www.instagram.com");
                  },
                  icon: SvgPicture.asset(
                    "assets/twitter.svg",
                    color: Colors.black,
                    width: 35.0,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await launch("https://www.github.com");
                  },
                  icon: SvgPicture.asset(
                    "assets/github.svg",
                    color: Colors.black,
                    width: 35.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 500.0,
              backgroundColor: Colors.black87,
              iconTheme: IconThemeData(size: 25.0, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/contact_image.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
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
                    route: "/about",
                  ),
                  Spacer(),
                  TabsWeb(
                    title: "Projets",
                    route: '/projet',
                  ),
                  Spacer(),
                  TabsWeb(
                    title: "Experience",
                    route: "/works",
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
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.0),
              SansBold("Contact me", 40.0),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      TextForm(
                          text: "First Name",
                          Containerwidth: 350.0,
                          hintText: "hahahaha"),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextForm(
                          text: "Last name",
                          Containerwidth: 350.0,
                          hintText: "hahaha"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextForm(
                          text: "Last name",
                          Containerwidth: 350.0,
                          hintText: "hahahahah"),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextForm(
                          text: "Num/Phone Number",
                          Containerwidth: 350.0,
                          hintText: "hahahaha"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              TextForm(
                  text: "Message",
                  Containerwidth: withDevice / 1.5,
                  hintText: "hahaha",
                  maxLine: 10),
              SizedBox(height: 20.0),
              MaterialButton(
                onPressed: () {},
                elevation: 20.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: 60.0,
                minWidth: 200.0,
                color: Colors.deepOrangeAccent,
                child: SansBold("Submit", 20.0),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
