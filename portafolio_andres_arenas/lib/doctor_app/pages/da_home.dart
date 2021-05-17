import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:ionicons/ionicons.dart';
import 'package:portafolio_andres_arenas/doctor_app/pages/controller.dart';
import 'package:portafolio_andres_arenas/doctor_app/style/colors.dart';
import 'package:portafolio_andres_arenas/doctor_app/style/theme.dart';

class DAHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: DATheme.theme,
      child: GetBuilder<DAHomeController>(
          init: DAHomeController(),
          builder: (controller) {
            return Scaffold(
              body: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          DAColors.primary.withOpacity(0.5),
                          DAColors.primary,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: 200,
                      child: Column(
                        children: [
                          DrawerHeader(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey[200],
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                      'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Anders Harld',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                _DAListTile(
                                  title: 'Home',
                                  icon: Ionicons.home,
                                  index: 0,
                                ),
                                _DAListTile(
                                  title: 'Profile',
                                  icon: Ionicons.person,
                                  index: 1,
                                ),
                                _DAListTile(
                                  title: 'settings',
                                  icon: Ionicons.settings,
                                  index: 2,
                                ),
                                _DAListTile(
                                  title: 'log out',
                                  icon: Ionicons.log_out,
                                  index: 3,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //MAIN SCREEN
                  Obx(() {
                    return TweenAnimationBuilder(
                      curve: Curves.easeIn,
                      tween:
                          Tween<double>(begin: 0, end: controller.value.value),
                      duration: Duration(milliseconds: 500),
                      builder: (_, double val, __) {
                        return Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..setEntry(0, 3, 200 * val)
                            ..rotateY((pi / 6) * val),
                          child: IndexedStack(
                            index: controller.index.value,
                            children: [
                              _HomePage(controller: controller),
                              _ProfilePage(controller: controller),
                              _SettingsPage(controller: controller),
                              _LogoutPage(controller: controller)
                            ],
                          ),
                        );
                      },
                    );
                  }),
                  GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      print(details);
                      if (details.delta.dx > 0) {
                        controller.value.value = 1;
                      } else {
                        controller.value.value = 0;
                      }
                    },

                    // onTap: () {
                    //   setState(() {
                    //     value == 0 ? value = 1 : value = 0;
                    //   });
                    // },
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class _LogoutPage extends StatelessWidget {
  final DAHomeController controller;

  const _LogoutPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Scaffold(
        appBar: AppBar(
          leading: TextButton(
              onPressed: () {
                if (controller.value.value == 1) {
                  controller.value.value = 0;
                } else {
                  controller.value.value = 1;
                }
              },
              child: Icon(Ionicons.menu_outline)),
          title: Text('3D Drawer Menu'),
        ),
        body: Center(
          child: Text('Logout Page'),
        ),
      ),
    );
  }
}

class _SettingsPage extends StatelessWidget {
  final DAHomeController controller;

  const _SettingsPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Scaffold(
        appBar: AppBar(
          leading: TextButton(
              onPressed: () {
                if (controller.value.value == 1) {
                  controller.value.value = 0;
                } else {
                  controller.value.value = 1;
                }
              },
              child: Icon(Ionicons.menu_outline)),
          title: Text('3D Drawer Menu'),
        ),
        body: Center(
          child: Text('Settings Page'),
        ),
      ),
    );
  }
}

class _ProfilePage extends StatelessWidget {
  final DAHomeController controller;

  const _ProfilePage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Scaffold(
        appBar: AppBar(
          leading: TextButton(
              onPressed: () {
                if (controller.value.value == 1) {
                  controller.value.value = 0;
                } else {
                  controller.value.value = 1;
                }
              },
              child: Icon(Ionicons.menu_outline)),
          title: Text('3D Drawer Menu'),
        ),
        body: Center(
          child: Text('Profile Page'),
        ),
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  final DAHomeController controller;

  _HomePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: TextButton(
                onPressed: () {
                  if (controller.value.value == 1) {
                    controller.value.value = 0;
                  } else {
                    controller.value.value = 1;
                  }
                },
                child: Icon(
                  Ionicons.menu_outline,
                  color: Colors.white,
                )),
            title: Text(
              'Drawer menu',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Container(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.33,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: DAColors.backgroundCard,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://images.theconversation.com/files/304957/original/file-20191203-66986-im7o5.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop'),
                          fit: BoxFit.cover)),
                ),
                Positioned.fill(
                  top: size.height * 0.28,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: DAColors.background,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        Text(
                          'Dr Steve Smith',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: List.generate(
                            5,
                            (index) {
                              if (index == 4) {
                                return Icon(Icons.star,
                                    size: 22, color: DAColors.backgroundCard);
                              }

                              return Icon(Icons.star,
                                  size: 22, color: DAColors.primary);
                            },
                          ),
                        ),
                        Text(
                          'Hearth • Saint Francis memorial hospital',
                          style: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                          style:
                              TextStyle(color: Colors.blue[900], height: 1.5),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Education',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text('UCL, MIT, Stanford university',
                            style: TextStyle(
                                color: Colors.blue[900], height: 1.5)),
                        const SizedBox(height: 10),
                        Text(
                          'Awards',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'CMS Stage 1 EHR (2013), AAD Felow (2016)',
                          style:
                              TextStyle(color: Colors.blue[900], height: 1.5),
                        ),
                        const SizedBox(height: 150),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          height: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blue[900]),
                          child: Icon(
                            Ionicons.phone_portrait_outline,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                          flex: 4,
                          child: Container(
                            alignment: Alignment.center,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: DAColors.primary),
                            child: Text(
                              'MAKE AN APPOINTMENT',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DAListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final index;

  _DAListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DAHomeController>(
      init: DAHomeController(),
      builder: (controller) {
        return ListTile(
          leading: Icon(this.icon, color: Colors.white),
          title: Text(
            this.title,
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            print(this.title);
            controller.index.value = this.index;
            controller.value.value = 0;
          },
        );
      },
    );
  }
}
