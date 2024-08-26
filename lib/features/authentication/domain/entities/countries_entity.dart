class CountriesEntity {
  final int page;
  final int limit;

  CountriesEntity({required this.page, required this.limit});
  toJson() {
    return {
      "page": page,
      "limit": limit,
    };
  }
}

class PaginatedData<T> {
  final List<T> data;

  PaginatedData({required this.data});
}
