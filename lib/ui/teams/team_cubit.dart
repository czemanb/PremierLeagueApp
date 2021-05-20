import 'package:bloc/bloc.dart';
import 'package:myfootballapp/repository/fd_Repository.dart';
import 'package:myfootballapp/ui/teams/team_list_state.dart';

class TeamsCubit extends Cubit<TeamsState> {
  TeamsCubit({required this.repository}) : super(InitialState()) {
    getTeams();
  }

  final FDRepository repository;

  void getTeams() async {
    try {
      emit(LoadingState());
      final teams = await repository.getTeams();
      emit(LoadedState(teams));
    } catch (e) {
      emit(ErrorState());
    }
  }
}