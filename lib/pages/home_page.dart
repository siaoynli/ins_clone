/*
 * @Author: 西瓜哥🍉
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥🍉
 * @Date: 2021-03-23 11:01:37
 * @LastEditTime: 2021-03-23 15:44:38
 * @Description:
 * @Copyright: (c) 2020 http://www.hangzhou.com.cn All rights reserved
 */

import 'package:flutter/material.dart';

import 'package:instagram/constant/post_json.dart';
import 'package:instagram/constant/story_json.dart';
import 'package:instagram/theme/colors.dart';
import 'package:instagram/widgets/post_item.dart';
import 'package:instagram/widgets/story_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                newPost(profile, name),
                Row(
                  children: List.generate(stories.length, (index) {
                    return StoryItem(
                        img: stories[index]['img'],
                        name: stories[index]['name']);
                  }),
                ),
              ],
            ),
          ),
          Divider(
            color: white.withOpacity(0.3),
          ),
          SizedBox(
            height: 8,
          ),
          Column(
            children: List.generate(
              posts.length,
              (index) => PostItem(
                postImg: posts[index]['postImg'],
                profileImg: posts[index]['profileImg'],
                name: posts[index]['name'],
                caption: posts[index]['caption'],
                isLoved: posts[index]['isLoved'],
                likedBy: posts[index]['likedBy'],
                commentCount: posts[index]['commentCount'],
                timeAgo: posts[index]['timeAgo'],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Center(
              child: Text(
                '我是有底线的...',
                style: TextStyle(color: white.withOpacity(0.8), fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget newPost(String profile, String name) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 15),
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            child: Stack(
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(profile),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    width: 19,
                    height: 19,
                    decoration: BoxDecoration(
                      color: white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add_circle,
                      color: buttonFollowColor,
                      size: 19,
                    ),
                  ),
                  right: 0,
                  bottom: 0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 70,
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
        ],
      ),
    );
  }
}
