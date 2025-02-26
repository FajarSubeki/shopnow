import 'package:shopnow/data/models/user.dart';
import 'package:shopnow/resources/app_asset.dart';
import 'package:shopnow/resources/app_string.dart';

import '../models/product.dart';

class DummyData {

  static List<Product> products = [
    Product(
      iconTop: AppAsset.icTop1,
      image: AppAsset.imgProductTop1,
      title: AppString.top1Title,
      description1: AppString.top1Subtile1,
      description2: AppString.top1Subtile2,
      rating: "4.89",
      count: "216",
      category1: AppString.top1Category1,
      category2: AppString.top1Category2,
    ),
    Product(
      iconTop: AppAsset.icTop2,
      image: AppAsset.imgProductTop2,
      title: AppString.top2Title,
      description1: AppString.top2Subtile1,
      description2: AppString.top2Subtile2,
      rating: "4.36",
      count: "136",
      category1: AppString.top2Category1,
      category2: AppString.top2Category2,
    ),
    Product(
      iconTop: AppAsset.icTop3,
      image: AppAsset.imgProductTop3,
      title: AppString.top3Title,
      description1: AppString.top3Subtile1,
      description2: AppString.top3Subtile2,
      rating: "3.98",
      count: "98",
      category1: AppString.top3Category1,
      category2: AppString.top3Category2,
    ),
  ];

  static List<User> users = [
    User(image: AppAsset.user1, title: AppString.name),
    User(image: AppAsset.user2, title: AppString.name),
    User(image: AppAsset.user3, title: AppString.name),
    User(image: AppAsset.user4, title: AppString.name),
    User(image: AppAsset.user5, title: AppString.name),
    User(image: AppAsset.user6, title: AppString.name),
    User(image: AppAsset.user7, title: AppString.name),
    User(image: AppAsset.user8, title: AppString.name),
    User(image: AppAsset.user9, title: AppString.name),
    User(image: AppAsset.user10, title: AppString.name),
  ];


}