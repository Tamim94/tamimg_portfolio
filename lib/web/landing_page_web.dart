import 'package:cloud_firestore/cloud_firestore.dart';
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
  final _formKey = GlobalKey<FormState>(); // Form key
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

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
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 72,
              backgroundColor: Colors.deepOrangeAccent,
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
            Text('Tamim GOLAM ',
                style: TextStyle(fontSize: 30.0, color: Colors.white)),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/linkedin.svg",
                    width: 35.0,
                  ),
                  onPressed: () {
                    launchUrl(
                        'https://www.linkedin.com/in/tamim-golam-16ab1322a/');
                  },
                ),
                IconButton(
                    icon: SvgPicture.asset(
                      "assets/github.svg",
                      color: Colors.white,
                      width: 35.0,
                    ),
                    onPressed: () {
                      launchUrl('https://github.com/Tamim94');
                    }),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 25.6, color: Colors.white),
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
              title: "Experience",
              route: '/projet',
            ),
            Spacer(),
            TabsWeb(
              title: "Experience Pro",
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
            height: heightDevice - 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/blacksandbyadrien-olichon.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.deepOrangeAccent,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  )),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20),
                              child: Text(
                                  '''A la  recherche d'une alternance de 1/2 ans  en dev web et mobile pour le master ''',
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Tamim GOLAM ',
                              style: TextStyle(
                                fontSize: 65,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
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
                            ),
                            AnimatedText(
                              texts: animatedTexts,
                              style: TextStyle(fontSize: 30),
                              textStyles: textStyles,
                            ),
                            Text('Actuellement étudiant en dev à  ',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                            IndependentAnimatedText(
                              texts: [
                                "Estiam en 3ème années spécialité Dev / Data",
                                "Futur Master dev web & mobile"
                              ],
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  BoxShadow(
                                    color: Colors.deepOrangeAccent
                                        .withOpacity(0.9),
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              textStyles: independentTextStyles,
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(Icons.mail, color: Colors.white),
                                SizedBox(width: 20),
                                Text('golam.tamim94@gmail.com',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white))
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(Icons.phone_android_sharp,
                                    color: Colors.white),
                                SizedBox(width: 20),
                                Text('+33 0699341308',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white))
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(Icons.info_outline, color: Colors.white),
                                SizedBox(width: 20),
                                Text('golam.tamim94@gmail.com',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white))
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(Icons.school_outlined,
                                    color: Colors.white),
                                SizedBox(width: 20),
                                Text('Estiam Paris',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white))
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(Icons.home, color: Colors.white),
                                SizedBox(width: 20),
                                Text('Rosny-Sous-Bois,France',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: CircleAvatar(
                          radius: 147.0,
                          backgroundColor: Colors.deepOrangeAccent,
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //2nd page about me
          Container(
            height: heightDevice / 1.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/blacksandp2adrien-olichon.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.deepOrangeAccent,
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepOrangeAccent.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width *
                        0.3, // 50% of screen width
                    child: AspectRatio(
                      aspectRatio: 1.9,
                      child: Image.asset(
                        "assets/fotis-fotopoulos.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('About me',
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              color: Colors.deepOrangeAccent
                                  .withOpacity(0.9), // Glow color
                              spreadRadius: 7,
                              blurRadius: 10,
                              offset: Offset(0, 0),
                            ),
                          ],
                        )),
                    SizedBox(height: 20),
                    Text(
                        "Salut ! Je m’appelle Tamim, \nj’ai 22 ans et je suis étudiant en développement\npassionné par les applications mobiles et les solutions cross-platform.",
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                    Text('Mon parcours scolaire:',
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.deepOrangeAccent,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.deepOrangeAccent
                                    .withOpacity(0.5), // Shadow color
                                spreadRadius: 5, // Spread radius
                                blurRadius: 7, // Blur radius
                                offset:
                                    Offset(0, 3), // Changes position of shadow
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(7),
                          child: Text(
                              "Master\nDeveloppeur \nWeb & Mobile \n2024-2026",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.white)),
                        ),

                        Icon(Icons.arrow_back,
                            color: Colors.white), // Add this line

                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.deepOrangeAccent,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(7),
                          child: Text("Bachelor\nDev/Data Estiam \n2022-2024",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.white)),
                        ),
                        Icon(Icons.arrow_back, color: Colors.white),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.deepOrangeAccent,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(7),
                          child: Text("BTS SIO SLAM\n2020-2022",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.white)),
                        ),
                        Icon(Icons.arrow_back, color: Colors.white),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.deepOrangeAccent,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(7),
                          child: Text("BAC ES\n2020 ",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                              )),
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
            height: heightDevice / 0.8,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/blacksandp3adrien-olichon.jpg'), // Replace with your image path
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), // Adjust opacity as needed
                  BlendMode.darken,
                ),
              ),
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      imagePath: "assets/flutter.png",
                      text: "Cross-plateform development",
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      imagePath: "assets/Web-dev.png",
                      text: "web development",
                      fit: BoxFit.contain,
                      reverse: true,
                      width: widthDevice / 4,
                      height: heightDevice / 4,
                    ),
                    AnimatedCard(
                      imagePath: "assets/back-end.png",
                      text: "back-end",
                      fit: BoxFit.contain,
                      reverse: true,
                      width: widthDevice / 4,
                      height: heightDevice / 4,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      imagePath: "assets/Database_api.png",
                      text: "Database / API",
                      fit: BoxFit.contain,
                      reverse: true,
                      width: widthDevice / 4,
                      height: heightDevice / 4,
                    ),
                    AnimatedCard(
                      imagePath: "assets/Devsops.png",
                      text: "Devsops",
                      fit: BoxFit.contain,
                      reverse: true,
                      width: widthDevice / 4,
                      height: heightDevice / 4,
                    ),
                    AnimatedCard(
                        imagePath: "Gamedev.png",
                        text: "Game development",
                        fit: BoxFit.contain,
                        reverse: true,
                        width: widthDevice / 4,
                        height: heightDevice / 4),
                  ],
                ),
                SizedBox(height: 30.0),
              ],
            ),
          ),

          //Page 4
          Container(
            height: heightDevice,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/blacksandpeter-gargiulo.jpg'), // Replace with your image path
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), // Adjust opacity as needed
                  BlendMode.darken,
                ),
              ),
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Contact me ',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                                color: Colors.deepOrangeAccent,
                                spreadRadius: 7,
                                blurRadius: 10,
                                offset: Offset(0, 0))
                          ])),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          TextForm(
                            controller: _firstNameController,
                            containerWidth: 350,
                            text: "First name",
                            hintText: "Write your first name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'First name is required';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15),
                          TextForm(
                            controller: _emailController,
                            containerWidth: 350,
                            text: "Email",
                            hintText: "Write your email",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                                  .hasMatch(value)) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TextForm(
                            controller: _lastNameController,
                            containerWidth: 350,
                            text: "Last name",
                            hintText: "Please type your last name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Last name is required';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15),
                          TextForm(
                            controller: _phoneNumberController,
                            containerWidth: 350,
                            text: "Number",
                            hintText: "please write your  number",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Phone number is required';
                              }
                              if (!RegExp(
                                      r'^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$')
                                  .hasMatch(value)) {
                                return 'Enter a valid phone number';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextForm(
                    controller: _messageController,
                    text: "Message",
                    containerWidth: widthDevice / 1.5,
                    hintText: "Please type your message",
                    maxLines: 10,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Message is required';
                      }
                      return null;
                    },
                  ),
                  MaterialButton(
                    elevation: 20.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 60,
                    minWidth: 200.0,
                    color: Colors.deepOrangeAccent,
                    child: Text('Submit', style: TextStyle(fontSize: 20.0)),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          await FirebaseFirestore.instance
                              .collection('contactMessages')
                              .add({
                            'firstName': _firstNameController.text,
                            'lastName': _lastNameController.text,
                            'email': _emailController.text,
                            'phoneNumber': _phoneNumberController.text,
                            'message': _messageController.text,
                            'timestamp': FieldValue.serverTimestamp(),
                          });

                          // (Optional) Send email to yourself using the method described previously

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Message sent successfully!')),
                          );
                          // Clear the form after submission
                          _formKey.currentState!.reset();
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'Error sending message (eather you discovered a bug or itson my part $e')),
                          );
                        }
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
