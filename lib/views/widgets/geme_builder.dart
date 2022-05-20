import 'package:domino/controller/cubit.dart';
import 'package:domino/controller/states.dart';
import 'package:domino/views/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameBuilder extends StatelessWidget {
  //List<Map> cubit;
  int index;

  GameBuilder(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Table(
              border: TableBorder.all(

                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8)),
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        cubit.games[index]['type'] == 'Individual'
                            ? '${cubit.games[index]['firstName']}'
                            : '${cubit.games[index]['firstName']}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: ColorManager.black),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        cubit.games[index]['type'] == 'Individual'
                            ? '${cubit.games[index]['secondName']}'
                            : '${cubit.games[index]['secondName']}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: ColorManager.black),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        cubit.games[index]['type'] == 'Individual'
                            ? '${cubit.games[index]['thirdName']}'
                            : '',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: ColorManager.black),
                      )),
                    ),
                    cubit.games[index]['type'] == 'Individual'
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              '${cubit.games[index]['fourthName']}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(color: ColorManager.black),
                            )),
                          )
                        : const SizedBox(),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        cubit.games[index]['type'] == 'Individual'
                            ? '${cubit.games[index]['firstScore']}'
                            : '${cubit.games[index]['firstScore']}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: ColorManager.black),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        cubit.games[index]['type'] == 'Individual'
                            ? '${cubit.games[index]['secondScore']}'
                            : '${cubit.games[index]['secondScore']}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: ColorManager.black),
                      )),
                    ),
                    cubit.games[index]['type'] == 'Individual'
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              '${cubit.games[index]['thirdScore']}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(color: ColorManager.black),
                            )),
                          )
                        : const SizedBox(),
                    cubit.games[index]['type'] == 'Individual'
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              '${cubit.games[index]['fourthScore']}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(color: ColorManager.black),
                            )),
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
