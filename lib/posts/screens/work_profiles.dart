import '../../libs.dart';

class MyWorks extends StatefulWidget {
  static const String Route = "/my-works-list";
  const MyWorks({Key? key}) : super(key: key);

  @override
  MyWorksState createState() => MyWorksState();
}

class MyWorksState extends State<MyWorks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddWorkProfileScreen.Route);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          " Work Profile ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: BlocBuilder<MaidBloc, MaidBlocState>(
          builder: (context, state) {
            if (state is MaidBlocLoadingSuccess) {
              print("${state.maid.works}  ${state.maid.works.length}");
              return ListView(
                children: [
                  ...state.maid.works.map<WorkProfileItem>(
                    (w) {
                      return WorkProfileItem(work: w);
                    },
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
