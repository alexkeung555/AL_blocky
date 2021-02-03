extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var child

# Called when the node enters the scene tree for the first time.
func _ready():
    
    for i in range(get_child_count()-1):
        child = get_child(i)
        child.color = Color(0.5,0.5,0.5,1)
    
    


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
