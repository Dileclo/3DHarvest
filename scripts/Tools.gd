class_name DataTools
extends Node

enum Tools{
	None,
	WoodAxe,
	StoneAxe,
	WoodPickaxe,
	StonePickaxe
}

# Словарь с уроном
const DAMAGE_TABLE = {
	Tools.None:1,
	Tools.WoodAxe: 3,
	Tools.StoneAxe: 20,
	Tools.WoodPickaxe: 5,
	Tools.StonePickaxe: 15
}

# Статический метод, чтобы получать урон из любого места кода
static func get_damage(tool_type: Tools) -> int:
	if DAMAGE_TABLE.has(tool_type):
		return DAMAGE_TABLE[tool_type]
	return 0
