import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddressModel {
  String lat;
  String long;
  String houseNo;
  String Addresstitle;
  String contactname;
  String contactnumber;
  AddressModel({
    required this.lat,
    required this.long,
    required this.houseNo,
    required this.Addresstitle,
    required this.contactname,
    required this.contactnumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'long': long,
      'houseNo': houseNo,
      'Addresstitle': Addresstitle,
      'contactname': contactname,
      'contactnumber': contactnumber,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      lat: map['lat'] as String,
      long: map['long'] as String,
      houseNo: map['houseNo'] as String,
      Addresstitle: map['Addresstitle'] as String,
      contactname: map['contactname'] as String,
      contactnumber: map['contactnumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddressModel(lat: $lat, long: $long, houseNo: $houseNo, Addresstitle: $Addresstitle, contactname: $contactname, contactnumber: $contactnumber)';
  }

  AddressModel copyWith({
    String? lat,
    String? long,
    String? houseNo,
    String? Addresstitle,
    String? contactname,
    String? contactnumber,
  }) {
    return AddressModel(
      lat: lat ?? this.lat,
      long: long ?? this.long,
      houseNo: houseNo ?? this.houseNo,
      Addresstitle: Addresstitle ?? this.Addresstitle,
      contactname: contactname ?? this.contactname,
      contactnumber: contactnumber ?? this.contactnumber,
    );
  }

  @override
  bool operator ==(covariant AddressModel other) {
    if (identical(this, other)) return true;

    return other.lat == lat &&
        other.long == long &&
        other.houseNo == houseNo &&
        other.Addresstitle == Addresstitle &&
        other.contactname == contactname &&
        other.contactnumber == contactnumber;
  }

  @override
  int get hashCode {
    return lat.hashCode ^
        long.hashCode ^
        houseNo.hashCode ^
        Addresstitle.hashCode ^
        contactname.hashCode ^
        contactnumber.hashCode;
  }
}
