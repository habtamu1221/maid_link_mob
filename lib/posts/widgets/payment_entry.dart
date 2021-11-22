import '../../libs.dart';

Future<void> paymentEntry(BuildContext context, String maidid) async {
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  await showDialog(
    context: context,
    builder: (conta) {
      return AlertDialog(
        title: Text(
          " Payment ",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22,
            fontStyle: FontStyle.italic,
          ),
        ),
        elevation: 25,
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pop(conta),
            child: Text(
              "Cancel",
              textAlign: TextAlign.justify,
              style: TextStyle(
                backgroundColor: Theme.of(context).primaryColor,
                color: Colors.white,
              ),
            ),
          ),
          FlatButton(
            onPressed: () async {
              // print("I Am called .... ");
              BlocProvider.of<PostsRating>(context).add(PayToRatePostEvent(
                  accountController.text, passwordController.text, maidid));
              Navigator.pop(conta);
            },
            child: Text(
              "Pay",
              textAlign: TextAlign.justify,
              style: TextStyle(
                backgroundColor: Theme.of(context).primaryColor,
                color: Colors.white,
              ),
            ),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        contentPadding: EdgeInsets.all(20),
        titlePadding: EdgeInsets.all(10),
        content: Container(
          height: 200,
          child: Column(
            children: [
              Text(
                "  Please Enter the ACC Number and Password for payment ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Container(
                child: TextField(
                  controller: accountController,
                  cursorColor: Theme.of(context).cursorColor,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.account_balance_wallet,
                      color: Colors.white,
                    ),
                    labelText: ' ACCOUNT NUMBER ',
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: TextField(
                  controller: passwordController,
                  cursorColor: Theme.of(context).cursorColor,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.security_rounded,
                      color: Colors.white,
                    ),
                    labelText: ' Password ',
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                    // helperText: 'example@example.com',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
    barrierDismissible: true,
    useSafeArea: true,
  );
}
