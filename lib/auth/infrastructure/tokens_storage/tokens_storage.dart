import '../dtos/tokens_dto.dart';

abstract class TokensStorage {
  Future<TokensDto?> read();
  Future<void> save(TokensDto tokens);
  Future<void> clear();
}
