import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:portafolio_andres_arenas/Festival_and_events/data/fae_data.dart';
import 'package:portafolio_andres_arenas/Festival_and_events/pages/fae_controller.dart';
import 'package:portafolio_andres_arenas/Festival_and_events/pages/fae_descripion.dart';
import 'package:portafolio_andres_arenas/Festival_and_events/style/colors.dart';
import 'package:portafolio_andres_arenas/Festival_and_events/style/theme.dart';
import 'package:provider/provider.dart';

class FAEHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FAEController>(
      create: (_) => FAEController(),
      builder: (context, snapshot) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Theme(
            data: FAETheme.theme,
            child: Scaffold(
              body: SafeArea(
                child: Stack(
                  children: [
                    ListView(
                      padding: const EdgeInsets.only(bottom: 20),
                      physics: BouncingScrollPhysics(),
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              _FAEAppBar(),
                              _Search(),
                              const SizedBox(height: 20),
                              _FAESelectors(),
                              const SizedBox(height: 10),
                              _HeaderCard(),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        _SlidersCards(),
                        const SizedBox(height: 100),
                      ],
                    ),
                    Positioned(
                      left: 20,
                      right: 20,
                      bottom: 20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              color: FAEColors.backgroundCard.withOpacity(0.9),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.white30,
                                            blurRadius: 10,
                                            spreadRadius: 3)
                                      ]),
                                  child: Icon(Ionicons.home),
                                ),
                                Icon(Ionicons.ticket_outline),
                                Icon(Ionicons.location_outline),
                                Icon(Ionicons.person_outline),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              extendBody: true,
            ),
          ),
        );
      },
    );
  }
}

class _SlidersCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final data = festivalAndEventsData;

    return Container(
      height: size.height * 0.7,
      child: CarouselSlider.builder(
        itemCount: data.length,
        itemBuilder: (_, index, __) {
          final currentData = data[index];

          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FAEDescriptionPage(data: currentData),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: FAEColors.backgroundCard,
                  image: DecorationImage(
                      image: NetworkImage(currentData.image),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black87,
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Ionicons.heart,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            currentData.date,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            currentData.title,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          autoPlayCurve: Curves.ease,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 400),
          disableCenter: true,
          pauseAutoPlayInFiniteScroll: true,
          viewportFraction: 0.85,
          scrollPhysics: BouncingScrollPhysics(),
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
          autoPlay: true,
        ),
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Musical Festivals',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        CupertinoButton(
            child: Text(
              'See all',
              style: TextStyle(color: Colors.deepPurple[200]),
            ),
            onPressed: () {})
      ],
    );
  }
}

class _Search extends StatelessWidget {
  const _Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: Icon(
          Ionicons.ellipsis_horizontal_outline,
          color: Colors.white60,
        ),
        prefixIcon: Icon(Ionicons.search_outline, color: Colors.white60),
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.white60),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20)),
        filled: true,
        fillColor: FAEColors.backgroundCard,
      ),
    );
  }
}

class _FAESelectors extends StatelessWidget {
  const _FAESelectors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight - 10,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          _FAESelector(
            label: 'Musical festival',
            index: 0,
          ),
          _FAESelector(
            label: 'Book festival',
            index: 1,
          ),
          _FAESelector(
            label: 'Dance festival',
            index: 2,
          ),
          _FAESelector(
            label: 'Party festival',
            index: 3,
          ),
        ],
      ),
    );
  }
}

class _FAESelector extends StatelessWidget {
  final String label;
  final int index;

  const _FAESelector({Key? key, required this.label, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indexController =
        context.select<FAEController, int>((value) => value.index);

    final controller = Provider.of<FAEController>(context, listen: false);

    return Container(
      margin: EdgeInsets.only(right: 10),
      child: CupertinoButton(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        borderRadius: BorderRadius.circular(50),
        color: this.index == indexController
            ? FAEColors.primary
            : FAEColors.backgroundCard,
        pressedOpacity: 1,
        child: Text(
          this.label,
          style: TextStyle(
            color:
                this.index == indexController ? Colors.white : Colors.white60,
            fontWeight: this.index == indexController
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
        onPressed: () {
          controller.changeIndex(this.index);
        },
      ),
    );
  }
}

class _FAEAppBar extends StatelessWidget {
  const _FAEAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CupertinoButton(
          child: Icon(
            Ionicons.menu_outline,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        const Spacer(),
        CupertinoButton(
          child: Stack(
            children: [
              Icon(
                Ionicons.notifications,
                color: Colors.white,
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.red,
                  )),
            ],
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
