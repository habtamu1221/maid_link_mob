import '../../libs.dart';

class PostInit extends MaidPostState {}

class MaidPostLoadSuccess extends MaidPostState {
  List<Maid> maids;
  MaidPostLoadSuccess({required this.maids});
}

class MaidPostLoading extends MaidPostState {}

class MaidPostLoadingFailed extends MaidPostState {}

class SearchResultSuccess extends MaidPostState {
  List<Maid> maids;
  // MaidPostState oldState;
  SearchResultSuccess({required this.maids});//equired this.oldState});
}

class SearchResultFailure extends MaidPostState {}

// POstState represents all the states of loading maids as a post
class MaidPostState {}
