import 'package:flutter/material.dart';
import 'package:project/services/api/product.service.dart';


class ProductsView extends StatefulWidget {
  static const routeName = 'product';
  ProductsView({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ProductsView> {
  int _counter = 0;
  final darkBlueColor = Color(0xff486579);
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  _listProduct(List<dynamic> data)=> ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index){
        final item = data[index];
        final name= item['name'];
        final components= item['components'];
        return Column(
            children: <Widget>[

              Card(

                child: Scrollbar(
                    child: ListTile(
                          leading: Icon(
                            Icons.account_circle,
                            color: darkBlueColor,
                            size: 40.0,
                          ),
                          title: Text(name.toUpperCase(), style: TextStyle(  color: darkBlueColor, fontWeight: FontWeight.bold), ),
                          subtitle:Text(components),
                          onTap: () {
                            Navigator.popAndPushNamed(context, 'update',arguments: [1,  name, components]);
                          },
                      ))),
              Divider(height: 5.0,),
            ]);
      },

  );
  @override
  Widget build(BuildContext context) {
    var productService=new ProductService();

    return Scaffold(
      appBar: AppBar(title: const Text('Product'),),
        body:   Container(
          child: FutureBuilder(

            future: productService.getAll(),
            builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
              if(snapshot.hasData){
                return _listProduct(snapshot.data);
              }else{
                return Center(child: CircularProgressIndicator());
              }
            },
          ),

        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, 'create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
