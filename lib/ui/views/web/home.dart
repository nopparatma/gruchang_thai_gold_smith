import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gruchang_thai_gold_smith/ui/shared/theme.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'navbar_drawer.dart';

class Product {
  String imgUrl;
  String name;

  Product({required this.imgUrl, required this.name});
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  bool isLandscape = false;

  @override
  Widget build(BuildContext context) {
    isLandscape = (MediaQuery.maybeOf(context)?.size.width ?? 0) > (MediaQuery.maybeOf(context)?.size.height ?? 0);
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const NavbarDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0x44000000),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'กรุช่างทอง',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.larger.copyWith(fontFamily: 'Thaispirit'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.search, size: 30)),
          )
        ],
      ),
      body: _buildMain(),
    );
  }

  Widget _buildMain() {
    return Container(
      color: const Color.fromRGBO(5, 5, 6, 1),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'V.${_packageInfo.version}+${_packageInfo.buildNumber}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    List<Product> listImgs = [
      Product(name: 'กำไล ทองโบราณ ทองเพชรบุรี', imgUrl: 'https://drive.google.com/uc?export=view&id=11eEV4eJyhPxS044VO72m5QoVHT5d0rR6'),
      Product(name: 'สร้อยคอ ทองโบราณ ทองเพชรบุรี', imgUrl: 'https://drive.google.com/uc?export=view&id=1sLgylZNJSV2fYHbHxNIIO1TT97HuuRkx'),
      Product(name: 'แหวน ทองโบราณ ทองเพชรบุรี', imgUrl: 'https://drive.google.com/uc?export=view&id=1BkcEh_XpQ72YFwvFzd08jDDclHmKmaaL'),
      Product(name: 'ปิ่น ทองโบราณ ทองเพชรบุรี', imgUrl: 'https://drive.google.com/uc?export=view&id=1nRwSu91BgYRcPuEiOIBz7zQF_tKIh5H3'),
      Product(name: 'ต่างหู ทองโบราณ ทองเพชรบุรี', imgUrl: 'https://drive.google.com/uc?export=view&id=1hk2ffeVZcJ-u8VSdYfPs8g2tPfeX56Bo'),
      Product(name: 'ผอบ ทองโบราณ ทองเพชรบุรี', imgUrl: 'https://drive.google.com/uc?export=view&id=1tMqNUdkKOXxbjp3J16oTgO7FPNXvK7Xw'),
    ];

    // https://drive.google.com/file/d/1CAYCNaYebn5mTS9MC_NQjAq9nB32ldhH/view?usp=share_link
    // https://drive.google.com/uc?export=view&id=1CAYCNaYebn5mTS9MC_NQjAq9nB32ldhH
    // 'https://lh5.googleusercontent.com/6JnnBwt6QeujsOpE0yEDxkpHmb44WYa6-hf1pY3uFGOb5mi3dBWBwF0UP8DLl0r6C9Q=w2400'

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
        Padding(
          padding: const EdgeInsets.all(20),
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: [...listImgs.map((e) => _buildImgItem(e))],
          ),
        ),
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
        Image.network(
          'https://lh5.googleusercontent.com/6JnnBwt6QeujsOpE0yEDxkpHmb44WYa6-hf1pY3uFGOb5mi3dBWBwF0UP8DLl0r6C9Q=w2400',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(color: Colors.amber, height: 30);
          },
        ),
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

  Widget _buildImgItem(Product product) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              product.imgUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                return Center(
                  child: LoadingAnimationWidget.discreteCircle(
                    color: Colors.deepPurple,
                    size: 100,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/logo_gruchang.png',
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: const Color(0x44000000),
                height: 60,
                child: Center(
                  child: Text(
                    product.name,
                    style: Theme.of(context).textTheme.large,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _imageWidget(String imagePath, int flex) {
    return SizedBox(
      width: 400,
      child: Card(
        child: SizedBox(
          height: 400,
          child: Positioned.fill(
            child: Image.network(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: Colors.amber);
              },
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
