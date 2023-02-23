import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;
}
