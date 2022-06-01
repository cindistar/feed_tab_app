import 'package:dio/dio.dart';
import 'package:feed_tab/repositories/feed_repository.dart';
import 'package:feed_tab/view_models/feed_view_model.dart';
import 'package:feed_tab/views/feed_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => Dio()),
        Provider(create: (context) => FeedRepository(context.read())),
        ChangeNotifierProvider(create: (context) => FeedViewModel(context.read())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FeedTabView(),
      ),
    );
  }
}
