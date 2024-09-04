class CompleteProfileUserInput {
  final int countryId;
  final String username;
  final int stateId;
  final int cityId;
  final String gender;
  final int birthDate;

  CompleteProfileUserInput({
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.gender,
    required this.birthDate,
    required this.username,
  });
  toJson() {
    return {
      "countryId": countryId,
      "username": username,
      "stateId": stateId,
      "cityId": cityId,
      "gender": gender.toUpperCase(),
      "birthDate": birthDate,
    };
  }
}
