class user_model {
  String? fullname;
  String? phone_number;
  String? email;
  String? gender;
  String? state;
  String? city;
  String? uid;

  user_model({
    this.city,
    this.gender,
    this.email,
    this.phone_number,
    this.state,
    this.fullname,
    this.uid,
  });
  user_model copyWith({
    String? fullname,
    phone_number,
    email,
    gender,
    business_name,
    business_address,
    state,
    city,
    uid,
    image,
  }) {
    return user_model(
      city: city ?? this.city,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      phone_number: phone_number ?? this.phone_number,
      state: state ?? this.state,
      fullname: fullname ?? this.fullname,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> tojson() {
    return {
      "city": city,
      "gender": gender,
      "email": email,
      "phone_number": phone_number,
      "state": state,
      "fullname": fullname,
      "uid": uid,
    };
  }

  user_model.fromuser_basic_model(Map<String, dynamic> json, this.uid)
      : city = json["city"] ?? "",
        gender = json["gender"] ?? "",
        email = json["email"] ?? "",
        phone_number = json["phone_number"] ?? "",
        state = json["state"] ?? "",
        fullname = json["fullname"] ?? "";
}
