import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildMain(),
    );
  }

  Widget _buildMain() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          height: 40,
          color: Colors.black,
        ),
        Stack(
          children: [
            Container(height: 500),
            Positioned.fill(
              child: Image.asset(
                'assets/images/gold.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.black26,
                      Colors.black,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: const [
                            Text('WOMEN', style: TextStyle(color: Colors.white)),
                            SizedBox(width: 10),
                            Text('MEN', style: TextStyle(color: Colors.white)),
                            SizedBox(width: 10),
                            Text('KID', style: TextStyle(color: Colors.white)),
                            SizedBox(width: 10),
                            Text('ACCESSORIES', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      const Expanded(
                        // child: Image.asset(
                        //   'assets/images/logo_gruchang_no_bg.png',
                        //   height: 200,
                        // ),
                        child: Text('กรุช่างทอง', textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text('WOMEN', style: TextStyle(color: Colors.white)),
                            SizedBox(width: 10),
                            Text('MEN', style: TextStyle(color: Colors.white)),
                            SizedBox(width: 10),
                            Text('KID', style: TextStyle(color: Colors.white)),
                            SizedBox(width: 10),
                            Text('ACCESSORIES', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Center(
                  //   child: Image.asset(
                  //     'assets/images/logo_gruchang_no_bg.png',
                  //     height: 200,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
        Container(
          height: 1000,
          color: Colors.black,
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        Container(
          height: 200,
          color: Colors.green,
        ),
        Container(
          height: 200,
          color: Colors.pinkAccent,
        ),
        Container(
          height: 1000,
          color: Colors.red,
        ),
      ],
    );
  }
}
