

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/model/nearby_place_model.dart';

final searchControllerProvider =
    StateNotifierProvider<SearchUserController, List<PlaceModel>>((ref) {
      
  return SearchUserController();
});

class SearchUserController extends StateNotifier<List<PlaceModel>> {
  SearchUserController() : super([]);

  void onSearch(String query, List<PlaceModel> data) {
    state = [];
    if (query.isNotEmpty) {
      final result = data
          .where((element) =>
             
              element.name
                  .toString()
                  .toLowerCase()
                  .contains(query.toString().toLowerCase())
                  
                )
          
          .toList();
      state.addAll(result);
    }
  }
}