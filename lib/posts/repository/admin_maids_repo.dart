import '../../libs.dart';

class AdminMaidRepo {
  final AdminMaidsProvider provider;
  AdminMaidRepo({required this.provider});

  Future<List<Maid>?> loadAdminMaids() async {
    final maids = await this.provider.loadAdminMaids();
    List<Maid> listMaids = [];
    if (maids != null) {
      for (int a = 0; a < maids.length; a++) {
        final md = Maid.fromJson(maids[a]);
        if (md != null && md.user != null) {
          listMaids.add(md);
        }
      }
      print("listMaids $listMaids");
      return listMaids;
    }
    return null;
  }

  Future<Maid?> registerMaid(
      String username, String email, String phone, String address) async {
    final client = await provider.registerMaid(username, email, phone, address);
    if (client == null) {
      return null;
    } else {
      return Maid.fromJson(client);
    }
  }

  Future<bool> deleteMaid(String maidID) async {
    return await this.provider.deleteMaid(maidID);
  }
}
