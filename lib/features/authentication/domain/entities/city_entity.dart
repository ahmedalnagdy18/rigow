class CityEntity {
  final int stateId;
  final String searchKey;

  CityEntity({required this.stateId, required this.searchKey});

  toJson() {
    return {
      "stateId": stateId,
      "searchKey": searchKey,
    };
  }
}
