class_name NPCPlatformerWanderState extends NPCState

@export var wander_speed = 25
@export var acceleration_speed = 10

func enter(_prev_state: String) -> void:
	if npc.is_way_blocked():
		# if the npc can't move forward, force it to move the other direction
		npc.direction = npc.direction * -1
	else:
		npc.direction = [1, -1].pick_random()

	npc.play_animation("walk")

func process(_delta: float) -> void:
	if npc.is_way_blocked():
		npc.change_state("NpcPlatformerBrainState")

func physics_process(_delta: float) -> void:
	if npc.is_way_blocked():
		return

	npc.velocity.x = move_toward(npc.velocity.x, wander_speed * actor.direction, _delta * acceleration_speed)
