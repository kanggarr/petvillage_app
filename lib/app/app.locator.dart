// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/auth_service.dart';
import '../services/chat_messages_service.dart';
import '../services/chat_room_service.dart';
import '../services/filter_service.dart';
import '../services/otp_service.dart';
import '../services/pet_detail_service.dart';
import '../services/post_service.dart';
import '../services/profile_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => PostService());
  locator.registerLazySingleton(() => ChatMessagesService());
  locator.registerLazySingleton(() => ChatRoomService());
  locator.registerLazySingleton(() => OtpService());
  locator.registerLazySingleton(() => FilterService());
  locator.registerLazySingleton(() => PetDetailService());
  locator.registerLazySingleton(() => ProfileService());
}
