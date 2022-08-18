import 'package:flutter/material.dart';

class GridA extends StatelessWidget {
  const GridA({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Onfonmedia';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(100, (index) {
            const BoxDecoration();
            return Center(
              child: Text(
                'Itemi index',
                style: Theme.of(context).textTheme.headline5,
              ), 
            );
          }),
        ),
      ),
    );
  }
}

class HomePage1 extends StatelessWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnfonMedia'),
      ),
       body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Itemi $index',
                style: Theme.of(context).textTheme.headline5,
              ),
            );
          }),
        ),
    );
  }
}
