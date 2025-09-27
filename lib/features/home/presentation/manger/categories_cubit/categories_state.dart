part of 'categories_cubit.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesFailire extends CategoriesState {
  final String errMessage;

  const CategoriesFailire({required this.errMessage});
}

final class CategoriesSuccess extends CategoriesState {
  final List<CategoryModel> categories;

  const CategoriesSuccess({required this.categories});
}
