import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myfootballapp/model/FootballTeamItem.dart';
import 'package:myfootballapp/ui/teams/team_cubit.dart';
import 'package:myfootballapp/ui/teams/team_list_state.dart';
import '../../main.dart';

class TeamListPage extends StatefulWidget {
  @override
  _TeamListPageState createState() => _TeamListPageState();
}

class _TeamListPageState extends State<TeamListPage> {
  TextEditingController editingController = TextEditingController();
  List<FootballTeamItem> duplicateItems = [];
  List<FootballTeamItem> teams = [];


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var result = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Are you sure?"),
              content: Text("Do you really want to quit?"),
              actions: [
                TextButton(
                  child: Text("No"),
                  onPressed: () => Navigator.pop(context, false),
                ),
                TextButton(
                  child: Text("Yes"),
                  onPressed: () => Navigator.pop(context, true),
                ),
              ],
            );
          },
        );
        return result ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Premier League"),
        ),
        body: BlocBuilder<TeamsCubit, TeamsState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ErrorState) {
              return Center(
                child: Icon(Icons.close),
              );
            } else if (state is LoadedState) {
              teams = state.teams;
              duplicateItems=[];
              duplicateItems.addAll(teams);
              return Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          filterSearchResults(value);
                        },
                        controller: editingController,
                        decoration: InputDecoration(
                            labelText: "Search",
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(25.0)))),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: teams.length,
                          itemBuilder: (context, index) {
                            return ListItem(teams[index]);
                          }
                      ),
                    ),
                  ],
                ),
              );
            } else {
            return Container();
            }
          },
        ),
      ),
    );
  }


  void filterSearchResults(String query) {
    List<FootballTeamItem> dummySearchList = [];
      dummySearchList.addAll(duplicateItems);

    if (query.isNotEmpty) {
      List<FootballTeamItem> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        teams.clear();
        teams.addAll(dummyListData);

      });
      return;
    } else {
      setState(() {
        teams.clear();
        teams.addAll(duplicateItems);
      });
    }
  }


}


class ListItem extends StatelessWidget {
  final FootballTeamItem item;

  const ListItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: AspectRatio(
          aspectRatio: 1 / 1,
          child: Hero(
            tag: item.id,
            child: kIsWeb ?  Image.network("https://via.placeholder.com/150/808080/FFFFFF/?text=NoImage") : SvgPicture.network(item.crestUrl, height: 24, width: 24) ,
          ),
        ),
        title: Text(item.name),
        subtitle: Text(
          item.name,
          maxLines: 1,
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            DETAIL_PAGE,
            arguments: item.id,
          );
        },
      ),
    );
  }
}




