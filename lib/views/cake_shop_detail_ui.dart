import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/cake_shop.dart';
import '../widgets/app_image.dart';

class CakeShopDetailUi extends StatelessWidget {
  final CakeShop cakeShop;

  const CakeShopDetailUi({super.key, required this.cakeShop});

  Future<void> _open(BuildContext context, Uri uri) async {
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ไม่สามารถเปิด $uri ได้')),
      );
    }
  }

  Widget _section(String title, String body) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            Text(body, style: const TextStyle(color: Colors.black54)),
          ],
        ),
      );

  Widget _linkTile(
    BuildContext context,
    Widget icon,
    String url,
  ) =>
      ListTile(
        contentPadding: EdgeInsets.zero,
        dense: true,
        leading: icon,
        title: Text(url),
        trailing: const Icon(Icons.link),
        onTap: () => _open(context, Uri.parse(url)),
      );

  @override
  Widget build(BuildContext context) {
    final position = LatLng(
      double.parse(cakeShop.latitude),
      double.parse(cakeShop.longitude),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(cakeShop.name, style: GoogleFonts.kanit()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AppImage(cakeShop.image1, width: 120, height: 80),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AppImage(cakeShop.image2, width: 120, height: 80),
                ),
                const SizedBox(width: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AppImage(cakeShop.image3, width: 120, height: 80),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _section('ชื่อร้าน 🏪', cakeShop.name),
            _section('เวลาเปิดปิด ⏰', cakeShop.openCloseTime),
            _section('รายละเอียดร้าน ℹ️', cakeShop.description),
            _section('ที่อยู่ของร้าน 🚩', cakeShop.address),
            Center(
              child: ElevatedButton.icon(
                onPressed: () =>
                    _open(context, Uri(scheme: 'tel', path: cakeShop.phone)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: const StadiumBorder(),
                ),
                icon: const Icon(Icons.phone, size: 18),
                label: Text(cakeShop.phone),
              ),
            ),
            const SizedBox(height: 8),
            _linkTile(
              context,
              const FaIcon(FontAwesomeIcons.globe, color: Colors.orange),
              cakeShop.website,
            ),
            _linkTile(
              context,
              const FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
              cakeShop.facebook,
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FlutterMap(
                  options: MapOptions(initialCenter: position, initialZoom: 15),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName:
                          'com.example.flutter_cake_shop_project',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: position,
                          width: 40,
                          height: 40,
                          child: const Icon(
                            Icons.location_pin,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
