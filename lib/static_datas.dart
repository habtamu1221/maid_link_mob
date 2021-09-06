enum Role {
  admin,
  maid,
  client,
}

class StaticDataStore {
  static List<String> roles = ["Admin", "Maid", "Client"];
  static String SCHEME = "http://";
  static String HOST = "10.9.208.154";
  static int PORT = 8080;
  static String URL = SCHEME + HOST + ":$PORT/";
  static String TOKEN = "";
  static Role role = Role.admin;
  static String id = "";
  static String Password = '';
}
