import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final stop1 = ref.watch(getTopAnimes);
  final stop2 = ref.watch(getPopularAnimes);
  // final stop2 = ref.watch(getNowAnimes);

  if (stop1.isEmpty || stop2.isEmpty) {
    return true;
  }

  return false;
});
