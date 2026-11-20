import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/cake_shop_data.dart';
import '../widgets/app_image.dart';
import 'cake_shop_detail_ui.dart';

class CakeShopListUi extends StatelessWidget {
  const CakeShopListUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          'สายด่วนกินเค้ก',
          style: GoogleFonts.kanit(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.6,
            ),
            items: List.generate(
              7,
              (i) => ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AppImage(
                  'assets/images/ck0${i + 1}.png',
                  width: double.infinity,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.separated(
              itemCount: cakeShops.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final shop = cakeShops[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: AppImage(shop.image1, width: 60, height: 50),
                  ),
                  title: Text(shop.name),
                  subtitle: Text(shop.phone.trim()),
                  trailing: const FaIcon(
                    FontAwesomeIcons.circleChevronRight,
                    color: Colors.red,
                    size: 18,
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CakeShopDetailUi(cakeShop: shop),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
