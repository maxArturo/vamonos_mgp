import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

class BaseToast extends StatelessWidget {
  final String toastText;
  const BaseToast({super.key, required this.toastText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                toastText,
              )),
        ],
      ),
    );
  }
}

SizedBox errorToastSink(AppError err) {
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await Fluttertoast.showToast(
        msg: err.userText,
        toastLength: Toast.LENGTH_LONG, //duration
        gravity: ToastGravity.TOP, //location
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red, //background color
        textColor: Colors.white, //text Color
        fontSize: 16.0 //font size
        );
  });

  return const SizedBox.shrink();
}
