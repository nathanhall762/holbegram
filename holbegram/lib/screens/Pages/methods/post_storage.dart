import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:lib/screens/auth/methods/user_storage.dart'; // Import the necessary user storage methods.

class PostStorage {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
    String caption,
    String uid,
    String username,
    String profImage,
    Uint8List image,
  ) async {
    try {
      // Upload the image to storage and get the download URL.
      String imageUrl = await UserStorage().uploadImageToStorage(image);

      // Create a new post document in Firestore.
      await _firestore.collection('posts').add({
        'caption': caption,
        'uid': uid,
        'username': username,
        'profImage': profImage,
        'postUrl': imageUrl,
        'datePublished': FieldValue.serverTimestamp(),
      });

      return "Ok"; // Return success message.
    } catch (e) {
      return e.toString(); // Return error message.
    }
  }

  Future<void> deletePost(String postId) async {
    try {
      // Delete the post document from Firestore.
      await _firestore.collection('posts').doc(postId).delete();
    } catch (e) {
      // Handle any errors that occur during deletion.
      print("Error deleting post: $e");
    }
  }
}
