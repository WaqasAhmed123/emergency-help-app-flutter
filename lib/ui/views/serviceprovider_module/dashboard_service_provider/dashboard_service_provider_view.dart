import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:squip/models/serviceprovider_model.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_service_provider_viewmodel.dart';

class DashboardServiceProviderView
    extends StackedView<DashboardServiceProviderViewModel> {
  @override
  onViewModelReady(DashboardServiceProviderViewModel viewModel) async {
    await viewModel.getData();
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
                            "${ServiceProviderModel.currentServiceProvider.name}")),
                    ListTile(
                        title: Text(
                            "${ServiceProviderModel.currentServiceProvider.service}")),
                    IconButton(
                        onPressed: () => viewModel.navigateToLogin(),
                        icon: Icon(Icons.logout))
                  ],
                ),
              ),
            ),
          ),
          appBar: AppBar(
            title: Text(
              "Help Requests",
              style: TextStyle(fontSize: 10),
            ),
          ),
          body: Container(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Column(children: [
                StreamBuilder(
                    stream: viewModel.getData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                            strokeWidth: 10,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else if (!snapshot.hasData) {
                        return Center(
                          child: Text('No data available'),
                        );
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final document = snapshot.data!.docs[index];

                              return Dismissible(
                                key: UniqueKey(),
                                direction: DismissDirection.horizontal,
                                onDismissed: (direction) {
                                  if (direction ==
                                      DismissDirection.endToStart) {
                                    viewModel.deleteRequest(document.id);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Request Declined'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Request Accepted'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                    viewModel.navigateToServiceproviderMap(
                                        destinationLocation: LatLng(
                                            (document["location latitude"]),
                                            (document["location longitude"])));
                                  }
                                },
                                background: Container(
                                  alignment: Alignment.centerLeft,
                                  color: Colors.green,
                                  child: Icon(Icons.check),
                                ),
                                secondaryBackground: Container(
                                  alignment: Alignment.centerRight,
                                  color: Colors.red,
                                  child: Icon(Icons.delete),
                                ),
                                child: ListTile(
                                  // title: Text("${viewModel.attributes.elementAt(0)}"),
                                  title: Text(document["by name"]),
                                  subtitle: Text(document['incident']),
                                ),
                              );
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
