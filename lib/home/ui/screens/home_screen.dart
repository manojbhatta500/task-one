import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/home/data/data.dart';
import 'package:task/home/bloc/header_bloc.dart';
import 'package:task/home/ui/widgets/green_text_container.dart';
import 'package:task/home/ui/widgets/item_container.dart';
import 'package:task/home/ui/widgets/white_text_container.dart';
import 'package:task/home/util/util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            SizedBox(
              height: 45,
              child: BlocBuilder<HeaderBloc, HeaderState>(
                builder: (context, state) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.headingList.length,
                      itemBuilder: (context, index) {
                        String currentstring = state.headingList[index];
                        return index == state.currentIndex
                            ? GreenTextContainer(inputKeyword: currentstring)
                            : GestureDetector(
                                onTap: () {
                                  BlocProvider.of<HeaderBloc>(context).add(
                                      GenerateHeadings(
                                          userCurrentindex: index));
                                },
                                child: WhiteTextContainer(
                                    inputKeyword: currentstring));
                      });
                },
              ),
            ),
            const Divider(),
            BlocBuilder<HeaderBloc, HeaderState>(
              builder: (context, state) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    state.headingList[state.currentIndex],
                    style: blacktitle,
                  ),
                );
              },
            ),
            Expanded(
              child: BlocBuilder<HeaderBloc, HeaderState>(
                builder: (context, state) {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // number of items in each row
                        mainAxisSpacing: 10, // spacing between rows
                        crossAxisSpacing: 10.0,
                        mainAxisExtent: 220,
                        childAspectRatio: 2 / 3),
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      switch (state.currentIndex) {
                        case 0:
                          return ItemContainer(
                            image: recomendedfood[0].image,
                            discount: recomendedfood[0].discount,
                            name: recomendedfood[0].name,
                            price: recomendedfood[0].price,
                            underlineprice: recomendedfood[0].underlineprice,
                          );

                        case 1:
                          return ItemContainer(
                            image: superdealfood[0].image,
                            discount: superdealfood[0].discount,
                            name: superdealfood[0].name,
                            price: superdealfood[0].price,
                            underlineprice: superdealfood[0].underlineprice,
                          );

                        case 2:
                          return ItemContainer(
                            image: veganfood[0].image,
                            discount: veganfood[0].discount,
                            name: veganfood[0].name,
                            price: veganfood[0].price,
                            underlineprice: veganfood[0].underlineprice,
                          );

                        case 3:
                          return ItemContainer(
                            image: buyOneGetOneFood[0].image,
                            discount: buyOneGetOneFood[0].discount,
                            name: buyOneGetOneFood[0].name,
                            price: buyOneGetOneFood[0].price,
                            underlineprice: buyOneGetOneFood[0].underlineprice,
                          );
                      }
                      return null;
                    },
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
