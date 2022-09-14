import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tech_blog/components/colors.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:url_launcher/url_launcher.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.divider,
      indent: size.width / 6,
      endIndent: size.width / 6,
      thickness: 1.3,
    );
  }
}

class TagItem extends StatelessWidget {
  const TagItem({
    Key? key,
    required this.textTheme, required this.index,
  }) : super(key: key);

  final TextTheme textTheme;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              colors: GradiantColors.tags,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            const Icon(
              Icons.tag,
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              tagList[index].title,
              style: textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }
}

myLaunchUrl(String url) async{
  var uri = Uri.parse(url);
  if(await canLaunchUrl(uri)){
    await launchUrl(uri);
  }else{
    log('could not launch this url: ${uri.toString()}');
  }
}