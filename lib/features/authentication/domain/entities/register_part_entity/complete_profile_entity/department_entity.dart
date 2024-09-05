class DepartmentEntity {
  final int page;
  final int limit;
  final String searchKey;
  final int facultyId;

  DepartmentEntity({
    required this.page,
    required this.limit,
    required this.searchKey,
    required this.facultyId,
  });

  toJson() {
    return {
      "page": page,
      "limit": limit,
      "searchKey": searchKey,
      "facultyId": facultyId,
    };
  }
}

class DepartmentPaginatedData<T> {
  final List<T> data;

  DepartmentPaginatedData({required this.data});
}
