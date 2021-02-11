extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func sandBox_mode_button_pressed():
    print("Change scene:  Sandbox")
    get_tree().change_scene("res://testing.tscn")

func task_mode_button_pressed():
    print("Change scene:  task")
    

func tutorial_mode_button_pressed():
    print("Change scene:  tutorial")
    get_tree().change_scene("res://tutorialMenu.tscn")
