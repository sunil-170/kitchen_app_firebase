import 'package:kitchen_app/Backend/data/Response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? massege;
  ApiResponse(this.status, this.data, this.massege);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.compileted(this.data) : status = Status.COMPILETED;
  ApiResponse.error(this.massege) : status = Status.ERROR;

  @override
  String toString() {
    return "Status :$status \n Massege:$massege \n Data:$data";
  }
}
