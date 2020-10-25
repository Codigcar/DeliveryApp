import 'package:delivery_app/data/in_memory_products.dart';
import 'package:delivery_app/domain/model/product.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:delivery_app/presentation/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class ProductosScreen extends StatelessWidget {
  const ProductosScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return _ItemProduct(product: product);
        },
      ),
    );
  }
}

class _ItemProduct extends StatelessWidget {
  final Product product;
  const _ItemProduct({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _mea = ['hola'];
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: ClipOval(child: Image.asset('assets/rat.png')),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(product.name),
                  const SizedBox(height: 15),
                  Text(
                    product.description,
                    style: Theme.of(context)
                        .textTheme
                        .overline
                        .copyWith(color: DeliveryColors.lightGrey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    '\$${product.price} USD',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ],
              ),
            ),
            DeliveryButton(
              padding: const EdgeInsets.symmetric(vertical: 4),
              text: 'Agregar',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
