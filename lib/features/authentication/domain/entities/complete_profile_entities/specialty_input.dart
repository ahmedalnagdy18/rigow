class SpecialtyInput {
  final int page;
  final int limit;
  final String searchKey;

  SpecialtyInput({
    required this.page,
    required this.limit,
    required this.searchKey,
  });

  toJson() {
    return {
      "page": page,
      "limit": limit,
      "searchKey": searchKey,
    };
  }
}

class PaginateddData<T> {
  final List<T> data;

  PaginateddData({required this.data});
}
