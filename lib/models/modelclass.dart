// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Wallpaper {
  int page;
  int per_page;
  String next_page;
  List<Photos> photos;
  Wallpaper({
    required this.page,
    required this.per_page,
    required this.next_page,
    required this.photos,
  });


  Wallpaper copyWith({
    int? page,
    int? per_page,
    String? next_page,
    List<Photos>? photos,
  }) {
    return Wallpaper(
      page: page ?? this.page,
      per_page: per_page ?? this.per_page,
      next_page: next_page ?? this.next_page,
      photos: photos ?? this.photos,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'per_page': per_page,
      'next_page': next_page,
      'photos': photos.map((x) => x.toMap()).toList(),
    };
  }

factory Wallpaper.fromMap(Map<String, dynamic> map) {
   
      return Wallpaper(
        page: map['page'] as int,
        per_page: map['per_page'] as int,
        next_page: map['next_page'] as String,
        photos: map['photos'] != null
            ? List<Photos>.from(
                (map['photos'] as List).map((x) => Photos.fromMap(x as Map<String, dynamic>)),
              )
            : [],
      );
  
}


  String toJson() => json.encode(toMap());

  factory Wallpaper.fromJson(String source) => Wallpaper.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Wallpaper(page: $page, per_page: $per_page, next_page: $next_page, photos: $photos)';
  }

  @override
  bool operator ==(covariant Wallpaper other) {
    if (identical(this, other)) return true;
  
    return 
      other.page == page &&
      other.per_page == per_page &&
      other.next_page == next_page &&
      listEquals(other.photos, photos);
  }

  @override
  int get hashCode {
    return page.hashCode ^
      per_page.hashCode ^
      next_page.hashCode ^
      photos.hashCode;
  }
}
class Photos {
  int id;
  int width;
  int height;
  String url;
  String photographer;
  String photographer_url;
  int  photographer_id;
  String avg_color;
  bool liked;
  String alt;
  Src src;
  Photos({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographer_url,
    required this.photographer_id,
    required this.avg_color,
    required this.liked,
    required this.alt,
    required this.src,
  });

  Photos copyWith({
    int? id,
    int? width,
    int? height,
    String? url,
    String? photographer,
    String? photographer_url,
    int ?photographer_id,
    String? avg_color,
    bool? liked,
    String? alt,
    Src? src,
  }) {
    return Photos(
      id: id ?? this.id,
      width: width ?? this.width,
      height: height ?? this.height,
      url: url ?? this.url,
      photographer: photographer ?? this.photographer,
      photographer_url: photographer_url ?? this.photographer_url,
      photographer_id: photographer_id?? this.photographer_id,
      avg_color: avg_color ?? this.avg_color,
      liked: liked ?? this.liked,
      alt: alt ?? this.alt,
      src: src ?? this.src,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'width': width,
      'height': height,
      'url': url,
      'photographer': photographer,
      'photographer_url': photographer_url,
      'photographer_id': photographer_id,
      'avg_color': avg_color,
      'liked': liked,
      'alt': alt,
      'src': src.toMap(),
    };
  }

  factory Photos.fromMap(Map<String, dynamic> map) {
  return Photos(
    id: map['id'] as int,
    width: map['width'] as int,
    height: map['height'] as int,
    url: map['url'] as String,
    photographer: map['photographer'] as String,
    photographer_url: map['photographer_url'] as String,
    photographer_id: map['photographer_id'] as int,
    avg_color: map['avg_color'] as String,
    liked: map['liked'] as bool,
    alt: map['alt'] as String,
    src: Src.fromMap(map['src'] as Map<String, dynamic>),
  );
}

  String toJson() => json.encode(toMap());

  factory Photos.fromJson(String source) => Photos.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Photos(id: $id, width: $width, height: $height, url: $url, photographer: $photographer, photographer_url: $photographer_url, photographer_id: $photographer_id, avg_color: $avg_color, liked: $liked, alt: $alt, src: $src)';
  }

  @override
  bool operator ==(covariant Photos other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.width == width &&
      other.height == height &&
      other.url == url &&
      other.photographer == photographer &&
      other.photographer_url == photographer_url &&
      other.photographer_id == photographer_id &&
      other.avg_color == avg_color &&
      other.liked == liked &&
      other.alt == alt &&
      other.src == src;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      width.hashCode ^
      height.hashCode ^
      url.hashCode ^
      photographer.hashCode ^
      photographer_url.hashCode ^
      photographer_id.hashCode ^
      avg_color.hashCode ^
      liked.hashCode ^
      alt.hashCode ^
      src.hashCode;
  }
}
class Src {

  String original;
  String large2x;
  String large;
  String medium;
  String small;
  String portrait;
  String landscape;
  String tiny;
  Src({
    required this.original,
    required this.large2x,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });





  Src copyWith({
    String? original,
    String? large2x,
    String? large,
    String? medium,
    String? small,
    String? portrait,
    String? landscape,
    String? tiny,
  }) {
    return Src(
      original: original ?? this.original,
      large2x: large2x ?? this.large2x,
      large: large ?? this.large,
      medium: medium ?? this.medium,
      small: small ?? this.small,
      portrait: portrait ?? this.portrait,
      landscape: landscape ?? this.landscape,
      tiny: tiny ?? this.tiny,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'original': original,
      'large2x': large2x,
      'large': large,
      'medium': medium,
      'small': small,
      'portrait': portrait,
      'landscape': landscape,
      'tiny': tiny,
    };
  }

factory Src.fromMap(Map<String, dynamic> map) {
  return Src(
    original: map['original'] as String,
    large2x: map['large2x'] as String,
    large: map['large'] as String,
    medium: map['medium'] as String,
    small: map['small'] as String,
    portrait: map['portrait'] as String,
    landscape: map['landscape'] as String,
    tiny: map['tiny'] as String,
  );
}

  String toJson() => json.encode(toMap());

  factory Src.fromJson(String source) => Src.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Src(original: $original, large2x: $large2x, large: $large, medium: $medium, small: $small, portrait: $portrait, landscape: $landscape, tiny: $tiny)';
  }

  @override
  bool operator ==(covariant Src other) {
    if (identical(this, other)) return true;
  
    return 
      other.original == original &&
      other.large2x == large2x &&
      other.large == large &&
      other.medium == medium &&
      other.small == small &&
      other.portrait == portrait &&
      other.landscape == landscape &&
      other.tiny == tiny;
  }

  @override
  int get hashCode {
    return original.hashCode ^
      large2x.hashCode ^
      large.hashCode ^
      medium.hashCode ^
      small.hashCode ^
      portrait.hashCode ^
      landscape.hashCode ^
      tiny.hashCode;
  }
}
