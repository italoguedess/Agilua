local FlexLove = require("lib.flexlove.FlexLove")
local Color = require("ui.Color")

local Kanban = {
	hovered_card = 0,
}

function Kanban.kanban_screen_create(column_keys)
	local window = Kanban.create_window()
	local columns = Kanban.create_columns(window, column_keys)
	local cards = Kanban.create_cards(columns)

	return { window = window, columns = columns, cards = cards }
end

function Kanban.create_window()
	return FlexLove.new({
		width = "100%",
		height = "100%",
		z = 1,
		positioning = "flex",
		flexDirection = "horizontal",
		backgroundColor = Color.background,
		justifyContent = "center",
		gap = "2%",
		padding = "2%",
	})
end

function Kanban.create_columns(window, column_keys)
	local width = tostring(100 / #column_keys - 2) .. "%"
	local columns = {}
	for _, v in ipairs(column_keys) do
		columns[v] = FlexLove.new({
			parent = window,
			width = width,
			height = "100%",
			positioning = "flex",
			flexDirection = "vertical",
			alignItems = "center",
			gap = 10,
			cornerRadius = 10,
			backgroundColor = Color.column,
		})

		FlexLove.new({
			parent = columns[v],
			text = v,
			textSize = 18,
			textAlign = "center",
			textColor = Color.foreground,
			padding = 10,
		})
	end

	return columns
end

function Kanban.create_cards(columns)
	local card_color = function(c)
		if c.priority == "A" then
			return Color.card_a
		elseif c.priority == "B" then
			return Color.card_b
		else
			return Color.card_c
		end
	end

	local render_cards = {}
	for i, c in ipairs(CARDS) do
		render_cards[i] = FlexLove.new({
			parent = columns[c.status],
			width = "90%",
			text = c.title,
			textSize = 18,
			textColor = BACKGROUND_COLOR,
			textAlign = "center",
			cornerRadius = 10,
			backgroundColor = Kanban.hovered_card == i and Color.foreground or card_color(c),
			padding = 15,
			onEvent = function(_, event)
				if event.type == "hover" then
					Kanban.hovered_card = i
				elseif event.type == "unhover" then
					Kanban.hovered_card = 0
				end
			end,
		})
	end
	return render_cards
end

return Kanban
