import 'package:flutter/material.dart';

import '../../theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: DeliveryColors.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      radius: 45,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Username',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: Theme.of(context).canvasColor,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Personal Information',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'email@email.com',
                          ),
                          /*SwitchListTile(
                            value: true,
                            title: Text('Dark Mode'),
                            onChanged: (value) {},
                          )*/
                          Row(
                            children: [
                              Text('Dark Mode'),
                              Spacer(),
                              Switch(
                                value: true,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Center(
                  child: RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: DeliveryColors.purple,
                    child: Text(
                      'Log Out',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
