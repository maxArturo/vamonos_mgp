import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  bool showBottomMenu = false;

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);

    double height = MediaQuery.of(context).size.height;
    double threshold = 100;

    return Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onPanEnd: (details) {
            // debugPrint(details.velocity.pixelsPerSecond.dy.toString());
            if (details.velocity.pixelsPerSecond.dy > threshold) {
              setState(() {
                showBottomMenu = false;
              });
            } else if (details.velocity.pixelsPerSecond.dy < -threshold) {
              setState(() {
                showBottomMenu = true;
              });
            }
          },
          child: SizedBox(
            height: height,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Some Texty"),
                          const SizedBox(height: 20),
                          TextField(
                            maxLines: 1,
                            // controller: _emailController,
                            keyboardType: TextInputType.streetAddress,
                            cursorColor: currentTheme.colorScheme.secondary,
                            decoration: InputDecoration(
                              hintText: "Where do you want to go?",
                              prefixIcon: Icon(
                                Icons.search,
                                color: currentTheme.primaryColor,
                              ),
                              // errorText: (_emailError) ? "Invalid Email" : null,
                              border: const UnderlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                    opacity: showBottomMenu ? 1 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(color: Colors.black.withOpacity(0.2)),
                    )),
                AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    left: 0,
                    bottom: showBottomMenu ? -50 : -height / 3,
                    // 50 pixels is the height of the first three children of the MenuExpanderWidget
                    child: const MenuExpanderWidget())
              ],
            ),
          ),
        ));
  }
}

class MenuExpanderWidget extends StatelessWidget {
  const MenuExpanderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        color: Colors.lightBlue.shade300,
        width: width,
        height: height / 3 +
            20 +
            10 +
            20, // add up heights for the first three children here
        child: Column(children: [
          const Icon(Icons.keyboard_arrow_up, size: 20),
          const Text(
            "Lines Nearby You",
            style: TextStyle(fontSize: 10),
          ),
          const SizedBox(height: 20),
          ...List<int>.generate(10, (i) => i + 1)
              .map((el) => sampleLineGenerator(el))
          // sampleLineGenerator(1),
        ]),
      ),
    );
  }
}

SizedBox sampleLineGenerator(int lineNumber) {
  int dueIn = Random().nextInt(30);
  return SizedBox(
    width: double.infinity,
    child: MaterialButton(
      onPressed: () {},
      color: Colors.blue.shade700,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("Sample Line $lineNumber".toUpperCase(),
                      style: const TextStyle(color: Colors.white)),
                  Text("Due in $dueIn min".toUpperCase(),
                      style: const TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(width: 13),
              const Icon(
                Icons.bus_alert_outlined,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 13),
        ],
      ),
    ),
  );
}
