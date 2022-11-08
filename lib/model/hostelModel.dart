class hostelModel {
  String? uid;
  String? name;
  String? hostel_address;
  String? hostel_phone;
  String? owner_name;
  String? email;
  String? owner_phone;
  String? hostel_type;
  String? hostel_gender_type;
  String? total_capacity;
  String? available_capacity;
  String? person_per_room;
  String? description;
  hostelModel({
    this.uid,
    this.name,
    this.hostel_address,
    this.hostel_phone,
    this.owner_name,
    this.email,
    this.owner_phone,
    this.hostel_gender_type,
    this.hostel_type,
    this.total_capacity,
    this.available_capacity,
    this.person_per_room,
    this.description

    // ignore: non_constant_identifier_names

  });

  Map toMap(hostelModel hostel) {
    var data = Map<String, dynamic>();
    data['uid'] = hostel.uid;
    data['name'] = hostel.name;
    data['hostel_address'] = hostel.hostel_address;
    data['hostel_phone'] = hostel.hostel_phone;
    data['owner_name'] = hostel.owner_name;
    data['owner_address'] = hostel.email;
    data['owner_phone'] = hostel.owner_phone;
    data['hostel_type'] = hostel.hostel_type;
    data['hostel_gender_type'] = hostel.hostel_gender_type;
    data['total_capacity'] = hostel.total_capacity;
    data['available_capacity'] = hostel.available_capacity;
    data['person_per_room'] = hostel.person_per_room;
    data['description'] = hostel.description;


    return data;
  }

     factory hostelModel.fromJson(Map<String,dynamic> json) {
      return hostelModel(
      uid: json['uid'],
      name: json['name'],
      hostel_address: json['hostel_address'],
         hostel_phone:json['hostel_phone'],
         owner_name: json['owner_phone'],
         hostel_type: json['hostel_type'],
         hostel_gender_type: json['hostel_gender_type'],
         total_capacity: json['total_capacity'],
         available_capacity: json['available_capacity'],
         person_per_room: json['person_per_room'],
         description: json['description']
      );
  }


  bool equals(hostelModel hostel) => hostel.uid == this.uid;
}