enum Role {
  admin,
  maid,
  client,
}

class StaticDataStore {
  static List<String> roles = ["Admin", "Maid", "Client"];
  static String SCHEME = "http://";
  static String HOST = "192.168.43.207";
  static int PORT = 8080;
  static String URL = SCHEME + HOST + ":$PORT/";
  static String TOKEN = "";
  static Role role = Role.admin;
  static String id = "";
  static String Password = '';

  static List<String> WorkTypes = [
    "Baby Sitting",
    "Cooking",
    "Janitor",
    "Laundary",
    "Home Care",
    "All Inclusive"
  ];

  static List<String> Shifts = [
    "Full day and night",
    "Full day",
    "Half day morning",
    "Half day after noon",
    "Full night"
  ];
}
