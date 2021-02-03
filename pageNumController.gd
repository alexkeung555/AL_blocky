extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var pageNum

# Called when the node enters the scene tree for the first time.
func _ready():
    pageNum = 1
    
    for  i in range(10):
        
        get_parent().get_node("slot" + String(i) + "/blockNum").set_text(String(i))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func nextPagePressed():
    pass # Replace with function body.


func previousPagePressed():
    pass # Replace with function body.
