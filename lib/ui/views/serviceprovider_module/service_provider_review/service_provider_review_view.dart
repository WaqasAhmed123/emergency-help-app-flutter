import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'service_provider_review_viewmodel.dart';

class ServiceProviderReviewView
    extends StackedView<ServiceProviderReviewViewModel> {
  const ServiceProviderReviewView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ServiceProviderReviewViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Reviews",
            style: TextStyle(fontSize: 20),
          ),
        ),
        // backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              // SizedBox(
              //   height: 50,
              //   child: viewModel.buildMarquee(context),
              // ),
              Expanded(
                child: FutureBuilder(
                    future: viewModel.getReviewsWithUserInfo(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
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
                      } else if (!snapshot.hasData) {
                        return const Center(
                          child: Text('No data available',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 11)),
                        );
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final reviewWithUser = snapshot.data![index];
                               final docId = reviewWithUser['docId']; 
                              final userName = reviewWithUser['userName'];
                              final reviewData = reviewWithUser['reviewData'];
                              // final document = snapshot.data!.docs[index];
                              return Card(
                                elevation: 4,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        userName,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        reviewData['rating'].toString(),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        reviewData['description'],
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                      // const SizedBox(height: 8),
                                      // Text(
                                      //   document['status'],
                                      //   style: const TextStyle(
                                      //       fontSize: 14, color: Colors.grey),
                                      // ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: TextButton(
                                          onPressed: () async {
                                            await viewModel.deleteReview(
                                                id: docId,collection: "review");
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text('Review Deleted'),
                                                duration: Duration(seconds: 2),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            'Delete',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ),
                                      // TextButton(
                                      //     onPressed: () async {
                                      //       ScaffoldMessenger.of(context)
                                      //           .showSnackBar(
                                      //         const SnackBar(
                                      //           content:
                                      //               Text('Request Accepted'),
                                      //           duration:
                                      //               Duration(seconds: 2),
                                      //         ),
                                      //       );
                                      //       await viewModel
                                      //           .updateRequestStatus(
                                      //               document.id);
                                      //       viewModel
                                      //           .navigateToServiceproviderMap(
                                      //               destinationLocation:
                                      //                   LatLng(
                                      //         (document["locationLatitude"]),
                                      //         (document["locationLongitude"]),
                                      //       ));
                                      //     },
                                      //     //   showReviewDialog(
                                      //     //       context: context,
                                      //     //       spId: document['spId']);
                                      //     // },
                                      //     child: const Text(
                                      //       'Accept',
                                      //       style: TextStyle(
                                      //           color: Colors.green),
                                      //     )),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    }),
              ),
            ])));
  }

  @override
  ServiceProviderReviewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ServiceProviderReviewViewModel();
}
