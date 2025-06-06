// Mocks generated by Mockito 5.4.4 from annotations
// in petvillage_app/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:io' as _i11;
import 'dart:ui' as _i8;

import 'package:flutter/material.dart' as _i6;
import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i5;
import 'package:petvillage_app/models/animal_type_model.dart' as _i17;
import 'package:petvillage_app/models/breeds_model.dart' as _i18;
import 'package:petvillage_app/models/chat_room_model.dart' as _i3;
import 'package:petvillage_app/services/auth_service.dart' as _i9;
import 'package:petvillage_app/services/chat_messages_service.dart' as _i13;
import 'package:petvillage_app/services/chat_room_service.dart' as _i12;
import 'package:petvillage_app/services/filter_service.dart' as _i15;
import 'package:petvillage_app/services/otp_service.dart' as _i14;
import 'package:petvillage_app/services/pet_detail_service.dart' as _i16;
import 'package:petvillage_app/services/post_service.dart' as _i10;
import 'package:petvillage_app/services/profile_service.dart' as _i15;
import 'package:stacked_services/stacked_services.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeStreamedResponse_0 extends _i1.SmartFake
    implements _i2.StreamedResponse {
  _FakeStreamedResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeChatRoom_1 extends _i1.SmartFake implements _i3.ChatRoom {
  _FakeChatRoom_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i4.NavigationService {
  @override
  String get previousRoute => (super.noSuchMethod(
        Invocation.getter(#previousRoute),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#previousRoute),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
          this,
          Invocation.getter(#previousRoute),
        ),
      ) as String);

  @override
  String get currentRoute => (super.noSuchMethod(
        Invocation.getter(#currentRoute),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#currentRoute),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
          this,
          Invocation.getter(#currentRoute),
        ),
      ) as String);

  @override
  _i6.GlobalKey<_i6.NavigatorState>? nestedNavigationKey(int? index) =>
      (super.noSuchMethod(
        Invocation.method(
          #nestedNavigationKey,
          [index],
        ),
        returnValueForMissingStub: null,
      ) as _i6.GlobalKey<_i6.NavigatorState>?);

  @override
  void config({
    bool? enableLog,
    bool? defaultPopGesture,
    bool? defaultOpaqueRoute,
    Duration? defaultDurationTransition,
    bool? defaultGlobalState,
    _i4.Transition? defaultTransitionStyle,
    String? defaultTransition,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #config,
          [],
          {
            #enableLog: enableLog,
            #defaultPopGesture: defaultPopGesture,
            #defaultOpaqueRoute: defaultOpaqueRoute,
            #defaultDurationTransition: defaultDurationTransition,
            #defaultGlobalState: defaultGlobalState,
            #defaultTransitionStyle: defaultTransitionStyle,
            #defaultTransition: defaultTransition,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.Future<T?>? navigateWithTransition<T>(
    _i6.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i6.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i4.Transition? transitionClass,
    _i4.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);

  @override
  _i7.Future<T?>? replaceWithTransition<T>(
    _i6.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i6.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i4.Transition? transitionClass,
    _i4.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);

  @override
  bool back<T>({
    dynamic result,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #back,
          [],
          {
            #result: result,
            #id: id,
          },
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  void popUntil(
    _i6.RoutePredicate? predicate, {
    int? id,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
          {#id: id},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void popRepeated(int? popTimes) => super.noSuchMethod(
        Invocation.method(
          #popRepeated,
          [popTimes],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.Future<T?>? navigateTo<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i6.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateTo,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);

  @override
  _i7.Future<T?>? navigateToView<T>(
    _i6.Widget? view, {
    dynamic arguments,
    int? id,
    bool? opaque,
    _i6.Curve? curve,
    Duration? duration,
    bool? fullscreenDialog = false,
    bool? popGesture,
    bool? preventDuplicates = true,
    _i4.Transition? transition,
    _i4.Transition? transitionStyle,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateToView,
          [view],
          {
            #arguments: arguments,
            #id: id,
            #opaque: opaque,
            #curve: curve,
            #duration: duration,
            #fullscreenDialog: fullscreenDialog,
            #popGesture: popGesture,
            #preventDuplicates: preventDuplicates,
            #transition: transition,
            #transitionStyle: transitionStyle,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);

  @override
  _i7.Future<T?>? replaceWith<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i6.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWith,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);

  @override
  _i7.Future<T?>? clearStackAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);

  @override
  _i7.Future<T?>? clearStackAndShowView<T>(
    _i6.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);

  @override
  _i7.Future<T?>? clearTillFirstAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);

  @override
  _i7.Future<T?>? clearTillFirstAndShowView<T>(
    _i6.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);

  @override
  _i7.Future<T?>? pushNamedAndRemoveUntil<T>(
    String? routeName, {
    _i6.RoutePredicate? predicate,
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamedAndRemoveUntil,
          [routeName],
          {
            #predicate: predicate,
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
}

/// A class which mocks [BottomSheetService].
///
/// See the documentation for Mockito's code generation for more information.
class MockBottomSheetService extends _i1.Mock
    implements _i4.BottomSheetService {
  @override
  void setCustomSheetBuilders(Map<dynamic, _i4.SheetBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #setCustomSheetBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.Future<_i4.SheetResponse<dynamic>?> showBottomSheet({
    required String? title,
    String? description,
    String? confirmButtonTitle = r'Ok',
    String? cancelButtonTitle,
    bool? enableDrag = true,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
    double? elevation = 1.0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showBottomSheet,
          [],
          {
            #title: title,
            #description: description,
            #confirmButtonTitle: confirmButtonTitle,
            #cancelButtonTitle: cancelButtonTitle,
            #enableDrag: enableDrag,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
            #elevation: elevation,
          },
        ),
        returnValue: _i7.Future<_i4.SheetResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i7.Future<_i4.SheetResponse<dynamic>?>.value(),
      ) as _i7.Future<_i4.SheetResponse<dynamic>?>);

  @override
  _i7.Future<_i4.SheetResponse<T>?> showCustomSheet<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i8.Color? barrierColor = const _i8.Color(2315255808),
    double? elevation = 1.0,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
    bool? enableDrag = true,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSheet,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #elevation: elevation,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
            #enableDrag: enableDrag,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i7.Future<_i4.SheetResponse<T>?>.value(),
        returnValueForMissingStub: _i7.Future<_i4.SheetResponse<T>?>.value(),
      ) as _i7.Future<_i4.SheetResponse<T>?>);

  @override
  void completeSheet(_i4.SheetResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeSheet,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i4.DialogService {
  @override
  void registerCustomDialogBuilders(
          Map<dynamic, _i4.DialogBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void registerCustomDialogBuilder({
    required dynamic variant,
    required _i6.Widget Function(
      _i6.BuildContext,
      _i4.DialogRequest<dynamic>,
      dynamic Function(_i4.DialogResponse<dynamic>),
    )? builder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilder,
          [],
          {
            #variant: variant,
            #builder: builder,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.Future<_i4.DialogResponse<dynamic>?> showDialog({
    String? title,
    String? description,
    String? cancelTitle,
    _i8.Color? cancelTitleColor,
    String? buttonTitle = r'Ok',
    _i8.Color? buttonTitleColor,
    bool? barrierDismissible = false,
    _i6.RouteSettings? routeSettings,
    _i6.GlobalKey<_i6.NavigatorState>? navigatorKey,
    _i4.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #buttonTitle: buttonTitle,
            #buttonTitleColor: buttonTitleColor,
            #barrierDismissible: barrierDismissible,
            #routeSettings: routeSettings,
            #navigatorKey: navigatorKey,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i7.Future<_i4.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i7.Future<_i4.DialogResponse<dynamic>?>.value(),
      ) as _i7.Future<_i4.DialogResponse<dynamic>?>);

  @override
  _i7.Future<_i4.DialogResponse<T>?> showCustomDialog<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i8.Color? barrierColor = const _i8.Color(2315255808),
    bool? barrierDismissible = false,
    String? barrierLabel = r'',
    bool? useSafeArea = true,
    _i6.RouteSettings? routeSettings,
    _i6.GlobalKey<_i6.NavigatorState>? navigatorKey,
    _i6.RouteTransitionsBuilder? transitionBuilder,
    dynamic customData,
    R? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomDialog,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #barrierLabel: barrierLabel,
            #useSafeArea: useSafeArea,
            #routeSettings: routeSettings,
            #navigatorKey: navigatorKey,
            #transitionBuilder: transitionBuilder,
            #customData: customData,
            #data: data,
          },
        ),
        returnValue: _i7.Future<_i4.DialogResponse<T>?>.value(),
        returnValueForMissingStub: _i7.Future<_i4.DialogResponse<T>?>.value(),
      ) as _i7.Future<_i4.DialogResponse<T>?>);

  @override
  _i7.Future<_i4.DialogResponse<dynamic>?> showConfirmationDialog({
    String? title,
    String? description,
    String? cancelTitle = r'Cancel',
    _i8.Color? cancelTitleColor,
    String? confirmationTitle = r'Ok',
    _i8.Color? confirmationTitleColor,
    bool? barrierDismissible = false,
    _i6.RouteSettings? routeSettings,
    _i4.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showConfirmationDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #confirmationTitle: confirmationTitle,
            #confirmationTitleColor: confirmationTitleColor,
            #barrierDismissible: barrierDismissible,
            #routeSettings: routeSettings,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i7.Future<_i4.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i7.Future<_i4.DialogResponse<dynamic>?>.value(),
      ) as _i7.Future<_i4.DialogResponse<dynamic>?>);

  @override
  void completeDialog(_i4.DialogResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeDialog,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [AuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthService extends _i1.Mock implements _i9.AuthService {
  @override
  void setUserSession({
    required String? userId,
    required String? username,
    required String? userRole,
    required String? token,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #setUserSession,
          [],
          {
            #userId: userId,
            #username: username,
            #userRole: userRole,
            #token: token,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setRoomId(String? roomId) => super.noSuchMethod(
        Invocation.method(
          #setRoomId,
          [roomId],
        ),
        returnValueForMissingStub: null,
      );

  @override
  String getRoomId() => (super.noSuchMethod(
        Invocation.method(
          #getRoomId,
          [],
        ),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.method(
            #getRoomId,
            [],
          ),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
          this,
          Invocation.method(
            #getRoomId,
            [],
          ),
        ),
      ) as String);

  @override
  String getUserId() => (super.noSuchMethod(
        Invocation.method(
          #getUserId,
          [],
        ),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.method(
            #getUserId,
            [],
          ),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
          this,
          Invocation.method(
            #getUserId,
            [],
          ),
        ),
      ) as String);

  @override
  String getToken() => (super.noSuchMethod(
        Invocation.method(
          #getToken,
          [],
        ),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.method(
            #getToken,
            [],
          ),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
          this,
          Invocation.method(
            #getToken,
            [],
          ),
        ),
      ) as String);

  @override
  String getUserRole() => (super.noSuchMethod(
        Invocation.method(
          #getUserRole,
          [],
        ),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.method(
            #getUserRole,
            [],
          ),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
          this,
          Invocation.method(
            #getUserRole,
            [],
          ),
        ),
      ) as String);

  @override
  _i7.Future<void> registerUser({
    required String? username,
    required String? email,
    required String? password,
    required Function? onSuccess,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #registerUser,
          [],
          {
            #username: username,
            #email: email,
            #password: password,
            #onSuccess: onSuccess,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> login({
    required String? email,
    required String? password,
    required Function? onSuccess,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [],
          {
            #email: email,
            #password: password,
            #onSuccess: onSuccess,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> registerShop({
    required String? shopName,
    required String? email,
    required String? password,
    required String? address,
    required String? province,
    required String? district,
    required String? subdistrict,
    required String? imagePath,
    required dynamic Function(
      bool,
      String?,
    )? onResult,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #registerShop,
          [],
          {
            #shopName: shopName,
            #email: email,
            #password: password,
            #address: address,
            #province: province,
            #district: district,
            #subdistrict: subdistrict,
            #imagePath: imagePath,
            #onResult: onResult,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
}

/// A class which mocks [PostService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPostService extends _i1.Mock implements _i10.PostService {
  @override
  _i7.Future<_i2.StreamedResponse> postBlog(
    String? title,
    String? description,
    List<_i11.File>? images,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #postBlog,
          [
            title,
            description,
            images,
          ],
        ),
        returnValue:
            _i7.Future<_i2.StreamedResponse>.value(_FakeStreamedResponse_0(
          this,
          Invocation.method(
            #postBlog,
            [
              title,
              description,
              images,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i2.StreamedResponse>.value(_FakeStreamedResponse_0(
          this,
          Invocation.method(
            #postBlog,
            [
              title,
              description,
              images,
            ],
          ),
        )),
      ) as _i7.Future<_i2.StreamedResponse>);

  @override
  _i7.Future<_i2.StreamedResponse> postPet(
    String? petName,
    String? petType,
    String? petBreed,
    String? gender,
    String? age,
    String? description,
    String? price,
    bool? isAdopt,
    String? address,
    String? province,
    String? district,
    String? subDistrict,
    String? shipping,
    List<_i11.File>? images,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #postPet,
          [
            petName,
            petType,
            petBreed,
            gender,
            age,
            description,
            price,
            isAdopt,
            address,
            province,
            district,
            subDistrict,
            shipping,
            images,
          ],
        ),
        returnValue:
            _i7.Future<_i2.StreamedResponse>.value(_FakeStreamedResponse_0(
          this,
          Invocation.method(
            #postPet,
            [
              petName,
              petType,
              petBreed,
              gender,
              age,
              description,
              price,
              isAdopt,
              address,
              province,
              district,
              subDistrict,
              shipping,
              images,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i2.StreamedResponse>.value(_FakeStreamedResponse_0(
          this,
          Invocation.method(
            #postPet,
            [
              petName,
              petType,
              petBreed,
              gender,
              age,
              description,
              price,
              isAdopt,
              address,
              province,
              district,
              subDistrict,
              shipping,
              images,
            ],
          ),
        )),
      ) as _i7.Future<_i2.StreamedResponse>);
}

/// A class which mocks [ChatRoomService].
///
/// See the documentation for Mockito's code generation for more information.
class MockChatRoomService extends _i1.Mock implements _i12.ChatRoomService {
  @override
  _i7.Future<List<_i3.ChatRoom>> getUserRooms() => (super.noSuchMethod(
        Invocation.method(
          #getUserRooms,
          [],
        ),
        returnValue: _i7.Future<List<_i3.ChatRoom>>.value(<_i3.ChatRoom>[]),
        returnValueForMissingStub:
            _i7.Future<List<_i3.ChatRoom>>.value(<_i3.ChatRoom>[]),
      ) as _i7.Future<List<_i3.ChatRoom>>);

  @override
  _i7.Future<_i3.ChatRoom> createRoom({
    required String? userId,
    required String? shopId,
    String? roomName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createRoom,
          [],
          {
            #userId: userId,
            #shopId: shopId,
            #roomName: roomName,
          },
        ),
        returnValue: _i7.Future<_i3.ChatRoom>.value(_FakeChatRoom_1(
          this,
          Invocation.method(
            #createRoom,
            [],
            {
              #userId: userId,
              #shopId: shopId,
              #roomName: roomName,
            },
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i3.ChatRoom>.value(_FakeChatRoom_1(
          this,
          Invocation.method(
            #createRoom,
            [],
            {
              #userId: userId,
              #shopId: shopId,
              #roomName: roomName,
            },
          ),
        )),
      ) as _i7.Future<_i3.ChatRoom>);

  @override
  _i7.Future<_i3.ChatRoom> getRoomById(String? roomId) => (super.noSuchMethod(
        Invocation.method(
          #getRoomById,
          [roomId],
        ),
        returnValue: _i7.Future<_i3.ChatRoom>.value(_FakeChatRoom_1(
          this,
          Invocation.method(
            #getRoomById,
            [roomId],
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i3.ChatRoom>.value(_FakeChatRoom_1(
          this,
          Invocation.method(
            #getRoomById,
            [roomId],
          ),
        )),
      ) as _i7.Future<_i3.ChatRoom>);
}

/// A class which mocks [ChatMessagesService].
///
/// See the documentation for Mockito's code generation for more information.
class MockChatMessagesService extends _i1.Mock
    implements _i13.ChatMessagesService {
  @override
  _i7.Future<List<Map<String, dynamic>>> fetchMessages({
    int? page = 1,
    int? limit = 50,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchMessages,
          [],
          {
            #page: page,
            #limit: limit,
          },
        ),
        returnValue: _i7.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
        returnValueForMissingStub: _i7.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i7.Future<List<Map<String, dynamic>>>);

  @override
  _i7.Future<Map<String, dynamic>> sendMessage(String? content) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendMessage,
          [content],
        ),
        returnValue:
            _i7.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
        returnValueForMissingStub:
            _i7.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i7.Future<Map<String, dynamic>>);

  @override
  _i7.Future<void> markAsRead() => (super.noSuchMethod(
        Invocation.method(
          #markAsRead,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> deleteMessage(String? messageId) => (super.noSuchMethod(
        Invocation.method(
          #deleteMessage,
          [messageId],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  void connectSocket(dynamic Function(Map<String, dynamic>)? onMessage) =>
      super.noSuchMethod(
        Invocation.method(
          #connectSocket,
          [onMessage],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void disconnectSocket() => super.noSuchMethod(
        Invocation.method(
          #disconnectSocket,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [OtpService].
///
/// See the documentation for Mockito's code generation for more information.
class MockOtpService extends _i1.Mock implements _i14.OtpService {
  @override
  _i7.Future<void> verifyOtp({
    required String? email,
    required String? otp,
    required Function? onSuccess,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyOtp,
          [],
          {
            #email: email,
            #otp: otp,
            #onSuccess: onSuccess,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> resendOtp({required String? email}) => (super.noSuchMethod(
        Invocation.method(
          #resendOtp,
          [],
          {#email: email},
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
}

/// A class which mocks [FilterService].
///
/// See the documentation for Mockito's code generation for more information.
class MockFilterService extends _i1.Mock implements _i15.FilterService {}

/// A class which mocks [PetDetailService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPetDetailService extends _i1.Mock implements _i16.PetDetailService {
  @override
  _i7.Future<List<_i17.AnimalTypeModel>> getAnimalTypes() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAnimalTypes,
          [],
        ),
        returnValue: _i7.Future<List<_i17.AnimalTypeModel>>.value(
            <_i17.AnimalTypeModel>[]),
        returnValueForMissingStub: _i7.Future<List<_i17.AnimalTypeModel>>.value(
            <_i17.AnimalTypeModel>[]),
      ) as _i7.Future<List<_i17.AnimalTypeModel>>);

  @override
  _i7.Future<List<_i18.Breed>> getBreedByType(String? type) =>
      (super.noSuchMethod(
        Invocation.method(
          #getBreedByType,
          [type],
        ),
        returnValue: _i7.Future<List<_i18.Breed>>.value(<_i18.Breed>[]),
        returnValueForMissingStub:
            _i7.Future<List<_i18.Breed>>.value(<_i18.Breed>[]),
      ) as _i7.Future<List<_i18.Breed>>);
}
