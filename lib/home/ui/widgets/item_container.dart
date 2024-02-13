import 'package:flutter/material.dart';
import 'package:task/home/util/util.dart';

class ItemContainer extends StatelessWidget {
  ItemContainer(
      {super.key,
      required this.image,
      required this.discount,
      required this.name,
      required this.price,
      required this.underlineprice});

  String image;
  int discount;
  String name;
  int price;
  int underlineprice;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: const Color(0xffF0F0F0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                    height: 150,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: const BoxDecoration(
                      color: Color(0xfffafafae5),
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(10))),
                  alignment: Alignment.bottomLeft,
                  child: Text('$discount% off', style: menuText),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              name,
              style: menuText,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              children: [
                Text(
                  'Rs. $price',
                  style: realPrice,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Rs. $underlineprice',
                  style: discountprice,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
