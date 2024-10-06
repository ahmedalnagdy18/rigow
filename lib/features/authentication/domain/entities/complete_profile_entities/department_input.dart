class DepartmentInput {
  final int page;
  final int limit;
  final String searchKey;
  final int facultyId;
  final int specialtyId;

  DepartmentInput({
    required this.page,
    required this.limit,
    required this.searchKey,
    required this.facultyId,
    required this.specialtyId,
  });

  toJson() {
    return {
      "page": page,
      "limit": limit,
      "searchKey": searchKey,
      "facultyId": facultyId,
      "specialtyId": specialtyId,
    };
  }
}

class DepartmentPaginatedData<T> {
  final List<T> data;

  DepartmentPaginatedData({required this.data});
}
