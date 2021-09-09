import "../../libs.dart";

class MaidRepo {
  final MaidProvider provider;
  MaidRepo({required this.provider});

  Future<MaidBlocState> getMaid() async {
    final map = await provider.getMaid();
    if (map == null) {
      return MaidBlocFailure();
    }
    return MaidBlocLoadingSuccess(maid: Maid.fromJson(map));
  }

  Future<SimpleMessage> addProfilePicture(File image) {
    return this.provider.addProfilePicture(image);
  }

  Future<bool> removeProfilePicture(String url) {
    return this.provider.removeProfilePicture(url);
  }
}
