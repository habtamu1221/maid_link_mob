import '../../libs.dart';

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

  Future<MaidUpdate?> updateMaid(MaidUpdate update) async {
    final json = await this.provider.updateMaid(update);
    if (json != null) {
      return MaidUpdate.fromJson(json);
    }
    return null;
  }

  Future<Work?> createWork(Work work) async {
    final json = await this.provider.createWork(work);
    if (json != null) {
      return Work.fromJson(json);
    }
    return null;
  }

  // updateWork
  Future<Work?> updateWork(Work work) async {
    final json = await this.provider.updateWork(work);
    if (json != null) {
      return Work.fromJson(json);
    }
    return null;
  }

  //
  Future<bool> deleteWork(int no) async {
    return await this.provider.deleteWork(no);
  }
}
