import 'package:delivery_app/data/in_memory_products.dart';
import 'package:delivery_app/domain/model/product.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:delivery_app/presentation/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final VoidCallback onShopping;
  const CartScreen({Key key, this.onShopping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: _FullCart() /* _EmptyCart(onShopping: onShopping)*/,
    );
  }
}

class _FullCart extends StatelessWidget {
  const _FullCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ListView.builder(
              itemCount: products.length,
              itemExtent: 230,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final product = products[index];
                return _ShoppingCartProduct(product: product);
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Theme.of(context).canvasColor,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sub total',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Theme.of(context).accentColor),
                        ),
                        Text(
                          '0.0 usd',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Theme.of(context).accentColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Theme.of(context).accentColor),
                        ),
                        Text(
                          'Free',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Theme.of(context).accentColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$85.00 USD',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    DeliveryButton(
                      text: 'Checkout',
                      onTap: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ShoppingCartProduct extends StatelessWidget {
  final Product product;
  const _ShoppingCartProduct({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Stack(
        children: [
          Card(
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
                        Row(
                          children: [
                            InkWell(
                              child: Icon(Icons.remove),
                              onTap: () {},
                            ),
                            Text(
                              '\$${product.price} USD',
                              style: TextStyle(color: DeliveryColors.green),
                            ),
                            InkWell(
                              child: Icon(Icons.add),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: DeliveryColors.pink,
                child: Icon(Icons.delete_outline),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyCart extends StatelessWidget {
  final VoidCallback onShopping;
  const _EmptyCart({Key key, this.onShopping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/rat.png',
          height: 90,
        ),
        Text(
          'There are no products',
          textAlign: TextAlign.center,
        ),
        Center(
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: DeliveryColors.purple,
            child: Text(
              'Go shopping',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: onShopping,
          ),
        )
      ],
    );
  }
}
