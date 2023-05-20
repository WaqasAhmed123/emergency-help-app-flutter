import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:squip/models/serviceprovider_model.dart';
import 'package:stacked/stacked.dart';
import 'dashboard_service_provider_viewmodel.dart';
import 'package:marquee/marquee.dart';

class DashboardServiceProviderView
    extends StackedView<DashboardServiceProviderViewModel> {
  const DashboardServiceProviderView({super.key});

  @override
  onViewModelReady(DashboardServiceProviderViewModel viewModel) async {
    viewModel.getData();
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
                      ServiceProviderModel.currentServiceProvider.service!
                          .toUpperCase(),
                      style: Theme.of(context).textTheme.titleLarge,
                    )),
                    Center(
                        child: CircleAvatar(
                      radius: 80,

                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.asset(viewModel.getData().$2),
                      ),
                      // backgroundImage: AssetImage(viewModel.getData().$2)
                    )),
                    ListTile(
                        title: Text(
                            "${ServiceProviderModel.currentServiceProvider.name}")),
                    ListTile(
                      title: const Text("Logout"),
                      trailing: IconButton(
                          onPressed: () => viewModel.navigateToLogin(),
                          icon: const Icon(Icons.logout)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          appBar: AppBar(
            title: const Text(
              "Help Requests",
              style: TextStyle(fontSize: 10),
            ),
          ),
          body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(children: [
                SizedBox(
                  height: 50,
                  child: viewModel.buildMarquee(context),
                ),
                StreamBuilder(
                    stream: viewModel.getData().$1,
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

                              return Dismissible(
                                key: UniqueKey(),
                                direction: DismissDirection.horizontal,
                                onDismissed: (direction) {
                                  if (direction ==
                                      DismissDirection.endToStart) {
                                    viewModel.deleteRequest(document.id);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Request Declined'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
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
                                  child: const Icon(Icons.check),
                                ),
                                secondaryBackground: Container(
                                  alignment: Alignment.centerRight,
                                  color: Colors.red,
                                  child: const Icon(Icons.delete),
                                ),
                                child: ListTile(
                                  title: Text(document["by name"]),
                                  subtitle: Text(document['incident']),
                                  // trailing: Text(document['timestamp'].toString()),
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
