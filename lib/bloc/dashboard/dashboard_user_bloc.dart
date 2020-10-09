import 'package:bloc/bloc.dart';

import 'package:sibeluapp/models/user_model.dart';
import 'package:sibeluapp/repository/api_auth_repository.dart';

abstract class DashboardUserState {}

class DashboardUserInitial extends DashboardUserState {}

class DashboardUserLoading extends DashboardUserState {}

class DashboardUserFailure extends DashboardUserState {
  final String error;

  DashboardUserFailure(this.error);
}

class DashboardUserSuccess extends DashboardUserState {
  final User users;

  DashboardUserSuccess(this.users);
}

class DashboardUserEvent {}

class DashboardUserBloc extends Bloc<DashboardUserEvent, DashboardUserState> {
  final ApiAuthRepository apiAuthRepository = ApiAuthRepository();

  DashboardUserBloc(DashboardUserState initialState) : super(initialState);

  @override
  DashboardUserState get initialState => DashboardUserInitial();

  @override
  Stream<DashboardUserState> mapEventToState(DashboardUserEvent event) async* {
    yield DashboardUserLoading();
    User user = await apiAuthRepository.getProfile();
    if (user.error != null) {
      yield DashboardUserFailure(user.error);
      return;
    }
    yield DashboardUserSuccess(user);
  }
}
