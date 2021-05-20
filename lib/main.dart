import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfootballapp/repository/fd_Repository.dart';
import 'package:myfootballapp/ui/details/details_cubit.dart';
import 'package:myfootballapp/ui/details/details_page.dart';
import 'package:myfootballapp/ui/teams/team_cubit.dart';
import 'package:myfootballapp/ui/teams/team_list_page.dart';

void main() {
  runApp(MyApp());
}

const DETAIL_PAGE = "/detailsPage";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Football App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: BlocProvider<TeamsCubit>(
        create: (context) => TeamsCubit(
          repository: FDRepository(),
        ),
        child: TeamListPage(),
      ),
      onGenerateRoute: (settings) {
        final name = settings.name ?? "";
        if (name.startsWith(DETAIL_PAGE)) {
          return MaterialPageRoute(
            builder: (context) {
              return BlocProvider<DetailsCubit>(
                create: (context) =>
                    DetailsCubit(
                      repository: FDRepository(),
                      id: settings.arguments as int,
                    ),
                child: TeamDetailsPage(settings.arguments as int),
              );
            }
          );
        }
        return null;
      },
    );
  }
}
