class HostelBookings {
  String? uid;
  String? name;
  int? charges;
  String? hostel_address;
  int? bookings;
  String? booking_date;
  HostelBookings({
    this.uid,
    this.name,
    this.charges,
    this.hostel_address,
    this.bookings,
    this.booking_date,
  });

  Map<String, dynamic> toMap(HostelBookings hostel) {
    var data = Map<String, dynamic>();
    data['uid'] = hostel.uid;
    data['name'] = hostel.name;
    data['charges'] = hostel.charges;
    data['hostel_address'] = hostel.hostel_address;
    data['bookings'] = hostel.bookings;
    data['booking_date'] = hostel.booking_date!;
    return data;
  }

  factory HostelBookings.fromJson(Map<String, dynamic> json) {
    return HostelBookings(
      uid: json['uid'],
      name: json['name'],
      charges: json['charges'],
      hostel_address: json['hostel_address'],
      bookings: json['bookings'] ?? 0,
      booking_date: json['booking_date'],
    );
  }
}
