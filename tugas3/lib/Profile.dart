import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

void main() => runApp(CardProfile());

class CardProfile extends StatelessWidget {
  const CardProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 78, 78, 78),
        body: SafeArea(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/img/PP.jpeg'),
            ),
            Text("Nouvo Chrisna Ariyanto", style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 30.0,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),),
            Text('Web Developer',
            style: TextStyle(
              fontFamily: 'Source Sans Pro',
              color:  Color.fromARGB(255, 255, 255, 255),
              fontSize: 20.0,
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(
              height: 50.0,
              width: 150.0,
              child: Divider(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  '+62 812 3886 5335',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
             Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: Text(
                  'nouvochrisna@gmail.com',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.teal.shade900,
                    fontFamily: 'Source Sans Pro'
                  ),
                  ),
              ),),
          ],
        )),
      ),
    );
  }
}