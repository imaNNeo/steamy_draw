import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:steamy_draw/data/entity/app_data_entity.dart';
import 'package:steamy_draw/presentation/models/selected_steam.dart';
import 'package:steamy_draw/resources.dart';

class SteamChooserDialog extends StatefulWidget {
  final ui.Image background;
  final List<Steam> steams;

  const SteamChooserDialog({
    Key? key,
    required this.background,
    required this.steams,
  }) : super(key: key);

  @override
  _SteamChooserDialogState createState() => _SteamChooserDialogState();
}

class _SteamChooserDialogState extends State<SteamChooserDialog> {
  static const double _opacityMin = 0.6;
  static const double _opacityMax = 0.9;

  int currentIndex = 0;
  double _opacity = _opacityMin + ((_opacityMax - _opacityMin) / 2);

  @override
  Widget build(BuildContext context) {
    const thumbSize = 60.0;
    const radius = 16.0;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(radius)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 1.777,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    RawImage(image: widget.background),
                    Opacity(
                      child: CachedNetworkImage(
                        imageUrl: widget.steams[currentIndex].landscape,
                        fit: BoxFit.cover,
                      ),
                      opacity: _opacity,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 42),
              SizedBox(
                height: thumbSize,
                child: PageView.builder(
                  itemCount: widget.steams.length,
                  controller: PageController(viewportFraction: 0.3),
                  onPageChanged: (int index) =>
                      setState(() => currentIndex = index),
                  itemBuilder: (_, i) {
                    return Transform.scale(
                      scale: i == currentIndex ? 1 : 0.9,
                      child: Opacity(
                        opacity: i == currentIndex ? 1 : 0.5,
                        child: SizedBox(
                          width: thumbSize,
                          child: CachedNetworkImage(
                            imageUrl: widget.steams[i].thumbnail,
                            placeholder: (context, url) =>
                                Container(
                                  decoration: const BoxDecoration(
                                    color: AppColors.loadImagePlaceHolder,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                            errorWidget: (context, url, error) =>
                                Container(
                                  decoration: const BoxDecoration(
                                    color: AppColors.loadImagePlaceHolder,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Slider(
                value: _opacity,
                onChanged: (newValue) {
                  setState(() {
                    _opacity = newValue;
                  });
                },
                min: _opacityMin,
                max: _opacityMax,
              ),
              const SizedBox(height: 42),
              FloatingActionButton(
                backgroundColor: AppColors.primary,
                onPressed: () {
                  Navigator.of(context).pop(
                    MapEntry(widget.steams[currentIndex], _opacity),
                  );
                },
                child: const Text(
                  'شروع',
                  style: TextStyle(color: AppColors.onPrimary),
                ),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
