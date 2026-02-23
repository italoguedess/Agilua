local Card = require("src.Card")
local File = {}

function File.read_cards(fname)
	local file = assert(io.open(fname, "r+"))
	local contents = file:read("*all")
	assert(io.close(file))

	local card_strings = {}
	local pattern = string.format("([^%s]+)", "*")
	local save_card_string = function(card_string)
		card_string = string.sub("*" .. card_string, 1, -2)
		table.insert(card_strings, card_string)
	end
	string.gsub(contents, pattern, save_card_string)

	local cards = {}
	for i = 1, #card_strings, 1 do
		local card = {}
		card.title = string.sub(string.match(card_strings[i], "%u%p%s.+[%a:][:]%s"), 4, -5)
		card.status = string.match(card_strings[i], "[%a_]+")
		card.priority = string.sub(string.match(card_strings[i], "%p%u"), 2)
		-- {or " "} in case string match returns nil meaning there are no tags
		card.tags = string.sub(string.match(card_strings[i], "[:].+[:]") or " ", 1, -2)
		card.description = string.sub(string.match(card_strings[i], "[:][\n].+"), 3, -1)
		cards[i] = Card.create(card)
	end

	return cards
end

function File.write_card() end

return File
