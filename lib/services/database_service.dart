// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:my_tree_links/models/app_user.dart';

// import 'constants.dart';

// class DatabaseService {
//   Future<AppUser> getUser(String userId) async {
//     DocumentSnapshot userDoc = await usersRef.doc(userId).get();
//     return AppUser.fromDoc(userDoc);
//   }

//   Future<void> createUser(String displayName) async {
//     final userCollection = FirebaseFirestore.instance.collection('users');
//     FirebaseAuth auth = FirebaseAuth.instance;
//     String uid = auth.currentUser!.uid;
//     AppUser user = AppUser(
//       displayName: displayName,
//       id: uid,
//     );

//     userCollection.add(user.toMap());
//     return; // since it's a future void type
//   }

//   Future<List<AppUser>> searchUsers(String currentUserId, String name) async {
//     QuerySnapshot usersSnap =
//         await usersRef.where('name', isGreaterThanOrEqualTo: name).get();
//     List<AppUser> users = [];
//     for (var doc in usersSnap.docs) {
//       AppUser user = AppUser.fromDoc(doc);
//       if (user.id != currentUserId) {
//         users.add(user);
//       }
//     }
//     return users;
//   }

//   Future<List<AppUser>> getAllUsers() async {
//     QuerySnapshot userSnapshot = await usersRef.get();
//     List<AppUser> users = [];
//     for (var doc in userSnapshot.docs) {
//       AppUser user = AppUser.fromDoc(doc);
//       users.add(user);
//     }
//     return users;
//   }

//   Future<List<String>> saveUsers(List<AppUser> users) async {
//     List<String> ids = [];
//     for (var user in users) {
//       usersRef.add(user.toJson()).then((doc) => ids.add(doc.id));
//     }
//     return ids;
//   }

//   void updateUserAttendance(AppUser user, String session, bool value) async {
//     usersRef.doc(user.id).update({
//       session: value,
//     });
//   }

//   void updateUser(
//       String id,
//       String name,
//       String bio,
//       String profileImageUrl,
//       double rating,
//       String? userStatus,
//       Timestamp? acceptedOn,
//       Timestamp? confirmedOn) async {
//     usersRef.doc(id).update({
//       "name": name,
//       "bio": bio,
//       "profileImageUrl": profileImageUrl,
//       "rating": rating,
//       "userStatus": userStatus,
//       "acceptedOn": acceptedOn,
//       "confirmedOn": confirmedOn,
//     });
//   }

//   void updateUserJson(
//     String id,
//     Map<String, dynamic>? json,
//   ) async {
//     usersRef.doc(id).update(json!);
//   }

//   Future<void> deleteUser(String userId) async {
//     var snapshot = usersRef.doc(userId);

//     final batch = FirebaseFirestore.instance.batch();

//     batch.delete(snapshot);

//     return batch.commit();
//   }

//   // void insertbookmarkedEvent(String userId, String eventId) async {
//   //   final documentReference =
//   //       usersRef.doc(userId).collection("bookmarkedEvents").doc();

//   //   final docId = documentReference.id;
//   //   var bookMarkEvent = BookmarkedEvent(
//   //       id: docId, eventId: eventId, createdDateTime: DateTime.now());
//   //   await documentReference
//   //       .set(bookMarkEvent.toDoc())
//   //       .onError((error, stackTrace) => debugPrint(error.toString()));
//   // }

//   // Future<void> deletebookmarkedEvent(String userId, String eventId) async {
//   //   var snapshot = await usersRef
//   //       .doc(userId)
//   //       .collection("bookmarkedEvents")
//   //       .where('eventId', isEqualTo: eventId)
//   //       .get();

//   //   final batch = FirebaseFirestore.instance.batch();

//   //   for (final doc in snapshot.docs) {
//   //     batch.delete(doc.reference);
//   //   }

//   //   return batch.commit();
//   // }
// }
