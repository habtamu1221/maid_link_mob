import '../../libs.dart';

class AdminAdmins extends StatelessWidget {
  static const String Route = '/admins-admins';
  // final MyMaidsRepo repo;
  const AdminAdmins({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("${StaticDataStore.role} ");
    if (StaticDataStore.role == Role.admin) {
      final adminMaidsBloc = BlocProvider.of<AdminAdminsBloc>(context);
      if (!(adminMaidsBloc.state is AdminAdminsLoadSuccess)) {
        print(" Loading ... ");
        adminMaidsBloc.loadAdminAdmins();
      }
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AdminAdminRegisterScreen.Route);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "My Admins",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (BuildContext context, UserState state) {
            return BlocBuilder<AdminAdminsBloc, AdminAdminsState>(
                builder: (context, state) {
              if (state is AdminAdminsLoadSuccess) {
                return ListView.builder(
                  itemCount: (state).myAdmins.length,
                  itemBuilder: (context, index) {
                    if ((state).myAdmins[index]!.id != StaticDataStore.id) {
                      return ListTile(
                        onTap: () {
                          // ---------------
                        },
                        leading: (state).myAdmins[index]!.imageUrl != ""
                            ? Image.network(
                                StaticDataStore.URL +
                                    (state).myAdmins[index]!.imageUrl,
                                height: 65,
                                width: 65,
                              )
                            : Image.asset(
                                "assets/images/avatar.png",
                                height: 65,
                                width: 65,
                              ), //
                        title: Text((state).myAdmins[index]!.username),
                        subtitle: Text(
                          (state).myAdmins[index]!.email,
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            BlocProvider.of<AdminAdminsBloc>(context)
                                .deleteAdmin((state).myAdmins[index]!.id);
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                );
              } else {
                return Center(
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          "Loading...",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.green,
                          ),
                        ),
                        CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                );
              }
            });
          },
        ),
      ),
    );
  }
}
