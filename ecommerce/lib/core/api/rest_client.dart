import 'package:dio/dio.dart';
import 'package:ecommerce/core/dtos/device/device_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/api/Device/{Id}")
  Future<DeviceDto> getDevice({
    @Path("Id") required String id,
  });
}
