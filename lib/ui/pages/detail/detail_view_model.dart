import 'package:flutter_riverpod/flutter_riverpod.dart';

final detailViewModelProvider = Provider<DetailViewModel>((ref) {
  return DetailViewModel();
});

class DetailViewModel {}
