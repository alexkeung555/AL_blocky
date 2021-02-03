extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const LinkedList = preload("LinkedList.gd")

var displayText
var slotNum

# Called when the node enters the scene tree for the first time.
func _ready():
    displayText = get_child(0).text
    slotNum = get_position_in_parent()
    print("Child Num: " + String(slotNum))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func _on_ColorRect2_mouse_entered():
    print("Mouse Entered!")
    var in_button = get_parent().get_node("IN")
    var out_button = get_parent().get_node("OUT")
    
    if in_button.isDragging && in_button.inX && in_button.inY :
        color = Color(0,1,0,1)
        get_child(0).set_text("IN")
        
        in_button.inX = false
        in_button.inY = false
        in_button.setOriginalPos()
    
    if out_button.isDragging && out_button.inX && out_button.inY:
        color = Color(0,1,0,1)
        get_child(0).set_text("OUT")
        
        out_button.inX = false
        out_button.inY = false
        out_button.setOriginalPos()
        
