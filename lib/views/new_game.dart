import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:domino/controller/cubit.dart';
import 'package:domino/controller/states.dart';
import 'package:domino/views/widgets/custom_form.dart';
import 'package:domino/views/widgets/geme_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewGame extends StatelessWidget {
  List<Map> model;
  int index;

  NewGame(this.model, this.index, {Key? key}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var firstScore = TextEditingController();
  var secondScore = TextEditingController();
  var thirdScore = TextEditingController();
  var fourthScore = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getDataFromDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('New Game'),
            ),
            key: scaffoldKey,
            body: ConditionalBuilder(
              condition: cubit.games.isNotEmpty,
              builder: (context) {
                return SingleChildScrollView(
                  child: SafeArea(child: Column(
                    children: [
                      GameBuilder(index),

                      SafeArea(
                        child: Container(
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
                                    controller: firstScore,
                                    type: TextInputType.number,
                                    myLabelText:cubit.games[index]['type']=='Individual'?
                                    '${cubit.games[index]['firstName']}':'${cubit.games[index]['firstName']}',
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'First Score Must Be Not Empty';
                                      }
                                      return null;
                                    }),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                CustomTextFormFields(
                                    controller: secondScore,
                                    myLabelText: cubit.games[index]['type']=='Individual'?
                                    '${cubit.games[index]['secondName']}':'${cubit.games[index]['secondName']}',
                                    type: TextInputType.number,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'Second Score Must Be Not Empty';
                                      }
                                      return null;
                                    }),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                cubit.games[index]['type']=='Individual'?
                                CustomTextFormFields(

                                    controller: thirdScore,
                                    myLabelText: cubit.games[index]['type']=='Individual'?
                                    '${cubit.games[index]['thirdName']}':'${cubit.games[index]['thirdName']}',
                                    type: TextInputType.number,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'Third Score Must Be Not Empty';
                                      }
                                      return null;
                                    }):const SizedBox(),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                cubit.games[index]['type']=='Individual'? CustomTextFormFields(
                                    controller: fourthScore,
                                    myLabelText: cubit.games[index]['type']=='Individual'?
                                    '${cubit.games[index]['fourthName']}':'${cubit.games[index]['fourthName']}',
                                    type: TextInputType.number,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'Fourth Score Must Be Not Empty';
                                      }
                                      return null;
                                    }):const SizedBox(),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                ElevatedButton(onPressed: (){
                                  if (formKey.currentState!.validate()) {
                                    cubit.getScore(
                                        firstScore: cubit.games[index]['firstScore'] + int.parse(firstScore.text ),
                                        secondScore: cubit.games[index]['secondScore'] + int.parse(secondScore.text),
                                        thirdScore:cubit.games[index]['type']=='Individual'? cubit.games[index]['thirdScore'] + int.parse(thirdScore.text):0,
                                        fourthScore:cubit.games[index]['type']=='Individual'?cubit.games[index]['fourthScore'] + int.parse(fourthScore.text):0
                                    );
                                    cubit.updateData(
                                        firstScore:cubit.firstScore1
                                        ,
                                        secondScore:cubit.secondScore1
                                        ,
                                        thirdScore:cubit.games[index]['type']=='Individual'?cubit.thirdScore1:0
                                        ,
                                        fourthScore:cubit.games[index]['type']=='Individual'?cubit.fourthScore1:0
                                        ,
                                        id: cubit.games[index]['id']);
                                    print('------------${model[index]}-------------------');

                                    print(  '-----(${cubit.games[index]['firstScore']})-----------(${firstScore.text})-------${cubit.firstScore1}');
                                    print(  '-----(${cubit.games[index]['secondScore']})-----------(${secondScore.text})-------${cubit.secondScore1}');
                                    print(  '-----(${cubit.games[index]['thirdScore']})-----------(${thirdScore.text})-------${cubit.thirdScore1}');
                                    print(  '-----(${cubit.games[index]['fourthScore']})-----------(${fourthScore.text})-------${cubit.fourthScore1}');
                                    formKey.currentState!.reset();
                                    cubit.getDataFromDatabase();
                                    formKey.currentState!.reset();

                                  }
                                }, child: const Text('ADD'))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
                );
              },
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
            ),

          );
        },
      ),
    );
  }
}
