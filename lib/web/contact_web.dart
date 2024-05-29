import 'package:cloud_firestore/cloud_firestore.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var withDevice = MediaQuery.of(context).size.width;

    Future<void> launchUrl(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

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
            SizedBox(height: 15.0),
            Text('Tamim GOLAM ',
                style: TextStyle(fontSize: 30.0, color: Colors.white)),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: SvgPicture.asset("assets/linkedin.svg", width: 35.0),
                  onPressed: () {
                    launchUrl(
                        'https://www.linkedin.com/in/tamim-golam-16ab1322a/');
                  },
                ),
                IconButton(
                  icon: SvgPicture.asset("assets/github.svg",
                      color: Colors.white, width: 35.0),
                  onPressed: () {
                    launchUrl('https://github.com/Tamim94');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black87,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 500.0,
              backgroundColor: Colors.black87,
              iconTheme: IconThemeData(size: 25.0, color: Colors.white),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/newyorkphone.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  height: double.infinity,
                ),
              ),
              title: Row(
                children: [
                  Spacer(flex: 3),
                  TabsWeb(title: "Home", route: '/'),
                  Spacer(),
                  TabsWeb(title: "About", route: "/about"),
                  Spacer(),
                  TabsWeb(title: "Experience", route: '/projet'),
                  Spacer(),
                  TabsWeb(title: "Experience Pro", route: "/works"),
                  Spacer(),
                  TabsWeb(title: ' Contact', route: '/contact'),
                  Spacer(),
                ],
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              image: DecorationImage(
                image: AssetImage(
                    "assets/blackrocklou-batier-5EoWFa_Htdo-unsplash.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.8),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 30.0),
                  SansBold2("Contact me", 40.0),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          TextForm(
                            text: "First Name",
                            Containerwidth: 350.0,
                            hintText: "First name",
                            controller: _firstNameController,
                          ),
                          SizedBox(height: 15.0),
                          TextForm(
                            text: "Last name",
                            Containerwidth: 350.0,
                            hintText: "Last name",
                            controller: _lastNameController,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextForm(
                            text: "Email",
                            Containerwidth: 350.0,
                            hintText: "Email",
                            controller: _emailController,
                          ),
                          SizedBox(height: 15.0),
                          TextForm(
                            text: "Num/Phone Number",
                            Containerwidth: 350.0,
                            hintText: "Phone number",
                            controller: _phoneNumberController,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  TextForm(
                    text: "Message",
                    Containerwidth: withDevice / 1.6,
                    hintText: "Message",
                    maxLine: 10,
                    controller: _messageController,
                  ),
                  SizedBox(height: 20.0),
                  MaterialButton(
                    onPressed: () async {
                      print("Submit button pressed");
                      if (_formKey.currentState!.validate()) {
                        print("Form is valid");
                        _formKey.currentState!.save();
                        // Get the form data
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
                          print("Message sent successfully");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Message sent successfully!')),
                          );
                          _firstNameController.clear();
                          _lastNameController.clear();
                          _emailController.clear();
                          _phoneNumberController.clear();
                          _messageController.clear();
                        } catch (e) {
                          print("Error sending message: $e");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Error sending message: $e')),
                          );
                        }
                      } else {
                        print("Form is not valid");
                      }
                    },
                    elevation: 20.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 60.0,
                    minWidth: 200.0,
                    color: Colors.deepOrangeAccent,
                    child: SansBold("Submit", 20.0),
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
