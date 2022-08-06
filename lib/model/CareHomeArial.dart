
class CareHomeArial {
  String image;
  String toastName;

  CareHomeArial.fromMap(Map<String, dynamic> data) {
    image = data['image'];
    toastName = data['toastname'];
  }
}