import 'dart:convert';

List<UserModel> userModelFromMap(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromMap(x)));

String userModelToMap(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class UserModel {
    UserModel({
        required this.id,
        required this.caption,
        required this.media,
        required this.createdAt,
        required this.author,
        required this.spot,
        required this.relevantComments,
        required this.numberOfComments,
        required this.likedBy,
        required this.numberOfLikes,
        required this.tags,
    });

    final String id;
    final Caption caption;
    final List<Media> media;
    final DateTime createdAt;
    final Author author;
    final Spot spot;
    final dynamic relevantComments;
    final int numberOfComments;
    final List<Author> likedBy;
    final int numberOfLikes;
    final List<Tag>? tags;

    factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        caption: Caption.fromMap(json["caption"]),
        media: List<Media>.from(json["media"].map((x) => Media.fromMap(x))),
        createdAt: DateTime.parse(json["created_at"]),
        author: Author.fromMap(json["author"]),
        spot: Spot.fromMap(json["spot"]),
        relevantComments: json["relevant_comments"],
        numberOfComments: json["number_of_comments"],
        likedBy: List<Author>.from(json["liked_by"].map((x) => Author.fromMap(x))),
        numberOfLikes: json["number_of_likes"],
        tags: json["tags"] != null ? List.from(json["tags"]).map((x) => Tag.fromMap(x)).toList() : null,
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "caption": caption.toMap(),
        "media": List<dynamic>.from(media.map((x) => x.toMap())),
        "created_at": createdAt.toIso8601String(),
        "author": author.toMap(),
        "spot": spot.toMap(),
        "relevant_comments": relevantComments,
        "number_of_comments": numberOfComments,
        "liked_by": List<dynamic>.from(likedBy.map((x) => x.toMap())),
        "number_of_likes": numberOfLikes,
        "tags": tags?.map((x) => x.toMap()),
    };
}

class Author {
    Author({
        required this.id,
        required this.username,
        required this.photoUrl,
        required this.fullName,
        required this.isPrivate,
        required this.isVerified,
    });

    final String id;
    final String username;
    final String photoUrl;
    final String fullName;
    final bool isPrivate;
    final bool isVerified;

    factory Author.fromMap(Map<String, dynamic> json) => Author(
        id: json["id"],
        username: json["username"],
        photoUrl: json["photo_url"],
        fullName: json["full_name"],
        isPrivate: json["is_private"],
        isVerified: json["is_verified"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "photo_url": photoUrl,
        "full_name": fullName,
        "is_private": isPrivate,
        "is_verified": isVerified,
    };
}

class Caption {
    Caption({
        required this.text,
    });

    final String text;

    factory Caption.fromMap(Map<String, dynamic> json) => Caption(
        text: json["text"],
    );

    Map<String, dynamic> toMap() => {
        "text": text,
    };
}

class Media {
    Media({
        required this.url,
        required this.type,
    });

    final String url;
    final String type;

    factory Media.fromMap(Map<String, dynamic> json) => Media(
        url: json["url"],
        type: json["type"],
    );

    Map<String, dynamic> toMap() => {
        "url": url,
        "type": type,
    };
}

class Spot {
    Spot({
        required this.id,
        required this.name,
        required this.types,
        required this.logo,
        required this.location,
        required this.isSaved,
    });

    final String id;
    final String name;
    final List<Type> types;
    final Logo logo;
    final Location location;
    final bool isSaved;

    factory Spot.fromMap(Map<String, dynamic> json) => Spot(
        id: json["id"],
        name: json["name"],
        types: List<Type>.from(json["types"].map((x) => Type.fromMap(x))),
        logo: Logo.fromMap(json["logo"]),
        location: Location.fromMap(json["location"]),
        isSaved: json["is_saved"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "types": List<dynamic>.from(types.map((x) => x.toMap())),
        "logo": logo.toMap(),
        "location": location.toMap(),
        "is_saved": isSaved,
    };
}

class Location {
    Location({
        required this.latitude,
        required this.longitude,
        required this.display,
    });

    final double latitude;
    final double longitude;
    final String display;

    factory Location.fromMap(Map<String, dynamic> json) => Location(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        display: json["display"],
    );

    Map<String, dynamic> toMap() => {
        "latitude": latitude,
        "longitude": longitude,
        "display": display,
    };
}

class Logo {
    Logo({
        required this.url,
        required this.blurHash,
        required this.type,
    });

    final String url;
    final String blurHash;
    final String type;

    factory Logo.fromMap(Map<String, dynamic> json) => Logo(
        url: json["url"],
        blurHash: json["blur_hash"],
        type: json["type"],
    );

    Map<String, dynamic> toMap() => {
        "url": url,
        "blur_hash": blurHash,
        "type": type,
    };
}

class Type {
    Type({
        required this.id,
        required this.name,
        required this.url,
    });

    final int id;
    final String name;
    final String url;

    factory Type.fromMap(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "url": url,
    };
}

class Tag {
    Tag({
        required this.id,
        required this.name,
    });

    final int id;
    final String name;

    factory Tag.fromMap(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
    };
}
