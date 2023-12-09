// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
      id: json['id'] as String?,
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      email: json['email'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      phone: json['phone'] as String?,
      website: json['website'] as String?,
      company: json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>),
      profileImageUrl: json['profileImageUrl'] as String?,
      githubuserid: json['githubuserid'] as String?,
      linkedInhandle: json['linkedInhandle'] as String?,
      slackId: json['slackId'] as String?,
      twitterhandle: json['twitterhandle'] as String?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    )..nowTimestamp = AppUser._dateTimeFromEpochUs(json['nowTimestamp'] as int);

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'bio': instance.bio,
      'address': instance.address?.toJson(),
      'phone': instance.phone,
      'company': instance.company?.toJson(),
      'profileImageUrl': instance.profileImageUrl,
      'githubuserid': instance.githubuserid,
      'linkedInhandle': instance.linkedInhandle,
      'slackId': instance.slackId,
      'twitterhandle': instance.twitterhandle,
      'links': instance.links,
      'website': instance.website,
      'nowTimestamp': AppUser._dateTimeToEpochUs(instance.nowTimestamp),
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      street: json['street'] as String?,
      suite: json['suite'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      zipcode: json['zipcode'] as String?,
      geo: json['geo'] == null
          ? null
          : Geo.fromJson(json['geo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'country': instance.country,
      'zipcode': instance.zipcode,
      'geo': instance.geo?.toJson(),
    };

Geo _$GeoFromJson(Map<String, dynamic> json) => Geo(
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
    );

Map<String, dynamic> _$GeoToJson(Geo instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'name': instance.name,
    };
