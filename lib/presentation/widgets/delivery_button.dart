import 'package:delivery_app/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class DeliveryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final EdgeInsets padding;

  const DeliveryButton({
    Key key,
    this.onTap,
    this.text,
    this.padding = const EdgeInsets.all(14.0)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: deliveryGradients,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
