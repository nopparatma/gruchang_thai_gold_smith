import 'package:flutter/material.dart';

import '../../widgets/custom_footer.dart';
import '../../widgets/custom_layout.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      body: _buildMain(),
    );
  }

  Widget _buildMain() {
    return ListView(
      children: [
        Column(
          children: const [
            Text(
              'เกี่ยวกับเรา',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(width: 100, child: Divider(color: Colors.orange)),
          ],
        ),
        const CustomFooter(),
      ],
    );
  }
}
