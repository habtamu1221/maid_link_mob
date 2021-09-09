import '../../libs.dart';

class MaidBloc extends Bloc<MaidEvent, MaidBlocState> {
  MaidBloc({required this.repo}) : super(MaidBlocInit());
  final MaidRepo repo;

  @override
  Stream<MaidBlocState> mapEventToState(MaidEvent event) async* {
    if (event is MaidEventLoad) {
      final thestate = await repo.getMaid();
      yield (thestate);
    } else if (event is MaidEventAddProfileImage) {
      File image = event.image;
      final mess = await this.repo.addProfilePicture(image);
      if (mess.success && this.state is MaidBlocLoadingSuccess) {
        (this.state as MaidBlocLoadingSuccess).maid.profileImages.add(mess.msg);
        emit(this.state);
        return;
      }
    } else if (event is MaidEventRemoveProfilePicture) {
      String url = event.imageurl;
      print(url);
      final success = await this.repo.removeProfilePicture(url);
      if (success && this.state is MaidBlocLoadingSuccess) {
        (this.state as MaidBlocLoadingSuccess).maid.profileImages.remove(url);
        emit(this.state);
        return;
      }
    }
    yield (this.state);
  }
}
