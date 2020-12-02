import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FoodService {
  Map<String, dynamic> data = {
    "name": "name",
    "price": 1000,
    "description":
        "sweet jollof rice and chicken with one bottle of coke to quench your hunger",
    "time": "20 - 25 mins",
    "rating": 4,
    "quantity": 0,
    "imageUrl": "null",
    "restaurant": "resID",
    "category": "food"
  };
  Future<Either<String, List<QueryDocumentSnapshot>>> getRestaurant() async {
    final collectionRef = FirebaseFirestore.instance.collection('restaurants');
    try {
      final QuerySnapshot snapshot = await collectionRef.get();
      return Right(snapshot.docs);
    } catch (e) {
      return Left("An error occur! : $e");
    }
  }

  Future<Either<String, bool>> createRestaurant(
      String name, String phone, String location) async {
    final ref = FirebaseFirestore.instance.collection('restaurants');
    try {
      await ref.doc(name).set({
        "imageUrl": "null",
        "phone": phone,
        "rating": 4,
        "openingTime": "8:00am - 6:00pm (Everyday)",
        "location": location
      });
      return Right(true);
    } catch (e) {
      return Left("An error occur while creating a new restaurant!");
    }
  }

  Future<Either<String, DocumentReference>> addFoodToRestaurant(
      {String resID, Map<String, dynamic> foodData}) async {
    final ref = FirebaseFirestore.instance.collection('restaurants');
    try {
      final DocumentReference docRef =
          await ref.doc(resID).collection('foods').add(foodData);
      return Right(docRef);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> removeFoodFromRestaurant(
      {String resID, String foodID}) async {
    final ref = FirebaseFirestore.instance.collection('restaurants');
    try {
      await ref.doc(resID).collection('foods').doc(foodID).delete();
      return Right(true);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, bool>> updateFoodFromRestaurant(
      {String resID, Map<String, dynamic> foodData, String docID}) async {
    final ref = FirebaseFirestore.instance.collection('restaurants');
    try {
      await ref.doc(resID).collection('foods').doc(docID).update(foodData);
      return Right(true);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, bool>> updateRestaurantFields(
      {String resID, Map<String, dynamic> data}) async {
    final ref = FirebaseFirestore.instance.collection('restaurants');
    try {
      await ref.doc(resID).update(data);
      return Right(true);
    } catch (e) {
      return left(e.toString());
    }
  }
}
