import 'package:flutter/material.dart';
import 'package:gruchang_thai_gold_smith/ui/shared/theme.dart';

import 'custom_drawer.dart';
import 'custom_footer.dart';

class CustomLayout extends StatefulWidget {
  final Widget body;
  final bool isShowBack;

  const CustomLayout({
    super.key,
    required this.body,
    this.isShowBack = false,
  });

  @override
  _CustomLayoutState createState() => _CustomLayoutState();
}

class _CustomLayoutState extends State<CustomLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: widget.isShowBack ? null : const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: widget.isShowBack
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        title: Image.asset(
          'assets/images/contact.png',
          height: 40,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.search, size: 30)),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          color: const Color.fromRGBO(5, 5, 6, 1),
          child: Column(
            children: [
              Expanded(child: widget.body),
            ],
          ),
        ),
      ),
    );
  }
}
