import 'package:flutter/material.dart';
import 'package:steamy_draw/resources.dart';

class MainButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool iconOnRight;
  final GestureTapCallback? onTap;

  const MainButton({
    Key? key,
    required this.text,
    required this.icon,
    this.iconOnRight = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const height = 48.0;
    const iconSize = height * 1.3;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.center,
        children: [
          Container(
            height: height,
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.all(Radius.circular(height / 2)),
            ),
          ),
          Directionality(
            textDirection: iconOnRight ? TextDirection.rtl : TextDirection.ltr,
            child: Row(
              children: [
                Container(
                  width: iconSize,
                  height: iconSize,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(iconSize / 2)),
                    border: Border.all(color: AppColors.primary, width: 2),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: iconSize * 0.6,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.secondary,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
