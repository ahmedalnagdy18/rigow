class CompleteProfileUserEntity {
  final String countryId;
  final String username;
  final String stateId;
  final String cityId;
  final String gender;
  final String birthDate;

  CompleteProfileUserEntity(
      {required this.countryId,
      required this.stateId,
      required this.cityId,
      required this.gender,
      required this.birthDate,
      required this.username});
  toJson() {
    return {
      "countryId": countryId,
      "username": username,
      "stateId": stateId,
      "cityId": cityId,
      "gender": gender,
      "birthDate": birthDate,
    };
  }
}
