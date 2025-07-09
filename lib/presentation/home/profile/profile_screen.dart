import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:delivery_app/presentation/home/profile/profile_bloc.dart';
import 'package:delivery_app/presentation/main_bloc.dart';
import 'package:delivery_app/presentation/splash/splash_screen.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileBLoC(
        apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
        localRepositoryInterface: context.read<LocalRepositoryInterface>(),
      )..loadTheme(),
      builder: (_, __) => ProfileScreen._(),
    );
  }

  void logout(BuildContext context) async {
    final profileBloc = Provider.of<ProfileBLoC>(context, listen: false);
    await profileBloc.logOut();
    if (!context.mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => SplashScreen.init(context),
      ),
      (route) => false,
    );
  }

  void onThemeUpdated(BuildContext context, bool isDark) {
    final profileBloc = Provider.of<ProfileBLoC>(context, listen: false);
    profileBloc.updateTheme(isDark);

    final mainBloc = context.read<MainBLoC>();

    mainBloc.loadTheme();
  }

  @override
  Widget build(BuildContext context) {
    final homeBloc = Provider.of<HomeBLoC>(context);
    final profileBloc = Provider.of<ProfileBLoC>(context);
    final user = homeBloc.user;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: user.image != null
          ? Column(
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
                            backgroundImage: AssetImage(
                              user.image.toString(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        user.name.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(
                            context,
                          ).copyWith().colorScheme.secondary,
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
                                  user.username.toString(),
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
                                      value: profileBloc.isDark,
                                      onChanged: (val) =>
                                          onThemeUpdated(context, val),
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
                          onPressed: () => logout(context),
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
            )
          : SizedBox.shrink(),
    );
  }
}
