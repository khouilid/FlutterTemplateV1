import 'package:dio/dio.dart';
import 'package:template/core/infrastructure/helpers/remote_service_helper.dart';
import 'package:template/Features/user/infrastructure/dtos/user_dto.dart';
import 'dtos/auth_response_dto.dart';
import 'dtos/token_dto.dart';
import 'dtos/tokens_dto.dart';

class AuthRemoteService extends RemoteServiceHelper {
  final Dio _dio;

  AuthRemoteService(this._dio);

  Future<AuthResponseDto> signIn(
    String email,
    String password,
  ) {
    return withoutRemoteResponse(
      _dio.post(
        'auth/login',
        data: {
          'email': email,
          'password': password,
        },
      ),
      (data) {
        final user = _getUser(data);
        final token = _getTokens(data);
        return AuthResponseDto(user: user, tokens: token);
      },
    );
  }

  Future<TokensDto> refreshToken(String token) => withoutRemoteResponse(
        _dio.post(
          'auth/refresh-tokens',
          data: {
            'refreshToken': token,
          },
        ),
        (_) => TokensDto.fromJson(_ as Map<String, dynamic>),
      );


  UserDto _getUser(dynamic responseData) {
    final data = responseData as Map<String, dynamic>;
    final user = data['user'] as Map<String, dynamic>;
    return UserDto.fromJson(user);
  }

  TokensDto _getTokens(dynamic responseData) {
    final data = responseData as Map<String, dynamic>;
    final tokensJson = data['tokens'] as Map<String, dynamic>;
    return TokensDto.fromJson(tokensJson);
  }

  TokenDto _getAccessToken(dynamic responseData) {
    final tokensDto = _getTokens(responseData);
    return tokensDto.access;
  }
}
