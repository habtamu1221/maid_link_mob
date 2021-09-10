import '../../libs.dart';

class AdminMaidsState {}

class AdminMaidsInit extends AdminMaidsState {}

class AdminMaidsLoading extends AdminMaidsState {}

class AdminMaidsLoadSuccess extends AdminMaidsState {
  List<Maid> myMaids;
  AdminMaidsLoadSuccess(this.myMaids);
}

class AdminMaidLoadingFailure extends AdminMaidsState {}

class AdminMaidAddedState extends AdminMaidsState {}
