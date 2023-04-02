import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLandscape = false;

  @override
  Widget build(BuildContext context) {
    isLandscape = (MediaQuery.maybeOf(context)?.size.width ?? 0) > (MediaQuery.maybeOf(context)?.size.height ?? 0);
    return Scaffold(
      body: _buildMain(),
    );
  }

  Widget _buildMain() {
    return Container(
      color: const Color.fromRGBO(5, 5, 6, 1),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            height: 40,
          ),
          Stack(
            children: [
              Container(height: 500),
              _buildPicBackground(),
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black26,
                        Color.fromRGBO(5, 5, 6, 1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              _buildHeaderMenu(),
            ],
          ),
          _buildContent(),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildPicBackground() {
    return Positioned.fill(
      child: Image.asset(
        'assets/images/gold.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildHeaderMenu() {
    return Padding(
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
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Our Product',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(width: 100, child: Divider(color: Colors.orange)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: 150,
                child: Center(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(Icons.ac_unit),
                            Text('etests'),
                            Text(
                              'กระบวนการผลิตเชิงช่างทองโบราณ\nมุ่งเน้นคุณค่าแห่งความคิด\nประกอบเข้ากับฝีมืออันบริสุทธิ์',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        _buildPanelProductItem(imagePath: 'assets/images/product1.png', flexLeft: 5, flexRight: 8, isPadding: true),
        const SizedBox(height: 30),
        _buildPanelProductItem(imagePath: 'assets/images/product2.png', flexLeft: 8, flexRight: 5, isPadding: true),
        const SizedBox(height: 30),
        const Text(
          'Our Product',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(width: 100, child: Divider(color: Colors.orange)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: 200,
                child: Center(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.ac_unit, size: 30),
                                Text(
                                  'สินค้า ${index + 1}',
                                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  'กระบวนการผลิตเชิงช่างทองโบราณ\nมุ่งเน้นคุณค่าแห่งความคิด\nประกอบเข้ากับฝีมืออันบริสุทธิ์',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _imageWidget(String imagePath, int flex) {
    return SizedBox(
      width: 400,
      child: Card(
        child: SizedBox(
          height: 400,
          child: Positioned.fill(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _textWidget(int flex) {
    return Expanded(
      flex: flex,
      child: Container(
        height: 400,
        color: const Color.fromRGBO(17, 17, 24, 1),
      ),
    );
  }

  Widget _buildPanelProductItem({String imagePath = '', int flexLeft = 5, int flexRight = 7, bool isPadding = true}) {
    if (!isLandscape) {
      return Container();
    }

    List<Widget> listWidget = [];

    if (flexLeft < flexRight) {
      listWidget.addAll([_imageWidget(imagePath, flexLeft), const SizedBox(width: 20), _textWidget(flexRight)]);
    } else {
      listWidget.addAll([_textWidget(flexLeft), const SizedBox(width: 20), _imageWidget(imagePath, flexRight)]);
    }

    return Row(
      children: [
        if (isPadding) Expanded(flex: 1, child: Container()),
        for (Widget item in listWidget) item,
        if (isPadding) Expanded(flex: 1, child: Container()),
      ],
    );
  }

  Widget _buildFooter() {
    return const SizedBox(
      height: 100,
    );
  }
}
