import 'package:flutter/material.dart';

/// แสดงรูปจาก assets ถ้ายังไม่มีไฟล์รูปจะแสดงกรอบไอคอนเค้กแทน
class AppImage extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;

  const AppImage(
    this.path, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => Container(
        width: width,
        height: height,
        color: Colors.red.shade50,
        alignment: Alignment.center,
        child: Icon(Icons.cake, color: Colors.red.shade300),
      ),
    );
  }
}
