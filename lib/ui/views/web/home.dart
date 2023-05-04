import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gruchang_thai_gold_smith/core/bloc/product/product_bloc.dart';
import 'package:gruchang_thai_gold_smith/core/bloc/product/product_event.dart';
import 'package:gruchang_thai_gold_smith/ui/shared/theme.dart';
import 'package:gruchang_thai_gold_smith/ui/widgets/custom_footer.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/bloc/product/product_state.dart';
import '../../../core/sevices/model/product.dart';
import '../../router.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/custom_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  late ProductBloc _productBloc;

  @override
  void initState() {
    super.initState();
    _initPackageInfo();

    context.read<ProductBloc>().add(GetProductEvent());
  }

  @override
  void dispose() {
    super.dispose();
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

    return CustomLayout(
      body: _buildMain(),
    );
  }

  Widget _buildMain() {
    return ListView(
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
                      Colors.black12,
                      Color.fromRGBO(5, 5, 6, 1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            _buildHeaderMenu(),
            Positioned.fill(
              child: Center(
                child: Image.asset(
                  'assets/images/logo_gruchang_no_bg.png',
                  width: 400,
                ),
              ),
            ),
          ],
        ),
        _buildContentFirst(),
        const CustomFooter(),
      ],
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

  Widget _buildContentFirst() {
    // List<Product> listImgs = [
    //   Product(nameTH: 'กำไล ทองโบราณ ทองเพชรบุรี', imgUrl: 'https://drive.google.com/uc?export=view&id=11eEV4eJyhPxS044VO72m5QoVHT5d0rR6'),
    //   Product(nameTH: 'สร้อยคอ ทองโบราณ ทองเพชรบุรี', imgUrl: 'https://drive.google.com/uc?export=view&id=1sLgylZNJSV2fYHbHxNIIO1TT97HuuRkx'),
    //   Product(nameTH: 'แหวน ทองโบราณ ทองเพชรบุรี', imgUrl: 'https://drive.google.com/uc?export=view&id=1BkcEh_XpQ72YFwvFzd08jDDclHmKmaaL'),
    //   Product(nameTH: 'ปิ่น ทองโบราณ ทองเพชรบุรี', imgUrl: 'https://drive.google.com/uc?export=view&id=1nRwSu91BgYRcPuEiOIBz7zQF_tKIh5H3'),
    //   Product(nameTH: 'ต่างหู ทองโบราณ ทองเพชรบุรี', imgUrl: 'https://drive.google.com/uc?export=view&id=1hk2ffeVZcJ-u8VSdYfPs8g2tPfeX56Bo'),
    //   Product(nameTH: 'ผอบ ทองโบราณ ทองเพชรบุรี', imgUrl: 'https://drive.google.com/uc?export=view&id=1tMqNUdkKOXxbjp3J16oTgO7FPNXvK7Xw'),
    // ];

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
          padding: const EdgeInsets.all(30),
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is LoadingProductState) {
                return buildOverlayLoader();
              }

              if (state is SuccessLoadProductState) {
                return StaggeredGrid.count(
                  crossAxisCount: isLandscape ? 3 : 4,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                  children: [...state.products.map((e) => _buildImgItem(e))],
                );
              }

              return Container();
            },
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Expanded(
        //       child: SizedBox(
        //         height: 150,
        //         child: Center(
        //           child: ListView.builder(
        //             scrollDirection: Axis.horizontal,
        //             itemCount: 4,
        //             shrinkWrap: true,
        //             itemBuilder: (context, index) {
        //               return Padding(
        //                 padding: const EdgeInsets.symmetric(horizontal: 20),
        //                 child: Column(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   crossAxisAlignment: CrossAxisAlignment.center,
        //                   children: const [
        //                     Icon(Icons.ac_unit),
        //                     Text('etests'),
        //                     Text(
        //                       'กระบวนการผลิตเชิงช่างทองโบราณ\nมุ่งเน้นคุณค่าแห่งความคิด\nประกอบเข้ากับฝีมืออันบริสุทธิ์',
        //                       textAlign: TextAlign.center,
        //                     ),
        //                   ],
        //                 ),
        //               );
        //             },
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // const SizedBox(height: 30),
        // Image.network(
        //   'https://lh5.googleusercontent.com/6JnnBwt6QeujsOpE0yEDxkpHmb44WYa6-hf1pY3uFGOb5mi3dBWBwF0UP8DLl0r6C9Q=w2400',
        //   fit: BoxFit.cover,
        //   errorBuilder: (context, error, stackTrace) {
        //     return Container(color: Colors.amber, height: 30);
        //   },
        // ),
        // const SizedBox(height: 30),
        // const Text(
        //   'Our Product',
        //   style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        //   textAlign: TextAlign.center,
        //   overflow: TextOverflow.ellipsis,
        // ),
        // const SizedBox(width: 100, child: Divider(color: Colors.orange)),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Expanded(
        //       child: SizedBox(
        //         height: 200,
        //         child: Center(
        //           child: ListView.builder(
        //             scrollDirection: Axis.horizontal,
        //             itemCount: 4,
        //             shrinkWrap: true,
        //             itemBuilder: (context, index) {
        //               return Padding(
        //                 padding: const EdgeInsets.symmetric(horizontal: 10),
        //                 child: Card(
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(8.0),
        //                     child: Column(
        //                       mainAxisAlignment: MainAxisAlignment.center,
        //                       crossAxisAlignment: CrossAxisAlignment.center,
        //                       children: [
        //                         const Icon(Icons.ac_unit, size: 30),
        //                         Text(
        //                           'สินค้า ${index + 1}',
        //                           style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        //                         ),
        //                         const Text(
        //                           'กระบวนการผลิตเชิงช่างทองโบราณ\nมุ่งเน้นคุณค่าแห่งความคิด\nประกอบเข้ากับฝีมืออันบริสุทธิ์',
        //                           textAlign: TextAlign.center,
        //                           overflow: TextOverflow.ellipsis,
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //               );
        //             },
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }

  Widget buildOverlayLoader() {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: Colors.deepPurple,
        size: 100,
      ),
    );
  }

  Widget _buildImgItem(Product product) {
    return StaggeredGridTile.count(
      crossAxisCellCount: isLandscape ? 1 : 2,
      mainAxisCellCount: isLandscape ? 1 : 2,
      child: InkWell(
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                alignment: Alignment.center,
                imageUrl: product.imgUrl ?? '',
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return Image.asset(
                    'assets/images/logo_gruchang_no_bg.png',
                    fit: BoxFit.cover,
                  );
                },
                errorWidget: (context, url, error) {
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
                      product.nameTH,
                      style: Theme.of(context).textTheme.large,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, RoutePaths.catalogPage);
        },
      ),
    );
  }
}
