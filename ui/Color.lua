local FlexLove = require("lib.flexlove.FlexLove")
local FL_Color = FlexLove.Color

local Color = {}

-- Colors from https://github.com/sainnhe/everforest

Color.background = FL_Color.new(30 / 255, 35 / 255, 38 / 255, 1)
Color.foreground = FL_Color.new(211 / 255, 198 / 255, 170 / 255, 1)
Color.column = FL_Color.new(39 / 255, 46 / 255, 51 / 255, 1)
Color.card_a = FL_Color.new(230 / 255, 152 / 255, 117 / 255, 1)
Color.card_b = FL_Color.new(219 / 255, 188 / 255, 127 / 255, 1)
Color.card_c = FL_Color.new(167 / 255, 192 / 255, 128 / 255, 1)

return Color
