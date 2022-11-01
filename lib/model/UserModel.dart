class UserModel {
  String? uid;
  String? profileImage;
  String? name;
  String? phone;
  String? email;
  String? gender;
  String? age;
  
  UserModel({
   this.uid,
   this.profileImage,
    this.name,
    this.phone,
    this.email,
    this.gender,
    this.age,
   
    // ignore: non_constant_identifier_names

  });

  Map toMap(UserModel user) {
    var data = Map<String, dynamic>();
    data['uid'] = user.uid;
    data['profile_image'] = user.profileImage;
    data['name'] = user.name;
  
    data['phone'] = user.phone;
    data['email'] = user.email;
    data['gender'] = user.gender;
    data['age'] = user.age;

    return data;
  }

  UserModel.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.profileImage = mapData['profile_image'];
    this.name = mapData['name']; 
    this.phone = mapData['phone'];
    this.email = mapData['email'];
       this.gender = mapData['gender'];
    this.age = mapData['age'];
       
  }

  bool equals(UserModel user) => user.uid == this.uid;
}