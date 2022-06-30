import 'package:flutter/material.dart';
import 'package:project/models/product.model.dart';
import 'package:project/services/api/product.service.dart';


class ProductUpdateView extends StatefulWidget {
  static const routeName = 'update';
  const ProductUpdateView({Key key}) : super(key: key);

  @override
  State<ProductUpdateView> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<ProductUpdateView> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  final compenentsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context)?.settings.arguments as List<String>;
    if(args[1].isNotEmpty){
        nameController.text=args[1];
    }
    if(args[2].isNotEmpty){
      priceController.text=args[2];
    }
    if(args[3].isNotEmpty){
      quantityController.text=args[3];
    }
    if(args[4].isNotEmpty){
      compenentsController.text=args[4];
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Update Page'),
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
                var productService=new ProductService();
                var p=new Product(
                    id:int.parse(args[0]),
                    name:  nameController.text,
                    price:  priceController.text ,
                    quantity:  int.parse(quantityController.text),
                    components: compenentsController.text
                );
                bool response= await productService.update(p);
                if(response){
                  Navigator.popAndPushNamed(context, 'home');
                }else{
                  throw Exception('Failed to update product.');
                }
              },
              child: const Text('Update'))
        ],),) ,
    );
  }
}
