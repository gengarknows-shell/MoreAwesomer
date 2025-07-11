--Too Many Atlases

SMODS.Atlas {
key = "GreenCard",
path = "greencard.png",
px = 71,
px = 95
}

SMODS.Atlas {
key = "MrPurple",
path = "purple_full.png",
px = 71,
px = 95
}

SMODS.Atlas {
key = "MHate",
path = "myleastfavouritejoker.png",
px = 71,
px = 95
}

SMODS.Atlas {
key = "IAM",
path = "blackmail.png",
px = 71,
px = 95
}

--JOKERS!!!!

--Green Card (+42 Chips)

SMODS.Joker {
	key = "gcard",
	loc_txt = {
		name = "Green Card",
		text = {
			"{C:chips}+#1# {} Chips"}
		}
	config = { extra = { chips = 42 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips } }
	end,
	rarity = 2,
	atlas = "GreenCard",
	pos = { x = 0, y = 0 },
	cost = -4,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chip_mod = card.ability.extra.chips, 
			message = localize { type = "variable", key = "a_chips", vars = { card.ability.extra.chips } }
			}
		end
	end
}

--My Least Favourite Joker (Mercury)

--how to mercury???

SMODS.Joker {
	key = "myleastfav",
	loc_txt = {
		name = "My Least Favourite Joker",
		text = {
			"Creates a {C:dark_edition}Mercury{}",
			"When blind is",
			"selected",
			"{C:inactive}m{}",
			"THIS JOKER CODE HAS NOT BEEN FINISHED.",
			"DO NOT BE SUPRPRISED IF THIS JOKER CRASHES YOUR GAME."
		}
	config = { extra = {} },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips } }
	end,
	rarity = 1,
	atlas = "MHate",
	pos = { x = 0, y = 0 },
	cost = 8,
	calculate = function(self, card, context)
		if context.setting_blind then
			return {
				chip_mod = card.ability.extra.chips, 
			message = localize { type = "variable", key = "a_chips", vars = { card.ability.extra.chips } }
			}
		end
	end
}

--Purple!

--Glad i finished this one :)

--x1.77 mult cards

SMODS.Joker {
	key = "purple",
	loc_txt = {
		name = "Purple",
		text = {
			"Each played card gives",
			"{X:Mult,C:white} X#1# {} Mult",
			"scored",
			"{C:inactive} :o it's purple!!!!!!! {}",
		}
	config = { extra = { Xmult = 1.77 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips } }
	end,
	rarity = 4,
	atlas = "MrPurple",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0},
	cost = 27,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:get_id() > 1 then 
				return {
					message = "Purple!",
					Xmult_mod = card.ability.extra.Xmult,
					card = context.other_card
				} 
			end
		end
	end
}

--Blackmail

--X4 Mult, -2 hands, -1 hand size

SMODS.Joker {
	key = "blackmailed",
	loc_txt = {
		name = "Blackmail",
		text = {
			"{X:Mult,C:white} X#1# {} I am blackmailed.",
			"{C:blue} #2# {} You are blackmailed.",
			"{C:attention} #3# {} You cannot chat or",
			"whisper when blackmailed.",
			"THIS JOKER CODE HAS NOT BEEN FINISHED.",
			"DO NOT BE SURPRISED IF THIS JOKER CRASHES YOUR GAME."
			}
		}
	config = { extra = { Xmult = 4, idk = -2, hand_size = -1,  } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips } }
	end,
	rarity = 2,
	atlas = "IAM",
	pos = { x = 0, y = 0 },
	cost = 8,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				Xmult_mod = card.ability.extra.Xmult, 
			message = localize { type = "variable", key = "a_xmult", vars = { card.ability.extra.xmult } }
			}
		end
	end
}
