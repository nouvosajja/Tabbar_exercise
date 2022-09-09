import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'PremierLeagueModel.dart';
import 'package:tugas3/DetailPage.dart';
import 'package:loading_gifs/loading_gifs.dart';

class ListFootballPL extends StatefulWidget {
  const ListFootballPL({Key? key}) : super(key: key);

  @override
  State<ListFootballPL> createState() => _ListFootballPLState();
}

class _ListFootballPLState extends State<ListFootballPL> {

  PremierLeagueModel? premierLeagueModel;
  bool isloaded = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllListPL();
  }

  void getAllListPL() async{
    setState(() {
      isloaded = false;
    });




    final res = await http.get(
      Uri.parse("https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League")
    );
    print("status code " + res.statusCode.toString());
    premierLeagueModel = 
      PremierLeagueModel.fromJson(json.decode(res.body.toString()));
    print("team 0 : " + premierLeagueModel!.teams![0].strTeam.toString());

    setState(() {
      isloaded = true;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 78, 78, 78),
      body: Center(
        child: Container(
          child: isloaded ? ListView.builder(
                  itemCount: premierLeagueModel!.teams!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                  teams: premierLeagueModel!.teams![index])),
                        );
                      },
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 20),
                                  width: 40,
                                  height: 40,
                                  child: FadeInImage.assetNetwork(placeholder: 'assets/gif/loading1.gif', image: '${premierLeagueModel!.teams![index].strTeamBadge.toString()}')),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(premierLeagueModel!
                                      .teams![index].strTeam
                                      .toString()),
                                  Text(premierLeagueModel!
                                      .teams![index].strStadium
                                      .toString()),
                                ],
                              ),
                              Spacer(),
                                IconButton(
                                  icon: Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(teams: premierLeagueModel!.teams![index])),);
                                  },
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }) : CircularProgressIndicator(),
        ),
      ),
    );
  }
  
  
}