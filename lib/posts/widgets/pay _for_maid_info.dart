import '../../libs.dart';

class PayForMaidInfo extends StatelessWidget {
  final String maidid;
  const PayForMaidInfo({Key? key, required this.maidid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        paymentEntry(context, maidid);
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 3),
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        curve: Curves.bounceInOut,
        // transform: Matrix4(20, 40, 60, 80, 100, 120, 140, 160, 180, 200, 220,
        //     240, 260, 280, 300, 320),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(
              40,
            ),
          ),
          child: Card(
            color: Theme.of(context).primaryColor,
            shadowColor: Theme.of(context).primaryColorDark,
            elevation: 5,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Center(
                child: Text(
                  "Pay For Contact Info",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
