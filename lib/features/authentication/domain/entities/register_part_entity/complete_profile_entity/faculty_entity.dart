class FacultyEntity {
  final int page;
  final int limit;
  final String searchKey;

  FacultyEntity(
      {required this.page, required this.limit, required this.searchKey});

  toJson() {
    return {
      "page": page,
      "limit": limit,
      "searchKey": searchKey,
    };
  }
}

class ToPaginatedData<T> {
  final List<T> data;

  ToPaginatedData({required this.data});
}
