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
        final val = this.state;
        yield (MaidBlocInit());
        yield (val);
      }
    } else if (event is MaidEventRemoveProfilePicture) {
      String url = event.imageurl;
      print(url);
      final success = await this.repo.removeProfilePicture(url);
      if (success && this.state is MaidBlocLoadingSuccess) {
        (this.state as MaidBlocLoadingSuccess).maid.profileImages.remove(url);
        final val = this.state;
        yield (MaidBlocInit());
        yield (val);
      }
    } else if (event is MaidEventUpdateProfile) {
      final update = await this.repo.updateMaid(event.update);
      if (update != null && this.state is MaidBlocLoadingSuccess) {
        (this.state as MaidBlocLoadingSuccess).maid.bio = update.bio;
        (this.state as MaidBlocLoadingSuccess).maid.address = update.address;
        (this.state as MaidBlocLoadingSuccess).maid.phone = update.phone;
        final val = this.state;
        yield (MaidBlocInit());
        yield (val);
      }
    } else if (event is MaidEventCreateWork) {
      final work = await this.repo.createWork(event.work);
      if (work != null) {
        (this.state as MaidBlocLoadingSuccess).maid.works.add(work!);
        final statess = this.state;
        yield (MaidBlocInit());
        yield (statess);
      }
    } else if (event is MaidEventUpdateWork) {
      final work = await this.repo.updateWork(event.work);
      if (work != null) {
        (this.state as MaidBlocLoadingSuccess).maid.works.forEach((element) {
          if (element.no == work.no) {
            element.experiance = work.experiance;
            element.experties = work.experties;
            element.type = work.type;
            element.shift = work.shift;
          }
        });
        final statess = this.state;
        yield (MaidBlocInit());
        yield (statess);
      }
    } else if (event is MaidEventDeleteWork) {
      final success = await this.repo.deleteWork(event.no);
      if (success) {
        (this.state as MaidBlocLoadingSuccess)
            .maid
            .works
            .removeWhere((element) => event.no == element.no);
        final statess = this.state;
        yield (MaidBlocInit());
        yield (statess);
      }
    }
    yield (this.state);
  }
}
