import 'package:myfootballapp/model/FootballTeamItem.dart';
import 'package:equatable/equatable.dart';

abstract class TeamsState extends Equatable {}

class InitialState extends TeamsState {
  @override
  List<Object> get props => [];
}

class LoadingState extends TeamsState {
  @override
  List<Object> get props => [];
}

class LoadedState extends TeamsState {
  LoadedState(this.teams);

  final List<FootballTeamItem> teams;

  @override
  List<Object> get props => [teams];
}

class SearchingState extends TeamsState{
  SearchingState(this.teams);
  final List<FootballTeamItem> teams;

  @override
  List<Object> get props => [teams];
}
class ErrorState extends TeamsState {
  @override
  List<Object> get props => [];
}