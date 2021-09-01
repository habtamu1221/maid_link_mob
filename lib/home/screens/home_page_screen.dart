import '../../libs.dart';

class HomeScreen extends StatefulWidget {
  static const String ROUTE = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        drawer: Navigation(),
        body: SafeArea(
          child: Container(
              child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.15,
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Maid Link",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          // controller: this.passwordController,
                          cursorColor: Theme.of(context).cursorColor,
                          decoration: InputDecoration(
                            labelText: ' Search ',
                            labelStyle: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                            ),
                            // helperText: 'example@example.com',
                            suffixIcon: Icon(
                              Icons.search,
                              // color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColorLight,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                // color: Theme.of(context).primaryColor,
                height: MediaQuery.of(context).size.height * 0.7,
                child: PageView(
                  children: [
                    ListView(children: [
                      PostItem(),
                      PostItem(),
                      PostItem(),
                      PostItem(),
                      PostItem(),
                      PostItem(),
                      PostItem(),
                      SeeMore(),
                    ])
                    // PostItem(),
                  ],
                ),
              ),
            ],
          )),
        ));
  }
}
