class_name StateMachine extends Node

@export var actor: Node2D

var current_state: State
var states: Dictionary[String, State] = {}

func _ready() -> void:
	var child_states = get_children()
	for child_state in child_states:
		if child_state is not State:
			push_error(child_state, "is not a State")
			continue
		states[child_state.name] = child_state
		child_state.init(actor)
		if !current_state: current_state = child_state

func process(delta: float) -> void:
	current_state.process(delta)

func physics_process(delta: float) -> void:
	current_state.physics_process(delta)

func change_state(state_name: String) -> void:
	if current_state.name == state_name:
		return
	if not states[state_name]:
		push_error('no state configured for', state_name)
		return

	var new_state := states[state_name]
	var prev_state := current_state
	prev_state.exit()
	current_state = states[state_name]
	new_state.enter(prev_state.name)
	
