import 'package:myfootballapp/model/FootballTeamItem.dart';
import 'package:equatable/equatable.dart';
import 'package:myfootballapp/model/TeamDetails.dart';

abstract class DetailsState extends Equatable {}

class InitialState extends DetailsState {
  final int id;
  InitialState(this.id);
  @override
  List<Object> get props => [];
}

class LoadingState extends DetailsState {
  @override
  List<Object> get props => [];
}

class LoadedState extends DetailsState {
  final TeamDetails teamDetails;
  LoadedState(this.teamDetails);

  @override
  List<Object> get props => [teamDetails];
}

class ErrorState extends DetailsState {
  @override
  List<Object> get props => [];
}