// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:shared_repositories/repositories.dart';

// Singleton instance for the repository
Repository? _instance;

// Getter for the singleton instance
Repository get repository => _instance ??= _DefaultRepository._internal();

abstract class Repository {
  ProductRepository get product;
  KeywordsRepository get keywords;
  ReviewsRepository get reviews;
  CategoriesRepository get categories;
  AppMetaDataRepository get appMetaData;
  PrimaryUserRepository primaryUser(String uid);
  UserActivityRepository userActivity(String uid);
}

abstract class _RepositoryInstance {
  AppMetaDataRepository? _appMetaData;
  ProductRepository? _product;
  KeywordsRepository? _keywords;
  CategoriesRepository? _categories;
  ReviewsRepository? _reviews;
  PrimaryUserRepository? _primaryUser;
  UserActivityRepository? _userActivity;
}

// Abstract base class for the Repository
class _DefaultRepository extends _RepositoryInstance implements Repository {
  _DefaultRepository._internal();

  @override
  AppMetaDataRepository get appMetaData => _appMetaData ??= AppMetaDataRepository('en');

  @override
  ProductRepository get product => _product ??= ProductRepository();

  @override
  KeywordsRepository get keywords => _keywords ??= KeywordsRepository();

  @override
  CategoriesRepository get categories => _categories ??= CategoriesRepository('en');

  @override
  ReviewsRepository get reviews => _reviews ??= ReviewsRepository();

  @override
  PrimaryUserRepository primaryUser(uid) => (_primaryUser != null && _primaryUser!.uid == uid)
      ? _primaryUser!
      : _primaryUser = PrimaryUserRepository(uid);

  @override
  UserActivityRepository userActivity(uid) => (_userActivity != null && _userActivity!.api.uid == uid)
      ? _userActivity!
      : _userActivity = UserActivityRepository(uid: uid);
}
