import 'package:flutter/material.dart';
import 'package:mcs/utils/utils.dart';

import 'ticket_clipper.dart';
import 'ver_ticket_clipper.dart';

class ClipCardWidget extends StatelessWidget {
  const ClipCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: VerTicketBothSidesClipper(holeRadius: 30),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(
            color: greyColor,
            width: 1,
          ),
          gradient: const LinearGradient(
            colors: [
              Colors.amberAccent,
              Colors.pink,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        width: 250,
        height: 420,
        padding: const EdgeInsets.only(right: 15, left: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Spacer(),
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Hey this is a card",
                        textAlign: TextAlign.center,
                        style: kLabelStyleBold.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "12 MONTHS",
              style: kLabelStyleBold.copyWith(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            Divider(
              color: Colors.grey.withOpacity(.6),
              thickness: 1,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\u{20B9}",
                  style: kLabelStyleBold.copyWith(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "19,9999",
                  style: kLabelStyleBold.copyWith(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Text(
                  "29,9999",
                  style: kLabelStyle.copyWith(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "extra",
                    style: kLabelStyle.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: " \u{20B9}10,000",
                    style: kLabelStyle.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: " discount applied",
                    style:
                        kLabelStyle.copyWith(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            Text(
              "134/month or no cost emi",
              style: kLabelStyle.copyWith(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Divider(
              color: Colors.grey.withOpacity(.6),
              thickness: 1,
            ),
            Center(
              child: ClipPath(
                clipper: TicketClipper(holeRadius: 5),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 3),
                  width: 150,
                  height: 30,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.amberAccent,
                          Colors.pink,
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.bolt, color: Colors.white),
                        Text(
                          "ONLY TODAY",
                          style: kLabelStyleBold.copyWith(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
