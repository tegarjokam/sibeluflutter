import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibeluapp/injector/injector.dart';
import 'package:sibeluapp/models/aduan/aduan_body.dart';
import 'package:sibeluapp/models/diagnostic/diagnostic.dart';
import 'package:sibeluapp/models/roles/roles.dart';
import 'package:sibeluapp/repository/api_aduan_repository.dart';
import 'package:sibeluapp/repository/api_auth_repository.dart';
import 'package:sibeluapp/storage/sharedpreferences/shared_preferences_manager.dart';

abstract class AduanRolesState {}

class AduanRolesInitial extends AduanRolesState {}

class AduanRolesLoading extends AduanRolesState {}

class AduanRolesFailure extends AduanRolesState {
  final String error;

  AduanRolesFailure(this.error);
}

class AduanRolesSuccess extends AduanRolesState {
  RolesBody rolesBody;

  AduanRolesSuccess({this.rolesBody});
}

class AduanRolesEvent extends AduanRolesState {}

class AduanRolesBloc extends Bloc<AduanRolesEvent, AduanRolesState> {
  final ApiAduanRepository apiAduanRepository = ApiAduanRepository();
  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();
  AduanRolesBloc(AduanRolesState initialState) : super(initialState);

  @override
  AduanRolesState get initialState => AduanRolesInitial();

  @override
  Stream<AduanRolesState> mapEventToState(AduanRolesEvent event) async* {
    yield AduanRolesLoading();
    RolesBody rolesBody = await apiAduanRepository.getRoles();
    print(rolesBody.roles);
    if (rolesBody.error != null) {
      yield AduanRolesFailure(rolesBody.error);
      return;
    }
    yield AduanRolesSuccess(rolesBody: rolesBody);
  }
}
