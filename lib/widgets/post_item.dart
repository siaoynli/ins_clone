/*
 * @Author: 西瓜哥🍉
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥🍉
 * @Date: 2021-03-23 15:43:45
 * @LastEditTime: 2021-03-23 15:46:46
 * @Description:
 * @Copyright: (c) 2020 http://www.hangzhou.com.cn All rights reserved
 */

import 'package:flutter/material.dart';
import 'package:instagram/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';

class PostItem extends StatefulWidget {
  final String profileImg;
  final String name;
  final String postImg;
  final String caption;
  final bool isLoved;
  final String likedBy;
  final String commentCount;
  final String timeAgo;

  const PostItem(
      {Key key,
      this.profileImg,
      this.name,
      this.postImg,
      this.caption,
      this.isLoved,
      this.likedBy,
      this.commentCount,
      this.timeAgo})
      : super(key: key);
  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: white.withOpacity(0.3),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.profileImg,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                      color: white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  LineIcons.horizontalEllipsis,
                  color: white,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          height: 260,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.postImg),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    widget.isLoved
                        ? 'assets/images/loved_icon.svg'
                        : 'assets/images/love_icon.svg',
                    width: 27,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset(
                    'assets/images/comment_icon.svg',
                    width: 27,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset(
                    'assets/images/message_icon.svg',
                    width: 27,
                  ),
                ],
              ),
              SvgPicture.asset(
                'assets/images/save_icon.svg',
                width: 27,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Liked by ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: widget.likedBy,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.name,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: widget.caption,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'View all ' + widget.commentCount ?? '0' + ' comments',
            style: TextStyle(
              color: white.withOpacity(0.4),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.profileImg,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    'Add as comment...',
                    style: TextStyle(
                      color: white.withOpacity(0.5),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                flex: 1,
              ),
              Container(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "😂",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "🙂",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Icon(
                      Icons.add_circle,
                      color: white.withOpacity(0.5),
                      size: 22,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            widget.timeAgo,
            style: TextStyle(
              color: white.withOpacity(0.4),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Divider(
          color: white.withOpacity(0.3),
        ),
      ],
    );
  }
}
