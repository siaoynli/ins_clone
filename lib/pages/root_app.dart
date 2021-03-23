/*
 * @Author: 西瓜哥🍉
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥🍉
 * @Date: 2021-03-23 10:15:33
 * @LastEditTime: 2021-03-23 14:24:30
 * @Description:
 * @Copyright: (c) 2020 http://www.hangzhou.com.cn All rights reserved
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/pages/home_page.dart';
import 'package:instagram/theme/colors.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(),
      backgroundColor: black,
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getFooter() {
    List<String> bottomItems = [
      pageIndex == 0
          ? 'assets/images/home_active_icon.svg'
          : 'assets/images/home_icon.svg',
      pageIndex == 1
          ? 'assets/images/search_active_icon.svg'
          : 'assets/images/search_icon.svg',
      pageIndex == 2
          ? 'assets/images/upload_active_icon.svg'
          : 'assets/images/upload_icon.svg',
      pageIndex == 3
          ? 'assets/images/love_active_icon.svg'
          : 'assets/images/love_icon.svg',
      pageIndex == 4
          ? 'assets/images/account_active_icon.svg'
          : 'assets/images/account_icon.svg',
    ];
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: appFooterColor,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return InkWell(
              onTap: () {
                selectedTab(index);
              },
              child: SvgPicture.asset(
                bottomItems[index],
                width: 27,
              ),
            );
          }),
        ),
      ),
    );
  }

  void selectedTab(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  getAppbar() {
    switch (pageIndex) {
      case 1:
        return null;
      case 2:
        return AppBar(
          backgroundColor: appBarColor,
          title: Text('Upload'),
          centerTitle: true,
        );
        break;
      case 3:
        return AppBar(
          backgroundColor: appBarColor,
          title: Text('Activity'),
          centerTitle: true,
        );
        break;
      case 4:
        return AppBar(
          backgroundColor: appBarColor,
          title: Text('Account'),
          centerTitle: true,
        );
        break;
      default:
        return AppBar(
          backgroundColor: appBarColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  print("photo");
                },
                child: SvgPicture.asset(
                  "assets/images/camera_icon.svg",
                  width: 30,
                ),
              ),
              Text(
                'Instagram',
                style: TextStyle(fontFamily: "Billabong", fontSize: 35),
              ),
              GestureDetector(
                onTap: () {
                  print("message");
                },
                child: SvgPicture.asset(
                  "assets/images/message_icon.svg",
                  width: 30,
                ),
              ),
            ],
          ),
        );
    }
  }

  Widget getBody() {
    List<Widget> pages = [
      HomePage(),
      Center(
        child: Text(
          'Search Page',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
      ),
      Center(
        child: Text(
          'Upload Page',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
      ),
      Center(
        child: Text(
          'Activity Page',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
      ),
      Center(
        child: Text(
          'Accdount Page',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
      ),
    ];
    return IndexedStack(
      index: pageIndex,
      children: List.generate(pages.length, (index) {
        return pages[index];
      }),
    );
  }
}
