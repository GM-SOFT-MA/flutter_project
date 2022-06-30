import 'package:flutter/material.dart';
import 'package:project/routes.dart';
import 'package:project/views/home/home.view.dart';
import 'locator.dart';


globalInitializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        appBar: AppBar(title: Text("GM-Products"),centerTitle: true,),
        body:  HomeView(),
        drawer:Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(),
              ListTile(title: const Text('Contacts'), leading: Icon(Icons.contacts) , onTap: () {
                //Navigator.popAndPushNamed(context, AppRouter.choices.);
              },),
              ListTile(title: const Text('Products'), leading: Icon(Icons.article) , onTap: () {

              },),
              ListTile(title: const Text('Map'), leading: Icon(Icons.map) , onTap: () {},),
              ListTile(title: const Text('Phone'), leading: Icon(Icons.phone) , onTap: () {},),
              ListTile(title: const Text('Camera'), leading: Icon(Icons.camera_alt) , onTap: () {},),
              ListTile(title: const Text('Album'), leading: Icon(Icons.map) , onTap: () {},),
              ListTile(title: const Text('WiFi'),  leading: Icon(Icons.map) , onTap: () {
                Navigator.of(context).pop();
              },),

            ],
          ),
        ),
      ),
      onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
    );
  }
}


