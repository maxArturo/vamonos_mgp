import 'package:flutter/material.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

class ErrorLayer extends StatelessWidget {
  final AppError error;
  final Color? color;
  final Alignment alignment;
  const ErrorLayer({
    super.key,
    required this.error,
    this.color,
    this.alignment = const Alignment(0.0, -0.9),
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: ColoredBox(
          color: color ?? const Color.fromARGB(229, 240, 236, 92),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        error.userText,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 67, 59, 59)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
