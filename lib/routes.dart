import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/views/product/camera.view.dart';
import 'package:project/views/product/product.create.view.dart';
import 'package:project/views/product/product.update.dart';
import 'helpers/empty.view.dart';
import 'views/home/home.view.dart';
import 'views/product/products.view.dart';

/// [AppRouter]
/// This the base router classes where you can registered
/// and customize all the named routes of your app
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeView.routeName:
        return MaterialPageRoute(builder: (_) => HomeView());
      case ProductsView.routeName:
        return MaterialPageRoute(builder: (_) => ProductsView());
      case ProductCreateView.routeName:
        return MaterialPageRoute(builder: (_) => ProductCreateView());
      case ProductUpdateView.routeName:
        return MaterialPageRoute(builder: (_) => ProductUpdateView());
        case CameraView.routeName:
      return MaterialPageRoute(builder: (_) => CameraView());
      default:
        return MaterialPageRoute(builder: (_) {
          return EmptyView();
        });
    }
  }
  static List<Choice> choices = const <Choice>[
    const Choice(title: 'Product',Route: "product",  icon: Icons.home),
    const Choice(title: 'Contact', Route: "product",icon: Icons.contacts),
    const Choice(title: 'Map', Route: "product",icon: Icons.map),
    const Choice(title: 'Phone', Route: "product",icon: Icons.phone),
    const Choice(title: 'Camera', Route: "camera",icon: Icons.camera_alt),
    const Choice(title: 'Setting',Route: "product", icon: Icons.settings),
    const Choice(title: 'Album',Route: "product", icon: Icons.photo_album),
    const Choice(title: 'WiFi', Route: "product",icon: Icons.wifi),
  ];


}

class Choice {
  const Choice({this.title,this.Route, this.icon});
  final String Route;
  final String title;
  final IconData icon;
}