import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibeluapp/injector/injector.dart';
import 'package:sibeluapp/models/aduan/aduan_body.dart';
import 'package:sibeluapp/models/aduan/list_aduan.dart';
import 'package:sibeluapp/models/diagnostic/diagnostic.dart';
import 'package:sibeluapp/repository/api_aduan_repository.dart';
import 'package:sibeluapp/repository/api_auth_repository.dart';
import 'package:sibeluapp/storage/sharedpreferences/shared_preferences_manager.dart';

abstract class AduanAdminState {}

class AduanAdminInitial extends AduanAdminState {}

class AduanAdminLoading extends AduanAdminState {}

class AduanAdminFailure extends AduanAdminState {
  final String error;

  AduanAdminFailure(this.error);
}

class AduanAdminSuccess extends AduanAdminState {
  ListAduan listAduan;

  AduanAdminSuccess({this.listAduan});
}

class AduanAdminEvent extends AduanAdminState {
  String startDate;
  String endDate;

  AduanAdminEvent({this.startDate, this.endDate});
}

class AduanAdminBloc extends Bloc<AduanAdminEvent, AduanAdminState> {
  final ApiAduanRepository apiAduanRepository = ApiAduanRepository();
  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();
  AduanAdminBloc(AduanAdminState initialState) : super(initialState);

  @override
  AduanAdminState get initialState => AduanAdminInitial();

  @override
  Stream<AduanAdminState> mapEventToState(AduanAdminEvent event) async* {
    String startDate = event.startDate;
    String endDate = event.endDate;

    if (startDate == null && endDate == null) {
      startDate = DateTime.now().subtract(Duration(days: 60)).toString();
      endDate = DateTime.now().toString();
    } else if (startDate == null && endDate != null) {
      startDate = DateTime.now().subtract(Duration(days: 60)).toString();
    } else if (startDate != null && endDate == null) {
      endDate = DateTime.now().toString();
    }

    yield AduanAdminLoading();
    ListAduan listAduan = await apiAduanRepository
        .getAllAduanListAdminByCreatedDate(startDate, endDate);

    if (listAduan.error != null) {
      yield AduanAdminFailure(listAduan.error);
      return;
    }
    yield AduanAdminSuccess(listAduan: listAduan);
  }
}

// 1. Dapatkan inputan tanggal
// 2. Cari inputan tanggal ke backend
// 3. Simpan data dalam bentuk ListAduan
// 4. Jika error maka tampilkan errornya
// 5. Jika sukses maka lempar data ke client/user
