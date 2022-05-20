abstract class AppStates{}

class AppInitialState extends AppStates{}


class AppCreateDatabaseState extends AppStates{}

class AppGetDatabaseState extends AppStates{}

class AppGetDatabaseLoadingState extends AppStates{}

class AppGetDatabaseSuccessState extends AppStates{}

class AppInsertDatabaseState extends AppStates{}

class AppUpdateDatabaseLoadingState extends AppStates{}

class AppUpdateDatabaseState extends AppStates{}

class AppUpdateDatabaseErrorState extends AppStates{
  final Error error;

  AppUpdateDatabaseErrorState(this.error);
}

class AppDeleteDatabaseState extends AppStates{}

class AppChangeBottomSheetState extends AppStates{}
class AppChangeBottomSheetState1 extends AppStates{}
class AppScoreState extends AppStates{}