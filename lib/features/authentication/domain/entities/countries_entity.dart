class CountriesEntity {
  final int page;
  final int limit;
  final String searchKey;

  CountriesEntity(
      {required this.page, required this.limit, required this.searchKey});
  toJson() {
    return {
      "page": page,
      "limit": limit,
      "searchKey": searchKey,
    };
  }
}

class PaginatedData<T> {
  final List<T> data;

  PaginatedData({required this.data});
}
