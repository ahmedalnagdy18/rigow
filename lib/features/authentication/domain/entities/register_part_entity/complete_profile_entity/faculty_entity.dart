class FacultyEntity {
  final int page;
  final int limit;
  final String searchKey;
  final int specialtyId;

  FacultyEntity(
      {required this.page,
      required this.limit,
      required this.searchKey,
      required this.specialtyId});

  toJson() {
    return {
      "page": page,
      "limit": limit,
      "searchKey": searchKey,
      "specialtyId": specialtyId,
    };
  }
}

class ToPaginatedData<T> {
  final List<T> data;

  ToPaginatedData({required this.data});
}
