class CountriesInput {
  final int page;
  final int limit;
  final String searchKey;

  CountriesInput(
      {required this.page, required this.limit, required this.searchKey});
}

class PaginatedData<T> {
  final List<T> data;

  PaginatedData({required this.data});
}
