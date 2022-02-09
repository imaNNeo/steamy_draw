import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class Utils {
  static Future<ui.Image> getCachedImage(String imageUrl) {
    final provider = CachedNetworkImageProvider(imageUrl);
    Future<ui.Codec> instantiateImageCodec(
        Uint8List bytes, {
          int? cacheWidth,
          int? cacheHeight,
          bool allowUpscaling = false,
        }) {
      assert(cacheWidth == null || cacheWidth > 0);
      assert(cacheHeight == null || cacheHeight > 0);
      return ui.instantiateImageCodec(
        bytes,
        targetWidth: cacheWidth,
        targetHeight: cacheHeight,
        allowUpscaling: allowUpscaling,
      );
    }
    final ImageStreamCompleter imageCompleter =
    provider.load(provider, instantiateImageCodec);

    Completer<ui.Image> c = Completer();

    late ImageStreamListener listener;
    listener = ImageStreamListener((ImageInfo image, bool synchronousCall) {
      c.complete(image.image);
      imageCompleter.removeListener(listener);
    }, onError: (Object exception, StackTrace? stack) {
      c.completeError(exception, stack);
      imageCompleter.removeListener(listener);
    });
    imageCompleter.addListener(listener);
    return c.future;
  }



}