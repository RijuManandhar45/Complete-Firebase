class Mentors {
  String? mentorsName;
  int? age;
  String? email;
  int? phoneNumber;
  String? specialist;
  String? bio;

  Mentors(
      {this.mentorsName,
      this.age,
      this.email,
      this.phoneNumber,
      this.specialist,
      this.bio});

  Mentors.fromJson(Map<String, dynamic> json) {
    mentorsName = json['mentorsName'];
    age = json['age'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    specialist = json['specialist'];
    bio = json['bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mentorsName'] = this.mentorsName;
    data['age'] = this.age;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['specialist'] = this.specialist;
    data['bio'] = this.bio;
    return data;
  }
}
