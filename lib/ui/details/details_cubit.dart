import 'package:bloc/bloc.dart';
import 'package:myfootballapp/repository/fd_Repository.dart';

import 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit({required this.repository, required int id}) : super(InitialState(id));


  final FDRepository repository;

  void getTeamDetails(int id) async {
    try {
      emit(LoadingState());
      final teamDetails = await repository.getDetails(id);
      emit(LoadedState(teamDetails));
    } catch (e) {
      emit(ErrorState());
    }
  }
}