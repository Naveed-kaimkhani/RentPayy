class UserBookingInfo {
  String? uid;
  String? bookingDate;
  String? name;
  String? phone;

  UserBookingInfo({
    this.uid,
  this.bookingDate,
    this.name,
    this.phone,
  });
  
  Map<String, dynamic> toMap(UserBookingInfo user) {
    var data = Map<String, dynamic>();
    data['uid'] = user.uid;
    data['bookingDate'] = user.bookingDate;
    data['name'] = user.name;
    data['phone'] = user.phone;
    return data;
  }

  UserBookingInfo.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.name = mapData['name'];
    this.phone = mapData['phone'];
    this.bookingDate = mapData['bookingDate'];
  }

}
