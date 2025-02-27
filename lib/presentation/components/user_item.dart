import 'package:flutter/material.dart';
import 'package:shopnow/data/models/user.dart';
import 'package:shopnow/presentation/pages/detail_user_page.dart';
import 'package:shopnow/resources/app_asset.dart';
import 'package:shopnow/resources/app_color.dart';
import 'package:shopnow/utils/util.dart';

class UserItem extends StatelessWidget {
  final User user;
  final bool isFirstItem;
  final int index;

  const UserItem({super.key, required this.index, required this.user, required this.isFirstItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailUserPage(user: user, index: index),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center, // Align icon to the top
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300, width: 2),
            ),
            child: ClipOval(
              child: Image.asset(
                user.image,
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Show top icon if it's the first item
          if (isFirstItem)
            Positioned(
              top: 0, // Adjust the position
              child: Util.buildSvgIcon(
                  AppAsset.icKing, 0, 0, size: 18, selectedColor: AppColor.yellow
              ),
            ),

          Positioned(
            bottom: 1,
            child: Text(
              '${user.title}${(index + 1).toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
