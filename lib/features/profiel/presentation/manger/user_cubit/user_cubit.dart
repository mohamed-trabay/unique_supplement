import 'package:bloc/bloc.dart';
import 'package:unique_supplement/core/utiles/local_storage_service.dart';
import 'package:unique_supplement/features/profiel/data/models/user_info_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial()) {
    loadUser();
  }

  Future<void> loadUser() async {
    emit(UserLoading());
    try {
      final data = await LocalStorageService.loadUserInfo();
      final user = UserModel.fromMap(data);
      emit(UserLoaded(user: user));
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }

  Future<void> saveUser(UserModel user) async {
    emit(UserLoading());
    try {
      await LocalStorageService.saveUserInfo(user.toMap());
      emit(UserLoaded(user: user));
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }
}
