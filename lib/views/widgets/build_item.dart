import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:domino/views/new_game.dart';
import 'package:flutter/material.dart';

import '../../controller/cubit.dart';

Widget buildGameItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${model['firstName']}',
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Text(
                  '${model['firstScore']}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${model['secondName']}',
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Text(
                  '${model['secondScore']}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                model['type']=='Individual'?
                Text(
                  '${model['thirdName']}',
                ):const SizedBox(),
                const SizedBox(
                  width: 20.0,
                ),
                model['type']=='Individual'?
                Text(
                  '${model['thirdScore']??''}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ):const SizedBox(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                model['type']=='Individual'?
                Text(
                  '${model['fourthName']??''}',
                ):const SizedBox(),
                const SizedBox(
                  width: 20.0,
                ),
                model['type']=='Individual'?
                Text(
                  '${model['fourthScore']??''}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ):const SizedBox(),
              ],
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(
          id: model['id'],
        );
      },
    );

Widget gameBuilder({
  required List<Map>? game,
}) =>
    ConditionalBuilder(
          condition: game!.isNotEmpty,
          builder: (context) => GridView.builder(
            padding: const EdgeInsets.all(8.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: game.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 2,
              crossAxisSpacing: 3,
              crossAxisCount: 2,
              childAspectRatio: (4.5 / 4),
            ),
            itemBuilder: (BuildContext context, int index) {
              return Card(


                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewGame(game, index)));
                      },
                      child: buildGameItem(game[index], context)));
            },
          ),
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );

