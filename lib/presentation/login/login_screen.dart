import 'package:delivery_app/presentation/home/home_screen.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:delivery_app/presentation/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

const logoSize = 45.0;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widht = size.width;
    final moreSize = 50.0;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: LayoutBuilder(
              builder: (context, constraints) {
                print(constraints);
                return Stack(
                  children: [
                    Positioned(
                      bottom: logoSize,
                      left: -moreSize / 2,
                      right: -moreSize / 2,
                      height: widht + moreSize,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [
                              0.5,
                              1.0,
                            ],
                            colors: deliveryGradients,
                          ),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(size.width / 2),
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
                          child: Image.asset(
                            'assets/image.png',
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Username',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outline,
                        ),
                        hintText: 'username',
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      'Password',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.check_box_outlined,
                        ),
                        hintText: 'password',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25),
            child: DeliveryButton(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                );
              },
              text: 'Login',
            ),
          ),
        ],
      ),
    );
  }
}
