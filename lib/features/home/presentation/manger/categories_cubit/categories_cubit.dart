import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unique_supplement/features/home/data/models/category_model.dart';
import 'package:unique_supplement/features/home/data/repos/home_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeRepo homeRepo;
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());

  Future<void> fetchCategories() async {
    if (isClosed) return;

    emit(CategoriesLoading());

    try {
      final result = await homeRepo.fetchCategories();

      if (isClosed) return;

      result.fold(
        (failure) => emit(CategoriesFailire(errMessage: failure.errMessage)),
        (categories) => emit(CategoriesSuccess(categories: categories)),
      );
    } catch (e) {
      if (isClosed) return;
      emit(CategoriesFailire(errMessage: e.toString()));
    }
  }
}
