import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:tamimg_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
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
      body: ListView(
        children: [
          //Page one
          Container(
            height: heightDevice - 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          )),
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                      child: Text('yoooooo', style: TextStyle(fontSize: 15)),
                    ),
                    SizedBox(height: 15.0),
                    Text('Tamim Golam ', style: TextStyle(fontSize: 65)),
                    Text('Etudiant en informatique  ',
                        style: TextStyle(fontSize: 30)),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.mail),
                        SizedBox(width: 20),
                        Text('golam.tamim94@gmail.com',
                            style: TextStyle(fontSize: 15))
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.phone_android_sharp),
                        SizedBox(width: 20),
                        Text('+33 0699341308', style: TextStyle(fontSize: 15))
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.info_outline),
                        SizedBox(width: 20),
                        Text('golam.tamim94@gmail.com',
                            style: TextStyle(fontSize: 15))
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.school_outlined),
                        SizedBox(width: 20),
                        Text('Estiam Paris', style: TextStyle(fontSize: 15))
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.home),
                        SizedBox(width: 20),
                        Text('Rosny-Sous-Bois', style: TextStyle(fontSize: 15))
                      ],
                    ),
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
                      backgroundImage: AssetImage(
                          "assets/t-high-resolution-logo-transparent.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //2nd page
          Container(
            height: heightDevice / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/web.jpg",
                  height: widthDevice / 1.9,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('About me', style: TextStyle(fontSize: 40.0)),
                    SizedBox(height: 20),
                    Text(
                        'Bonjour je suis golam Tamim je suis étudiant en informatique et dévelloper  ',
                        style: TextStyle(fontSize: 15)),
                    Text('je suis dev mobile', style: TextStyle(fontSize: 15)),
                    Text('androidiosnsfdjgrsjeiozef',
                        style: TextStyle(fontSize: 15)),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(7),
                          child:
                              Text("Flutter", style: TextStyle(fontSize: 15.0)),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(7),
                          child: Text("HTML", style: TextStyle(fontSize: 15.0)),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(7),
                          child: Text("HTML", style: TextStyle(fontSize: 15.0)),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(7),
                          child: Text("HTML", style: TextStyle(fontSize: 15.0)),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(7),
                          child: Text("HTML", style: TextStyle(fontSize: 15.0)),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Page 3
          Container(
            height: heightDevice / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('What i do ?', style: TextStyle(fontSize: 25.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      imagePaths: "assets/app.png",
                      text: "app development",
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                    AnimatedCard(
                      imagePaths: "assets/webL.png",
                      text: "web development",
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                    AnimatedCard(
                      imagePaths: "assets/firebase.png",
                      text: "back-end",
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Page 4
          Container(
            height: heightDevice,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Contact me ', style: TextStyle(fontSize: 40)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        TextForm(
                          Containerwidth: 350,
                          text: "First name",
                          hintText: "Write your first name",
                        ),
                        SizedBox(height: 15),
                        TextForm(
                          Containerwidth: 350,
                          text: "Email",
                          hintText: "Write your email",
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextForm(
                          Containerwidth: 350,
                          text: "Last name",
                          hintText: "Please type your last name",
                        ),
                        SizedBox(height: 15),
                        TextForm(
                          Containerwidth: 350,
                          text: "Number",
                          hintText: "please write your  number",
                        ),
                      ],
                    ),
                  ],
                ),
                TextForm(
                  text: "Message",
                  Containerwidth: widthDevice / 1.5,
                  hintText: "Please type your message",
                  maxLine: 10,
                ),
                MaterialButton(
                    elevation: 20.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 60,
                    minWidth: 200.0,
                    color: Colors.tealAccent,
                    child: Text('Submit', style: TextStyle(fontSize: 20.0)),
                    onPressed: () {})
              ],
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
