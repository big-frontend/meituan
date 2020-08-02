import 'package:flutter/material.dart';

class InfiniteListView extends SliverChildBuilderDelegate {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];
  InfiniteListView(IndexedWidgetBuilder builder) : super(builder);
  // void _retrieveData() {
  //   Future.delayed(Duration(seconds: 2)).then((e) {
  //     setState(() {
  //       //重新构建列表
  //       _words.insertAll(
  //           _words.length - 1,
  //           //每次生成20个单词
  //           generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
  //     });
  //   });
  // }
}
