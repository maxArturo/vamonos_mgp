import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  final String title;
  final Widget? child;
  final String? bodyText;

  const AboutSection(
      {required this.title, this.bodyText, this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
          ),
          child: child ??
              Text(
                bodyText ?? "",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
