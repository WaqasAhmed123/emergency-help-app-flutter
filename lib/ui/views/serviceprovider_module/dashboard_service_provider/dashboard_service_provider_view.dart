import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:squip/models/serviceprovider_model.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_service_provider_viewmodel.dart';

class DashboardServiceProviderView
    extends StackedView<DashboardServiceProviderViewModel> {
  const DashboardServiceProviderView({super.key});

  @override
  onViewModelReady(DashboardServiceProviderViewModel viewModel) async {
    viewModel.getImage();
    viewModel.getRequests();
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    DashboardServiceProviderViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () async {
        await SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
          drawer: SafeArea(
            child: Drawer(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                        title: Text(
                      ServiceProviderModel.service!.toUpperCase(),
                      style: Theme.of(context).textTheme.titleLarge,
                    )),
                    ListTile(title: Text("${ServiceProviderModel.name}")),
                    InkWell(
                        onTap: () =>
                            viewModel.navigateToServiceproviderReviews(),
                        child: const ListTile(title: Text("Reviews"))),
                    ListTile(
                      title: const Text("Logout"),
                      trailing: IconButton(
                          onPressed: () => viewModel.navigateToLogin(),
                          icon: const Icon(Icons.logout)),
                    ),
                    InkWell(
                      onTap: () => viewModel.deleteAccount(),
                      child: ListTile(
                        title: const Text(
                          "Delete Account",
                          style: TextStyle(color: Colors.red),
                        ),
                        trailing: IconButton(
                            onPressed: () => viewModel.deleteAccount(),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          appBar: AppBar(
            title: const Text(
              "Help Requests",
              style: TextStyle(fontSize: 20),
            ),
          ),
          body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(children: [
                FutureBuilder(
                    future: viewModel.getRequests(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        alignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            onPressed: () async {
                                              await viewModel.deleteRequest(
                                                  id: document.id,
                                                  collection: "requests");
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content:
                                                      Text('Request Canceled'),
                                                  duration:
                                                      Duration(seconds: 2),
                                                ),
                                              );
                                            },
                                            child: const Text(
                                              'Decline',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                          TextButton(
                                              onPressed: () async {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        'Request Accepted'),
                                                    duration:
                                                        Duration(seconds: 2),
                                                  ),
                                                );
                                                await viewModel
                                                    .updateRequestStatus(
                                                        document.id);
                                                viewModel
                                                    .navigateToServiceproviderMap(
                                                        destinationLocation:
                                                            LatLng(
                                                  (document[
                                                      "locationLatitude"]),
                                                  (document[
                                                      "locationLongitude"]),
                                                ));
                                              },
                                              //   showReviewDialog(
                                              //       context: context,
                                              //       spId: document['spId']);
                                              // },
                                              child: const Text(
                                                'Accept',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );

                              // return Dismissible(
                              //   key: UniqueKey(),
                              //   direction: DismissDirection.horizontal,
                              //   onDismissed: (direction) async {
                              //     if (direction ==
                              //         DismissDirection.endToStart) {
                              //       viewModel.deleteRequest(document.id);
                              //       ScaffoldMessenger.of(context).showSnackBar(
                              //         const SnackBar(
                              //           content: Text('Request Declined'),
                              //           duration: Duration(seconds: 2),
                              //         ),
                              //       );
                              //     } else {
                              //       ScaffoldMessenger.of(context).showSnackBar(
                              //         const SnackBar(
                              //           content: Text('Request Accepted'),
                              //           duration: Duration(seconds: 2),
                              //         ),
                              //       );
                              //       await viewModel
                              //           .updateRequestStatus(document.id);
                              //       viewModel.navigateToServiceproviderMap(
                              //           destinationLocation: LatLng(
                              //         (document["locationLatitude"]),
                              //         (document["locationLongitude"]),
                              //       ));
                              //     }
                              //   },
                              //   background: Container(
                              //     alignment: Alignment.centerLeft,
                              //     color: Colors.green,
                              //     child: const Icon(Icons.check),
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
                              //     // trailing: Text(document['timestamp'].toString()),
                              //   ),
                              // );
                            });
                      }
                    }),
              ]))),
    );
  }

  @override
  DashboardServiceProviderViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardServiceProviderViewModel();
}
