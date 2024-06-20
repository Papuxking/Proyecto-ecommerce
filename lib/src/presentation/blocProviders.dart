// src/presentation/blocProviders.dart
import 'package:ecommerce_flutter/injection.dart';
import 'package:ecommerce_flutter/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/address/AddressUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/CategoriesUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/ProductsUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/users/UsersUseCases.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/list/bloc/AdminProductListBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/create/bloc/ClientAddressCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/create/bloc/ClientAddressCreateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/category/list/bloc/ClientCategoryListBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/detail/bloc/ClientProductDetailBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/list/bloc/ClientProductListBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/info/bloc/ProfileInfoBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/info/bloc/ProfileInfoEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/roles/bloc/RolesBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/roles/bloc/RolesEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [

  BlocProvider<LoginBloc>(create: (context) => LoginBloc(locator<AuthUseCases>())..add(InitialEvent()) ),
  BlocProvider<RegisterBloc>(create: (context) => RegisterBloc(locator<AuthUseCases>())..add(RegisterInitEvent())),
  BlocProvider<RolesBloc>(create: (context) => RolesBloc(locator<AuthUseCases>())..add(GetRolesList())),
  BlocProvider<AdminHomeBloc>(create: (context) => AdminHomeBloc(locator<AuthUseCases>())),
  BlocProvider<ProfileInfoBloc>(create: (context) => ProfileInfoBloc(locator<AuthUseCases>())..add(ProfileInfoGetUser())),
  BlocProvider<ProfileUpdateBloc>(create: (context) => ProfileUpdateBloc(locator<UsersUseCases>(), locator<AuthUseCases>())),
  BlocProvider<AdminCategoryCreateBloc>(create: (context) => AdminCategoryCreateBloc(locator<CategoriesUseCases>())..add(AdminCategoryCreateInitEvent())),
  BlocProvider<AdminCategoryListBloc>(create: (context) => AdminCategoryListBloc(locator<CategoriesUseCases>())),
  BlocProvider<AdminCategoryUpdateBloc>(create: (context) => AdminCategoryUpdateBloc(locator<CategoriesUseCases>())),
  BlocProvider<AdminProductCreateBloc>(create: (context) => AdminProductCreateBloc(locator<ProductsUseCases>())),
  BlocProvider<AdminProductListBloc>(create: (context) => AdminProductListBloc(locator<ProductsUseCases>())),
  BlocProvider<AdminCategoryUpdateBloc>(create: (context) => AdminCategoryUpdateBloc(locator<CategoriesUseCases>())),
  BlocProvider<ClientHomeBloc>(create: (context) => ClientHomeBloc(locator<AuthUseCases>())),
  BlocProvider<ClientCategoryListBloc>(create: (context) => ClientCategoryListBloc(locator<CategoriesUseCases>())),
  BlocProvider<ClientProductListBloc>(create: (context) => ClientProductListBloc(locator<ProductsUseCases>())),
  BlocProvider<ClientProductDetailBloc>(create: (context) => ClientProductDetailBloc(locator<ShoppingBagUseCases>())),
  BlocProvider<ClientShoppingBagBloc>(create: (context) => ClientShoppingBagBloc(locator<ShoppingBagUseCases>())),
  BlocProvider<ClientAddressCreateBloc>(create: (context) => ClientAddressCreateBloc(locator<AddressUseCases>(), locator<AuthUseCases>())..add(ClientAddressCreateInitEvent())),





];