#Include easy.ahk
#Include primary.ahk
#Include ftdc_primary.ahk
#Include impoppable.ahk

BALANCE_DATA := Map(
    "easy", [BalanceEasy, ""],
    "primary", [
        [BalancePrimaryFTDC, "benjamin", true, true],
        [BalancePrimePrimary, "etienne"],
    ],
    "impoppable", [BalanceImpoppable, "benjamin"],
)
