class hostelModel {
  String? uid;
  String? name;
  int? charges;
  String? hostel_address;
  String? hostel_phone;
  // String? owner_name;
  String? email;
  // String? owner_phone;
  String? hostel_type;
  String? hostel_gender_type;
  int? total_capacity;
  int? available_capacity;
  int? person_per_room;
  int? confirms;
  int? bookings;
  int? cancel;
  String? description;
  List<dynamic>? facilities;
  List<dynamic>? pictures;
  int? visits;
  String? registration_date;
  hostelModel({
    this.uid,
    this.name,
    this.charges,
    this.hostel_address,
    this.hostel_phone,
    // this.owner_name,
    this.email,
    // this.owner_phone,
    this.hostel_gender_type,
    this.hostel_type,
    this.total_capacity,
    this.available_capacity,
    this.person_per_room,
    this.description,
    this.facilities,
    this.pictures,
    this.visits,
    this.bookings,
    this.cancel,
    this.confirms,
    this.registration_date,
  });

  Map<String, dynamic> toMap(hostelModel hostel) {
    DateTime today = new DateTime.now();
String date ="${today.day.toString().padLeft(2, '0')}/${today.month.toString().padLeft(2,'0')}/${today.year.toString()}";
    var data = Map<String, dynamic>();
    data['uid'] = hostel.uid;
    data['name'] = hostel.name;
    data['charges'] = hostel.charges;
    data['hostel_address'] = hostel.hostel_address;
    data['hostel_phone'] = hostel.hostel_phone;
    // data['owner_name'] = hostel.owner_name;
    data['owner_address'] = hostel.email;
    // data['owner_phone'] = hostel.owner_phone;
    data['hostel_type'] = hostel.hostel_type;
    data['hostel_gender_type'] = hostel.hostel_gender_type;
    data['total_capacity'] = hostel.total_capacity;
    data['available_capacity'] = hostel.available_capacity;
    data['person_per_room'] = hostel.person_per_room;
    data['description'] = hostel.description;
    data['pictures'] = hostel.pictures;
    data['visits'] = hostel.visits;
    data['confirms'] = hostel.confirms;
    data['cancel'] = hostel.cancel;
    data['facilities'] = hostel.facilities;
    data['bookings'] = hostel.bookings;
    data['registration_date'] = hostel.registration_date!;
    return data;
  }
  factory hostelModel.fromJson(Map<String, dynamic> json) {
    return hostelModel(
      uid: json['uid'],
      name: json['name'],
      charges: json['charges'],
      hostel_address: json['hostel_address'],
      hostel_phone: json['hostel_phone'],
      // owner_name: json['owner_phone'],
      hostel_type: json['hostel_type'],
      hostel_gender_type: json['hostel_gender_type'],
      total_capacity: json['total_capacity'],
      available_capacity: json['available_capacity'],
      person_per_room: json['person_per_room'],
      description: json['description'],
      facilities: json['facilities'],
      pictures: json['pictures'],
      visits: json['visits'] ?? 0,
      confirms: json['confirms'] ?? 0,
      bookings: json['bookings'] ?? 0,
      cancel: json['cancel'] ?? 0,
      registration_date: json['registration_date'],
    );
  }
}
