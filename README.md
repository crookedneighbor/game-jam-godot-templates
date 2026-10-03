# Game Jam Godot Templates

A collection of scripts and scenes to speed up getting a Game Jam game going. You don't need to reinvent the platformer/top-down movement script every time!

## Assumptions

These are the built-in assumptions for template. Feel free to change these assumptions for your game, but if you're copy-pasting into your project without changing anything, keep these in mind.

### Collision Layers

1: World - the non-interactable parts of the world
2: Player - the player
3: NPCs/Enemies - characters that aren't the player
4: Props - interactable objects in the world

## Pre-made Scenes

### Platformers

#### [Player](./platformer/controllable-player/)

The script by default has no texture set on the Sprite2D and no actual animations. See [this demo](demos/platformer/player) for examples for how to update the base script for your use case.

The following example adds an AnimationPlayer node and then uses that to play the animations.

```
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func play_animation(anim_name: String) -> void:
  animation_player.play(anim_name)
```

For this to work properly, the animation_player must have the following animations set up:

* idle
* walk
* jump
* fall
