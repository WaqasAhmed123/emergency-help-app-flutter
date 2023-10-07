import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/review_widget.dart';
import 'all_requests_viewmodel.dart';

class AllRequestsView extends StackedView<AllRequestsViewModel> {
  const AllRequestsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AllRequestsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Help Requests",
            style: TextStyle(fontSize: 20),
          ),
        ),
        // backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(children: [
          // SizedBox(height: 50, child: viewModel.buildMarquee(context)),
          Expanded(
            child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
              future: viewModel.getUserRequests(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 5,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('No data available',
                        style: TextStyle(color: Colors.black, fontSize: 11)),
                  );
                } else {
                  // Now, let's process the documents and display them
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final document = snapshot.data!.docs[index];
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                document["byName"],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                document['incident'],
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                document['status'],
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.grey),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () async {
                                      await viewModel
                                          .deleteRequest(id:document.id,collection: "requests");
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Request Canceled'),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      showReviewDialog(
                                          context: context,
                                          spId: document['spId'],
                                          onSubmit: viewModel.deleteRequest(id:document.id,collection: "requests" )
                                          );
                                    },
                                    child: const Text(
                                      'Review',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                      // Update the field names based on your Firestore document structure
                      // return Dismissible(
                      //   key: UniqueKey(),
                      //   direction: DismissDirection.horizontal,
                      //   onDismissed: (direction) async {
                      //     if (direction == DismissDirection.endToStart) {
                      //       await viewModel.deleteRequest(document.id);
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         const SnackBar(
                      //           content: Text('Request Canceled'),
                      //           duration: Duration(seconds: 2),
                      //         ),
                      //       );
                      //     } else {
                      //       showReviewDialog(
                      //           context: context, spId: document['spId']);
                      //       // ScaffoldMessenger.of(context).showSnackBar(
                      //       //   const SnackBar(
                      //       //     content: Text('Review'),
                      //       //     duration: Duration(seconds: 2),
                      //       //   ),
                      //       // );
                      //     }
                      //   },
                      //   background: Container(
                      //     alignment: Alignment.centerLeft,
                      //     color: Colors.green,
                      //     child: const Icon(Icons.reviews),
                      //   ),
                      //   secondaryBackground: Container(
                      //     alignment: Alignment.centerRight,
                      //     color: Colors.red,
                      //     child: const Icon(Icons.delete),
                      //   ),
                      //   child: ListTile(
                      //     title: Text(document["byName"]),
                      //     subtitle: Text(document['incident']),
                      //     trailing: Text(document['status']),
                      //   ),
                      // );
                    },
                  );
                }
              },
            ),
          ),
        ]));
  }

  @override
  AllRequestsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AllRequestsViewModel();
}
