import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:myfootballapp/model/TeamDetails.dart';

import 'details_cubit.dart';
import 'details_state.dart';

class TeamDetailsPage extends StatefulWidget {
  final int id;

  TeamDetailsPage(this.id);

  @override
  _TeamDetailsPageState createState() => _TeamDetailsPageState(id);
}

class _TeamDetailsPageState extends State<TeamDetailsPage> {
  final int id;

  _TeamDetailsPageState(this.id);

  @override
  void initState() {
    super.initState();
    context.read<DetailsCubit>().getTeamDetails(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Premier Leauge'),
      ),
      body: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          if (state is LoadingState) {
            // final id =ModalRoute.of(context)!.settings.arguments as int;
            // print(id);
            //
            return DetailsLoading();
          } else if (state is ErrorState) {
            return Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            final team = state.teamDetails;
            return DetailsLoaded(team);
          } else {
            return Center(
              child: Text("Egyéb hiba"),
            );
          }
        },
      ),
    );
  }
}

class DetailsLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class DetailsLoaded extends StatelessWidget {
  final TeamDetails team;

  const DetailsLoaded(this.team, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  kIsWeb ?  Image.network("https://via.placeholder.com/150/808080/FFFFFF/?text=NoImage") : SvgPicture.network(team.crestUrl, height: 24, width: 24),
                  Text(
                    team.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ]),
        ),
         Container(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 20.0, 0, 0),
              child: Row(children: [
                Text("Stadium name: ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold),
                ),
                Text("${team.venue}"),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 5.0, 0, 0),
              child: Row(children: [
                Text("Founded year: ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold),
                ),
                Text("${team.founded}"),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 5.0, 0, 0),
              child: Row(children: [
                Text("Club colors: ",
                  style: const TextStyle(
                  fontWeight: FontWeight.bold),
                ),
                Text("${team.clubColors}"),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 5.0, 0, 0),
              child: Row(children: [
                Text("Team member: ",
                  style: const TextStyle(fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ),
          ]),
        ),
        Expanded(
            child: Center(
                child: ListView.builder(
                    itemCount: team.squad.length,
                    itemBuilder: (context, index) {
                      return ListItem(team.squad[index]);
                    }
                ),
            )
        ),
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  final Player item;

  const ListItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: AspectRatio(
          aspectRatio: 1 / 1,
          child: CircleAvatar(
            radius: 30.0,
            backgroundImage:
            NetworkImage("https://via.placeholder.com/150/808080/FFFFFF/?text=NoImage"),
            backgroundColor: Colors.transparent,
          ),
        ),
        title: Text(item.name),
        subtitle: Text(
          (item.position ?? "Team member"),
          maxLines: 1,
        ),
        onTap: () {
        },
      ),
    );
  }
}