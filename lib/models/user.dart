
 class UserMain {
  UserMain({
    required this.uuid,
    required this.username,
    required this.surname,
    required this.firstname,
    required this.othername,
    required this.sex,
    required this.role,
    required this.dob,
    required this.pic,
  });

  UserMain.fromJson(Map<String, Object?> json)
      : this(
    uuid: json['uuid']! as String,
    username: json['username']! as String,
    surname: json['surname']! as String,
    firstname: json['firstname']! as String,
    othername: json['othername']! as String,
    sex: json['sex']! as String,
    role: json['role']! as String,
    dob: json['dob']! ,
    pic: json['pic']! as String,
  );


  final String uuid;
  final String username;
  final String surname;
  final String firstname;
  final String othername;
  final String sex;
  final String role;
  final dob;
  final String pic;

  Map<String, Object?> toJson() {
    return {
      'uuid': uuid,
      'username': username,
      'surname': surname,
      'firstname': firstname,
      'othername': othername,
      'sex': sex,
      'role': role,
      'dob': dob,
      'pic': pic,
    };
  }
}