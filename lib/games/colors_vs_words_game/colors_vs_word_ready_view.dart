import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_connection_test/games/colors_vs_words_game/colors_vs_word_game_view.dart';

class ColorsVsWordGameReadyView extends StatefulWidget {
  const ColorsVsWordGameReadyView({
    super.key,
  });

  @override
  State<ColorsVsWordGameReadyView> createState() =>
      _ColorsVsWordGameReadyViewState();
}

class _ColorsVsWordGameReadyViewState extends State<ColorsVsWordGameReadyView> {
  @override
  Widget build(BuildContext context) {
    const double sizeboxHeigt = 20.0;
    const double sizeboxWidth = 20.0;

    return Scaffold(
      extendBodyBehindAppBar: true,
      // floatingActionButton: Icon(Icons.arrow_back),
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '五顏',
              style: GoogleFonts.permanentMarker(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1.5,
            ),
            Text(
              '配六色',
              style: GoogleFonts.permanentMarker(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1.5,
            ),
            const SizedBox(height: sizeboxHeigt),
            Text(
              '字的顏色模式：\n根據字體的顏色選出答案\n\n字的意義模式：\n根據字義代表的顏色選出答案\n\n混合出題模式：\n兩種模式隨機出題',
              style: GoogleFonts.permanentMarker(
                fontSize: 20,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
              textScaleFactor: 1,
            ),
            const SizedBox(height: sizeboxHeigt),
            Text(
              '選擇模式',
              style: GoogleFonts.permanentMarker(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1,
            ),
            const SizedBox(height: sizeboxHeigt),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    maximumSize: const Size(120, 100),
                    minimumSize: const Size(100, 80),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ColorvsWordGameView(
                              questionType: 1,
                            )));
                  },
                  child: Text(
                    '字的\n顏色',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.permanentMarker(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1,
                  ),
                ),
                const SizedBox(width: sizeboxWidth),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    maximumSize: const Size(120, 100),
                    minimumSize: const Size(100, 80),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ColorvsWordGameView(
                              questionType: 0,
                            )));
                  },
                  child: Text(
                    '字的\n意義',
                    style: GoogleFonts.permanentMarker(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1,
                  ),
                ),
                const SizedBox(width: sizeboxWidth),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    maximumSize: const Size(120, 100),
                    minimumSize: const Size(100, 80),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ColorvsWordGameView(
                              questionType: 2,
                            )));
                  },
                  child: Text(
                    '混合\n出題',
                    style: GoogleFonts.permanentMarker(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
