import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:portafolio_andres_arenas/nike_colors/data/nc_model.dart';
import 'package:portafolio_andres_arenas/nike_colors/pages/nc_controller.dart';
import 'package:portafolio_andres_arenas/nike_colors/style/theme.dart';

class NCHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: NCTheme.theme,
      child: GetBuilder<NCHomeController>(
          init: NCHomeController(),
          builder: (controller) {
            return Scaffold(
              appBar: AppBar(
                leadingWidth: 70,
                leading: CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [Icon(Ionicons.chevron_back), Text('Back')],
                    ),
                    onPressed: () => Navigator.pop(context)),
                title: Text(
                  'Nike shoes',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            controller.past.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                            child: AnimatedBuilder(
                          animation: controller.animationController,
                          builder: (_, __) {
                            return ClipPath(
                              clipper: _NCClipper(
                                  controller.animationController.value,
                                  controller.current),
                              child: Image.asset(
                                controller.current.image,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text(controller.current.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: controller.current.color)),
                        Expanded(
                          child: GridView.builder(
                            padding: const EdgeInsets.all(20.0),
                            itemCount: ncData.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 20.0,
                              mainAxisSpacing: 20.0,
                            ),
                            itemBuilder: (context, index) {
                              return _NCButton(
                                nike: ncData[index],
                                selected: controller.current.color ==
                                    ncData[index].color,
                                onTap: () {
                                  controller.onNCSelected(ncData[index]);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class _NCClipper extends CustomClipper<Path> {
  final double percent;
  final NCModel ncModel;

  const _NCClipper(this.percent, this.ncModel);

  @override
  getClip(Size size) {
    final path = Path();
    Offset center;

    if (ncModel.align == Alignment.topRight) {
      center = Offset(size.width, 0);
    } else if (ncModel.align == Alignment.centerLeft) {
      center = Offset(size.width / 2, 0);
    } else if (ncModel.align == Alignment.bottomCenter) {
      center = Offset(size.width / 2, size.height);
    } else if (ncModel.align == Alignment.topCenter) {
      center = Offset(size.width / 2, 0);
    } else if (ncModel.align == Alignment.bottomLeft) {
      center = Offset(0, size.height);
    } else {
      center = Offset(size.width / 2, size.height / 2);
    }

    path.addOval(
      Rect.fromCenter(
          center: center,
          width: size.width * percent,
          height: size.height * percent),
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}

class _NCButton extends StatelessWidget {
  final NCModel nike;
  final VoidCallback onTap;
  final bool selected;

  const _NCButton(
      {Key? key,
      required this.nike,
      required this.onTap,
      this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounce(
      from: 10,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border:
                Border.all(color: Colors.white, width: this.selected ? 10 : 1),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: nike.color.withOpacity(0.7),
            ),
          ),
        ),
      ),
    );
  }
}
