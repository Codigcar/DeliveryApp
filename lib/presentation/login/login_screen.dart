import 'package:delivery_app/presentation/home/home_screen.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:delivery_app/presentation/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

const logoSize = 40.0;

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final moreSize = 50.0;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: LayoutBuilder(builder: (context, constraints) {
              return Stack(
                children: [
                  Positioned( 
                    bottom: logoSize,
                    left: -moreSize / 2,
                    right: -moreSize / 2,
                    height: width + moreSize,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: deliveryGradients,
                            stops: [0.5, 1.0]),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(200),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).canvasColor,
                      radius: logoSize,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset('assets/ma.png'),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Login',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),
                    Text(
                      'Username',
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'username',
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Password',
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'password',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: DeliveryButton(
              text: 'Login',
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => HomeScreen(),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
