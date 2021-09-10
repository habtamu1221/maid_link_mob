import '../../libs.dart';

class AdminAdminsBloc extends Cubit<AdminAdminsState> {
  final AdminAdminRepo repo;
  AdminAdminsBloc(this.repo) : super(AdminAdminsInit());

  loadAdminAdmins() async {
    emit(AdminAdminsLoading());
    final admins = await this.repo.loadAdminAdmins();
    if (admins != null) {
      emit(AdminAdminsLoadSuccess(admins));
      return;
    }
    emit(AdminAdminLoadingFailure());
  }

  Future<bool> registerAdmin(String username, String email) async {
    final admin = await this.repo.registerAdmin(username, email);
    if (admin != null && this.state is AdminAdminsLoadSuccess) {
      (this.state as AdminAdminsLoadSuccess).myAdmins.add(admin);
      final val = this.state;
      emit(AdminAdminsInit());
      emit(val);
      return true;
    } else if (!(this.state is AdminAdminsLoadSuccess)) {
      loadAdminAdmins();
      return false;
    }
    return false;
  }

  Future<bool> deleteAdmin(String adminID) async {
    final success = await this.repo.deleteAdmin(adminID);
    if (success && this.state is AdminAdminsLoadSuccess) {
      (this.state as AdminAdminsLoadSuccess)
          .myAdmins
          .removeWhere((element) => element.id == adminID);
      final val = this.state;
      emit(AdminAdminsInit());
      emit(val);
      return true;
    }
    return false;
  }
}
