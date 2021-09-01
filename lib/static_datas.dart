enum Role {
  admin,
  maid,
  client,
}

class StaticDataStore {
  static String HOST = "";
  static String TOKEN = "";
  static Role role = Role.admin;
}
