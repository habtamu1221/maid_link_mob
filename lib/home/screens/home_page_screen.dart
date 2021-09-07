import '../../libs.dart';

class HomeScreen extends StatefulWidget {
  static const String ROUTE = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController searchController = TextEditingController();
  bool once = false;
  @override
  Widget build(BuildContext context) {
    if (!once) {
      BlocProvider.of<PostBloc>(context).loadMaids();
      this.once = true;
    }
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        drawer: Navigation(),
        body: SafeArea(
          child: Container(
              child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
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
                        StaticDataStore.roles[StaticDataStore.role.index],
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
                            controller: this.searchController,
                            onChanged: (String text) {
                              print("\n\n\n\n\n");
                              print(StaticDataStore.TOKEN);
                              print("\n\n\n\n\n");
                              if (text.length > 0) {
                                BlocProvider.of<PostBloc>(context)
                                    .searchMaids(text);
                              } else {
                                if (!(context.watch<PostBloc>()
                                    is MaidPostLoadSuccess)) {
                                  BlocProvider.of<PostBloc>(context)
                                      .loadMaids();
                                }
                              }
                            },
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
              ),
              Expanded(
                flex: 6,
                child: Container(
                  // color: Theme.of(context).primaryColor,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: PageView(
                    children: [
                      BlocBuilder<PostBloc, MaidPostState>(
                        builder: (context, state) {
                          if (state is MaidPostLoadSuccess) {
                            if (state.maids == null) {
                              BlocProvider.of<PostBloc>(context).loadMaids();
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(" loading ...",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    CircularProgressIndicator(),
                                  ],
                                ),
                              );
                            } else {
                              // for (int b = 0;
                              //     b < (state as MaidPostLoadSuccess).maids.length;
                              //     b++) {
                              //   PostItem((state as MaidPostLoadSuccess).maids[b])
                              // }
                              print("\n\n\n\nLOOOOADDEEDDD\n\n\n\n");
                              return Container(
                                width: double.infinity,
                                height: 200,
                                child: ListView.builder(
                                  itemCount: (state).maids.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index == (state).maids.length) {
                                      return SeeMore();
                                    }
                                    return PostItem(
                                      maid: (state).maids[index],
                                    );
                                    // return SizedBox();
                                  },
                                ),
                              );
                            }
                          } else if (state is MaidPostLoading) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(" loading ...",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  CircularProgressIndicator(),
                                ],
                              ),
                            );
                          } else if (state is MaidPostLoadingFailed) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(" Loading failed ... ",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  GestureDetector(
                                    child: Icon(
                                      Icons.signal_wifi_connected_no_internet_4,
                                    ),
                                    onTap: () {
                                      BlocProvider.of<PostBloc>(context)
                                          .loadMaids();
                                    },
                                  ),
                                ],
                              ),
                            );
                          } else {
                            BlocProvider.of<PostBloc>(context).loadMaids();
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    " loading ...",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  CircularProgressIndicator(),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                      // ListView.builder(
                      //   // itemCount :
                      //   itemBuilder: (context , index){})),
                      // PostItem(),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ));
  }
}
