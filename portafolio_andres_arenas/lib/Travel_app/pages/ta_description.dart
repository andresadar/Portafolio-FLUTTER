import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:portafolio_andres_arenas/Travel_app/data/ta_data.dart';
import 'package:portafolio_andres_arenas/Travel_app/pages/ta_home.dart';

class TADescriptionPage extends StatelessWidget {
  final TAModel data;

  const TADescriptionPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                _ImageHeader(size: size, data: data),
                Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        data.title,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                        style: TextStyle(color: Colors.grey[700], height: 1.4),
                      ),
                      const SizedBox(height: 20),
                      TAWrap(data: data)
                    ],
                  ),
                ),
                Container(
                  height: size.height / 3,
                  child: CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: (context, index, realIndex) {
                      final _taData = taData;

                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[200],
                            image: DecorationImage(
                                image: NetworkImage(_taData[index].image),
                                fit: BoxFit.cover)),
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
                const SizedBox(height: 150),
              ],
            ),
            Positioned(
              bottom: 30,
              left: size.width / 5,
              right: size.width / 5,
              child: Container(
                height: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: data.colors[1]),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Text(
                  "Let's go",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ImageHeader extends StatelessWidget {
  const _ImageHeader({
    Key? key,
    required this.size,
    required this.data,
  }) : super(key: key);

  final Size size;
  final TAModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        height: size.height / 3,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            image: DecorationImage(
                image: NetworkImage(data.image), fit: BoxFit.cover)),
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration:
              BoxDecoration(color: Colors.black38, shape: BoxShape.circle),
          child: CupertinoButton(
              child: Icon(Ionicons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context)),
        ));
  }
}
