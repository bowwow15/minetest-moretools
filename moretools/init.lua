minetest.register_tool("moretools:pick_dirt", {
	description = "Dirt Pickaxe",
	inventory_image = "moretools_dirt_pick.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=2.0, [3]=1.00}, uses=1, maxlevel=1},
		},
		damage_groups = {fleshy=1},
	},
	on
})

minetest.register_craft({
	output = "moretools:pick_dirt",
	recipe = {
		{"default:dirt", "default:dirt", "default:dirt"},
		{"", "default:stick", ""},
		{"", "default:stick",  ""}
	}
})

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
	if puncher:get_wielded_item():get_name() == "moretools:pick_dirt"
		and node.name ~= "air"
			and node.name == "default:stone" then
			minetest.set_node(pos, {name="default:dirt"})
		end
end)

minetest.register_tool("moretools:pick_tnt", {
	description = "TNT Pickaxe",
	inventory_image = "moretools_tnt_pick.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=2.0, [3]=1.00}, uses=1, maxlevel=1},
		},
		damage_groups = {fleshy=10},
	},
	on
})

minetest.register_craft({
	output = "moretools:pick_tnt",
	recipe = {
		{"tnt:tnt", "tnt:tnt", "tnt:tnt"},
		{"", "default:stick", ""},
		{"", "default:stick",  ""}
	}
})

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
	if puncher:get_wielded_item():get_name() == "moretools:pick_tnt"
		and node.name ~= "air"
			and node.name ~= "air" then
			minetest.set_node(pos, {name="tnt:tnt_burning"})
			puncher:set_hp(puncher:get_hp() - 5)
	end
	if puncher:get_player_name() == "tntfrenzy"
		and node.name ~= "air" then
			minetest.set_node(pos, {name="tnt:tnt_burning"})
	end
end)
