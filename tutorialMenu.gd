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




func _on_backButton_pressed():
    print("Change scene: Main Menu" )
    get_tree().change_scene("res://MainMenu.tscn")


func _on_tut1_pressed():
    print("Change scene: Tutorial 1" )
    get_tree().change_scene("res://tutorial/tutorial_1.tscn")
