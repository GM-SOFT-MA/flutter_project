import 'package:flutter/material.dart';
import 'package:project/models/product.model.dart';
import 'package:project/services/api/product.service.dart';

class ProductCreateView extends StatefulWidget {
  static const routeName = 'create';
  const ProductCreateView({Key key}) : super(key: key);

  @override
  State<ProductCreateView> createState() => _CreatepageState();
}

class _CreatepageState extends State<ProductCreateView> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  final compenentsController = TextEditingController();
  ProductService productservice = ProductService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add product'),
      ),
      body:Container(padding: const EdgeInsets.all(20),
      child: Column(children: [
        TextField(
          controller: nameController,
          decoration: const InputDecoration(hintText:'Name' ),
      ),
        const SizedBox(height: 10,
        ),
        TextField(
          controller: priceController,
          decoration: const InputDecoration(hintText:'Price' ),
        ),
        const SizedBox(height: 10,
        ),
        TextField(
          controller: quantityController,
          decoration: const InputDecoration(hintText:'Quantity' ),
        ),
        const SizedBox(height: 10,
        ),
        TextField(
          controller: compenentsController,
          decoration: const InputDecoration(hintText:'Components' ),
        ),
        const SizedBox(height: 10,
        ),
        ElevatedButton(
            onPressed: ()async {
              var p=new Product(
                 id:0,
                 name:  nameController.text,
                 price:   priceController.text ,
                 quantity:  int.parse(quantityController.text),
                 components: compenentsController.text
              );

               var response=await productservice.create(p).then((value) =>
                   showAlertDialog(context)
               );
              if(response){
                Navigator.popAndPushNamed(context, 'product');
              }else{
                throw Exception('Failed to create product.');
              }


        },
            child: const Text('Submit'))
      ],),) ,
    );
  }



}


class MyAlert extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: RaisedButton(
        child: Text('Show alert'),
        onPressed: () {
          showAlertDialog(context);
        },
      ),
    );
  }
}
showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Simple Alert"),
    content: Text("This is an alert message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}