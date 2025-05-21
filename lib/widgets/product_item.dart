import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.image,
    required this.name,
    required this.rate,
    required this.rateCount,
    required this.price,
    required this.onTap,
    required this.icon,
  });
  final String image;
  final String name;
  final String rate;
  final String rateCount;
  final String price;
  final Function()? onTap;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(image, width: 120, fit: BoxFit.contain),
                ),
                Positioned(
                  bottom: 6,
                  right: 5,
                  child: GestureDetector(
                    onTap: onTap,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: icon,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 5),
              child: SizedBox(
                width: 125,
                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/icons/star.png', height: 16),
                  SizedBox(width: 5),
                  Text(rate),
                  SizedBox(width: 5),
                  Text(rateCount),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
