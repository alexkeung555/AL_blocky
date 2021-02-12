extends Position2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var sizeX = 100
var sizeY = 25
var inX = false
var inY = false
var isDragging = false
var desiredPos

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    
    if isDragging && inX && inY:
        get_parent().color = Color(1,1,1,1)
        get_parent().get_node("typeString").text = ""
        get_parent().get_node("address").text = "00"
        
        get_parent().get_parent().get_node("SUB").set_visible(true)
        get_parent().get_parent().get_node("SUB").position.y = desiredPos.y

func _input(event):
   # Mouse in viewport coordinates.
    if event is InputEventMouseButton :
        #print("Mouse Click/Unclick at: ", event.position)
        
        # check mouse within the box
        if event.position.x > get_parent().rect_position.x && event.position.x < get_parent().rect_position.x + sizeX : 
            inX = true
            
        else:
            inX = false
        
        if event.position.y > get_parent().rect_position.y && event.position.y < get_parent().rect_position.y + sizeY: 
            inY = true
            
        else:
            inY = false
        
  
        if isDragging :
            #print("stop Dragging")
            isDragging = false
            
        else:
            #print("start Dragging")
            isDragging = true
            

        
    elif event is InputEventMouseMotion:
        #print("Mouse Motion at: ", event.position)
        desiredPos = event.position
