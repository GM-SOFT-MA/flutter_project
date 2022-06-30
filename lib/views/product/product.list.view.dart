import 'package:flutter/material.dart';
import 'package:project/services/api/product.service.dart';
import 'file:///D:/mobile/project/lib/models/product.model.dart';


class ProductListView extends StatefulWidget{
  const ProductListView({Key key}) : super(key: key);
   @override
   _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ProductListView>{

  List<Product> listProduct=[];
  //ProductBean p =ProductBean(id: '1', name: 'name', price: 'price', quantity: 1, components: 'components');
  ProductService productService =  ProductService();

  @override
  void initState() {
    productService.getAll().then((response) {
      setState(() {
        listProduct = response.map((model) => Product.fromJson(model)).toList();
      });
    });

    super.initState();
  }

    @override
    Widget build(BuildContext context) {

      return Scaffold(
          appBar: AppBar(
              title: const Text('Product'),),
              body: ListView.builder(
                  itemCount: listProduct.length,
                  itemBuilder:(context, index){
                    Product product = listProduct[index];
                  return InkWell(
                    onTap: (){
                      Navigator.popAndPushNamed(context, 'update',arguments: [
                        product.id,
                        product.name,
                        product.price,
                        product.quantity,
                        product.components]);
                    },
                    child: Dismissible(
                      key: Key(product.id.toString()),
                      direction:DismissDirection.endToStart ,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal:30),
                        child: const Icon(Icons.delete),
                      ),
                      confirmDismiss: (direction){
                        return showDialog(context: context, builder: (context){
                          return AlertDialog(
                            title: const Text('Delete Product'),
                          content: const Text('Are you sure to delete Product ?'),
                          actions: [
                            TextButton(onPressed: () async{
                              bool response = await productService.deletePage(product.id.toString());
                              if(response){Navigator.pop(context,true);}
                              else{
                                Navigator.pop(context,false);
                              }

                            }, child: const Text('Yes')),
                            TextButton(onPressed: (){

                            }, child: const Text('No'))
                          ],);
                        });
                      },
                      child: ListTile(
                          leading: Container(
                      width:60,
                      height:60,
                      decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                      image: AssetImage('images/prod.png'),
                      fit: BoxFit.cover)),
                      ),
                      title:Text('${product.name} ${product.price} ${product.quantity}'),
                      subtitle:Text(product.components,maxLines: 1,overflow: TextOverflow.ellipsis,
                      ),//khas tkon product.message
                     ),
                    ),
                  );
                },
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





























