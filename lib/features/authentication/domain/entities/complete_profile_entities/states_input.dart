class StatesInput {
  final int countryId;
  final String searchKey;

  StatesInput({required this.countryId, required this.searchKey});
  toJson() {
    return {
      "countryId": countryId,
      "searchKey": searchKey,
    };
  }
}
