import 'package:dio/dio.dart';
import 'package:ecommerce/core/dtos/product_tag/product_tag_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/api/ProductTag/{Id}")
  Future<List<ProductTagDto>> getProductTags();
}
