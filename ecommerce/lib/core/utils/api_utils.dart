import 'package:dio/dio.dart';
import 'package:ecommerce/core/dtos/error/error_dto.dart';
import 'package:ecommerce/core/ui_models/result_ui_model.dart';
import 'package:ecommerce/global/app_text.dart';

import 'logger_utils.dart';

class ApiUtils {
  static Future<ResultUIModel> handleApiCall(
      Future<void> Function() apiFunction) async {
    ResultUIModel result = ResultUIModel();

    try {
      await apiFunction();
      result.isSuccess = true;
      result.errorMessage = '';
    } on DioError catch (e) {
      await LoggerUtils.logException(e);
      try {
        ErrorDto errorResponse = ErrorDto.fromJson(e.response!.data);
        result.isSuccess = false;
        result.errorMessage =
            errorResponse.errors.first;
      } catch (e) {
        result.isSuccess = false;
        result.errorMessage = AppText.lblServerError;
      }
    } catch (e) {
      await LoggerUtils.logException(e);
      result.isSuccess = false;
      result.errorMessage = AppText.lblServerError;
    }

    return result;
  }
}
