import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:portafolio_andres_arenas/Festival_and_events/data/fae_data.dart';
import 'package:portafolio_andres_arenas/Festival_and_events/style/colors.dart';
import 'package:portafolio_andres_arenas/Festival_and_events/style/theme.dart';

class FAEDescriptionPage extends StatelessWidget {
  final FAEData data;

  const FAEDescriptionPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageHeight = size.height * 0.5;
    return Theme(
      data: FAETheme.theme,
      child: Scaffold(
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Stack(
              children: [
                _ImageBackground(
                    imageHeight: imageHeight, size: size, data: data),
                _GradientImageBackground(imageHeight: imageHeight, size: size),
                _Body(imageHeight: imageHeight, data: data, size: size)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.imageHeight,
    required this.data,
    required this.size,
  }) : super(key: key);

  final double imageHeight;
  final FAEData data;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            _ButtonsHeader(),
            SizedBox(height: imageHeight - 120),
            _TitleHeader(data: data),
            const SizedBox(height: 20),
            _DescriptionBody(),
            const SizedBox(height: 10),
            _MapGoogle(size: size),
            const SizedBox(height: 10),
            _InterestedBody(),
            const SizedBox(height: 20),
            _ButtonBuyTicket(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _ButtonBuyTicket extends StatelessWidget {
  const _ButtonBuyTicket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
            color: Colors.deepPurple.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 8)
      ]),
      child: CupertinoButton(
          borderRadius: BorderRadius.circular(20),
          color: FAEColors.primary,
          child: Text('Buy Ticket 272\$'),
          onPressed: () {}),
    );
  }
}

class _InterestedBody extends StatelessWidget {
  const _InterestedBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Interested',
          style: TextStyle(
              color: Colors.white60, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 10),
        Row(
          children: List.generate(
            5,
            (index) {
              if (index == interesedData.length - 1) {
                return Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                  child: Text(
                    '+324',
                    style: TextStyle(color: FAEColors.background),
                  ),
                );
              }

              return Align(
                widthFactor: 0.8,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(interesedData[index]),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _MapGoogle extends StatelessWidget {
  const _MapGoogle({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      decoration: BoxDecoration(
          color: FAEColors.backgroundCard,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(
                  'https://9to5google.com/wp-content/uploads/sites/4/2020/02/new-google-maps-cover.png?w=1600'),
              fit: BoxFit.cover)),
    );
  }
}

class _DescriptionBody extends StatelessWidget {
  const _DescriptionBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Description',
          style: TextStyle(
              color: Colors.white60, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 10),
        Text(
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto',
          style: TextStyle(color: Colors.white60),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Text(
                'Read more',
                style: TextStyle(color: Colors.deepPurple[200]),
              ),
              onPressed: () {}),
        ),
      ],
    );
  }
}

class _TitleHeader extends StatelessWidget {
  const _TitleHeader({
    Key? key,
    required this.data,
  }) : super(key: key);

  final FAEData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          data.title,
          style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 26),
        ),
        Row(
          children: [
            Icon(Ionicons.calendar_outline, color: Colors.deepPurple[200]),
            const SizedBox(width: 10),
            Text(
              data.date,
              style: TextStyle(color: Colors.white60),
            ),
            const Spacer(),
            Icon(Ionicons.time_outline, color: Colors.deepPurple[200]),
            const SizedBox(width: 10),
            Text(
              '4pm-12pm',
              style: TextStyle(color: Colors.white60),
            )
          ],
        ),
      ],
    );
  }
}

class _ButtonsHeader extends StatelessWidget {
  const _ButtonsHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            Ionicons.chevron_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        const Spacer(),
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            Ionicons.heart,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _GradientImageBackground extends StatelessWidget {
  const _GradientImageBackground({
    Key? key,
    required this.imageHeight,
    required this.size,
  }) : super(key: key);

  final double imageHeight;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imageHeight,
      width: size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.transparent,
            FAEColors.background.withOpacity(0.4),
            FAEColors.background,
          ])),
    );
  }
}

class _ImageBackground extends StatelessWidget {
  const _ImageBackground({
    Key? key,
    required this.imageHeight,
    required this.size,
    required this.data,
  }) : super(key: key);

  final double imageHeight;
  final Size size;
  final FAEData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imageHeight,
      width: size.width,
      decoration: BoxDecoration(
        color: FAEColors.background,
        image:
            DecorationImage(image: NetworkImage(data.image), fit: BoxFit.cover),
      ),
    );
  }
}
