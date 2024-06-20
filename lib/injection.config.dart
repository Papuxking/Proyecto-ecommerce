// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart'
    as _i9;
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart'
    as _i3;
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/CategoriesService.dart'
    as _i6;
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/ProductsService.dart'
    as _i7;
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/UsersService.dart'
    as _i4;
import 'package:ecommerce_flutter/src/di/AppModule.dart' as _i18;
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart'
    as _i11;
import 'package:ecommerce_flutter/src/domain/repository/CategoriesRepository.dart'
    as _i10;
import 'package:ecommerce_flutter/src/domain/repository/ProductsRepository.dart'
    as _i8;
import 'package:ecommerce_flutter/src/domain/repository/ShoppingBagRepository.dart'
    as _i14;
import 'package:ecommerce_flutter/src/domain/repository/UsersRepository.dart'
    as _i5;
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart'
    as _i12;
import 'package:ecommerce_flutter/src/domain/useCases/categories/CategoriesUseCases.dart'
    as _i15;
import 'package:ecommerce_flutter/src/domain/useCases/products/ProductsUseCases.dart'
    as _i16;
import 'package:ecommerce_flutter/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart'
    as _i17;
import 'package:ecommerce_flutter/src/domain/useCases/users/UsersUseCases.dart'
    as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

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
    final appModule = _$AppModule();
    gh.factoryAsync<String>(() => appModule.token);
    gh.factory<_i3.AuthService>(() => appModule.authService);
    gh.factory<_i4.UsersService>(() => appModule.usersService);
    gh.factory<_i5.UsersRepository>(() => appModule.usersRepository);
    gh.factory<_i6.CategoriesService>(() => appModule.categoriesService);
    gh.factory<_i7.ProductsService>(() => appModule.productsService);
    gh.factory<_i8.ProductsRepository>(() => appModule.productsRepository);
    gh.factory<_i9.SharedPref>(() => appModule.sharedPref);
    gh.factory<_i10.CategoriesRepository>(() => appModule.categoriesRepository);
    gh.factory<_i11.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i12.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i13.UsersUseCases>(() => appModule.usersUseCases);
    gh.factory<_i14.ShoppingBagRepository>(
        () => appModule.shoppingBagRepository);
    gh.factory<_i15.CategoriesUseCases>(() => appModule.categoriesUseCases);
    gh.factory<_i16.ProductsUseCases>(() => appModule.productsUseCases);
    gh.factory<_i17.ShoppingBagUseCases>(() => appModule.shoppingBagUseCases);
    return this;
  }
}

class _$AppModule extends _i18.AppModule {}
