import 'package:json_annotation/json_annotation.dart';

part 'fd_json_models.g.dart';

@JsonSerializable()
class FDLeagueResponse{
  final int count;
  final Filters filters;
  final Competition competition;
  final Season season;
  final List<Teams> teams;

  FDLeagueResponse(this.count, this.filters,  this.competition, this.season, this.teams);

  factory FDLeagueResponse.fromJson(Map<String, dynamic> json) => _$FDLeagueResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FDLeagueResponseToJson(this);
}

@JsonSerializable()
class Filters {
  Filters();

  factory Filters.fromJson(Map<String, dynamic> json) => _$FiltersFromJson(json);
  Map<String, dynamic> toJson() => _$FiltersToJson(this);
}

@JsonSerializable()
class Competition {
  int id;
  Area area;
  String? name;
  String code;
  String plan;
  String lastUpdated;

  Competition(
      this.id, this.area, this.name, this.code, this.plan, this.lastUpdated);

  factory Competition.fromJson(Map<String, dynamic> json) => _$CompetitionFromJson(json);
  Map<String, dynamic> toJson() => _$CompetitionToJson(this);
}

@JsonSerializable()
class Area {
  int id;
  String name;

  Area(this.id, this.name);
  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);
  Map<String, dynamic> toJson() => _$AreaToJson(this);
}

@JsonSerializable()
class Season {
  int id;
  String startDate;
  String endDate;
  int currentMatchday;
  Winner? winner;

  Season(
      this.id,
      this.startDate,
      this.endDate,
      this.currentMatchday,
      this.winner);

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);
  Map<String, dynamic> toJson() => _$SeasonToJson(this);

}


@JsonSerializable()
class Winner {
  int id;
  String name;
  String shortName;
  String tla;
  String crestUrl;

  Winner(
      this.id,
      this.name,
      this.shortName,
      this.tla,
      this.crestUrl);

  factory Winner.fromJson(Map<String, dynamic> json) => _$WinnerFromJson(json);
  Map<String, dynamic> toJson() => _$WinnerToJson(this);
}

@JsonSerializable()
class Teams {
  int id;
  Area area;
  String name;
  String shortName;
  String tla;
  String? crestUrl;
  String address;
  String? phone;
  String? website;
  String? email;
  int? founded;
  String clubColors;
  String? venue;
  String lastUpdated;

  Teams(
      this.id,
        this.area,
        this.name,
        this.shortName,
        this.tla,
        this.crestUrl,
        this.address,
        this.phone,
        this.website,
        this.email,
        this.founded,
        this.clubColors,
        this.venue,
        this.lastUpdated);

  factory Teams.fromJson(Map<String, dynamic> json) => _$TeamsFromJson(json);
  Map<String, dynamic> toJson() => _$TeamsToJson(this);
}

@JsonSerializable()
class FdTeamResponse {
  int id;
  Area area;
  String name;
  String shortName;
  String tla;
  String crestUrl;
  String address;
  String phone;
  String website;
  String? email;
  int founded;
  String clubColors;
  String venue;
  List<Squad> squad;
  String lastUpdated;

  FdTeamResponse (this.id,
      this.area,
      this.name,
      this.shortName,
      this.tla,
      this.crestUrl,
      this.address,
      this.phone,
      this.website,
      this.email,
      this.founded,
      this.clubColors,
      this.venue,
      this.squad,
      this.lastUpdated);

  factory FdTeamResponse.fromJson(Map<String, dynamic> json) => _$FdTeamResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FdTeamResponseToJson(this);

}

@JsonSerializable()
class Squad {
  int id;
  String name;
  String? position;
  String dateOfBirth;
  String countryOfBirth;
  String nationality;
  String role;

  Squad(this.id,
      this.name,
      this.position,
      this.dateOfBirth,
      this.countryOfBirth,
      this.nationality,
      this.role);

  factory Squad.fromJson(Map<String, dynamic> json) => _$SquadFromJson(json);
  Map<String, dynamic> toJson() => _$SquadToJson(this);

}