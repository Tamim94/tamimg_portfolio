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
  tealContainer(String text, {required List<BoxShadow> boxShadow}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.deepOrangeAccent,
          style: BorderStyle.solid,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: boxShadow,
      ),
      padding: EdgeInsets.all(7.0),
      child: Text(
        text,
        style: GoogleFonts.openSans(
          fontSize: 13.0,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    var heightDevice = MediaQuery.of(context).size.height;
    List<TextStyle> textStyles = [
      TextStyle(fontSize: 30, color: Colors.blue),
      TextStyle(fontSize: 30, color: Colors.white),
      TextStyle(fontSize: 30, color: Colors.green),
    ];
    List<String> animatedTexts = [
      "Flutter Developer",
      "Web Developer",
      "Mobile Developer",
    ];
    List<TextStyle> independentTextStyles = [
      TextStyle(fontSize: 30, color: Colors.purpleAccent),
      TextStyle(fontSize: 30, color: Colors.purpleAccent),
      TextStyle(fontSize: 30, color: Colors.orange),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 35.0, color: Colors.white),
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
      body: ListView(
        children: [
          // First Section
          Container(
            height: heightDevice / 0.7,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/blacksandbyadrien-olichon.jpg'),
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7),
                  BlendMode.darken,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 117.0,
                  backgroundColor: Colors.deepOrangeAccent,
                  child: CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                        'assets/t-high-resolution-logo-transparent.png'),
                  ),
                ),
                // Intro
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: SansBold(
                          "A la recherche d'une alternance de 1/2 ans en dev web et mobile pour le master!",
                          15.0,
                        ),
                      ),
                      Text(
                        'Tamim GOLAM',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              color: Colors.deepOrangeAccent.withOpacity(0.9),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                      AnimatedText(
                        texts: animatedTexts,
                        style: TextStyle(fontSize: 30, color: Colors.white),
                        textStyles: textStyles,
                      ),
                      Text(
                        'Actuellement étudiant en dev à',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IndependentAnimatedText(
                        texts: [
                          "Estiam en 3ème années spécialité Dev / Data",
                          "Futur Master dev web & mobile"
                        ],
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            BoxShadow(
                              color: Colors.deepOrangeAccent
                                  .withOpacity(0.9), // Glow color
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        textStyles: independentTextStyles,
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Wrap(
                            direction: Axis.vertical,
                            spacing: 3.0,
                            children: [
                              Icon(
                                Icons.email,
                                color: Colors.deepOrangeAccent,
                              ),
                              Icon(Icons.phone, color: Colors.deepOrangeAccent),
                              Icon(Icons.gps_fixed,
                                  color: Colors.deepOrangeAccent),
                              Icon(Icons.school_sharp,
                                  color: Colors.deepOrangeAccent),
                            ],
                          ),
                          SizedBox(width: 40.0),
                          Wrap(
                            direction: Axis.vertical,
                            spacing: 9.0,
                            children: [
                              SansBold2("golam.tamim94@gmail.com", 15.0),
                              SansBold2("0699331308", 15.0),
                              SansBold2("Rosny-sous-bois, France ", 15.0),
                              SansBold2("Estiam  Paris , France", 15.0),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Second Section
          Container(
            height: heightDevice / 1.1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/blacksandp2adrien-olichon.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), // Adjust opacity as needed
                  BlendMode.darken,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('About me ',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                            color: Colors.deepOrangeAccent, // Glow color
                            spreadRadius: 7,
                            blurRadius: 10,
                            offset: Offset(0, 0),
                          ),
                        ],
                      )),
                  Sans2(
                      "Bonjour je suis Tamim , 22 ans étudiant / developpeur passioné par le dev mobile et cross-platform ",
                      15.0),
                  SizedBox(height: 10.0),
                  SansBold2('Mon parcours  scolaire:', 10.0),
                  SizedBox(height: 10.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      tealContainer(
                        "Master\nDeveloppeur \nWeb & Mobile\n2024-2026",
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepOrangeAccent
                                .withOpacity(0.5), // Shadow color
                            spreadRadius: 5, // Spread radius
                            blurRadius: 7, // Blur radius
                            offset: Offset(0, 3), // Changes position of shadow
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_upward, color: Colors.white),
                      tealContainer(
                        "Bachelor\nDev/Data \n2022-2024",
                        boxShadow: [
                          BoxShadow(color: Colors.transparent),
                        ],
                      ),
                      Icon(Icons.arrow_upward, color: Colors.white),
                      tealContainer(
                        "BTS \nSIO SLAM\n2020-2022",
                        boxShadow: [
                          BoxShadow(color: Colors.transparent),
                        ],
                      ),
                      Icon(Icons.arrow_upward, color: Colors.white),
                      tealContainer(
                        "BAC ES\n2020",
                        boxShadow: [
                          BoxShadow(color: Colors.transparent),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Third Section
          Container(
            height: heightDevice / 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/blacksandp3adrien-olichon.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), // Adjust opacity as needed
                  BlendMode.darken,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Mes expériences ',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                          color: Colors.deepOrangeAccent, // Glow color
                          spreadRadius: 7,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        ),
                      ],
                    )),
                AnimatedCard(
                  imagePath: "assets/flutter.png",
                  text: "Cross-platform development",
                ),
                SizedBox(height: 35.0),
                AnimatedCard(
                  imagePath: "assets/Web-devmobile.png",
                  text: "Web development",
                ),
                SizedBox(height: 35.0),
                AnimatedCard(
                  imagePath: "assets/backend.png",
                  text: "Back-end development",
                ),
                SizedBox(height: 35.0),
                AnimatedCard(
                  imagePath: "assets/Database_api.png",
                  text: "Database / API",
                ),
                SizedBox(height: 35.0),
                AnimatedCard(
                  imagePath: "assets/Devsops.png",
                  text: "Devsops",
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 35.0),
                AnimatedCard(
                  imagePath: "assets/Gamedev.png",
                  text: "Game development",
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),

          // Fourth Section
          Container(
            height: heightDevice / 0.6,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/blacksandpeter-gargiulo.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), // Adjust opacity as needed
                  BlendMode.darken,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Contact ',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                          color: Colors.deepOrangeAccent, // Glow color
                          spreadRadius: 7,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        ),
                      ],
                    )),
                TextForm(
                  text: "First name",
                  Containerwidth: widthDevice / 1.4,
                  Containerheight: heightDevice / 7,
                  hintText: "Type your name ",
                ),
                TextForm(
                    text: "Last name",
                    Containerwidth: widthDevice / 1.4,
                    Containerheight: heightDevice / 7,
                    hintText: "Type your last name"),
                TextForm(
                  text: "Email",
                  Containerwidth: widthDevice / 1.4,
                  Containerheight: heightDevice / 7,
                  hintText: "Type your email",
                ),
                TextForm(
                  text: "Num/phone number",
                  Containerwidth: widthDevice / 1.4,
                  Containerheight: heightDevice / 7,
                  hintText: "Type your phone number",
                ),
                TextForm(
                  text: "Message",
                  Containerwidth: widthDevice / 1.4,
                  Containerheight: heightDevice / 7,
                  hintText: "Type your message",
                  maxLine: 10,
                ),
                SizedBox(height: 20.0),
                MaterialButton(
                  onPressed: () {},
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 60,
                  minWidth: widthDevice / 1.5,
                  color: Colors.deepOrangeAccent,
                  child: SansBold("Submit", 20.0),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
