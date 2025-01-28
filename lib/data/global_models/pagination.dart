// class PagingInfo {
//   int? pageCount;
//   int? totalItemCount;
//   int? pageNumber;
//   int? pageSize;
//   bool? hasPreviousPage;
//   bool? hasNextPage;
//   bool? isFirstPage;
//   bool? isLastPage;
//   int? firstItemOnPage;
//   int? lastItemOnPage;
//
//   PagingInfo(
//       {this.pageCount,
//         this.totalItemCount,
//         this.pageNumber,
//         this.pageSize,
//         this.hasPreviousPage,
//         this.hasNextPage,
//         this.isFirstPage,
//         this.isLastPage,
//         this.firstItemOnPage,
//         this.lastItemOnPage});
//
//   PagingInfo.fromJson(Map<String, dynamic> json) {
//     pageCount = json['pageCount'];
//     totalItemCount = json['totalItemCount'] ;
//     pageNumber = json['pageNumber'];
//     pageSize = json['pageSize'];
//     hasPreviousPage = json['hasPreviousPage'];
//     hasNextPage = json['hasNextPage'];
//     isFirstPage = json['isFirstPage'];
//     isLastPage = json['isLastPage'];
//     firstItemOnPage = json['firstItemOnPage'];
//     lastItemOnPage = json['lastItemOnPage'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['pageCount'] = pageCount;
//     data['totalItemCount'] = totalItemCount;
//     data['pageNumber'] = pageNumber;
//     data['pageSize'] = pageSize;
//     data['hasPreviousPage'] = hasPreviousPage;
//     data['hasNextPage'] = hasNextPage;
//     data['isFirstPage'] = isFirstPage;
//     data['isLastPage'] = isLastPage;
//     data['firstItemOnPage'] = firstItemOnPage;
//     data['lastItemOnPage'] = lastItemOnPage;
//     return data;
//   }
// }

class Pagination {
  int? pageNumber;
  int? totalPages;
  int? pageSize;
  int? totalItemCount;
  bool? hasPreviousPage;
  bool? hasNextPage;

  Pagination(
      {this.pageNumber,
      this.totalPages,
      this.pageSize,
      this.totalItemCount,
      this.hasPreviousPage,
      this.hasNextPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    pageNumber = json['PageNumber'];
    totalPages = json['TotalPages'];
    pageSize = json['PageSize'];
    totalItemCount = json['TotalItemCount'];
    hasPreviousPage = json['HasPreviousPage'];
    hasNextPage = json['HasNextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PageNumber'] = pageNumber;
    data['TotalPages'] = totalPages;
    data['PageSize'] = pageSize;
    data['TotalItemCount'] = totalItemCount;
    data['HasPreviousPage'] = hasPreviousPage;
    data['HasNextPage'] = hasNextPage;
    return data;
  }
}
