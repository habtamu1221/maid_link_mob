import '../../libs.dart';

class MyMaidsState {}

class MyMaidsInit extends MyMaidsState {}

class MyMaidsLoading extends MyMaidsState {}

class MyMaidsLoadSuccess extends MyMaidsState {
  List<Maid> myMaids;
  MyMaidsLoadSuccess(this.myMaids);
}

class MaidLoadingFailure extends MyMaidsState {}

class MaidAddedState extends MyMaidsState {}
