// src/di/AppModule.dart
import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/CategoriesService.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/ProductsService.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/UsersService.dart';
import 'package:ecommerce_flutter/src/data/repository/AuthRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:ecommerce_flutter/src/data/repository/CategoriesRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/repository/UsersRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/CategoriesRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/ProductsRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/UsersRepository.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/CategoriesUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/CreateCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/DeleteCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/GetCategoriesUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/UpdateCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/CreateProductUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/users/UpdateUserUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/users/UsersUseCases.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule{
//inyección de dependencias

@injectable
  Future<String> get token async {
    String token = "";
    final userSession = await sharedPref.read('user');
    if (userSession != null) {
      AuthResponse authResponse = AuthResponse.fromJson(userSession);
      token = authResponse.token;
    }
    return token;
  }

  @injectable
  AuthService get authService => AuthService();

  @injectable
  UsersService get usersService => UsersService(token);

  @injectable
  UsersRepository get usersRepository => UsersRepositoryImpl(usersService);

 @injectable
  CategoriesService get categoriesService => CategoriesService(token);

  @injectable
  ProductsService get productsService => ProductsService(token);

  @injectable
  ProductsRepository get productsRepository => ProductsRepositoryImpl(productsService);

  @injectable
  SharedPref get sharedPref => SharedPref();

@injectable
  CategoriesRepository get categoriesRepository => CategoriesRepositoryImpl(categoriesService);

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService, sharedPref);

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
    login: LoginUseCase(authRepository),
    register: RegisterUseCase(authRepository),
    saveUserSession: SaveUserSessionUseCase(authRepository),
    getUserSession: GetUserSessionUseCase(authRepository),
    logout: LogoutUseCase(authRepository)
  );

  @injectable
  UsersUseCases get usersUseCases => UsersUseCases(
    updateUser: UpdateUserUseCase(usersRepository)
  );

  @injectable
  CategoriesUseCases get categoriesUseCases => CategoriesUseCases(
    create: CreateCategoryUseCase(categoriesRepository),
    getCategories: GetCategoriesUseCase(categoriesRepository),
    update: UpdateCategoryUseCase(categoriesRepository),
    delete: DeleteCategoryUseCase(categoriesRepository)
  );

  @injectable
   ProductsUseCases get productsUseCases => ProductsUseCases(
    create: CreateProductUseCase(productsRepository),
    getProductsByCategory: GetProductsByCategoryUseCase(productsRepository),
    update: UpdateProductUseCase(productsRepository),
    delete: DeleteProductUseCase(productsRepository)
  );

}