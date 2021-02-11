import 'package:android_intent/android_intent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safety_net/LearnTiles.dart';

class Learn extends StatefulWidget {
  @override
  _LearnState createState() => _LearnState();
}

int listIndex;

class _LearnState extends State<Learn> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 1,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              "Precautionary Measures",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: ListView(
          children: [
            listTile('Helpline Numbers', 0),
            Divider(
              thickness: 3,
            ),
            listTile('Do\'s and Don\'ts', 1),
            Divider(
              thickness: 3,
            ),
            listTile('Domestic Abuse', 2),
            Divider(
              thickness: 3,
            ),
            listTile('Stalker Situation', 3),
            Divider(
              thickness: 3,
            ),
            listTile('Cyber Harassment', 4),
            Divider(
              thickness: 3,
            ),
            listTile('ways to fight against above mentioned abuses', 5),
            Divider(
              thickness: 3,
            ),
            listTile('Penal Codes ', 6),
          ],
        ),
      )
    ]);
  }

  Widget listTile(String name, int index) {
    return ListTile(
      title: Text(name),
      onTap: () {
        setState(() {
          listIndex = index;
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HelpLine(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DosAndDonts(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DomesticViolence(),
              ),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Stalker(),
              ),
            );
          } else if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CyberHarassments(),
              ),
            );
          } else if (index == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Emergencies(),
              ),
            );
          } else if (index == 6) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PenalCode(),
              ),
            );
          }
          print("List index $index");
        });
      },
    );
  }
}
