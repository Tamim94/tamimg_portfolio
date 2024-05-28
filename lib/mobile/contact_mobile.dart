import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tamimg_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
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
              expandedHeight: 500.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                size: 35.0,
                color: Colors.black,
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/contact_image.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 25.0),
          child: Wrap(
            runSpacing: 20.0,
            spacing: 20.0,
            alignment: WrapAlignment.center,
            children: [
              SansBold("Contact me ", 35.0),
              TextForm(
                  text: "First name",
                  Containerwidth: widthDevice / 1.4,
                  hintText: "hahahah"),
              TextForm(
                  text: "lASTNAME",
                  Containerwidth: widthDevice / 1.4,
                  hintText: "hahaha"),
              TextForm(
                  text: "Num/Phone number",
                  Containerwidth: widthDevice / 1.4,
                  hintText: "hahaha"),
              TextForm(
                  text: "Email",
                  Containerwidth: widthDevice / 1.4,
                  hintText: "hahaha"),
              TextForm(
                text: "Message",
                Containerwidth: widthDevice / 1.4,
                hintText: "hahahaha",
                maxLine: 10,
              ),
              MaterialButton(
                onPressed: () {},
                elevation: 20.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 60.0,
                minWidth: widthDevice / 2.2,
                color: Colors.tealAccent,
                child: SansBold("Submit", 20.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
