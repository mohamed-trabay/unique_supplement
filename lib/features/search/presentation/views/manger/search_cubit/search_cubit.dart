import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unique_supplement/features/search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;

  SearchCubit(this.searchRepo) : super(SearchInitial());

  Future<void> search(String keyword) async {
    if (keyword.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());

    final result = await searchRepo.searchProducts(keyword);

    result.fold(
      (failure) => emit(SearchFailure(errMessage: failure.errMessage)),
      (products) => emit(SearchSuccess(products: products)),
    );
  }
}
