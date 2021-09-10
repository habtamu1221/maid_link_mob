import '../../libs.dart';

class AdminAdminsState {}

class AdminAdminsInit extends AdminAdminsState {}

class AdminAdminsLoading extends AdminAdminsState {}

class AdminAdminsLoadSuccess extends AdminAdminsState {
  List<DUser> myAdmins;
  AdminAdminsLoadSuccess(this.myAdmins);
}

class AdminAdminLoadingFailure extends AdminAdminsState {}

class AdminAdminAddedState extends AdminAdminsState {}
