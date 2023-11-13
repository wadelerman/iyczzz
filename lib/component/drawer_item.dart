import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const DrawerItem({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: 51,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1.5,
              color: Colors.black,
            ),
            bottom: BorderSide(
              width: 1.5,
              color: Colors.black,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
