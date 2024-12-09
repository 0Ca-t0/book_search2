import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/location.dart';

final locationRepositoryProvider = Provider<LocationRepository>((ref) {
  return LocationRepository();
});

class LocationRepository {
  final Dio _dio = Dio();

  Future<List<Location>> searchLocations(String query) async {
    try {
      final response = await _dio.get(
        'https://openapi.naver.com/v1/search/local.json',
        queryParameters: {
          'query': query,
          'display': 5,
        },
        options: Options(headers: {
          'X-Naver-Client-Id': 'NL6idLyNM0EPyn8RrPOO',
          'X-Naver-Client-Secret': '9_lz_tGykg',
        }),
      );
      final List<dynamic> data = response.data['items'];
      return data.map((item) => Location.fromJson(item)).toList();
    } catch (e) {
      throw Exception('$e');
    }
  }
}
