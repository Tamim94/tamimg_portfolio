import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tamimg_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
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

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
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
          TabsMobile(text: "About", route: '/about'),
          SizedBox(height: 20.0),
          TabsMobile(text: "Projets", route: '/projet'),
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
      )),
      body: ListView(children: [
        CircleAvatar(
          radius: 117.0,
          backgroundColor: Colors.tealAccent,
          child: CircleAvatar(
            radius: 110.0,
            backgroundColor: Colors.white,
            backgroundImage:
                AssetImage('assets/t-high-resolution-logo-transparent.png'),
          ),
        ),
        //intro
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.tealAccent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: SansBold('hello Im', 15.0),
                  ),
                  SansBold("mR GOLAM", 40.0),
                  SansBold("flutaa", 20.0),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 3.0,
                        children: [
                          Icon(Icons.email),
                          Icon(Icons.phone),
                          Icon(Icons.gps_fixed),
                        ],
                      ),
                      SizedBox(width: 40.0),
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 9.0,
                        children: [
                          Sans("golam.tamim94@gmail.com", 15.0),
                          Sans("0699331308", 15.0),
                          Sans(("Rosny-sous-bois"), 15.0),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 90.0,
        ),
        //About tamim
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Sans("About me", 35.0),
              Sans("hello me tamim me flutta  dev ", 15.0),
              Sans("Me wish to be good as i can ", 15.0),
              Sans('securityyy', 10.0),
              SizedBox(height: 10.0),
              Wrap(
                spacing: 7.0,
                runSpacing: 7.0,
                children: [
                  tealContainer("Flutter"),
                  tealContainer("firebase"),
                  tealContainer("html"),
                  tealContainer("yoyoyoyo"),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 60.0),
        //experience
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SansBold("whatsup", 35.0),
            AnimatedCard(
                imagePaths: "assets/webL.png", text: " Web devvelopment"),
            SizedBox(
              height: 35.0,
            ),
            AnimatedCard(
                imagePaths: "assets/firebase.png",
                text: "back-end development"),
            SizedBox(
              height: 35.0,
            ),
            AnimatedCard(imagePaths: "assets/app.png", text: "app devlopement"),
            SizedBox(
              height: 60.0,
            ),
            Wrap(
              runSpacing: 20.0,
              spacing: 20.0,
              alignment: WrapAlignment.center,
              children: [
                SansBold("Contact me", 35.0),
                TextForm(
                    text: "Firstname",
                    Containerwidth: widthDevice / 1.4,
                    hintText: "haha"),
                TextForm(
                    text: "Last name",
                    Containerwidth: widthDevice / 1.4,
                    hintText: "haha"),
                TextForm(
                    text: "Email",
                    Containerwidth: widthDevice / 1.4,
                    hintText: "haha"),
                TextForm(
                    text: "Num/phone number",
                    Containerwidth: widthDevice / 1.4,
                    hintText: "haha"),
                TextForm(
                  text: "Message",
                  Containerwidth: widthDevice / 1.4,
                  hintText: "haha",
                  maxLine: 10,
                ),
                MaterialButton(
                  onPressed: () {},
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 60,
                  minWidth: widthDevice / 1.2,
                  color: Colors.tealAccent,
                  child: SansBold("Submit", 20.0),
                ),
                SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
