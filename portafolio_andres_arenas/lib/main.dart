import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portafolio_andres_arenas/routes/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portafolio Andres Arenas',
      initialRoute: Pages.INITIAL,
      routes: Pages.routes,
    );
  }
}

class SelectProject extends StatelessWidget {
  const SelectProject({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Aplicaciones'),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CupertinoButton(
              color: Colors.blue,
              child: Text('Festival & Events'),
              onPressed: () {
                Navigator.pushNamed(context, '/FestivalAndEvents');
              },
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Colors.blue,
              child: Text('Recipe food'),
              onPressed: () {
                Navigator.pushNamed(context, '/RecipeFood');
              },
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Colors.blue,
              child: Text('Travel App'),
              onPressed: () {
                Navigator.pushNamed(context, '/TravelApp');
              },
            ),
          ],
        ),
      ),
    );
  }
}
