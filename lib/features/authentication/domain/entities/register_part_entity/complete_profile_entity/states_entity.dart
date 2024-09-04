class StatesEntity {
  final int countryId;
  final String searchKey;

  StatesEntity({required this.countryId, required this.searchKey});
  toJson() {
    return {
      "countryId": countryId,
      "searchKey": searchKey,
    };
  }
}
