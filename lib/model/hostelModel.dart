class hostelModel {
  String? uid;
  String? name;
  int? charges;
  String? hostel_address;
  String? hostel_phone;
  String? owner_name;
  String? email;
  String? owner_phone;
  String? hostel_type;
  String? hostel_gender_type;
  int? total_capacity;
  int? available_capacity;
  int? person_per_room;
  String? description;
  List<dynamic>? facilities;
  String? pic1;
  String? pic2;
  String? pic3;
  String? pic4;
  String? pic5;
  String? pic6;
  String? pic7;
  String? pic8;
  hostelModel(
      {this.uid,
      this.name,
      this.charges,
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
      this.description,
      this.facilities,
      this.pic1,
      this.pic2,
      this.pic3,
      this.pic4,
      this.pic5,
      this.pic6,
      this.pic7,
      this.pic8

      // ignore: non_constant_identifier_names

      });

  Map toMap(hostelModel hostel) {
    var data = Map<String, dynamic>();
    data['uid'] = hostel.uid;
    data['name'] = hostel.name;
    data['charges'] = hostel.charges;
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
    
    data['pic1'] = hostel.pic1;
    data['pic2'] = hostel.pic2;
    data['pic3'] = hostel.pic3;
    data['pic4'] = hostel.pic4;
    data['pic5'] = hostel.pic5;
    data['pic6'] = hostel.pic6;
    data['pic7'] = hostel.pic7;
    data['pic8'] = hostel.pic8;
    return data;
  }

  factory hostelModel.fromJson(Map<String, dynamic> json) {
    return hostelModel(
      uid: json['uid'],
      name: json['name'],
      charges: json['charges'],
      hostel_address: json['hostel_address'],
      hostel_phone: json['hostel_phone'],
      owner_name: json['owner_phone'],
      hostel_type: json['hostel_type'],
      hostel_gender_type: json['hostel_gender_type'],
      total_capacity: json['total_capacity'],
      available_capacity: json['available_capacity'],
      person_per_room: json['person_per_room'],
      description: json['description'],
      facilities: json['facilities'],
      pic1: json['pictures'][0],
      pic2: json['pictures'][1],
      pic3: json['pictures'][2],
      pic4: json['pictures'][3],
      pic5: json['pictures'][4],
      pic6: json['pictures'][5],
      pic7: json['pictures'][6],
      pic8: json['pictures'][7],
      // pic1: json['pic1'],
      // pic2: json['pic2'],
      // pic3: json['pic3'],
      // pic4: json['pic4'],
      // pic5: json['pic5'],
      // pic6: json['pic6'],
      // pic7: json['pic7'],
      // pic8: json['pic8'],
    );
  }

  bool equals(hostelModel hostel) => hostel.uid == this.uid;
}
