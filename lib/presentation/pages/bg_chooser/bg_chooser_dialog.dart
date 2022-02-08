import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:steamy_draw/data/entity/app_data_entity.dart';
import 'package:steamy_draw/resources.dart';

class BgChooserDialog extends StatefulWidget {
  final List<Background> backgrounds;

  const BgChooserDialog({Key? key, required this.backgrounds})
      : super(key: key);

  @override
  _BgChooserDialogState createState() => _BgChooserDialogState();
}

class _BgChooserDialogState extends State<BgChooserDialog> {
  int currentIndex = 0;

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
                child: CachedNetworkImage(
                  imageUrl: widget.backgrounds[currentIndex].image,
                  placeholder: (context, url) =>
                      Container(color: AppColors.loadImagePlaceHolder),
                  errorWidget: (context, url, error) =>
                      Container(color: AppColors.loadImagePlaceHolder),
                ),
              ),
              const SizedBox(height: 42),
              SizedBox(
                height: thumbSize,
                child: PageView.builder(
                  itemCount: widget.backgrounds.length,
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
                            imageUrl: widget.backgrounds[i].thumbnail,
                            placeholder: (context, url) => Container(
                              decoration: const BoxDecoration(
                                color: AppColors.loadImagePlaceHolder,
                                shape: BoxShape.circle,
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
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
              const SizedBox(height: 68),
              FloatingActionButton(
                backgroundColor: AppColors.primary,
                onPressed: () {
                  Navigator.of(context).pop();
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
