import '../../libs.dart';

/*{
    "no" : NumberLong(2),
    "shift" : 1,
    "type" : 1,
    "experiance" : "Cake Bread",
    "experties" : [ 
        "One", 
        "Two", 
        "Three"
    ]
}, */
class WorkProfileItem extends StatefulWidget {
  final Work work;
  const WorkProfileItem({Key? key, required this.work}) : super(key: key);

  @override
  _WorkProfileItemState createState() => _WorkProfileItemState();
}

class _WorkProfileItemState extends State<WorkProfileItem> {
  TextEditingController experianceController = TextEditingController();
  TextEditingController expertiesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (StaticDataStore.role == Role.maid &&
        !(BlocProvider.of<MaidBloc>(context).state is MaidBlocLoadingSuccess)) {
      BlocProvider.of<MaidBloc>(context).add(MaidEventLoad());
    }
    return Container(
      // width: MediaQuery.of(context).size.width * 0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: Container(
          // height: 100,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          width: double.infinity,
          // height: 500,

          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: BlocBuilder<MaidBloc, MaidBlocState>(
            builder: (context, state) {
              if (state is MaidBlocLoadingSuccess) {
                // this.phoneController.text = state.maid.phone;
                // this.bioController.text = state.maid.bio;
                // this.addressController.text = state.maid.address;
                /*{
                          "no" : NumberLong(2),
                          "shift" : 1,
                          "type" : 1,
                          "experiance" : "Cake Bread",
                          "experties" : [ 
                              "One", 
                              "Two", 
                              "Three"
                          ]
                      }, */
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Number ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "${widget.work.no}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shift  ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          DropdownButton(
                            value: widget.work.shift,
                            iconEnabledColor: Theme.of(context).primaryColor,
                            icon: Icon(Icons.keyboard_arrow_down),
                            autofocus: true,
                            onChanged: (int? val) {
                              setState(() {
                                widget.work.shift = val!;
                              });
                            },
                            items: [
                              DropdownMenuItem(
                                value: 1,
                                child: Text(StaticDataStore.Shifts[0]),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text(StaticDataStore.Shifts[1]),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Text(StaticDataStore.Shifts[2]),
                              ),
                              DropdownMenuItem(
                                value: 4,
                                child: Text(StaticDataStore.Shifts[3]),
                              ),
                              DropdownMenuItem(
                                value: 5,
                                child: Text(StaticDataStore.Shifts[4]),
                              ),
                            ],
                            // onChanged: (int val) {

                            // } ,
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Type  ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        DropdownButton(
                          value: widget.work.type,
                          iconEnabledColor: Theme.of(context).primaryColor,
                          icon: Icon(Icons.keyboard_arrow_down),
                          autofocus: true,
                          onChanged: (int? val) {
                            setState(() {
                              widget.work.type = val!;
                            });
                          },
                          items: [
                            DropdownMenuItem(
                              value: 1,
                              child: Text(StaticDataStore.WorkTypes[0]),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text(StaticDataStore.WorkTypes[1]),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text(StaticDataStore.WorkTypes[2]),
                            ),
                            DropdownMenuItem(
                              value: 4,
                              child: Text(StaticDataStore.WorkTypes[3]),
                            ),
                            DropdownMenuItem(
                              value: 5,
                              child: Text(StaticDataStore.WorkTypes[4]),
                            ),
                            DropdownMenuItem(
                              value: 6,
                              child: Text(StaticDataStore.WorkTypes[5]),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(children: [
                      Text(
                        "Experiance ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: TextField(
                          controller: this.experianceController,
                          keyboardType: TextInputType.text,
                          maxLines: 5,
                          minLines: 1,
                          cursorColor: Theme.of(context).cursorColor,
                          decoration: InputDecoration(
                            labelText: 'Experiance ',
                            labelStyle: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorLight),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Center(
                                  child: Column(
                                    children: [
                                      ...widget.work.experties.map<Row>((e) {
                                        return Row(
                                          children: [
                                            Text(
                                              e,
                                              style: TextStyle(
                                                fontSize: 8,
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.redAccent,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  widget.work.experties
                                                      .remove(e);
                                                });
                                              },
                                            ),
                                          ],
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: TextField(
                                  minLines: 1,
                                  maxLines: 5,
                                  controller: this.expertiesController,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Theme.of(context).cursorColor,
                                  decoration: InputDecoration(
                                    labelText: ' Experty ... ',
                                    labelStyle: TextStyle(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .primaryColorLight),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                child: FlatButton(
                                  child: Icon(Icons.add, color: Colors.white),
                                  color: Theme.of(context).primaryColor,
                                  onPressed: () {
                                    // -----------------
                                    if (expertiesController.text != "" &&
                                        expertiesController.text.length > 3) {
                                      setState(() {
                                        widget.work.experties
                                            .add(expertiesController.text);
                                        expertiesController.text = "";
                                      });
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          child: ElevatedButton(
                            onPressed: () {
                              if (widget.work.experties.length > 0 &&
                                  experianceController.text != "") {
                                BlocProvider.of<MaidBloc>(context).add(
                                  MaidEventUpdateWork(
                                    Work(
                                      ownerID: StaticDataStore.id,
                                      no: widget.work.no,
                                      shift: widget.work.shift,
                                      type: this.widget.work.type,
                                      experiance:
                                          this.experianceController.text,
                                      experties: widget.work.experties,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              " Update ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<MaidBloc>(context).add(
                              MaidEventDeleteWork(
                                widget.work.no,
                              ),
                            );
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}


/*// TextField(
              //       controller: this.emailController,
              //       keyboardType: TextInputType.emailAddress,
              //       cursorColor: Theme.of(context).cursorColor,
              //       decoration: InputDecoration(
              //         icon: Icon(Icons.email),
              //         labelText: ' Email ',
              //         labelStyle: TextStyle(
              //           color: Theme.of(context).primaryColorLight,
              //         ),
              //         enabledBorder: UnderlineInputBorder(
              //           borderSide: BorderSide(
              //               color: Theme.of(context).primaryColorLight),
              //         ),
              //       ),
              //     ),*/