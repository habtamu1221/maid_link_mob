import '../../libs.dart';

class MyRatingRepo {
  final MyRatingProvider provider;
  MyRatingRepo(this.provider);

  Future<List<Maid>?> getMyPosts() async {
    final maids = await this.provider.getMyMaids();
    List<Maid> listMaids = [];
    if (maids != null && maids.length > 0) {
      for (int a = 0; a < maids.length; a++) {
        final md = Maid.fromJson(maids[a]);
        if (md != null && md.user != null) {
          listMaids.add(md);
        }
      }
      return listMaids;
    }
    return [];
  }

  Future<Maid?> payForPostInformation(
      String account, String password, String maidID) async {
    final maid =
        await this.provider.payForMaidInformation(account, password, maidID);
    if (maid != null) {
      return Maid.fromJson(maid);
    }
    return null;
  }

  Future<RateResult?> ratePost(int rate, String maidID) async {
    final result = await this.provider.rateMaid(rate, maidID);
    if (result != null) {
      return RateResult.fromJson(result);
    }
    return null;
  }
}
