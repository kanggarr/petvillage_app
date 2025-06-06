// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i22;
import 'package:flutter/material.dart';
import 'package:petvillage_app/models/blog_model.dart' as _i24;
import 'package:petvillage_app/models/pet_model.dart' as _i23;
import 'package:petvillage_app/ui/views/blog/blog_view.dart' as _i4;
import 'package:petvillage_app/ui/views/blog_detail/blog_detail_view.dart'
    as _i18;
import 'package:petvillage_app/ui/views/chat_room/chat_room_view.dart' as _i20;
import 'package:petvillage_app/ui/views/favorite/favorite_view.dart' as _i19;
import 'package:petvillage_app/ui/views/forgot_password/forgot_password_view.dart'
    as _i17;
import 'package:petvillage_app/ui/views/home/home_view.dart' as _i8;
import 'package:petvillage_app/ui/views/home_filter/home_filter_view.dart'
    as _i9;
import 'package:petvillage_app/ui/views/login/login_view.dart' as _i13;
import 'package:petvillage_app/ui/views/main/main_view.dart' as _i3;
import 'package:petvillage_app/ui/views/message/message_view.dart' as _i6;
import 'package:petvillage_app/ui/views/otp/otp_view.dart' as _i15;
import 'package:petvillage_app/ui/views/pet_detail/pet_detail_view.dart'
    as _i11;
import 'package:petvillage_app/ui/views/post/post_view.dart' as _i5;
import 'package:petvillage_app/ui/views/profile/profile_view.dart' as _i7;
import 'package:petvillage_app/ui/views/profile_edit/profile_edit_view.dart'
    as _i10;
import 'package:petvillage_app/ui/views/register/register_view.dart' as _i14;
import 'package:petvillage_app/ui/views/shop_profile/shop_profile_view.dart'
    as _i21;
import 'package:petvillage_app/ui/views/shop_register/shop_register_view.dart'
    as _i16;
import 'package:petvillage_app/ui/views/splash_page1/splash_page1_view.dart'
    as _i12;
import 'package:petvillage_app/ui/views/startup/startup_view.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i25;

class Routes {
  static const startupView = '/startup-view';

  static const mainView = '/main-view';

  static const blogView = '/blog-view';

  static const postView = '/post-view';

  static const messageView = '/message-view';

  static const profileView = '/profile-view';

  static const homeView = '/home-view';

  static const homeFilterView = '/home-filter-view';

  static const profileEditView = '/profile-edit-view';

  static const petDetailView = '/pet-detail-view';

  static const splashPage1View = '/splash-page1-view';

  static const loginView = '/login-view';

  static const registerView = '/register-view';

  static const otpView = '/otp-view';

  static const shopRegisterView = '/shop-register-view';

  static const forgotPasswordView = '/forgot-password-view';

  static const blogDetailView = '/blog-detail-view';

  static const favoriteView = '/favorite-view';

  static const chatRoomView = '/chat-room-view';

  static const shopProfileView = '/shop-profile-view';

  static const all = <String>{
    startupView,
    mainView,
    blogView,
    postView,
    messageView,
    profileView,
    homeView,
    homeFilterView,
    profileEditView,
    petDetailView,
    splashPage1View,
    loginView,
    registerView,
    otpView,
    shopRegisterView,
    forgotPasswordView,
    blogDetailView,
    favoriteView,
    chatRoomView,
    shopProfileView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.mainView,
      page: _i3.MainView,
    ),
    _i1.RouteDef(
      Routes.blogView,
      page: _i4.BlogView,
    ),
    _i1.RouteDef(
      Routes.postView,
      page: _i5.PostView,
    ),
    _i1.RouteDef(
      Routes.messageView,
      page: _i6.MessageView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i7.ProfileView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i8.HomeView,
    ),
    _i1.RouteDef(
      Routes.homeFilterView,
      page: _i9.HomeFilterView,
    ),
    _i1.RouteDef(
      Routes.profileEditView,
      page: _i10.ProfileEditView,
    ),
    _i1.RouteDef(
      Routes.petDetailView,
      page: _i11.PetDetailView,
    ),
    _i1.RouteDef(
      Routes.splashPage1View,
      page: _i12.SplashPage1View,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i13.LoginView,
    ),
    _i1.RouteDef(
      Routes.registerView,
      page: _i14.RegisterView,
    ),
    _i1.RouteDef(
      Routes.otpView,
      page: _i15.OtpView,
    ),
    _i1.RouteDef(
      Routes.shopRegisterView,
      page: _i16.ShopRegisterView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordView,
      page: _i17.ForgotPasswordView,
    ),
    _i1.RouteDef(
      Routes.blogDetailView,
      page: _i18.BlogDetailView,
    ),
    _i1.RouteDef(
      Routes.favoriteView,
      page: _i19.FavoriteView,
    ),
    _i1.RouteDef(
      Routes.chatRoomView,
      page: _i20.ChatRoomView,
    ),
    _i1.RouteDef(
      Routes.shopProfileView,
      page: _i21.ShopProfileView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.MainView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.MainView(),
        settings: data,
      );
    },
    _i4.BlogView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.BlogView(),
        settings: data,
      );
    },
    _i5.PostView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.PostView(),
        settings: data,
      );
    },
    _i6.MessageView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.MessageView(),
        settings: data,
      );
    },
    _i7.ProfileView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ProfileView(),
        settings: data,
      );
    },
    _i8.HomeView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.HomeView(),
        settings: data,
      );
    },
    _i9.HomeFilterView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.HomeFilterView(),
        settings: data,
      );
    },
    _i10.ProfileEditView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.ProfileEditView(),
        settings: data,
      );
    },
    _i11.PetDetailView: (data) {
      final args = data.getArgs<PetDetailViewArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i11.PetDetailView(key: args.key, petModel: args.petModel),
        settings: data,
      );
    },
    _i12.SplashPage1View: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.SplashPage1View(),
        settings: data,
      );
    },
    _i13.LoginView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.LoginView(),
        settings: data,
      );
    },
    _i14.RegisterView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.RegisterView(),
        settings: data,
      );
    },
    _i15.OtpView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.OtpView(),
        settings: data,
      );
    },
    _i16.ShopRegisterView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.ShopRegisterView(),
        settings: data,
      );
    },
    _i17.ForgotPasswordView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.ForgotPasswordView(),
        settings: data,
      );
    },
    _i18.BlogDetailView: (data) {
      final args = data.getArgs<BlogDetailViewArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i18.BlogDetailView(key: args.key, blogModel: args.blogModel),
        settings: data,
      );
    },
    _i19.FavoriteView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.FavoriteView(),
        settings: data,
      );
    },
    _i20.ChatRoomView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.ChatRoomView(),
        settings: data,
      );
    },
    _i21.ShopProfileView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i21.ShopProfileView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class PetDetailViewArguments {
  const PetDetailViewArguments({
    this.key,
    required this.petModel,
  });

  final _i22.Key? key;

  final _i23.PetModel petModel;

  @override
  String toString() {
    return '{"key": "$key", "petModel": "$petModel"}';
  }

  @override
  bool operator ==(covariant PetDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.petModel == petModel;
  }

  @override
  int get hashCode {
    return key.hashCode ^ petModel.hashCode;
  }
}

class BlogDetailViewArguments {
  const BlogDetailViewArguments({
    this.key,
    required this.blogModel,
  });

  final _i22.Key? key;

  final _i24.BlogModel blogModel;

  @override
  String toString() {
    return '{"key": "$key", "blogModel": "$blogModel"}';
  }

  @override
  bool operator ==(covariant BlogDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.blogModel == blogModel;
  }

  @override
  int get hashCode {
    return key.hashCode ^ blogModel.hashCode;
  }
}

extension NavigatorStateExtension on _i25.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBlogView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.blogView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPostView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.postView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMessageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.messageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeFilterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeFilterView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileEditView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileEditView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPetDetailView({
    _i22.Key? key,
    required _i23.PetModel petModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.petDetailView,
        arguments: PetDetailViewArguments(key: key, petModel: petModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSplashPage1View([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashPage1View,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOtpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.otpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToShopRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.shopRegisterView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBlogDetailView({
    _i22.Key? key,
    required _i24.BlogModel blogModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.blogDetailView,
        arguments: BlogDetailViewArguments(key: key, blogModel: blogModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFavoriteView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.favoriteView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatRoomView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.chatRoomView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToShopProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.shopProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBlogView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.blogView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPostView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.postView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMessageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.messageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeFilterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeFilterView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileEditView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileEditView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPetDetailView({
    _i22.Key? key,
    required _i23.PetModel petModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.petDetailView,
        arguments: PetDetailViewArguments(key: key, petModel: petModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashPage1View([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashPage1View,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOtpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.otpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithShopRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.shopRegisterView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBlogDetailView({
    _i22.Key? key,
    required _i24.BlogModel blogModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.blogDetailView,
        arguments: BlogDetailViewArguments(key: key, blogModel: blogModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFavoriteView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.favoriteView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatRoomView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.chatRoomView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithShopProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.shopProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
