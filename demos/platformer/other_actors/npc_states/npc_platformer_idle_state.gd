class_name NPCPlatformerIdleState extends NPCState

@onready var idle_timer: Timer = $IdleTimer

func _ready() -> void:
	idle_timer.timeout.connect(_on_idle_finish)

func enter(_prev_state: String) -> void:
	npc.play_animation("idle")
	npc.velocity.x = 0
	idle_timer.start()

func exit() -> void:
	idle_timer.stop()

func _on_idle_finish() -> void:
	npc.change_state("NpcPlatformerBrainState")
