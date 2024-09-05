import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TimerFieldConstructor extends StatelessWidget {
  /* Cannot be constant. if constant the backspace button
  // doesn't work*/
  TimerFieldConstructor({
    super.key, 
    // required this.hint,
    required this.controller,
    required this.fieldType,
    this.padding = const EdgeInsets.all(20.0),
    this.width = 50.0,
    this.fontSize = 40.0,
  });
  
  final String fieldType;
  // final String hint;
  final EdgeInsetsGeometry padding;
  final double width;
  final double fontSize;
  final TextEditingController controller;
  // final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    if (!["minute", "second", "hour"].contains(fieldType)) {
      throw Exception("invalid fieldType specified");
    }

    final decoration = InputDecoration(
      counterText: "", // isCollapsed: true,
      helper: Text(fieldType),
      // hintText: hint,
      // hintStyle: TextStyle(color:Color.fromARGB(255, 118, 118, 118))
    );

    final element = Padding(
      padding: padding,
      child: SizedBox(
        width: width,
        child: TextFormField(
          controller: controller,
          maxLength: 2,
          // initialValue: hint,
          textAlign: TextAlign.center,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          style: TextStyle(fontSize: fontSize),
          keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
          decoration: decoration,
          validator: validatorConstructor(fieldType)
        ),
      )
    );
    
    return element;
  }
}

String? Function(String?) validatorConstructor(String t) {
  if (t == "hour") {
    String? x(String? st) {
      if (st is! String) {
        return "not string";
      }
      else if (st.isEmpty) {
         return "empty";
      }
      else if (int.tryParse(st)! > 23) {
        return "too big";
      }
      return null;
    }
    return x;
  } else if (t == "minute" || t == "second") {
    String? x(String? st) {
      if (st is! String) {
        return "not string";
      }
      else if (st.isEmpty) {
        return "empty";
      }
      else if (int.tryParse(st)! > 59) {
        return "too big";
      }
      return null;
    }
    return x;
  } else {
    throw Exception("invalid fieldType specified");
  } 
}