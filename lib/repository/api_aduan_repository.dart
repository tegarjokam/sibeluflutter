import 'package:sibeluapp/models/aduan/aduan_body.dart';
import 'package:sibeluapp/models/diagnostic/diagnostic.dart';
import 'package:sibeluapp/repository/api_aduan_provider.dart';

class ApiAduanRepository {
  final _apiAduanProvider = new ApiAduanProvider();

  Future<Diagnostic> postAduan(AduanBody aduan) =>
      _apiAduanProvider.postAduan(aduan);
}
