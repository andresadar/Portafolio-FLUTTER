import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:portafolio_andres_arenas/Recipe_food/data/rf_model.dart';
import 'package:portafolio_andres_arenas/Recipe_food/pages/home/controller.dart';
import 'package:portafolio_andres_arenas/Recipe_food/style/colors.dart';
import 'package:portafolio_andres_arenas/Recipe_food/style/theme.dart';

class RFHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const buttonHeight = 70.0;
    return GetBuilder<RFHomeController>(
      init: RFHomeController(),
      builder: (controller) {
        return Theme(
          data: RFTheme.theme,
          child: Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  NestedScrollView(
                    physics: BouncingScrollPhysics(),
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return <Widget>[
                        _RFSliverAppBar(
                          controller: controller,
                        ),
                        SliverPersistentHeader(
                            pinned: true,
                            delegate: RFSliverPersintentHeader(
                                tabBar: TabBar(
                                    controller: controller.tabController,
                                    tabs: controller.pages
                                        .map<Tab>((e) => Tab(
                                              text: e.title,
                                            ))
                                        .toList()))),
                      ];
                    },
                    body: TabBarView(
                        controller: controller.tabController,
                        children: controller.pages
                            .map<Widget>((e) => e.body)
                            .toList()),
                  ),
                  Positioned(
                    bottom: 50,
                    left: size.width / 2 - buttonHeight / 2,
                    right: size.width / 2 - buttonHeight / 2,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: buttonHeight,
                        width: buttonHeight,
                        decoration: BoxDecoration(
                            color: RFColors.primary,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Ionicons.add,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ReviewsBody extends StatelessWidget {
  final data = rfdataReviews;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: List.generate(
        data.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 180,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.grey[200]!, blurRadius: 3, spreadRadius: 3)
          ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                data[index].title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                data[index].description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black45, height: 1.2),
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: RFColors.backgroundCard,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(data[index].image),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data[index].author),
                      Text(
                        data[index].nickname,
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubmitedBody extends StatelessWidget {
  final data = rfdata;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: List.generate(
        data.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                    color: RFColors.backgroundCard,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(data[index].image),
                        fit: BoxFit.cover)),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Ionicons.star,
                          color: Colors.yellow[700],
                          size: 15,
                        ),
                        Text(
                          '4.5',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                data[index].title,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    'by: ',
                    style: TextStyle(color: Colors.black38),
                  ),
                  Text(
                    data[index].author,
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RFSliverAppBar extends StatelessWidget {
  final RFHomeController controller;

  const _RFSliverAppBar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const imageProfileHeight = 100.0;
    const flexHeight = 280.0;

    return SliverAppBar(
      automaticallyImplyLeading: true,
      expandedHeight: flexHeight,
      iconTheme: IconThemeData(color: Colors.black),
      pinned: false,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        background: Container(
          color: RFColors.backgroundCard,
          height: flexHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                top: flexHeight / 2.5,
                child: Container(color: RFColors.background),
              ),
              Positioned(
                top: flexHeight / 2.5 - imageProfileHeight / 2,
                left: size.width / 2 - imageProfileHeight / 2,
                right: size.width / 2 - imageProfileHeight / 2,
                child: Container(
                  height: imageProfileHeight,
                  width: imageProfileHeight,
                  decoration: BoxDecoration(
                      color: RFColors.background,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://kiwakkuki.org/uploads/volunteers/3.jpg'),
                          fit: BoxFit.cover),
                      border: Border.all(color: RFColors.primary, width: 3),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Positioned.fill(
                top: flexHeight / 2.5 + imageProfileHeight / 2 + 10,
                child: Column(
                  children: [
                    Text(
                      'Julia Nanatsu',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'juliananat',
                      style: TextStyle(color: Colors.black38),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoButton(
                            child: Icon(Ionicons.logo_twitter),
                            onPressed: () {}),
                        CupertinoButton(
                            child: Icon(Ionicons.logo_instagram),
                            onPressed: () {}),
                        CupertinoButton(
                            child: Icon(Ionicons.logo_facebook),
                            onPressed: () {}),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Tuple extends StatelessWidget {
  final String title;
  final Widget body;

  const Tuple({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return this.body;
  }
}

class RFSliverPersintentHeader extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final Color color;

  RFSliverPersintentHeader(
      {required this.tabBar, this.color = RFColors.background});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: this.color,
      child: tabBar,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => tabBar.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
