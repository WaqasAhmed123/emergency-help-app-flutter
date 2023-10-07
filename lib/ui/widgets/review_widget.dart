import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:squip/ui/views/user_module/all_requests/all_requests_viewmodel.dart';

void showReviewDialog({required BuildContext context, spId,onSubmit}) {
  final TextEditingController descriptionController = TextEditingController();
  double rating = 0.0;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Leave a Review'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            RatingBar.builder(
              initialRating: rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemSize: 36,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (newRating) {
                rating = newRating;
                print("changing $rating");
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              // Here you can handle the review submission
              String description = descriptionController.text;
              print("submitted $rating");

              await AllRequestsViewModel()
                  .postReview(rating, description, spId);
              // You can also use the _rating value for the star rating

              Navigator.pop(context);
            },
            child: const Text('Submit'),
          ),
        ],
      );
    },
  );
}
