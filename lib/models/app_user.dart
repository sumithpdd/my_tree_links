import 'package:json_annotation/json_annotation.dart';

part 'app_user.g.dart';

@JsonSerializable(explicitToJson: true)
class AppUser {
  final String? id;
  final String? name;
  final String? email;
  final String? bio;
  final Address? address;
  final String? phone;
  final Company? company;
  final String? profileImageUrl;
  final String? githubuserid, linkedInhandle, slackId, twitterhandle;
  List<Map<String, dynamic>>? links;
  final String? website;
  @JsonKey(fromJson: _dateTimeFromEpochUs, toJson: _dateTimeToEpochUs)
  DateTime nowTimestamp = DateTime.now();
  AppUser({
    this.id,
    this.name,
    this.bio,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
    this.profileImageUrl,
    this.githubuserid,
    this.linkedInhandle,
    this.slackId,
    this.twitterhandle,
    this.links,
  });
  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
  static DateTime _dateTimeFromEpochUs(int us) =>
      DateTime.fromMicrosecondsSinceEpoch(us);

  static int? _dateTimeToEpochUs(DateTime? dateTime) =>
      dateTime?.microsecondsSinceEpoch;
}

@JsonSerializable(explicitToJson: true)
class Address {
  String? street;
  String? suite;
  String? city;
  String? country;
  String? zipcode;
  Geo? geo;

  Address({
    this.street,
    this.suite,
    this.city,
    this.country,
    this.zipcode,
    this.geo,
  });
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  Map<String, dynamic> toJson() => _$GeoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Company {
  String? name;
  Company({
    this.name,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
