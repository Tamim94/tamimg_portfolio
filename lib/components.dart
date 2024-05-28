import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

//animatedtext du cursus :
class IndependentAnimatedText extends StatefulWidget {
  final List<String> texts;
  final Duration duration;
  final TextStyle style;
  final List<TextStyle> textStyles;

  const IndependentAnimatedText({
    Key? key,
    required this.texts,
    this.duration = const Duration(seconds: 5),
    required this.style,
    required this.textStyles,
  }) : super(key: key);

  @override
  _IndependentAnimatedTextState createState() =>
      _IndependentAnimatedTextState();
}

class _IndependentAnimatedTextState extends State<IndependentAnimatedText>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _controller;
  late Animation<int> _typingAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _typingAnimation = StepTween(
      begin: 0,
      end: widget.texts[_currentIndex].length,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();

    _changeText();
  }

  void _changeText() {
    Future.delayed(widget.duration, () {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.texts.length;
        _controller.reset();
        _typingAnimation = StepTween(
          begin: 0,
          end: widget.texts[_currentIndex].length,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          ),
        );
        _controller.forward();
      });
      _changeText(); // Loop the animation
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _typingAnimation,
      builder: (context, child) {
        String currentText =
            widget.texts[_currentIndex].substring(0, _typingAnimation.value);

        return Text(
          currentText,
          key: ValueKey<int>(_currentIndex),
          style: widget
              .textStyles[_currentIndex], // Apply style based on current index
        );
      },
    );
  }
}

//animated text pour moi
class AnimatedText extends StatefulWidget {
  final List<String> texts;
  final Duration duration;
  final TextStyle style;
  final List<TextStyle> textStyles;

  const AnimatedText({
    super.key,
    required this.texts,
    this.duration = const Duration(seconds: 2),
    required this.style,
    required this.textStyles,
  });

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _controller;
  late Animation<int> _typingAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _typingAnimation = StepTween(
      begin: 0,
      end: widget.texts[_currentIndex].length,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();

    _changeText();
  }

  void _changeText() {
    Future.delayed(widget.duration, () {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.texts.length;
        _controller.reset();
        _typingAnimation = StepTween(
          begin: 0,
          end: widget.texts[_currentIndex].length,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          ),
        );
        _controller.forward();
      });
      _changeText(); // Loop the animation
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _typingAnimation,
      builder: (context, child) {
        String currentText =
            widget.texts[_currentIndex].substring(0, _typingAnimation.value);

        return Text(
          currentText,
          key: ValueKey<int>(_currentIndex),
          style: widget
              .textStyles[_currentIndex], // Apply style based on current index
        );
      },
    );
  }
}
//appbarweb

class TabsWeb extends StatefulWidget {
  final title;
  final route;
  const TabsWeb({Key? key, this.title, this.route}) : super(key: key);

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            isSelected = true;
          });
          // print("enter");
        },
        onExit: (event) {
          setState(() {
            isSelected = false;
          });
          // print("exit");
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          curve: Curves.elasticIn,
          style: isSelected
              ? GoogleFonts.oswald(
                  shadows: [
                      Shadow(
                        color: Colors.deepOrangeAccent,
                        offset: Offset(0, -8),
                      ),
                    ],
                  fontSize: 25.0,
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationColor: Colors.deepOrangeAccent)
              : GoogleFonts.oswald(color: Colors.white, fontSize: 23.0),
          child: Text(widget.title),
        ),
      ),
    );
  }
}

//sans font
class SansBold extends StatelessWidget {
  final String text;
  final double size;
  const SansBold(this.text, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

//white
class SansBold2 extends StatelessWidget {
  final String text;
  final double size;
  const SansBold2(this.text, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
          fontSize: size, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}

class Sans extends StatelessWidget {
  final String text;
  final double size;
  const Sans(this.text, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size),
    );
  }
}

//white
class Sans2 extends StatelessWidget {
  final String text;
  final double size;
  const Sans2(this.text, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, color: Colors.white),
    );
  }
}

//form
class TextForm extends StatelessWidget {
  final text;
  final Containerwidth;
  final hintText;
  final maxLine;
  final Containerheight;
  const TextForm({
    Key? key,
    @required this.text,
    @required this.Containerwidth,
    @required this.Containerheight,
    @required this.hintText,
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Sans2(text, 16.0),
            SizedBox(height: 5),
            SizedBox(
              width: Containerwidth,
              height: Containerheight,
              child: TextFormField(
                maxLines: maxLine == null ? null : maxLine,
                decoration: InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.deepOrangeAccent, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: hintText,
                  hintStyle:
                      GoogleFonts.poppins(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//card used in projet
class AnimatedCard extends StatefulWidget {
  final imagePath;
  final text;
  final fit;
  final reverse;
  final height;
  final width;
  const AnimatedCard({
    Key? key,
    required this.imagePath,
    this.text,
    this.fit,
    this.reverse,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);
  late Animation<Offset> _animation = Tween(
    begin: widget.reverse == true ? Offset(0, 0.08) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : Offset(0, 0.08),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.deepOrangeAccent),
        ),
        shadowColor: Colors.deepOrangeAccent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                height: widget.height == null ? 200 : widget.height,
                width: widget.width == null ? 200 : widget.width,
                fit: widget.fit == null ? null : widget.fit,
              ),
              SizedBox(
                height: 10,
              ),
              widget.text == null ? SizedBox() : SansBold(widget.text, 15.0),
            ],
          ),
        ),
      ),
    );
  }
}

class TabsMobile extends StatefulWidget {
  final text;
  final route;
  const TabsMobile({super.key, this.text, this.route});

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: 20.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
          (5.0),
        )),
        height: 50.0,
        minWidth: 200.0,
        child: Text(widget.text,
            style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white)),
        onPressed: () {
          Navigator.of(context).pushNamed(widget.route);
        });
  }
}

class AbelCustom extends StatelessWidget {
  // Change to StatelessWidget
  final String text;
  final double size;
  final Color? color; // Make color nullable
  final FontWeight? fontWeight; // Make fontWeight nullable

  const AbelCustom({
    super.key,
    required this.text,
    required this.size,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
        fontSize: size,
        color: color ?? Colors.black, // Use ?? for default color
        fontWeight:
            fontWeight ?? FontWeight.normal, // Use ?? for default fontWeight
      ),
    );
  }
}

//Mon dart project object :
class ProjetPost extends StatefulWidget {
  final String title;
  final String description;
  final String imagePath;
  final List<String> technologies;
  final String projetUrl;
  final double imageHeight; // New parameter
  final double imageWidth; // New parameter
  final FilterQuality filterQuality;
  final BoxFit fit;
  const ProjetPost({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.technologies,
    this.projetUrl = '',
    this.imageHeight = 200.0, // Default value
    this.imageWidth = 200.0,
    this.filterQuality = FilterQuality.high,
    this.fit = BoxFit.cover,
// Default value
  }) : super(key: key);

  @override
  _ProjetPostState createState() => _ProjetPostState();
}

class _ProjetPostState extends State<ProjetPost>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);
  late Animation<Offset> _animation = Tween(
    begin: Offset.zero,
    end: Offset(0, 0.08),
  ).animate(_controller);

  bool isExpanded = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black54, // background container
          border: Border.all(color: Colors.deepOrange),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Container(
                child: Text(
                  widget.title,
                  style: GoogleFonts.oswald(
                    backgroundColor: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                icon: Icon(
                  isExpanded
                      ? Icons.arrow_drop_up_outlined
                      : Icons.arrow_drop_down_circle_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SlideTransition(
                      position: _animation,
                      child: Container(
                        // Use Container instead of Card
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepOrangeAccent.withOpacity(
                                  0.5), // Shadow color with opacity
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          // ClipRRect to give rounded corners to the image
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            widget.imagePath,
                            height: widget.imageHeight,
                            width: widget.imageWidth,
                            filterQuality: widget.filterQuality,
                            fit: widget.fit,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      widget.description,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 8.0,
                      children: widget.technologies
                          .map((tech) => Chip(
                                backgroundColor: Colors.black, //background tech
                                label: Text(tech,
                                    style: TextStyle(color: Colors.white)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                    color: Colors.deepOrangeAccent,
                                    width: 2.0,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    SizedBox(height: 10),
                    if (widget.projetUrl.isNotEmpty)
                      ElevatedButton(
                        onPressed: () async {
                          final url = Uri.parse(widget.projetUrl);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            // Handle error (e.g., show a snackbar)
                          }
                        },
                        child: Text(
                          "Github Link",
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.orangeAccent,
                          backgroundColor: Colors
                              .black38, // text color // Set the button color to black
                          side: BorderSide(
                            color: Colors
                                .deepOrange, // Set the border color to orange
                            width: 2.0,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
