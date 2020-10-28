import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibeluapp/injector/injector.dart';
import 'package:sibeluapp/models/aduan/aduan_body.dart';
import 'package:sibeluapp/models/diagnostic/diagnostic.dart';
import 'package:sibeluapp/repository/api_aduan_repository.dart';
import 'package:sibeluapp/repository/api_auth_repository.dart';
import 'package:sibeluapp/storage/sharedpreferences/shared_preferences_manager.dart';

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
  final ApiAduanRepository apiAduanRepository = ApiAduanRepository();
  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();
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
    if (aduanBody.phoneNumber == null || aduanBody.phoneNumber.isEmpty) {
      yield AduanFailure('Phone number is required');
      return;
    }
    if (aduanBody.eventDate == null || aduanBody.eventDate.isEmpty) {
      yield AduanFailure('Event date is required');
      return;
    }
    if (aduanBody.jenisAduan == null || aduanBody.jenisAduan.isEmpty) {
      yield AduanFailure('Jenis aduan is required');
      return;
    }
    if (aduanBody.kronologi == null || aduanBody.kronologi.isEmpty) {
      yield AduanFailure('Kronologi is required');
      return;
    }

    yield AduanLoading();
    Diagnostic diagnostic = await apiAduanRepository.postAduan(aduanBody);
    if (diagnostic.error != null) {
      yield AduanFailure(diagnostic.error);
      return;
    }
    yield AduanSuccess();
  }
}

//1. Check Input Apakah ada yang masih kosong atau salah
//2. loading;
//3. post aduanbody menggunakan aduan body
