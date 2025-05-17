import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:petvillage_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:petvillage_app/services/auth_service.dart';
import 'package:petvillage_app/services/post_service.dart';
import 'package:petvillage_app/services/chat_service.dart';
import 'package:petvillage_app/services/message_service.dart';
import 'package:petvillage_app/services/otp_service.dart';
import 'package:petvillage_app/services/filter_service.dart';
import 'package:petvillage_app/services/pet_detail_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<PostService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ChatService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<MessageService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<OtpService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FilterService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<PetDetailService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterAuthService();
  getAndRegisterPostService();
  getAndRegisterChatService();
  getAndRegisterMessageService();
  getAndRegisterOtpService();
  getAndRegisterFilterService();
  getAndRegisterPetDetailService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockAuthService getAndRegisterAuthService() {
  _removeRegistrationIfExists<AuthService>();
  final service = MockAuthService();
  locator.registerSingleton<AuthService>(service);
  return service;
}

MockPostService getAndRegisterPostService() {
  _removeRegistrationIfExists<PostService>();
  final service = MockPostService();
  locator.registerSingleton<PostService>(service);
  return service;
}

MockChatService getAndRegisterChatService() {
  _removeRegistrationIfExists<ChatService>();
  final service = MockChatService();
  locator.registerSingleton<ChatService>(service);
  return service;
}

MockMessageService getAndRegisterMessageService() {
  _removeRegistrationIfExists<MessageService>();
  final service = MockMessageService();
  locator.registerSingleton<MessageService>(service);
  return service;
}

MockOtpService getAndRegisterOtpService() {
  _removeRegistrationIfExists<OtpService>();
  final service = MockOtpService();
  locator.registerSingleton<OtpService>(service);
  return service;
}

MockFilterService getAndRegisterFilterService() {
  _removeRegistrationIfExists<FilterService>();
  final service = MockFilterService();
  locator.registerSingleton<FilterService>(service);
  return service;
}

MockPetDetailService getAndRegisterPetDetailService() {
  _removeRegistrationIfExists<PetDetailService>();
  final service = MockPetDetailService();
  locator.registerSingleton<PetDetailService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
