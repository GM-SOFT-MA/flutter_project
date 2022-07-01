import 'package:flutter/material.dart';
import '../../routes.dart';
import 'widgets/custom.widget.dart';

const textStyle = TextStyle(fontSize: 12, color: Colors.white);

class HomeView extends StatefulWidget {
  static const routeName = '/';
  
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {




  @override
  Widget build(BuildContext context) {

  return  Scaffold(
      //appBar: AppBar(title: Text("Flutter GridView Demo")),
        body: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 8.0,
            children: List.generate(AppRouter.choices.length, (index) {
                return Center(
                  child: SelectCard(choice: AppRouter.choices[index]),
                );
              }
            )
        )
    );
  }
}



class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
        color: Colors.orange,
        child: Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Icon(choice.icon, size:50.0, color: textStyle.color)),
              new TextButton(
                child: new Text("Close"),
                onPressed: () {
                  _showDialog(context);
                  //Navigator.of(context).pop();
                },
              ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(choice.title, style: textStyle,
                 ),
               ),

            ]
        ),
        )
    );
  }


  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new TextButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

          ],
        );
      },
    );
  }
}