import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';
import 'package:unique_supplement/features/home/data/repos/home_repo.dart';

part 'newest_product_state.dart';

class NewestProductCubit extends Cubit<NewestProductState> {
  NewestProductCubit(this.homeRepo) : super(NewestProductInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewestProduct() async {
    emit(NewestProductLoading());
    var result = await homeRepo.fetchNewestProduct();
    result.fold(
      (failure) {
        emit(NewestProductFailire(errMessage: failure.errMessage));
      },
      (products) {
        emit(NewestProductSuccess(products: products));
      },
    );
  }
}
