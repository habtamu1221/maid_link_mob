import '../../libs.dart';

class WorksItems extends StatelessWidget {
  final List<Work> works;
  const WorksItems({Key? key, required this.works}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("The  Length of the list is ${works.length}");
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black38,
        ),
      ),
      child: Column(
        children: [
          ...this.works.map<Container>((e) {
            return Container(
              // height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black38,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    leading: Text(
                      "Shift",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text(
                      "${StaticDataStore.Shifts[e.shift]}",
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      "Type",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text("${StaticDataStore.WorkTypes[e.type - 1]}"),
                  ),
                  ListTile(
                    leading: Text(
                      "Experiance",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text("${e.experiance}"),
                  ),
                  ListTile(
                    leading: Text(
                      "Experties ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Column(children: [
                        ...e.experties.map((se) {
                          return Text(
                            "$se",
                          );
                        })
                      ]),
                      //     ListView.builder(
                      //   itemCount: e.experiance.length,
                      //   itemBuilder: (context, ind) {
                      //     return Text(
                      //       "${e.experties[ind]}",
                      //     );
                      //   },
                      // ),
                    ),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
