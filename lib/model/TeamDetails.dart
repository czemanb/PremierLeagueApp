class TeamDetails {
  final int id;
  final String name;
  final String crestUrl;
  final int founded;
  final String clubColors;
  final String venue;
  final List<Player> squad;


  TeamDetails(
      this.id,
      this.name,
      this.crestUrl,
      this.founded,
      this.clubColors,
      this.venue,
      this.squad
      );
}

class Player {
  final int id;
  final String name;
  final String? position;

  Player(
      this.id,
      this.name,
      this.position);
}