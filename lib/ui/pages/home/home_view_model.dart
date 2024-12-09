import 'package:flutter_book_search_app2/models/location.dart';
import 'package:flutter_book_search_app2/repository/location_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, List<Location>>((ref) {
  return HomeViewModel(ref.read(locationRepositoryProvider));
});

class HomeViewModel extends StateNotifier<List<Location>> {
  final LocationRepository _repository;

  HomeViewModel(this._repository) : super([]);

  Future<List<Location>> search(String query) async {
    final locations = await _repository.searchLocations(query);
    state = locations;
    return locations;
  }
}
