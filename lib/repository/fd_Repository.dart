import 'package:myfootballapp/model/FootballTeamItem.dart';
import 'package:myfootballapp/model/TeamDetails.dart';
import 'package:myfootballapp/services/fd_service.dart';

class FDRepository{
  var fdService = FDService();


  Future<List<FootballTeamItem>> getTeams() async {
    var response = await fdService.getFDTeams();
    return response.teams.map(
        (e) => FootballTeamItem(
            e.id,
            e.name,
            e.crestUrl == null? "https://picsum.photos/250?image=9" :  e.crestUrl! )
    ).toList();
  }

  Future<TeamDetails> getDetails(int id) async {
    var response = await fdService.getTeamDetails(id);
    int teamid = response.id;
    String name = response.name;
    String crestUrl = response.crestUrl;
    int founded = response.founded;
    String clubColors = response.clubColors;
    String venue = response.venue;
    List<Player> squad = response.squad.map((e) => Player(
      e.id,
      e.name,
      e.position)
    ).toList();
    return TeamDetails(teamid, name, crestUrl, founded, clubColors, venue, squad);
  }
}