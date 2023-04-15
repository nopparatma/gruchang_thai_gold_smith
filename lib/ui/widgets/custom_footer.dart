import 'package:flutter/material.dart';
import 'package:gruchang_thai_gold_smith/ui/shared/theme.dart';

class CustomFooter extends StatefulWidget {
  const CustomFooter({super.key});

  @override
  _CustomFooterState createState() => _CustomFooterState();
}

class _CustomFooterState extends State<CustomFooter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(color: Colors.orange, indent: 10, endIndent: 10),
        const SizedBox(height: 10),
        Image.asset(
          'assets/images/contact.png',
          height: 50,
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}
