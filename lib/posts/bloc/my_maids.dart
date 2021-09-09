import '../../libs.dart';

class MyMaidsBloc extends Cubit<MyMaidsState> {
  final MyMaidsRepo repo;
  MyMaidsBloc(this.repo) : super(MyMaidsInit());

  getMyMaids() async {
    emit(MyMaidsLoading());
    final maids = await this.repo.getMyMaids();
    emit(MyMaidsLoadSuccess(maids!));
  }

  // payForMaidInformation ...
  payForMaidInformation(String account, String password, String maidID) async {
    final maid =
        await this.repo.payForMaidInformation(account, password, maidID);
    if (maid != null) {
      if (this.state is MyMaidsLoadSuccess) {
        (this.state as MyMaidsLoadSuccess).myMaids.add(maid!);
      } else {
        emit(MyMaidsLoadSuccess([maid!]));
      }
    }
  }

  rateMaid(int rate, String maidID) async {
    final rateResult = await this.repo.rateMaid(rate, maidID);
    if (rateResult != null) {
      if (this.state is MyMaidsLoadSuccess) {
        for (int a = 0;
            a < (this.state as MyMaidsLoadSuccess).myMaids.length;
            a++) {
          if ((this.state as MyMaidsLoadSuccess).myMaids[a]!.user!.id ==
              maidID) {
            (this.state as MyMaidsLoadSuccess).myMaids[a].rateCount =
                rateResult.ratesCount;
            (this.state as MyMaidsLoadSuccess).myMaids[a].rates =
                rateResult.rates;
            (this.state as MyMaidsLoadSuccess).myMaids[a].ratedBy =
                rateResult.ratedBy;
            emit(this.state);
          }
        }
      }
    }
  }

  // -----------------

}
