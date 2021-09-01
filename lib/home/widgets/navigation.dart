import "../../libs.dart";

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    Container(
                      // width: 100,
                      // height: 100,
                      decoration: BoxDecoration(),
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              pickImage(context);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/maidso.jpeg",
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 10,
                                    width: 100,
                                    child: Container(
                                      color: Colors.black54,
                                      child: Icon(
                                        Icons.camera,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Samuael Adnew",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    ListTile(
                        leading: Icon(Icons.person), title: Text("Profile")),
                    ListTile(
                        leading: Icon(Icons.settings), title: Text("Settings")),
                    ListTile(
                        leading: Icon(Icons.verified_user),
                        title: Text("My Maids")),
                    ListTile(
                        leading: Icon(Icons.supervised_user_circle_sharp),
                        title: Text("Admins")),
                    ListTile(
                        leading: Icon(Icons.supervised_user_circle_outlined),
                        title: Text("Clients")),
                    ListTile(
                        leading: Icon(Icons.privacy_tip_outlined),
                        title: Text("Security")),
                    ListTile(
                        leading: Icon(Icons.logout), title: Text("Logout")),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.elliptical(400, 100),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Column(
                        children: [],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
