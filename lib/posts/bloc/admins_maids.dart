import '../../libs.dart';

class AdminMaidsBloc extends Cubit<AdminMaidsState> {
  final AdminMaidRepo repo;
  AdminMaidsBloc(this.repo) : super(AdminMaidsInit());

  loadAdminMaids() async {
    emit(AdminMaidsLoading());
    final maids = await this.repo.loadAdminMaids();
    if (maids != null) {
      emit(AdminMaidsLoadSuccess(maids));
      return;
    }
    emit(AdminMaidLoadingFailure());
  }

  Future<bool> registerMaid(
      String username, String email, String phone, String address) async {
    final maid = await this.repo.registerMaid(username, email, phone, address);
    if (maid != null && this.state is AdminMaidsLoadSuccess) {
      (this.state as AdminMaidsLoadSuccess).myMaids.add(maid);

      final val = this.state;
      emit(AdminMaidsInit());
      emit(val);

      return true;
    } else if (!(this.state is AdminMaidsLoadSuccess)) {
      loadAdminMaids();
      return false;
    }
    return false;
  }

  Future<bool> deleteMaid(String maidID) async {
    final success = await this.repo.deleteMaid(maidID);
    if (success) {
      (this.state as AdminMaidsLoadSuccess).myMaids.removeWhere(
            (element) => maidID == element.user!.id,
          );
      final val = this.state;
      emit(AdminMaidsInit());
      emit(val);
      return true;
    }
    return false;
  }
  // payForMaidInformation ...
  // payForMaidInformation(String account, String password, String maidID) async {
  //   final maid =
  //       await this.repo.payForMaidInformation(account, password, maidID);
  //   if (maid != null) {
  //     if (this.state is MyMaidsLoadSuccess) {
  //       (this.state as MyMaidsLoadSuccess).myMaids.add(maid!);
  //     } else {
  //       emit(MyMaidsLoadSuccess([maid!]));
  //     }
  //   }
  // }

  // rateMaid(int rate, String maidID) async {
  //   final rateResult = await this.repo.rateMaid(rate, maidID);
  //   if (rateResult != null) {
  //     if (this.state is MyMaidsLoadSuccess) {
  //       for (int a = 0;
  //           a < (this.state as MyMaidsLoadSuccess).myMaids.length;
  //           a++) {
  //         if ((this.state as MyMaidsLoadSuccess).myMaids[a]!.user!.id ==
  //             maidID) {
  //           (this.state as MyMaidsLoadSuccess).myMaids[a].rateCount =
  //               rateResult.ratesCount;
  //           (this.state as MyMaidsLoadSuccess).myMaids[a].rates =
  //               rateResult.rates;
  //           (this.state as MyMaidsLoadSuccess).myMaids[a].ratedBy =
  //               rateResult.ratedBy;
  //           emit(this.state);
  //         }
  //       }
  //     }
  //   }
  // }

  // -----------------

}
