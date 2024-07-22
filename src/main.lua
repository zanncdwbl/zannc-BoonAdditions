---@meta _
zanncdwbl_Practical_Gods = zanncdwbl_Practical_Gods or {}

---@diagnostic disable-next-line: undefined-global
local mods = rom.mods

---@diagnostic disable: lowercase-global
---@module "SGG_Modding-ENVY-auto"
mods["SGG_Modding-ENVY"].auto()

---@diagnostic disable-next-line: undefined-global
rom = rom
---@diagnostic disable-next-line: undefined-global
_PLUGIN = PLUGIN

---@module "SGG_Modding-Hades2GameDef-Globals"
game = rom.game

---@module "SGG_Modding-SJSON"
sjson = mods["SGG_Modding-SJSON"]

---@module "SGG_Modding-ModUtil"
modutil = mods["SGG_Modding-ModUtil"]

---@module 'SGG_Modding-Chalk'
chalk = mods["SGG_Modding-Chalk"]

---@module "SGG_Modding-ReLoad"
reload = mods["SGG_Modding-ReLoad"]

---@module 'Practical_Gods-zannc-config'
config = chalk.auto("config.lua")
public.config = config

local function on_ready()
	import_as_fallback(rom.game)

	import("ready.lua")
	import("sjson.lua")

	-- Hermes Boons
	import("hermes/speedDamage.lua")
	import("hermes/moveSpeed.lua")
	import("hermes/dashHeal.lua")
	import("hermes/bonusDash.lua")

	-- Artemis Boons
	import("artemis/artemisLootData.lua")
	import("artemis/artemisSJSONIcons.lua")

	import("artemis/weaponAttack/critAttack.lua")
	import("artemis/weaponSpecial/critSpecial.lua")
	import("artemis/critDamage/critDamage.lua")
	import("artemis/armourDamage/armourDamage.lua")
	import("artemis/dashDamage/dashDamage.lua")

	-- import "artemis/weaponAttack/critAttackSJSON.lua"
	-- import "artemis/weaponSpecial/critSpecialSJSON.lua"

	import("artemis/artemisCritScaling.lua")
end

local function on_reload()
	import_as_fallback(rom.game)
	import("imgui.lua")
end

local loader = reload.auto_single()

modutil.once_loaded.game(function()
	loader.load(on_ready, on_reload)
end)
