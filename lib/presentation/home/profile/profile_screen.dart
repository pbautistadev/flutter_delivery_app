import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: DeliveryColors.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      radius: 50,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Username',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).copyWith().colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Card(
                    color: Theme.of(context).canvasColor,
                    child: Padding(
                      padding: const EdgeInsets.all(23.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Personal Information',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(
                                context,
                              ).copyWith().colorScheme.secondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          Text(
                            'email@gmail.com',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Dark Mode',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Switch(
                                value: true,
                                onChanged: (val) {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: DeliveryColors.purple,
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          color: DeliveryColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
