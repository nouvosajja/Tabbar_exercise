import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tugas3/PremierLeagueModel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.teams}) : super(key: key);
  Teams teams;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {}
  }

  var linktext = TextStyle(color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Description"),
        backgroundColor: Color.fromARGB(255, 114, 114, 114),
      ),
      
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Container(
                  height: 95,
                  width: 95,
                  child: Image.network(widget.teams.strTeamBadge.toString())
                ),
                SizedBox(height: 15,),
                Text(widget.teams.strTeam.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                  ),),
                SizedBox(height: 20,),
                Text(widget.teams.strStadium.toString()),
                Text('Since ' + widget.teams.intFormedYear.toString()),
                SizedBox(height: 25,),
                InkWell(
                    onTap: () {
                      var myUrl =
                          "https://" + widget.teams.strWebsite.toString();
                      _launchInBrowser(myUrl);
                    },
                    child: Text(widget.teams.strWebsite.toString(),
                    style: linktext,
                    ),
                ),
                SizedBox(height: 15,),
                 Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: () {
                      var myUrl =
                          "https://" + widget.teams.strYoutube.toString();
                      _launchInBrowser(myUrl);
                    },
                    child: Icon(FontAwesomeIcons.youtube, color: Colors.red,)),
                InkWell(
                    onTap: () {
                      var myUrl =
                          "https://" + widget.teams.strInstagram.toString();
                      _launchInBrowser(myUrl);
                    },
                    child: Icon(FontAwesomeIcons.instagram)),
                InkWell(
                    onTap: () {
                      var myUrl =
                          "https://" + widget.teams.strTwitter.toString();
                      _launchInBrowser(myUrl);
                    },
                    child: Icon(FontAwesomeIcons.twitter, color: Colors.lightBlue,)),
                    InkWell(
                    onTap: () {
                      var myUrl =
                          "https://" + widget.teams.strFacebook.toString();
                      _launchInBrowser(myUrl);
                    },
                    child: Icon(FontAwesomeIcons.facebook, color: Colors.blueAccent,)),
              ],
            ),
                SizedBox(height: 20,),
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(widget.teams.strDescriptionEN.toString(),
                    textAlign: (TextAlign.justify),
                  ),
                ),
                SizedBox(height: 20,),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}

