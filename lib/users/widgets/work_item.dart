import '../../libs.dart';

class WorksItems extends StatelessWidget {
  final List<Work> works;
  const WorksItems({Key? key, required this.works}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shift"),
                    Text(
                      "${works[index].shift}",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Type"),
                    Text("${works[index].type}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Experiance"),
                    Text("${works[index].experiance}")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Experties "),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: works[index].experiance.length,
                        itemBuilder: (context, ind) {
                          return Text(
                            "${works[index].experiance[ind]}",
                          );
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
