extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var sizeX = 130
var sizeY = 33
var isDragging : bool = false
var inX = false
var inY = false
var MouseOver = false
var desiredPos
var originalPos

# Called when the node enters the scene tree for the first time.
func _ready():
    originalPos = position
    
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    #print("inX: " + String(inX) + "  inY:" + String(inY) + "   isDragging: " + String(isDragging))
    
    if isDragging && inX && inY:
        position = desiredPos
        
        

func setOriginalPos():
   set_position(originalPos)

func _input(event):
   # Mouse in viewport coordinates.
    if event is InputEventMouseButton :
        #print("Mouse Click/Unclick at: ", event.position)
        
        # check mouse within the box
        if event.position.x > position.x && event.position.x < position.x + sizeX : 
            inX = true
            
        else:
            inX = false
        
        if event.position.y > position.y && event.position.y < position.y + sizeY: 
            inY = true
            
        else:
            inY = false
        
        if isDragging :
            isDragging = false
            #setOriginalPos()
            
        else:
            isDragging = true
            
    elif event is InputEventMouseMotion:
        #print("Mouse Motion at: ", event.position)
        desiredPos = event.position
       
