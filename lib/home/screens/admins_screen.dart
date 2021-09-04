import '../../libs.dart';

class AdminsScreen extends StatelessWidget {
  static String Route = "/admins_list_screen";
  const AdminsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text("Admins",
            style: TextStyle(
              color: Colors.white,
            )),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                child: Container(
                  // color: Theme.of(context).primaryColor,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black38)),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Admins List ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 20,
                        // color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        child: Container(
                          height: 100,
                          // width: 100,
                          child: Image.asset("assets/images/maidso.jpeg"),
                        ),
                      ),
                      title: Text("samauela  "),
                      subtitle: Text("s34234jfskfjkl3423kj42lk"),
                      trailing: Icon(Icons.delete_forever, color: Colors.red),
                    ),
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        child: Container(
                          height: 100,
                          // width: 100,
                          child: Image.asset("assets/images/maidso.jpeg"),
                        ),
                      ),
                      title: Text("samauela  "),
                      subtitle: Text("s34234jfskfjkl3423kj42lk"),
                      trailing: Icon(Icons.delete_forever, color: Colors.red),
                    ),
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        child: Container(
                          height: 100,
                          // width: 100,
                          child: Image.asset("assets/images/maidso.jpeg"),
                        ),
                      ),
                      title: Text("samauela  "),
                      subtitle: Text("s34234jfskfjkl3423kj42lk"),
                      trailing: Icon(Icons.delete_forever, color: Colors.red),
                    ),
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        child: Container(
                          height: 100,
                          // width: 100,
                          child: Image.asset("assets/images/maidso.jpeg"),
                        ),
                      ),
                      title: Text("samauela  "),
                      subtitle: Text("s34234jfskfjkl3423kj42lk"),
                      trailing: Icon(Icons.delete_forever, color: Colors.red),
                    ),
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        child: Container(
                          height: 100,
                          // width: 100,
                          child: Image.asset("assets/images/maidso.jpeg"),
                        ),
                      ),
                      title: Text("samauela  "),
                      subtitle: Text("s34234jfskfjkl3423kj42lk"),
                      trailing: Icon(Icons.delete_forever, color: Colors.red),
                    ),
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        child: Container(
                          height: 100,
                          // width: 100,
                          child: Image.asset("assets/images/maidso.jpeg"),
                        ),
                      ),
                      title: Text("samauela  "),
                      subtitle: Text("s34234jfskfjkl3423kj42lk"),
                      trailing: Icon(Icons.delete_forever, color: Colors.red),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
