import 'package:petvillage_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:petvillage_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:petvillage_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:petvillage_app/ui/views/main/main_view.dart';
import 'package:petvillage_app/ui/views/blog/blog_view.dart';
import 'package:petvillage_app/ui/views/post/post_view.dart';
import 'package:petvillage_app/ui/views/message/message_view.dart';
import 'package:petvillage_app/ui/views/profile/profile_view.dart';
import 'package:petvillage_app/ui/views/home/home_view.dart';
import 'package:petvillage_app/ui/views/home_filter/home_filter_view.dart';
import 'package:petvillage_app/ui/views/profile_edit/profile_edit_view.dart';
import 'package:petvillage_app/ui/views/pet_detail/pet_detail_view.dart';
import 'package:petvillage_app/ui/views/splash_page1/splash_page1_view.dart';
import 'package:petvillage_app/ui/views/login/login_view.dart';
import 'package:petvillage_app/ui/views/register/register_view.dart';
import 'package:petvillage_app/ui/views/otp/otp_view.dart';
import 'package:petvillage_app/ui/views/shop_register/shop_register_view.dart';
import 'package:petvillage_app/ui/views/forgot_password/forgot_password_view.dart';
import 'package:petvillage_app/ui/views/blog_detail/blog_detail_view.dart';
import 'package:petvillage_app/services/auth_service.dart';
import 'package:petvillage_app/ui/views/favorite/favorite_view.dart';
import 'package:petvillage_app/services/post_service.dart';
import 'package:petvillage_app/services/chat_messages_service.dart';
import 'package:petvillage_app/services/chat_room_service.dart';
import 'package:petvillage_app/services/otp_service.dart';
import 'package:petvillage_app/services/filter_service.dart';
import 'package:petvillage_app/services/pet_detail_service.dart';
import 'package:petvillage_app/ui/views/chat_room/chat_room_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: MainView),
    MaterialRoute(page: BlogView),
    MaterialRoute(page: PostView),
    MaterialRoute(page: MessageView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: HomeFilterView),
    MaterialRoute(page: ProfileEditView),
    MaterialRoute(page: PetDetailView),
    MaterialRoute(page: SplashPage1View),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: OtpView),
    MaterialRoute(page: ShopRegisterView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: BlogDetailView),
    MaterialRoute(page: FavoriteView),
    MaterialRoute(page: ChatRoomView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: PostService),
    LazySingleton(classType: ChatMessagesService),
    LazySingleton(classType: ChatRoomService),
    LazySingleton(classType: OtpService),
    LazySingleton(classType: FilterService),
    LazySingleton(classType: PetDetailService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
