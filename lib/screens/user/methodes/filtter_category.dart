import 'package:cloud_firestore/cloud_firestore.dart';

Stream<QuerySnapshot> FilterCategory(int index) {
  switch (index) {
    case 1:
      return FirebaseFirestore.instance
          .collection('product')
          .where('category', isEqualTo: 'jacket')
          .snapshots();
      break;
    case 2:
      return FirebaseFirestore.instance
          .collection('product')
          .where('category', isEqualTo: 'dressShirt')
          .snapshots();

      break;
    case 3:
      return FirebaseFirestore.instance
          .collection('product')
          .where('category', isEqualTo: 'shoes')
          .snapshots();

      break;
    case 4:
      return FirebaseFirestore.instance
          .collection('product')
          .where('category', isEqualTo: 'shirt')
          .snapshots();

      break;
    case 5:
      return FirebaseFirestore.instance
          .collection('product')
          .where('category', isEqualTo: 'socks')
          .snapshots();

      break;
    default:
      return FirebaseFirestore.instance.collection('product').snapshots();
  }
}
