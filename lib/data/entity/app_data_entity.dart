class AppDataEntity {
  late List<Background> defaultBackgrounds;
  late List<Steams> steams;
  late Config config;

  AppDataEntity.fromJson(Map<String, dynamic> json) {
    defaultBackgrounds = <Background>[];
    json['default_backgrounds'].forEach((v) {
      defaultBackgrounds.add(Background.fromJson(v));
    });
    steams = <Steams>[];
    json['steams'].forEach((v) {
      steams.add(Steams.fromJson(v));
    });
    config = Config.fromJson(json['config']);
  }

  Map<String, dynamic> toJson() => {
        'default_backgrounds':
            defaultBackgrounds.map((v) => v.toJson()).toList(),
        'steams': steams.map((v) => v.toJson()).toList(),
        'config': config.toJson(),
      };
}

class Background {
  late String slug;
  late String image;
  late String thumbnail;

  Background.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    image = json['image'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() => {
        'slug': slug,
        'image': image,
        'thumbnail': thumbnail,
      };
}

class Steams {
  late String slug;
  late String landscape;
  late String portrait;
  late String thumbnail;

  Steams.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    landscape = json['landscape'];
    portrait = json['portrait'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() => {
        'slug': slug,
        'landscape': landscape,
        'portrait': portrait,
        'thumbnail': thumbnail,
      };
}

class Config {
  late String instagramId;

  Config.fromJson(Map<String, dynamic> json) {
    instagramId = json['instagram_id'];
  }

  Map<String, dynamic> toJson() => {
        'instagram_id': instagramId,
      };
}
