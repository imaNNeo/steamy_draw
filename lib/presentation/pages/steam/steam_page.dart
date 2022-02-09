import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:steamy_draw/presentation/models/selected_steam.dart';

class SteamPage extends StatefulWidget {
  final ui.Image image;
  final SelectedSteamImage steam;

  const SteamPage(
      {Key? key, required this.image, required this.steam})
      : super(key: key);

  @override
  State<SteamPage> createState() => _SteamPageState();
}

class _SteamPageState extends State<SteamPage> {

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SteamPainter(widget.image, widget.steam),
    );
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

}

class SteamPainter extends CustomPainter {

  final ui.Image image;
  final SelectedSteamImage steam;

  SteamPainter(this.image, this.steam);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(image, Offset.zero, Paint());
    canvas.drawImage(steam.steam, Offset.zero, Paint()..color = Color.fromARGB((steam.opacity * 255).toInt(), 0, 0, 0));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
