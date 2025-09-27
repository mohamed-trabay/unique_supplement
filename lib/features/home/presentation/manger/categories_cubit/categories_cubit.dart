import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unique_supplement/features/home/data/models/category_model.dart';
import 'package:unique_supplement/features/home/data/repos/home_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());
  final HomeRepo homeRepo;
  Future<void> fetchCategories() async {
    emit(CategoriesLoading());
    var result = await homeRepo.fetchCategories();
    result.fold(
      (failure) {
        emit(CategoriesFailire(errMessage: failure.errMessage));
      },
      (categories) {
        emit(CategoriesSuccess(categories: categories));
      },
    );
  }
}
