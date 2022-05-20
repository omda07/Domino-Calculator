import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:domino/views/widgets/build_item.dart';
import 'package:domino/views/widgets/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/cubit.dart';
import '../controller/states.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AppCubit()..getDataFromDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title:const Text('Domino Calculator'),
              actions: [
                IconButton(
                    onPressed: () {
                      cubit.getDataFromDatabase();
                    },
                    icon:const Icon(Icons.refresh_outlined))
              ],
            ),
            key: scaffoldKey,
            body: SizedBox(
              height: media.height,
              width: media.width,
              child: ConditionalBuilder(
                condition: state is! AppGetDatabaseLoadingState,
                builder: (context) {
                  return Stack(
                    children: [
                      gameBuilder(
                        game: cubit.games,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(

                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                            Expanded(
                              child: ElevatedButton(

                                onPressed: (){
                                if (cubit.isBottomSheetShown) {


                                } else {
                                  scaffoldKey.currentState!
                                      .showBottomSheet(
                                        (context) {
                                      return Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(
                                          20.0,
                                        ),
                                        child: Form(
                                          key: formKey,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CustomTextFormFields(
                                                  controller: cubit.firstName,
                                                  myLabelText: 'First Name',
                                                  validate: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'First Name Must Be Not Empty';
                                                    }
                                                    return null;
                                                  }),
                                              const SizedBox(
                                                height: 15.0,
                                              ),
                                              CustomTextFormFields(
                                                  controller: cubit.secondName,
                                                  myLabelText: 'Second Name',
                                                  validate: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Second Name Must Be Not Empty';
                                                    }
                                                    return null;
                                                  }),
                                              const SizedBox(
                                                height: 15.0,
                                              ),
                                              CustomTextFormFields(
                                                  controller: cubit.thirdName,
                                                  myLabelText: 'Third Name',
                                                  validate: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Third Name Must Be Not Empty';
                                                    }
                                                    return null;
                                                  }),
                                              const SizedBox(
                                                height: 15.0,
                                              ),
                                              CustomTextFormFields(
                                                  controller: cubit.fourthName,
                                                  myLabelText: 'Fourth Name',
                                                  validate: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Fourth Name Must Be Not Empty';
                                                    }
                                                    return null;
                                                  }),
                                              const SizedBox(
                                                height: 15.0,
                                              ),
                                              ElevatedButton(onPressed: (){
                                                if (formKey.currentState!.validate()) {
                                                  cubit.insertToDatabase(
                                                      firstName: cubit.firstName.text,
                                                      secondName: cubit.secondName.text,
                                                      thirdName: cubit.thirdName.text,
                                                      fourthName: cubit.fourthName.text,
                                                  type: 'Individual');
                                                    formKey.currentState!.reset();
                                                  cubit.changeBottomSheetState(isShow: false);

                                                }

                                              }, child: const Text('Go'))
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    elevation: 20.0,
                                  )
                                      .closed
                                      .then((value) {
                                    cubit.changeBottomSheetState(isShow: false);

                                    //cubit.isBottomSheetShown=false;
                                    // icon: Icons.edit,
                                  });
                                  cubit.changeBottomSheetState(isShow: true);
                                  //  cubit.isBottomSheetShown=true;
                                  //  icon: Icons.add,
                                }
                              }, child:const Text('Individual'),style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity,50)
                              ),),
                            ),
const SizedBox(width: 8,),
                              Expanded(
                                child: ElevatedButton(onPressed: (){
                                  if (cubit.isBottomSheetShown) {


                                  } else {
                                    scaffoldKey.currentState!
                                        .showBottomSheet(
                                          (context) {
                                        return Container(
                                          color: Colors.white,
                                          padding: const EdgeInsets.all(
                                            20.0,
                                          ),
                                          child: Form(
                                            key: formKey,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CustomTextFormFields(
                                                    controller: cubit.firstName,
                                                    myLabelText: 'Team 1',
                                                    validate: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'Team 1 Must Be Not Empty';
                                                      }
                                                      return null;
                                                    }),
                                                const SizedBox(
                                                  height: 15.0,
                                                ),
                                                CustomTextFormFields(
                                                    controller: cubit.secondName,
                                                    myLabelText: 'Team 2',
                                                    validate: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'Team 2 Must Be Not Empty';
                                                      }
                                                      return null;
                                                    }),
                                                const SizedBox(
                                                  height: 15.0,
                                                ),

                                                ElevatedButton(onPressed: (){
                                                  if (formKey.currentState!.validate()) {
                                                    cubit.insertToDatabase(
                                                        firstName: cubit.firstName.text,
                                                        secondName: cubit.secondName.text,
                                                      type: 'Team'
                                                        );
                                                    formKey.currentState!.reset();
                                                    cubit.changeBottomSheetState(isShow: false);

                                                  }

                                                }, child: const Text('Go'))
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      elevation: 20.0,
                                    )
                                        .closed
                                        .then((value) {
                                      cubit.changeBottomSheetState(isShow: false);

                                      //cubit.isBottomSheetShown=false;
                                      // icon: Icons.edit,
                                    });
                                    cubit.changeBottomSheetState(isShow: true);
                                    //  cubit.isBottomSheetShown=true;
                                    //  icon: Icons.add,
                                  }
                                }, child:const Text('Team'),style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(double.infinity,50)
                                ),),
                              ),
                          ],),
                        ),
                      ),
                    ],
                  );
                  // return Text('hello');
                },
                fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
              ),
            ),

          );
        },
      ),
    );
  }
}
