class ResultUIModel {
  late bool isSuccess;
  late String errorMessage;

  ResultUIModel({
    this.isSuccess = true,
    this.errorMessage = '',
  });
}

class DataResultUIModel<T> extends ResultUIModel {
  T data;

  DataResultUIModel({
    required ResultUIModel result,
    required this.data,
  }) : super(
          isSuccess: result.isSuccess,
          errorMessage: result.errorMessage,
        );
}
