import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibeluapp/models/aduan/aduan_body.dart';
import 'package:sibeluapp/repository/api_auth_repository.dart';

abstract class AduanState {}

class AduanInitial extends AduanState {}

class AduanLoading extends AduanState {}

class AduanFailure extends AduanState {
  final String error;

  AduanFailure(this.error);
}

class AduanSuccess extends AduanState {}

class AduanEvent extends AduanState {
  final AduanBody aduanBody;

  AduanEvent(this.aduanBody);
}

class AduanBloc extends Bloc<AduanEvent, AduanState> {
  final ApiAuthRepository apiAuthRepository = ApiAuthRepository();

  AduanBloc(AduanState initialState) : super(initialState);

  @override
  AduanState get initialState => AduanInitial();

  @override
  Stream<AduanState> mapEventToState(AduanEvent event) async* {
    AduanBody aduanBody = event.aduanBody;
    if (aduanBody.email == null || aduanBody.email.isEmpty) {
      yield AduanFailure('Username is required');
      return;
    }

    yield AduanLoading();
    Token token = await apiAuthRepository.postAduanUser(aduanBody);
    if (token.error != null) {
      yield AduanFailure(token.error);
      return;
    }
    yield AduanSuccess();
  }
}

//1. Check Input Apakah ada yang masih kosong atau salah
//2. loading;
//3. post aduanbody menggunakan aduan body
