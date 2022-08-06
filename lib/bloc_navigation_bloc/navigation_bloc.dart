
import 'package:bloc/bloc.dart';
import '../thrown_pages/management_thrown_page.dart';
import '../thrown_pages/care_assistants_thrown_page.dart';
import '../thrown_pages/nurses_thrown_page.dart';
import '../thrown_pages/non_clinical_staff_thrown_page.dart';

enum NavigationEvents {
  myCareAssistantsPageClickedEvent,
  myNursesPageClickedEvent,
  myNCStaffPageClickedEvent,
  myManagementBodyPageClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {

  NavigationBloc() : super(MyCareAssistantsPage());

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.myCareAssistantsPageClickedEvent:
        yield MyCareAssistantsPage();
        break;
      case NavigationEvents.myNursesPageClickedEvent:
        yield MyNursesPage();
        break;
      case NavigationEvents.myNCStaffPageClickedEvent:
        yield MyNCStaffPage();
        break;
      case NavigationEvents.myManagementBodyPageClickedEvent:
        yield MyManagementBodyPage();
        break;
    }
  }


}
