import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gruchang_thai_gold_smith/ui/shared/theme.dart';

import '../../widgets/custom_footer.dart';
import '../../widgets/custom_layout.dart';
import 'home.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  String testDesc = '''กระบวนการผลิตเชิงช่างทองโบราณ มุ่งเน้นคุณค่าแห่งความคิด ประกอบเข้ากับฝีมืออันบริสุทธิ์ ทุกๆ เทคนิคล้วนต้องใช้ความสามารถเฉพาะด้าน สมาธิ และระยะเวลาในการทำ งานทองโบราณส่วนใหญ่ จึงไม่สามารถผลิต เพื่อตอบสนองผู้ต้องการได้ทันท่วงที กระนั้นผู้ที่เห็นคุณค่าของงานฝีมือ เครื่องทองโบราณจึงเป็นกลุ่มคนที่ไม่มากนัก งานเครื่องทองโบราณมีกรรมวิธีในการผลิตหลากหลายเทคนิค ขั้นตอน และรูปแบบมากมายล้วนมีที่มา งานเครื่องทองโบราณแฝงไปด้วยความเชื่อ ที่มีมาแต่โบราณ มีความหมายอันเป็นสิริมงคล เสริมพลังต่อผู้ครอบครอง''';

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      isShowBack: true,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildMainHeader(),
                    const SizedBox(height: 10),
                    _buildContent(),
                    const SizedBox(height: 10),
                    const CustomFooter(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainHeader() {
    return Card(
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: Row(
              children: [
                Expanded(
                  child: _buildHeaderImage(),
                ),
              ],
            ),
          ),
          _buildHeaderText(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'อ่านเพิ่มเติม...',
                  style: Theme.of(context).textTheme.large.copyWith(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderImage() {
    return Image.asset(
      'assets/images/p1_1.png',
      fit: BoxFit.cover,
    );
  }

  Widget _buildHeaderText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'กำไลทองโบราณ กำไลโบราณ',
            style: Theme.of(context).textTheme.xxlarger.copyWith(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '   $testDesc',
            style: Theme.of(context).textTheme.large,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    List<Product> listImgs = [
      Product(name: 'BA-101', imgUrl: 'https://drive.google.com/uc?export=view&id=11eEV4eJyhPxS044VO72m5QoVHT5d0rR6'),
      Product(name: 'BA-102', imgUrl: 'https://drive.google.com/uc?export=view&id=1sLgylZNJSV2fYHbHxNIIO1TT97HuuRkx'),
      Product(name: 'BA-103', imgUrl: 'https://drive.google.com/uc?export=view&id=1BkcEh_XpQ72YFwvFzd08jDDclHmKmaaL'),
      Product(name: 'BA-104', imgUrl: 'https://drive.google.com/uc?export=view&id=1nRwSu91BgYRcPuEiOIBz7zQF_tKIh5H3'),
      Product(name: 'BA-105', imgUrl: 'https://drive.google.com/uc?export=view&id=1hk2ffeVZcJ-u8VSdYfPs8g2tPfeX56Bo'),
      Product(name: 'BA-106', imgUrl: 'https://drive.google.com/uc?export=view&id=1tMqNUdkKOXxbjp3J16oTgO7FPNXvK7Xw'),
      Product(name: 'BA-107', imgUrl: 'https://drive.google.com/uc?export=view&id=11eEV4eJyhPxS044VO72m5QoVHT5d0rR6'),
      Product(name: 'BA-108', imgUrl: 'https://drive.google.com/uc?export=view&id=1sLgylZNJSV2fYHbHxNIIO1TT97HuuRkx'),
      Product(name: 'BA-109', imgUrl: 'https://drive.google.com/uc?export=view&id=1BkcEh_XpQ72YFwvFzd08jDDclHmKmaaL'),
      Product(name: 'BA-110', imgUrl: 'https://drive.google.com/uc?export=view&id=1nRwSu91BgYRcPuEiOIBz7zQF_tKIh5H3'),
      Product(name: 'BA-111', imgUrl: 'https://drive.google.com/uc?export=view&id=1hk2ffeVZcJ-u8VSdYfPs8g2tPfeX56Bo'),
      Product(name: 'BA-112', imgUrl: 'https://drive.google.com/uc?export=view&id=1tMqNUdkKOXxbjp3J16oTgO7FPNXvK7Xw'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'สินค้าของเรา',
          style: Theme.of(context).textTheme.xlarger.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(width: 100, child: Divider(color: Colors.orange)),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(20),
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: [...listImgs.map((e) => _buildImgItem(e))],
          ),
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
            child: FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              image: product.imgUrl,
              placeholder: 'assets/images/logo_gruchang_no_bg.png',
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/logo_gruchang_no_bg.png',
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: const Color(0x66000000),
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
}
