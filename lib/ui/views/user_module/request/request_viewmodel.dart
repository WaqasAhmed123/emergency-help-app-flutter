import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:squip/models/user_model.dart';
import 'package:stacked/stacked.dart';

class RequestViewModel extends BaseViewModel {
  Object? selectedService;
  Object? selectedServiceincident;
  Map<String, List<String>> servicesList = {
    "Ambulance": [
      "Medical Emergency",
      "Fire",
      "Accident",
    ],
    "Police": [
      "Fight/Fire",
      "Robbery",
      "Harassment",
    ],
    "Fire Brigade": [
      "Fire",
      "Cylinder Blast",
      "Short Circuit",
    ],
  };

  Function(Object) onchangeServiceoption() {
    return (Object value) {
      selectedService = value;
      rebuildUi();
    };
  }

  Function(Object) onchangeIncident() {
    return (Object value) {
      selectedServiceincident = value;
      rebuildUi();
    };
  }

  CollectionReference _request =
      FirebaseFirestore.instance.collection('requests');

  addServices() async {
    await _request.doc().set(UserModel.currentUser.request(
        to: selectedService.toString().toLowerCase(),
        incident: selectedServiceincident.toString().toLowerCase()));
  }
}
