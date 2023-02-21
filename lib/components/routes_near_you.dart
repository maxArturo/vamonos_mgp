// generates a single SizedBox representing a transportation line
// in the expanding drawer.
import 'dart:math';

import 'package:flutter/material.dart';

List<SizedBox> getLineComponents() {
  final linesNearYou = List<int>.generate(30, (i) => i + 1)
      .map((el) => sampleLineGenerator())
      .toList();

  linesNearYou.add(SizedBox(
    width: double.infinity,
    child: MaterialButton(
      onPressed: () {},
      color: const Color.fromARGB(255, 38, 46, 60),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Icon(
                    Icons.block_sharp,
                    size: 30,
                    color: Colors.white,
                  ),
                  Text("No more routes near you".toUpperCase(),
                      style: const TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(width: 13),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    ),
  ));
  return linesNearYou;
}

SizedBox sampleLineGenerator() {
  int dueIn = Random().nextInt(30);
  int lineNumber = 500 + Random().nextInt(100);
  final colors = [
    Colors.lightBlue,
    const Color.fromARGB(255, 24, 84, 26),
    Colors.deepOrangeAccent,
    Colors.deepPurpleAccent
  ];

  final color = colors[Random().nextInt(colors.length)];

  return SizedBox(
    width: double.infinity,
    child: MaterialButton(
      onPressed: () {},
      color: color,
      child: Column(
        children: [
          const SizedBox(height: 20),
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
              const Icon(Icons.bus_alert_outlined, color: Colors.white),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    ),
  );
}
