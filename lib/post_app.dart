import 'package:bloc_tutorial/posts/view/posts_page.dart';
import 'package:flutter/material.dart';

class PostApp extends MaterialApp {
  const PostApp({super.key})
      : super(debugShowCheckedModeBanner: false, home: const PostsPage());
}
