import 'package:flutter/material.dart';
import 'package:frontend/utils/hexColor.dart';
import 'package:frontend/views/components/translationHeader/translationHeader.dart';

class SpeechScreen extends StatelessWidget {
  const SpeechScreen({Key? key}) : super(key: key);

  static String route = '/speech';

  final double topPad = 25.0;
  final double horizotalPad = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: topPad, left: horizotalPad, right: horizotalPad),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black, width: 0.5),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: const Icon(
                                    Icons.volume_up,
                                    color: Colors.black,
                                  ),
                                  style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all(
                                      const Size(20, 30),
                                    ),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.file_copy),
                                  splashColor: Colors.transparent,
                                  splashRadius: 1,
                                  iconSize: 30,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'sad',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: MaterialButton(
                              shape: const CircleBorder(),
                              onPressed: () {},
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(80.0)),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: <Color>[
                                      HexColor('#F0B831'),
                                      HexColor('#962F4A'),
                                      HexColor('#1E307C'),
                                    ],
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(20),
                                  child: IconTheme(
                                    data: IconThemeData(
                                      size: 35,
                                      color: Colors.white,
                                    ),
                                    child: Icon(Icons.mic),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                      top: topPad, left: horizotalPad, right: horizotalPad),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.black, width: 0.5),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: OutlinedButton(
                                onPressed: () {},
                                child: const Icon(
                                  Icons.volume_up,
                                  color: Colors.black,
                                ),
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                    const Size(20, 30),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () => {},
                                icon: const Icon(Icons.star_rounded),
                                splashRadius: 15,
                                iconSize: 30,
                                color: Colors.yellow,
                                splashColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'sad',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: MaterialButton(
                            shape: const CircleBorder(),
                            onPressed: () {},
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(80.0)),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: <Color>[
                                    HexColor('#F0B831'),
                                    HexColor('#962F4A'),
                                    HexColor('#1E307C'),
                                  ],
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(20),
                                child: IconTheme(
                                  data: IconThemeData(
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                  child: Icon(Icons.mic),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Align(
            alignment: Alignment.center,
            child: TranslationHeader(
              upDown: true,
            ),
          )
        ],
      ),
    );
  }
}
