// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fd_json_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FDLeagueResponse _$FDLeagueResponseFromJson(Map<String, dynamic> json) {
  return FDLeagueResponse(
    json['count'] as int,
    Filters.fromJson(json['filters'] as Map<String, dynamic>),
    Competition.fromJson(json['competition'] as Map<String, dynamic>),
    Season.fromJson(json['season'] as Map<String, dynamic>),
    (json['teams'] as List<dynamic>)
        .map((e) => Teams.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$FDLeagueResponseToJson(FDLeagueResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'filters': instance.filters,
      'competition': instance.competition,
      'season': instance.season,
      'teams': instance.teams,
    };

Filters _$FiltersFromJson(Map<String, dynamic> json) {
  return Filters();
}

Map<String, dynamic> _$FiltersToJson(Filters instance) => <String, dynamic>{};

Competition _$CompetitionFromJson(Map<String, dynamic> json) {
  return Competition(
    json['id'] as int,
    Area.fromJson(json['area'] as Map<String, dynamic>),
    json['name'] as String?,
    json['code'] as String,
    json['plan'] as String,
    json['lastUpdated'] as String,
  );
}

Map<String, dynamic> _$CompetitionToJson(Competition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'area': instance.area,
      'name': instance.name,
      'code': instance.code,
      'plan': instance.plan,
      'lastUpdated': instance.lastUpdated,
    };

Area _$AreaFromJson(Map<String, dynamic> json) {
  return Area(
    json['id'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Season _$SeasonFromJson(Map<String, dynamic> json) {
  return Season(
    json['id'] as int,
    json['startDate'] as String,
    json['endDate'] as String,
    json['currentMatchday'] as int,
    json['winner'] == null
        ? null
        : Winner.fromJson(json['winner'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SeasonToJson(Season instance) => <String, dynamic>{
      'id': instance.id,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'currentMatchday': instance.currentMatchday,
      'winner': instance.winner,
    };

Winner _$WinnerFromJson(Map<String, dynamic> json) {
  return Winner(
    json['id'] as int,
    json['name'] as String,
    json['shortName'] as String,
    json['tla'] as String,
    json['crestUrl'] as String,
  );
}

Map<String, dynamic> _$WinnerToJson(Winner instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortName': instance.shortName,
      'tla': instance.tla,
      'crestUrl': instance.crestUrl,
    };

Teams _$TeamsFromJson(Map<String, dynamic> json) {
  return Teams(
    json['id'] as int,
    Area.fromJson(json['area'] as Map<String, dynamic>),
    json['name'] as String,
    json['shortName'] as String,
    json['tla'] as String,
    json['crestUrl'] as String?,
    json['address'] as String,
    json['phone'] as String?,
    json['website'] as String?,
    json['email'] as String?,
    json['founded'] as int?,
    json['clubColors'] as String,
    json['venue'] as String?,
    json['lastUpdated'] as String,
  );
}

Map<String, dynamic> _$TeamsToJson(Teams instance) => <String, dynamic>{
      'id': instance.id,
      'area': instance.area,
      'name': instance.name,
      'shortName': instance.shortName,
      'tla': instance.tla,
      'crestUrl': instance.crestUrl,
      'address': instance.address,
      'phone': instance.phone,
      'website': instance.website,
      'email': instance.email,
      'founded': instance.founded,
      'clubColors': instance.clubColors,
      'venue': instance.venue,
      'lastUpdated': instance.lastUpdated,
    };

FdTeamResponse _$FdTeamResponseFromJson(Map<String, dynamic> json) {
  return FdTeamResponse(
    json['id'] as int,
    Area.fromJson(json['area'] as Map<String, dynamic>),
    json['name'] as String,
    json['shortName'] as String,
    json['tla'] as String,
    json['crestUrl'] as String,
    json['address'] as String,
    json['phone'] as String,
    json['website'] as String,
    json['email'] as String?,
    json['founded'] as int,
    json['clubColors'] as String,
    json['venue'] as String,
    (json['squad'] as List<dynamic>)
        .map((e) => Squad.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['lastUpdated'] as String,
  );
}

Map<String, dynamic> _$FdTeamResponseToJson(FdTeamResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'area': instance.area,
      'name': instance.name,
      'shortName': instance.shortName,
      'tla': instance.tla,
      'crestUrl': instance.crestUrl,
      'address': instance.address,
      'phone': instance.phone,
      'website': instance.website,
      'email': instance.email,
      'founded': instance.founded,
      'clubColors': instance.clubColors,
      'venue': instance.venue,
      'squad': instance.squad,
      'lastUpdated': instance.lastUpdated,
    };

Squad _$SquadFromJson(Map<String, dynamic> json) {
  return Squad(
    json['id'] as int,
    json['name'] as String,
    json['position'] as String?,
    json['dateOfBirth'] as String,
    json['countryOfBirth'] as String,
    json['nationality'] as String,
    json['role'] as String,
  );
}

Map<String, dynamic> _$SquadToJson(Squad instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'position': instance.position,
      'dateOfBirth': instance.dateOfBirth,
      'countryOfBirth': instance.countryOfBirth,
      'nationality': instance.nationality,
      'role': instance.role,
    };
