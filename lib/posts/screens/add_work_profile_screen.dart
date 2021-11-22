import '../../libs.dart';

class AddWorkProfileScreen extends StatefulWidget {
  static const String Route = "/create-work-peofile";
  const AddWorkProfileScreen({Key? key}) : super(key: key);

  @override
  _AddWorkProfileScreenState createState() => _AddWorkProfileScreenState();
}

class _AddWorkProfileScreenState extends State<AddWorkProfileScreen> {
  List<String> experties = [];
  String experiance = "";
  int type = 1;
  int shift = 1;

  TextEditingController experianceController = TextEditingController();
  TextEditingController expertiesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Add Work Profile ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            ClipRRect(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Shift  ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                DropdownButton(
                                  value: shift,
                                  iconEnabledColor:
                                      Theme.of(context).primaryColor,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  autofocus: true,
                                  onChanged: (int? val) {
                                    setState(() {
                                      this.shift = val!;
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
                                value: type,
                                iconEnabledColor:
                                    Theme.of(context).primaryColor,
                                icon: Icon(Icons.keyboard_arrow_down),
                                autofocus: true,
                                onChanged: (int? val) {
                                  setState(() {
                                    this.type = val!;
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
                                        color: Theme.of(context)
                                            .primaryColorLight),
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
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Center(
                                        child: Column(
                                          children: [
                                            ...experties.map<Row>((e) {
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
                                                        this
                                                            .experties
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
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: TextField(
                                        minLines: 1,
                                        maxLines: 5,
                                        controller: this.expertiesController,
                                        keyboardType: TextInputType.text,
                                        cursorColor:
                                            Theme.of(context).cursorColor,
                                        decoration: InputDecoration(
                                          labelText: ' Experty ... ',
                                          labelStyle: TextStyle(
                                            color: Theme.of(context)
                                                .primaryColorLight,
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
                                        child: Icon(Icons.add,
                                            color: Colors.white),
                                        color: Theme.of(context).primaryColor,
                                        onPressed: () {
                                          // -----------------
                                          if (expertiesController.text != "" &&
                                              expertiesController.text.length >
                                                  3) {
                                            setState(() {
                                              experties.add(
                                                  expertiesController.text);
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
                          ElevatedButton(
                            onPressed: () {
                              if (experties.length > 0 &&
                                  experianceController.text != "") {
                                BlocProvider.of<MaidBloc>(context).add(
                                  MaidEventCreateWork(
                                    Work(
                                      ownerID: StaticDataStore.id,
                                      no: 0,
                                      shift: shift,
                                      type: this.type,
                                      experiance:
                                          this.experianceController.text,
                                      experties: this.experties,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              " Create ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
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
            )
          ],
        ),
      ),
    );
  }
}
