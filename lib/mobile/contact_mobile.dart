import 'package:cloud_firestore/cloud_firestore.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _messageController = TextEditingController();
  bool _validate = false;

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
                    border:
                        Border.all(width: 2.0, color: Colors.deepOrangeAccent)),
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
                color: Colors.white,
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/newyorkphone.jpg", // Image from ContactWeb
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  filterQuality: FilterQuality.high, // Maintain high quality
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(
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
              child: Wrap(
                runSpacing: 20.0,
                spacing: 20.0,
                alignment: WrapAlignment.center,
                children: [
                  SansBold2("Contact me ", 35.0),
                  TextForm(
                    text: "First name",
                    containerWidth: widthDevice / 1.4,
                    hintText: "First name",
                    controller: _firstNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'First name is required';
                      }
                      return null;
                    },
                  ),
                  TextForm(
                    text: "Last name",
                    containerWidth: widthDevice / 1.4,
                    hintText: "Last name",
                    controller: _lastNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Last name is required';
                      }
                      return null;
                    },
                  ),
                  TextForm(
                    text: "Num/Phone number",
                    containerWidth: widthDevice / 1.4,
                    hintText: "Num/phone number",
                    controller: _phoneNumberController,
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
                  TextForm(
                    text: "Email",
                    containerWidth: widthDevice / 1.4,
                    hintText: "Email",
                    controller: _emailController,
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
                  TextForm(
                    text: "Message",
                    containerWidth: widthDevice / 1.4,
                    hintText: "Message",
                    maxLines: 10,
                    controller: _messageController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Message is required';
                      }
                      return null;
                    },
                  ),
                  MaterialButton(
                    onPressed: () async {
                      setState(() {
                        _validate = true;
                      });

                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

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
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Error sending message: $e')),
                          );
                        }
                      }
                    },
                    elevation: 20.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 60.0,
                    minWidth: widthDevice / 2.2,
                    color: Colors.deepOrangeAccent,
                    child: SansBold("Submit", 20.0),
                  )
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
