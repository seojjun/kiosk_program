import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class FirestoreModule {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final menuColRef = firestore.collection('menu');

  static Map<String, dynamic> menuInfo = {};

  static Future<void> addMenu({
    required String menuCategory,
    required String menuName,
    required int menuPrice,
  }) async {
    await menuColRef.doc('category').collection(menuCategory).doc().set({
      'name': menuName,
      'price': menuPrice,
    }).then((value) {
      logger.d(
          "Menu Added\ncategory : $menuCategory\nname : $menuName\nprice : $menuPrice");
    }).catchError((error) {
      logger.d("Failed to add menu: $error");
    });
  }

  static dynamic getMenuAllInfo({required String menuCategory}) async {
    final menuSnapshot =
        await menuColRef.doc('category').collection(menuCategory).get();

    menuInfo[menuCategory] = {};

    for (var menu in menuSnapshot.docs) {
      final menuId = menu.id;
      final menuData = menu.data();
      menuInfo[menuCategory][menuId] = menuData;
    }
  }
}
