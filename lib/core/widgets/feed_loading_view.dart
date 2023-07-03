import 'package:flutter/material.dart';
import 'greeting_view.dart';
import 'loading_post_view.dart';

class FeedLoadingView extends StatelessWidget {
  final String name;
  const FeedLoadingView({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          GreetingView(name: ''),
          LoadingPostItemView(),
          LoadingPostItemView(),
          LoadingPostItemView(),
          LoadingPostItemView(),
        ],
      ),
    );
  }
}
