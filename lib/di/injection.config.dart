// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/authentication/login/cubit/login_screen_cubit.dart' as _i6;
import '../features/authentication/shared/repository/user_authentication_repository.dart'
    as _i5;
import '../features/authentication/shared/service/user_authentication_service.dart'
    as _i4;
import '../util/dio_http_client.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.DioHttpClient>(_i3.DioHttpClient());
    gh.singleton<_i4.UserAuthenticationService>(
        _i4.UserAuthenticationService(gh<_i3.DioHttpClient>()));
    gh.singleton<_i5.UserAuthenticationRepository>(
        _i5.UserAuthenticationRepository(gh<_i4.UserAuthenticationService>()));
    gh.factory<_i6.LoginScreenCubit>(
        () => _i6.LoginScreenCubit(gh<_i5.UserAuthenticationRepository>()));
    return this;
  }
}
