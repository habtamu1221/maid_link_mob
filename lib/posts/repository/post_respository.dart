import '../../libs.dart';

class MaidPostRepo {
  final MaidPostProvider provider;
  MaidPostRepo({required this.provider});

  Future<List<Maid>?> loadMaids(int offset) async {
    final maids = await this.provider.loadMaids(offset);
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

  Future<List<Maid>?> searchMaids(String text, int offset) async {
    final maids = await this.provider.searchMaids(text, offset);
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
}
