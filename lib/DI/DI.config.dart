// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data_layer/api_manager/api_functions.dart' as _i3;
import '../data_layer/dataSourceContract/dataSurceContract.dart' as _i4;
import '../data_layer/dataSourceImplementation/dataSourceImplementation.dart'
    as _i5;
import '../data_layer/repository_implementation/repositoryImplementation.dart'
    as _i7;
import '../domain_layer/repository_Contract/repositoryContract.dart' as _i6;
import '../domain_layer/useCase/getProductsUseCase.dart' as _i8;
import '../presentation_layer/ui/products/productScreenViewModel.dart' as _i9;

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
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.DataSourceContract>(
        () => _i5.DataSourceImplementation(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i6.RepositoryContract>(() => _i7.RepositoryImplementation(
        dataSourceContract: gh<_i4.DataSourceContract>()));
    gh.factory<_i8.GetProductUseCase>(() => _i8.GetProductUseCase(
        repositoryContract: gh<_i6.RepositoryContract>()));
    gh.factory<_i9.ProductViewModel>(() =>
        _i9.ProductViewModel(getProductUseCase: gh<_i8.GetProductUseCase>()));
    return this;
  }
}
