import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tamimg_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
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

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Wrap with SafeArea
      child: Scaffold(
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
                    border: Border.all(width: 2.0, color: Colors.black),
                  ),
                  child: Image.asset(
                    'assets/t-high-resolution-logo-transparent.png', // Path to your asset
                  ),
                ),
              ),
              TabsMobile(text: "Home", route: '/'), // Use '/' for home
              SizedBox(height: 20.0),
              TabsMobile(
                  text: "About ",
                  route: '/about'), // Use named routes if available
              SizedBox(height: 20.0),
              TabsMobile(text: "Projets", route: '/projet'),
              SizedBox(height: 20.0),
              TabsMobile(text: "Contact", route: '/contact'),
              SizedBox(height: 40.0),
              // Removed duplicate "Works" tab
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSocialIconButton('assets/instagram.svg',
                      'https://www.instagram.com'), // Update with actual links
                  _buildSocialIconButton(
                      'assets/github.svg', 'https://www.github.com'),
                  _buildSocialIconButton(
                      'assets/twitter.svg', 'https://www.twitter.com'),
                ],
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              //Intro Section
              CircleAvatar(
                radius: 117.0,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  radius: 110.0,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/t-high-resolution-logo-transparent.png',
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 35.0),
                    SizedBox(height: 10.0),
                    Sans("hello me tamim me flutta  dev ", 15.0),
                    Sans("Me wish to be good as i can ", 15.0),
                    Sans('securityyy', 10.0),
                    SizedBox(height: 15.0),
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
              SizedBox(
                height: 40.0,
              ),
              //web dev , backend
              Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Center content
                children: [
                  AnimatedCard(
                    imagePaths: "assets/webL.png",
                    width: 200.0,
                  ),
                  SizedBox(height: 30.0),
                  SansBold("Web Development", 20.0),
                  SizedBox(height: 10.0),
                  Sans(
                    "Hello, I'm Tamim, a Flutter developer. Building your online presence.",
                    15.0,
                  ),
                ],
              ),

              //app dev
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(
                    imagePaths: "assets/app.png",
                    width: 200.0,
                    reverse: true,
                  ),
                  SizedBox(height: 30.0),
                  SansBold("App Development", 20.0),
                  SizedBox(height: 10.0),
                  Sans(
                    // Correct the syntax error here
                    "Hello, I'm Tamim, a Flutter developer. Building your online presence.",
                    15.0, // Add the missing fontSize argument
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(
                    imagePaths: "assets/firebase.png",
                    width: 200.0,
                    reverse: true,
                  ),
                  SizedBox(height: 30.0),
                  SansBold("back-end devlepoment", 20.0),
                  SizedBox(height: 10.0),
                  Sans(
                    // Correct the syntax error here
                    "I've got back-end knowledge",
                    15.0,
                    // Add the missing fontSize argument
                  ),
                  SizedBox(height: 15.0),
                ],
              ),
            ], // Close the children array for the main Column
          ),
        ),
      ),
    );
  }
//Back-end development

  // Helper function to build social media icons
  Widget _buildSocialIconButton(String assetPath, String url) {
    return IconButton(
      onPressed: () async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          // Handle error (e.g., show a snackbar)
        }
      },
      icon: SvgPicture.asset(
        assetPath,
        color: Colors.black,
        width: 35.0,
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tamimg_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
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
    TabsMobile(text: "Works", route: '/works'),
    SizedBox(height: 20.0),
    TabsMobile(text: "Blog", route: '/blog'),
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
    )),,
    );
  }
}
*/
