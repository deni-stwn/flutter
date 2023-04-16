import 'package:e_letter/Screen/activity/activity_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<ActivityViewModel>(context, listen: false).getAllActivity();
    });
  }

  @override
  Widget build(BuildContext context) {
    final activityViewModel = Provider.of<ActivityViewModel>(context);
    return Scaffold(
        backgroundColor: const Color(0xff261865),
        appBar: AppBar(
          title: const Text('Activity'),
          elevation: 0,
          backgroundColor: const Color(0xff261865),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child:
                  Consumer<ActivityViewModel>(builder: (context, state, child) {
                if (state.stateType == ActivityViewState.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.stateType == ActivityViewState.error) {
                  return const Center(
                    child: Text('Gagal mengambil data'),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: AnimationLimiter(
                    child: ListView.builder(
                        itemCount: activityViewModel.activityModels.length,
                        itemBuilder: ((context, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: const BorderSide(
                                        color: Color(0xff261865), width: 1)),
                                child: ListTile(
                                  title: Text(activityViewModel
                                      .activityModels[index].title),
                                  subtitle: Text(activityViewModel
                                      .activityModels[index].createdDate
                                      .toString()),
                                ),
                              ),
                            ),
                          );
                        })),
                  ),
                );
              }),
            )));
  }
}
