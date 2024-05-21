import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
                        color: Colors.black,
                        offset: Offset(0, -8),
                      ),
                    ],
                  fontSize: 25.0,
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationColor: Colors.tealAccent)
              : GoogleFonts.oswald(color: Colors.black, fontSize: 23.0),
          child: Text(widget.title),
        ),
      ),
    );
  }
}

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

class TextForm extends StatelessWidget {
  final text;
  final Containerwidth;
  final hintText;
  final maxLine;
  const TextForm({
    Key? key,
    @required this.text,
    @required this.Containerwidth,
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
            Sans(text, 16.0),
            SizedBox(height: 5),
            SizedBox(
              width: Containerwidth,
              child: TextFormField(
                maxLines: maxLine == null ? null : maxLine,
                decoration: InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.tealAccent, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: hintText,
                  hintStyle: GoogleFonts.poppins(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AnimatedCard extends StatefulWidget {
  final imagePaths;
  final text;
  final fit;
  final reverse;
  final height;
  final width;
  const AnimatedCard(
      {super.key,
      @required this.imagePaths,
      this.text,
      this.fit,
      this.reverse,
      this.height,
      this.width,
      required String imagePath});

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
          side: BorderSide(color: Colors.tealAccent),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePaths,
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
            style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.black)),
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

  const ProjetPost({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.technologies,
    this.projetUrl = '',
    this.imageHeight = 200.0, // Default value
    this.imageWidth = 200.0, // Default value
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
          border: Border.all(color: Colors.grey),
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
                    backgroundColor: Colors.black,
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
                  color: Colors.black,
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          widget.imagePath,
                          height: widget.imageHeight,
                          width: widget.imageWidth,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(widget.description),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 8.0,
                      children: widget.technologies
                          .map((tech) => Chip(label: Text(tech)))
                          .toList(),
                    ),
                    SizedBox(height: 10),
                    if (widget.projetUrl.isNotEmpty)
                      ElevatedButton(
                        onPressed: () async {
                          final url = Uri.parse(widget.projetUrl);
                          if (await canLaunch(url.toString())) {
                            await launch(url.toString());
                          } else {
                            // Handle error (e.g., show a snackbar)
                          }
                        },
                        child: Text("View Project"),
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
