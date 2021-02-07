extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var draggingIconIsDisplaying

# Called when the node enters the scene tree for the first time.
func _ready():
    draggingIconIsDisplaying = false
    
    get_node("hintTextDisplayer").push_align(3)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func changeChildIndex(node, index):
    move_child(node, index)
