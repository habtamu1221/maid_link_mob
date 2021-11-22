import '../../libs.dart';

class AdminAdminRepo {
  final AdminAdminsProvider provider;
  AdminAdminRepo({required this.provider});

  Future<List<DUser>?> loadAdminAdmins() async {
    final maids = await this.provider.loadAdminAdmins();
    List<DUser> listMaids = [];
    if (maids != null) {
      for (int a = 0; a < maids.length; a++) {
        final md = DUser.fromJson(maids[a]["user"]);
        if (md != null) {
          listMaids.add(md);
        }
      }
      return listMaids;
    }
    return null;
  }

  Future<DUser?> registerAdmin(String username, String email) async {
    final admin = await provider.registerAdmin(username, email);
    if (admin == null) {
      return null;
    } else {
      return DUser.fromJson(admin["user"]);
    }
  }

  Future<bool> deleteAdmin(String adminID) async {
    return await provider.deleteAdmin(adminID);
  }
}
