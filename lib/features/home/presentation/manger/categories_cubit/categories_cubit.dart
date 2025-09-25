import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model/product_model.dart';
import 'package:unique_supplement/features/home/data/repos/home_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());
  final HomeRepo homeRepo;
  Future<void> fetchcategories() async {
    emit(CategoriesLoading());
    var result = await homeRepo.fetchcategories();
    result.fold(
      (failure) {
        emit(CategoriesFailire(errMessage: failure.errMessage));
      },
      (products) {
        emit(CategoriesSuccess(categories: products));
      },
    );
  }
}
