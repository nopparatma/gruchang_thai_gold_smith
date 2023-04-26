import 'package:flutter/material.dart';
import 'package:gruchang_thai_gold_smith/ui/shared/theme.dart';

import '../../widgets/custom_layout.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      body: _buildMain(),
    );
  }

  Widget _buildMain() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'ติดต่อเรา',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(width: 100, child: Divider(color: Colors.orange)),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.grey,
                      height: (MediaQuery.maybeOf(context)?.size.width ?? 0) / 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
               Text(
                'ร้าน กรุช่าง เครื่องทองโบราณ\nชั้น 2 โซนผ้าไหม\nดิโอลด์สยามพลาซ่า\nโทร. 083-7188850, 089-4597773',
                style: Theme.of(context).textTheme.large.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 30),
              const Text(
                'แบบฟอร์มจองสินค้า',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(width: 100, child: Divider(color: Colors.orange)),
            ],
          ),
        ),
      ],
    );
  }
}
