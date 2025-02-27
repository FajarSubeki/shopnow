import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopnow/data/models/user.dart';
import 'package:shopnow/presentation/components/bordered_text.dart';
import 'package:shopnow/resources/app_asset.dart';
import 'package:shopnow/resources/app_color.dart';
import 'package:shopnow/resources/app_string.dart';
import 'package:shopnow/resources/app_theme.dart';
import 'package:shopnow/utils/util.dart';

class DetailUserPage extends StatefulWidget {

  final User user;

  const DetailUserPage({super.key, required this.user});

  @override
  State<DetailUserPage> createState() => _DetailUserPageState();
}

class _DetailUserPageState extends State<DetailUserPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
        statusBarColor: Colors.black, // Black background
        statusBarIconBrightness: Brightness.light, // White icons
      ),
        child: Scaffold(
          backgroundColor: AppColor.white02,
          appBar: AppBar(
            backgroundColor: AppColor.white,
            leading: IconButton(
              icon: Util.buildSvgIcon(
                  AppAsset.icArrowBack,
                  0,
                  0,
                  size: 18,
                  selectedColor: AppColor.black02
              ), // Custom Back Icon
              onPressed: () {
                Navigator.pop(context); // Go back when tapped
              },
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppString.detailTitle, // First Label
                  style: textStyle.copyWith(
                    color: AppColor.grey02,
                    fontSize: 13,
                  ),
                ),
                Text(
                  AppString.detailSubtitle, // Second Label
                  style: textStyle.copyWith(
                    color: AppColor.black02,
                    fontWeight: bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            centerTitle: true, // Ensures the column is centered
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(2), // Divider thickness
              child: Divider(
                color: AppColor.grey06,
                thickness: 1,
                height: 1,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align children to the left
              children: [
                profileDetail(widget.user),
                reviewProductUser(),
              ],
            ),
          ),
        )
    );
  }

  Widget profileDetail(User user) {
    return Center(
      child: Container(
          color: AppColor.white, // Set background to white
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
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
              Text(
                user.title, // Second Label
                style: textStyle.copyWith(
                    color: AppColor.black01,
                    fontSize: 20,
                    fontWeight: bold
                ),
              ),
              Row(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Util.buildSvgIcon(
                      AppAsset.icKing,
                      0,
                      0,
                      size: 19,
                      selectedColor: AppColor.yellow
                  ),
                  Text(
                    AppString.goldType, // Second Label
                    style: textStyle.copyWith(
                      color: AppColor.yellow,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColor.white02,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  AppString.descUser,
                  style: textStyle.copyWith(
                      color: AppColor.grey02,
                      fontSize: 14
                  ),
                ),
              ),
            ],
          )
      )
    );
  }

  Widget reviewProductUser() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 30),
      padding: EdgeInsets.symmetric(vertical: 16),
      color: AppColor.white,
      child: Column(
        spacing: 16,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 6,
                    children: [
                      Text(
                        AppString.review,
                        style: textStyle.copyWith(fontSize: 16, color: AppColor.black01),
                      ),
                      Text(
                        AppString.countReview,
                        style: textStyle.copyWith(fontSize: 15, color: AppColor.grey03),
                      ),
                    ],
                  ),
                  BorderedText(
                    text: AppString.latest,
                    borderColor: Colors.grey,
                    borderWidth: 1.0,
                    borderRadius: 10.0,
                    textStyle: textStyle.copyWith(
                        color: AppColor.grey02,
                        fontSize: 13
                    ),
                    icon: Icons.arrow_drop_down_outlined, // Custom arrow icon
                    iconColor: AppColor.grey02,
                    iconSize: 18.0,
                  ),
                ],
              ),
          ),
          Divider(
            color: AppColor.grey06,
            thickness: 1,
            height: 1,
          ),
          productRate(),
          userReviewSection(widget.user),
        ],
      ),

    );
  }

  Widget productRate() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        spacing: 12,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center, // Ensures vertical alignment
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColor.grey09,
                        width: 1,
                      ),
                    ),
                    child: Image.asset(
                      AppAsset.imgRyzen,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 12),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft, // Align content vertically
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Shrinks to fit content
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.amdTitle,
                        style: textStyle.copyWith(
                          fontSize: 14,
                          color: AppColor.black01,
                          fontWeight: bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        AppString.amdDesc,
                        style: textStyle.copyWith(
                          fontSize: 14,
                          color: AppColor.black01,
                          fontWeight: medium,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        spacing: 10,
                        children: [
                          Image.asset(
                            AppAsset.imgStar,
                            width: 120,
                            height: 22,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            AppString.ratingProduct,
                            style: textStyle.copyWith(
                              fontSize: 20,
                              color: AppColor.black01,
                              fontWeight: bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: AppColor.grey06,
            thickness: 1,
            height: 1,
          ),
        ],
      )
    );
  }

  Widget userReviewSection(User user) {
    return Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 4),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          spacing: 12,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppAsset.user1NoBorder,
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.title,
                        style: textStyle.copyWith(
                          fontSize: 14,
                          color: AppColor.black01,
                          fontWeight: semiBold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            AppAsset.imgStar,
                            width: 72,
                            height: 15,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 4),
                          Text(
                            AppString.dateReview,
                            style: textStyle.copyWith(
                              fontSize: 13,
                              color: AppColor.grey02,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Util.buildSvgIcon(
                    AppAsset.icSave, 0, 0, size: 26, selectedColor: AppColor.grey02
                ),
              ],
            ),
            SizedBox(height: 4),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 18,
                children: [
                  textItem(AppString.review01),
                  textItem(AppString.review02),
                  textItem(AppString.review03),
                  textItem(AppString.review04),
                ],
              ),
            ),
            commentProduct(AppColor.purple, AppString.comment01),
            commentProduct(AppColor.grey06, AppString.comment02),
            Padding(
                padding: EdgeInsets.only(left: 28, bottom: 8),
                child: Row(
                  children: [
                    commentImageProduct(AppAsset.commentPick1),
                    commentImageProduct(AppAsset.commentPick1),
                    commentImageProduct(AppAsset.commentPick1),
                  ],
                ),
            ),
            Divider(
              color: AppColor.grey06,
              thickness: 1,
              height: 1,
            ),
            Row(
              spacing: 4,
              children: [
                Util.buildSvgIcon(
                    AppAsset.icComment, 0, 0, size: 26, selectedColor: AppColor.grey01
                ),
                Text(
                  AppString.leaveComment,
                  style: textStyle.copyWith(fontSize: 12, color: AppColor.grey03, fontWeight: medium),
                )
              ],
            )
          ],
        )
    );
  }

  Widget textItem(String text) {
    return Text(
      text,
      style: textStyle.copyWith(fontSize: 11, color: AppColor.grey04, fontWeight: semiBold),
    );
  }

  Widget commentProduct(Color color, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        spacing: 16,
        children: [
          Util.buildSvgIcon(
              AppAsset.icComment, 0, 0, size: 26, selectedColor: color
          ),
          Expanded( // Prevents overflow and allows wrapping
            child: Text(
              text,
              style: textStyle.copyWith(
                fontSize: 14,
                color: AppColor.grey03,
                fontWeight: medium,
              ),
              maxLines: null, // Allows unlimited lines
              softWrap: true, // Enables text wrapping
            ),
          ),
        ],
      ),
    );
  }

  Widget commentImageProduct(String image) {
    return Padding(
        padding: EdgeInsets.only(left: 13),
        child: Row(
          children: [
            Image.asset(
              image,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ],
        )
    );
  }
}
