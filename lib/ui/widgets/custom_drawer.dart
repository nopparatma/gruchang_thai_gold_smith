import 'package:flutter/material.dart';
import 'package:gruchang_thai_gold_smith/ui/shared/theme.dart';

import '../router.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/logo_gruchang.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SizedBox(),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                _buildMenuItem('หน้าหลัก', Icons.ac_unit, page: RoutePaths.homePage),
                _buildMenuItem('สร้อยคอ', Icons.ac_unit),
                _buildMenuItem('ข้อมือ', Icons.ac_unit),
                _buildMenuItem('กรอบพระ', Icons.ac_unit),
                _buildMenuItem('ทับทรวง', Icons.ac_unit),
                _buildMenuItem('แหวนทองโบราณ', Icons.ac_unit),
                _buildMenuItem('กำไลทองโบราณ', Icons.ac_unit),
                _buildMenuItem('ต่างหูโบราณ', Icons.ac_unit),
                _buildMenuItem('ปิ่นทองโบราณ', Icons.ac_unit),
                _buildMenuItem('เครื่องประดับแต่งงาน', Icons.ac_unit),
                _buildMenuItem('ผอบทอง', Icons.ac_unit),
                _buildMenuItem('งานเครื่องถมเงิน เครื่องถมทอง', Icons.ac_unit),
                _buildMenuItem('งานเครื่องประดับอื่นๆ', Icons.ac_unit),
                const Divider(color: Colors.orange, thickness: 2, indent: 10, endIndent: 10),
                _buildMenuItem('เกี่ยวกับเรา', Icons.ac_unit, page: RoutePaths.aboutUsPage),
                _buildMenuItem('ติดต่อเรา', Icons.ac_unit, page: RoutePaths.contactUsPage),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String text, IconData icon, {String? page}) {
    return InkWell(
      onTap: page != null ? () => Navigator.pushReplacementNamed(context, page) : () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon, size: 30),
            const SizedBox(width: 10),
            Expanded(
              child: Text(text, textAlign: TextAlign.left, style: Theme.of(context).textTheme.normal),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.navigate_next, size: 30),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatefulWidget {
  final String text;
  final IconData icon;
  final Function function;

  const MenuItem({super.key, required this.text, required this.icon, required this.function});

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.function(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(widget.icon, size: 30),
            const SizedBox(width: 10),
            Expanded(
              child: Text(widget.text, textAlign: TextAlign.left, style: Theme.of(context).textTheme.normal),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.navigate_next, size: 30),
          ],
        ),
      ),
    );
  }
}
