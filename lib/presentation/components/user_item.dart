import 'package:flutter/material.dart';
import 'package:shopnow/data/models/user.dart';
import 'package:shopnow/presentation/pages/detail_user_page.dart';

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
            builder: (context) => DetailUserPage(user: user),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center, // Align icon to the top
        children: [
          /// Circular Image
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
              child: Icon(
                Icons.star, // Change the icon as needed
                color: Colors.orange,
                size: 18,
              ),
            ),

          Positioned(
            bottom: 0,
            child: Text(
              '${user.title} ${(index + 1).toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
