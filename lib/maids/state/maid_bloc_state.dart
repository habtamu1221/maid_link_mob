import '../../libs.dart';

class MaidBlocState {}

class MaidBlocInit extends MaidBlocState {}

class MaidBlocLoading extends MaidBlocState {}

class MaidBlocFailure extends MaidBlocState {}

class MaidBlocLoadingSuccess extends MaidBlocState {
  final Maid maid;
  MaidBlocLoadingSuccess({required this.maid});
}
