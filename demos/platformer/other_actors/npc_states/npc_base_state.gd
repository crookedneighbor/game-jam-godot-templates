@abstract
class_name NPCState extends State

var npc: NPC:
	get:
		return actor as NPC
	set(value):
		actor = value
