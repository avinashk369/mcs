import 'package:flutter/material.dart';
import 'package:mcs/utils/utils.dart';

class CustomDialog {
  static deleteDiaolg(
      {required Function yes,
      required Function no,
      required String yesButtonLabel,
      required String noButtonLabel,
      required String message}) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Text(message,
          style: kHeaderStyle.copyWith(
            color: Colors.black,
          )),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                style:
                    OutlinedButton.styleFrom(minimumSize: const Size(100, 40)),
                child: Text(noButtonLabel,
                    style: kLabelStyle.copyWith(color: Colors.black)),
                onPressed: () => no(),
              ),
              OutlinedButton(
                child: Text(
                  yesButtonLabel,
                  style: kLabelStyle.copyWith(color: Colors.black),
                ),
                style:
                    OutlinedButton.styleFrom(minimumSize: const Size(100, 40)),
                onPressed: () => yes(),
              ),
            ],
          ),
        )
      ],
    );
  }

  static exitDialog(
      {required Function yes,
      required Function no,
      required String yesButtonLabel,
      required String noButtonLabel,
      required String message}) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Text(message,
          style: kHeaderStyle.copyWith(
            color: Colors.black,
          )),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                style:
                    OutlinedButton.styleFrom(minimumSize: const Size(100, 40)),
                child: Text(noButtonLabel),
                onPressed: () => no(),
              ),
              OutlinedButton(
                child: Text(yesButtonLabel),
                style:
                    OutlinedButton.styleFrom(minimumSize: const Size(100, 40)),
                onPressed: () => yes(),
              ),
            ],
          ),
        )
      ],
    );
  }

  static customExitDialog(
      {required Function yes,
      required Function no,
      required String yesButtonLabel,
      required String noButtonLabel,
      required String message}) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: SizedBox(
        height: 350,
        child: Column(
          children: [
            const Expanded(
              child: Icon(
                Icons.exit_to_app,
                size: 60,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4)),
                  color: Colors.redAccent,
                ),
                child: SizedBox.expand(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          message,
                          style: kLabelStyle.copyWith(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size(100, 40),
                                  side: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                child: Text(
                                  noButtonLabel,
                                  style:
                                      kLabelStyle.copyWith(color: Colors.white),
                                ),
                                onPressed: () => no(),
                              ),
                              OutlinedButton(
                                child: Text(
                                  yesButtonLabel,
                                  style:
                                      kLabelStyle.copyWith(color: Colors.white),
                                ),
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size(100, 40),
                                  side: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () => yes(),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static warningDialog(
      {required Function yes,
      required Function no,
      required String yesButtonLabel,
      required String noButtonLabel,
      required String message}) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        height: 350,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  //color: primaryLight,
                ),
                child: SizedBox.expand(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                child: Text(
                                  yesButtonLabel,
                                  style:
                                      kLabelStyle.copyWith(color: Colors.black),
                                ),
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size(100, 40),
                                  side: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: () => yes(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size(100, 40),
                                  side: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                child: Text(
                                  noButtonLabel,
                                  style:
                                      kLabelStyle.copyWith(color: Colors.black),
                                ),
                                onPressed: () => no(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static simpleDialog(
    String title,
    String message, {
    required Function dismiss,
  }) {
    return AlertDialog(
      title: Text(
        title,
        style: kLabelStyleBold,
      ),
      content: Text(
        message,
        style: kLabelStyle,
      ),
      actions: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(minimumSize: const Size(100, 40)),
          child: Text(
            "Okay",
            style: kLabelStyleBold,
          ),
          onPressed: () => dismiss(),
        ),
      ],
    );
  }
}
