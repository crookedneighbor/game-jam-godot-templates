class_name NPCPlatformerBrainState extends NPCState

# TODO make this an @export variable
var configured_states: Array[String] = [
	"NpcPlatformerIdleState", 
	"NpcPlatformerWanderState"
]

var states: Array[String] = configured_states

func enter(prev_state: String) -> void:
	states = configured_states.filter(
		func (state): return state != prev_state
	)

func exit() -> void:
	states = configured_states

func process(_delta: float) -> void:
	npc.change_state(states.pick_random())
