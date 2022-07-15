import 'package:e_letter/Model/activity/activity_model.dart';
import 'package:e_letter/helper/database_helper.dart';
import 'package:flutter/cupertino.dart';

enum ActivityViewState { loading, succes, error }

class ActivityViewModel extends ChangeNotifier {
  List<ActivityModel> _activityModels = [];
  List<ActivityModel> get activityModels => _activityModels;

  ActivityViewState _stateType = ActivityViewState.loading;
  ActivityViewState get stateType => _stateType;

  void changeState(ActivityViewState s) {
    _stateType = s;
    notifyListeners();
  }

  Future getAllActivity() async {
    changeState(ActivityViewState.loading);
    try {
      List<ActivityModel> data =
          await DatabaseHelper.instance.readAllActivity();
      _activityModels = data;
      notifyListeners();
      changeState(ActivityViewState.succes);
    } catch (e) {
      changeState(ActivityViewState.error);
    }
  }

  Future<void> addActivity(ActivityModel activityModel) async {
    _activityModels.add(activityModel);
    await DatabaseHelper.instance.create(activityModel);
    notifyListeners();
  }
}
