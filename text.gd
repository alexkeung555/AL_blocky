extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass
    
    
    


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    set_text("")
    
    for n in range(get_parent().get_child_count()-1):
        
        var child = get_parent().get_child(n)
        var text : String = get_text()
        
        text += "\n Child " + String(n+1) + " position: " + String(child.position) + "  downSlot Pos: " + String(child.downSlotX) + " , " + String (child.downSlotY)
        set_text(text)
    
    
    
