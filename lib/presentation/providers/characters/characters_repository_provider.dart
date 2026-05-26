import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:zen_anime/domain/domain.dart';
import 'package:zen_anime/infrastructure/infrastructure.dart';

final characterRepositoryProvider = Provider<CharactersRepository>((ref) {
  return CharactersRepositoryImpl(CharactersDatasourceImpl());
});
