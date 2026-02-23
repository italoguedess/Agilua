local File = require("src.File")
local Card = require("src.Card")
local Kanban = require("ui.screens.Kanban")
local FlexLove = require("lib.flexlove.FlexLove")

function love.load(args)
	if #args ~= 1 and type(args[1]) ~= "string" then
		error("Error: org file path expected!")
		love.event.quit()
	end

	local screen_width, screen_height = love.window.getDesktopDimensions(displayindex)
	love.window.setMode(0.9 * screen_width, 0.9 * screen_height)
	FlexLove.init({ immediateMode = true })

	COLUMN_KEYS = { "BACKLOG", "TODO", "IN_PROGRESS", "REVIEW", "DONE" }
	CARDS = File.read_cards(args[1])
	Card.sort(CARDS)
end

function love.update(dt)
	FlexLove.update(dt)
end

function love.draw()
	SCREEN = Kanban.kanban_screen_create(COLUMN_KEYS)
	FlexLove.draw()
end
