import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:myfootballapp/json_models/fd_json_models.dart';

const _ApiKey = "0713f8a94d42454bb6870b8943c0c9b4";
const _baseUrl = "api.football-data.org";

//must top-level func
FDLeagueResponse _parseLeagueResponse(String message){
  return FDLeagueResponse.fromJson(jsonDecode(message));
}

FdTeamResponse _parseTeamResponse(String message){
  return FdTeamResponse.fromJson(jsonDecode(message));
}



class FDService {

  Future<FDLeagueResponse> getFDTeams() async {
    var response = await http.get(
      Uri.https(_baseUrl,"v2/competitions/PL/teams"),
        headers: {
            "X-Auth-Token": _ApiKey
        }
      );
    return await compute(_parseLeagueResponse, response.body);
   //return FDTeamsResponse.fromJson(jsonDecode(response.body));
  }

  Future<FdTeamResponse> getTeamDetails(int id) async {
    var response = await http.get(
        Uri.https(_baseUrl,"v2/teams/$id"),
        headers: {
          "X-Auth-Token": _ApiKey
        }
    );
    return await compute(_parseTeamResponse, response.body);
    //return FDTeamsResponse.fromJson(jsonDecode(response.body));
  }

}