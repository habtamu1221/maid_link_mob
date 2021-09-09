import '../../libs.dart';

class MyMaidsRepo {
  final MyMaidsProvider provider;
  MyMaidsRepo(this.provider);

  Future<List<Maid>?> getMyMaids() async {
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

  Future<Maid?> payForMaidInformation(
      String account, String password, String maidID) async {
    final maid =
        await this.provider.payForMaidInformation(account, password, maidID);
    if (maid != null) {
      return Maid.fromJson(maid);
    }
    return null;
  }

  Future<RateResult?> rateMaid(int rate, String maidID) async {
    final result = await this.provider.rateMaid(rate, maidID);
    if (result != null) {
      return RateResult.fromJson(result);
    }
    return null;
  }
}
