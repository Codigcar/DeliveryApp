import 'package:delivery_app/presentation/home/cart/cart_screen.dart';
import 'package:delivery_app/presentation/home/products/products_screen.dart';
import 'package:delivery_app/presentation/home/profile/profile_screen.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: currentIndex,
              children: [
                ProductosScreen(),
                Text('data'),
                CartScreen(
                  onShopping: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                ),
                ProfileScreen()
              ],
            ),
          ),
          _DeliveryNavigationBar(
            index: currentIndex,
            onIndexSelected: (value) {
              setState(() {
                currentIndex = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;
  const _DeliveryNavigationBar({
    Key key,
    this.index,
    this.onIndexSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(38.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: DeliveryColors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              child: IconButton(
                icon: Icon(
                  Icons.home,
                  color: index == 0
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
                onPressed: () => onIndexSelected(0),
              ),
            ),
            Material(
              child: IconButton(
                icon: Icon(
                  Icons.store,
                  color: index == 1
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
                onPressed: () => onIndexSelected(1),
              ),
            ),
            Material(
              child: CircleAvatar(
                backgroundColor: DeliveryColors.purple,
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_basket,
                    color: index == 2
                        ? DeliveryColors.green
                        : DeliveryColors.lightGrey,
                  ),
                  onPressed: () => onIndexSelected(2),
                ),
              ),
            ),
            Material(
              child: IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: index == 3
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
                onPressed: () => onIndexSelected(3),
              ),
            ),
            InkWell(
              onTap: () => () => onIndexSelected(4),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
