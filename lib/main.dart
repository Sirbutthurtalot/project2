import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'util/asset_loader.dart';

import './routes/router.dart';

main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}

class AssetLoadingSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<String> data = loadData();

    return FutureBuilder(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!);
        } else {
          return Text("Waiting for data...");
        }
      },
    );
  }
}
