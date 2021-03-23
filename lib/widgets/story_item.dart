/*
 * @Author: 西瓜哥🍉
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥🍉
 * @Date: 2021-03-23 11:31:10
 * @LastEditTime: 2021-03-23 15:43:15
 * @Description:
 * @Copyright: (c) 2020 http://www.hangzhou.com.cn All rights reserved
 */
import 'package:flutter/material.dart';
import 'package:instagram/theme/colors.dart';

class StoryItem extends StatelessWidget {
  final String img;
  final String name;

  const StoryItem({Key key, this.img, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        bottom: 10,
      ),
      child: Column(
        children: [
          buildAvatar(img),
          SizedBox(
            height: 8,
          ),
          buildName(name)
        ],
      ),
    );
  }

  Widget buildAvatar(String img) {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: storyBorderColor,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            border: Border.all(
              color: black,
              width: 2,
            ),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                img,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildName(String name) {
    return SizedBox(
      width: 70,
      child: Center(
        child: Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
