import 'package:network/model/login_response_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: 'https://dev-api.getsolo.io/')
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST('/login')
  Future<LoginResponseDto> login(@Body() Map<String, dynamic> loginRequestDto);
}
