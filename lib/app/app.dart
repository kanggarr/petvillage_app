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
import 'package:petvillage_app/ui/views/register/register_view.dart';
import 'package:petvillage_app/ui/views/home_filter/home_filter_view.dart';
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
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: HomeFilterView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
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
