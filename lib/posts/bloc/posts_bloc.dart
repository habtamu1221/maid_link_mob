import '../../libs.dart';

class PostBloc extends Cubit<MaidPostState> {
  final MaidPostRepo repo;
  PostBloc({required this.repo}) : super(PostInit());

  setState(MaidPostState ustate) {
    emit(ustate);
  }

  loadMaids() async {
    int offset = 0;
    if (this.state is MaidPostLoadSuccess) {
      if ((this.state as MaidPostLoadSuccess).maids != null) {
        offset = (this.state as MaidPostLoadSuccess).maids.length;
      }
    }
    final maids = await this.repo.loadMaids(offset);
    if (maids != null && maids.length > 0) {
      if (this.state is MaidPostLoadSuccess &&
          (this.state as MaidPostLoadSuccess).maids != null) {
        (this.state as MaidPostLoadSuccess).maids.addAll(maids!);
        emit(this.state);
      } else if (this.state is MaidPostLoadSuccess) {
        (this.state as MaidPostLoadSuccess).maids = [];
        emit(this.state);
      } else {
        emit(MaidPostLoadSuccess(maids: maids!));
      }
    } else {
      emit(MaidPostLoadingFailed());
    }
  }

  searchMaids(String q) async {
    int offset = 0;
    if (this.state is SearchResultSuccess) {
      if ((this.state as SearchResultSuccess).maids != null) {
        offset = (this.state as SearchResultSuccess).maids.length;
      }
    }
    final maids = await this.repo.searchMaids(q , offset );
    if (maids != null && maids.length > 0) {
      if (this.state is SearchResultSuccess &&
          (this.state as SearchResultSuccess).maids != null) {
        (this.state as SearchResultSuccess).maids.addAll(maids!);
        emit(this.state);
      } else if (this.state is SearchResultSuccess) {
        (this.state as SearchResultSuccess).maids = [];
        emit(this.state);
      } else {
        emit(SearchResultSuccess( maids : maids ));
      }
    } else {
      emit(SearchResultFailure());
    }
  }
}
