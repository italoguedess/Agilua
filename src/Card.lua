local Card = {}

function Card.create(c)
	local new_card = {
		title = c.title,
		description = c.description,
		tags = c.tags,
		status = c.status,
		priority = c.priority,
	}

	return new_card
end

function Card.sort(c)
	return table.sort(c, function(c1, c2)
		return c1.priority < c2.priority
	end)
end

return Card
