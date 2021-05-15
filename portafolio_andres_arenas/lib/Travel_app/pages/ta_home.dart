import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:portafolio_andres_arenas/Travel_app/data/ta_data.dart';
import 'package:portafolio_andres_arenas/Travel_app/pages/ta_description.dart';
import 'package:portafolio_andres_arenas/Travel_app/style/theme.dart';

class TAHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Theme(
      data: TATheme.theme,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            leading: CupertinoButton(
                child: Icon(
                  Ionicons.menu_outline,
                  color: Colors.grey,
                ),
                onPressed: () {}),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Samantha Marin',
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://image.freepik.com/free-photo/cheerful-attractive-woman-with-long-dark-hair-blue-eyes_176420-18270.jpg'),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Column(
                children: [
                  _Search(),
                  const SizedBox(height: 20),
                  Container(
                    height: size.height * 0.7,
                    child: CarouselSlider.builder(
                      itemCount: 3,
                      itemBuilder: (context, index, realIndex) {
                        final data = taData[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    TADescriptionPage(data: data),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Text(
                                data.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(data.image),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[300]!,
                                          spreadRadius: 2,
                                          blurRadius: 2)
                                    ],
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    height: size.height * 0.2,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(20),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          data.location,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          children: List.generate(
                                            5,
                                            (index) {
                                              if (index == 4) {
                                                return Icon(Ionicons.star,
                                                    size: 18,
                                                    color: Colors.grey[200]);
                                              }

                                              return Container(
                                                margin: const EdgeInsets.only(
                                                    right: 1),
                                                child: Icon(Ionicons.star,
                                                    size: 18,
                                                    color: Colors.yellow),
                                              );
                                            },
                                          ),
                                        ),
                                        TAWrap(data: data)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10)
                            ],
                          ),
                        );
                      },
                      options: CarouselOptions(
                        autoPlayCurve: Curves.ease,
                        autoPlayInterval: Duration(seconds: 4),
                        autoPlayAnimationDuration: Duration(milliseconds: 400),
                        disableCenter: true,
                        pauseAutoPlayInFiniteScroll: true,
                        viewportFraction: 0.7,
                        scrollPhysics: BouncingScrollPhysics(),
                        enableInfiniteScroll: true,
                        enlargeCenterPage: true,
                        autoPlay: true,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TAWrap extends StatelessWidget {
  const TAWrap({
    Key? key,
    required this.data,
  }) : super(key: key);

  final TAModel data;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      clipBehavior: Clip.none,
      children: List.generate(
        4,
        (index) => Container(
          margin: const EdgeInsets.all(3),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                data.tags[index],
                style: TextStyle(color: Colors.white),
              ),
              Icon(
                Icons.close,
                color: Colors.white70,
                size: 12,
              )
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: data.colors[index])),
        ),
      ),
    );
  }
}

class _Search extends StatelessWidget {
  const _Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300]!)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300]!)),
            prefixIcon: Icon(
              Ionicons.search_outline,
              color: Colors.grey[300],
            ),
            hintText: 'Search here',
            hintStyle: TextStyle(color: Colors.grey[300])),
      ),
    );
  }
}
