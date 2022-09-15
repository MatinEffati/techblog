import 'package:flutter/material.dart';
import 'package:tech_blog/components/colors.dart';
import 'package:tech_blog/components/components.dart';
import 'package:tech_blog/components/text_style.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar('مقالات جدید'),
      ),
    );
  }


}
