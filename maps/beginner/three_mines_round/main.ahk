#Include easy.ahk
#Include deflation.ahk
#Include medium.ahk
#Include reverse.ahk
#Include hard.ahk

THREE_MINES_ROUND_DATA := Map(
    "easy", [ThreeMinesRoundEasy, ""],
    "deflation", [
        [ThreeMinesRoundDeflation, "churchill"],
    ],
    "medium", [ThreeMinesRoundMedium, "churchill"],
    "reverse", [ThreeMinesRoundReverse, "churchill"],
    "hard", [ThreeMinesRoundHard, ""],
)
