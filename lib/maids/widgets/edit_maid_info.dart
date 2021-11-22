import '../../libs.dart';

class EditMaidInfo extends StatefulWidget {
  const EditMaidInfo({Key? key}) : super(key: key);

  @override
  _EditMaidInfoState createState() => _EditMaidInfoState();
}

class _EditMaidInfoState extends State<EditMaidInfo> {
  TextEditingController bioController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
        width: 100,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: BlocBuilder<MaidBloc, MaidBlocState>(
          builder: (context, state) {
            if (state is MaidBlocLoadingSuccess) {
              this.phoneController.text = state.maid.phone;
              this.bioController.text = state.maid.bio;
              this.addressController.text = state.maid.address;

              return Column(
                children: [
                  TextField(
                    controller: this.phoneController,
                    keyboardType: TextInputType.phone,
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColorLight),
                      ),
                    ),
                  ),
                  TextField(
                    controller: this.bioController,
                    maxLines: 4,
                    minLines: 1,
                    keyboardType: TextInputType.text,
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                      labelText: ' Bio ',
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColorLight),
                      ),
                    ),
                  ),
                  TextField(
                    controller: addressController,
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                      labelText: ' Address  ',
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColorLight),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<MaidBloc>(context).add(
                        MaidEventUpdateProfile(
                          MaidUpdate(
                            id: StaticDataStore.id,
                            bio: bioController.text,
                            address: addressController.text,
                            phone: phoneController.text,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      " Update ",
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
    );
  }
}
