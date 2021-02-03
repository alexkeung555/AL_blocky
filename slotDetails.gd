extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const LinkedList = preload("LinkedList.gd")

var slotNum
var address
var typeString
var opCode

# Called when the node enters the scene tree for the first time.
func _ready():
    slotNum = get_position_in_parent()
    typeString = get_node("typeString")
    address = get_node("Address").text
    opCode = 0
    print("Child Num: " + String(slotNum))
    


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func resetProperties():
    color = Color(1,1,1,1)
    typeString.set_text("")
    typeString.set("custom_colors/default_color", Color(0,0,0,1))
    opCode = 0
    get_node("Address").text = "00"
    address = 0
    
    

func _on_ColorRect_mouse_entered():

    print("Mouse Entered!" + String(address))
    
    var in_button = get_parent().get_node("IN")
    var out_button = get_parent().get_node("OUT")
    var add_button = get_parent().get_node("ADD")
    var sub_button = get_parent().get_node("SUB")
    var br_button = get_parent().get_node("BR")
    var brz_button = get_parent().get_node("BRZ")
    var brp_button = get_parent().get_node("BRP")
    var lda_button = get_parent().get_node("LDA")
    var sto_button = get_parent().get_node("STO")
    var hlt_button = get_parent().get_node("HLT")
    
    
    if in_button.isDragging && in_button.inX && in_button.inY  :
        color = Color(0,1,0,1)
        typeString.set_text(" IN")
        opCode = 901
        
        in_button.inX = false
        in_button.inY = false
        in_button.setOriginalPos()
    
    if out_button.isDragging && out_button.inX && out_button.inY :
        color = Color(0,1,0,1)
        typeString.set_text("OUT")
        opCode = 902
        
        out_button.inX = false
        out_button.inY = false
        out_button.setOriginalPos()
    
    if add_button.isDragging && add_button.inX && add_button.inY :
        color = Color(1,1,0,1)
        typeString.set_text("ADD")
        opCode = 100
        
        add_button.inX = false
        add_button.inY = false
        add_button.setOriginalPos()
    
    if sub_button.isDragging && sub_button.inX && sub_button.inY :
        color = Color(1,1,0,1)
        typeString.set_text("SUB")
        opCode = 200
        
        sub_button.inX = false
        sub_button.inY = false
        sub_button.setOriginalPos()
    
    if br_button.isDragging && br_button.inX && br_button.inY :
        color = Color(1,0.597,0,1)
        typeString.set_text(" BR")
        opCode = 600
        
        br_button.inX = false
        br_button.inY = false
        br_button.setOriginalPos()
        
    if brz_button.isDragging && brz_button.inX && brz_button.inY :
        color = Color(1,0.597,0,1)
        typeString.set_text("BRZ")
        opCode = 700
        
        brz_button.inX = false
        brz_button.inY = false
        brz_button.setOriginalPos()
        
    if brp_button.isDragging && brp_button.inX && brp_button.inY :
        color = Color(1,0.597,0,1)
        typeString.set_text("BRP")
        opCode = 800
        
        brp_button.inX = false
        brp_button.inY = false
        brp_button.setOriginalPos()
        
    if lda_button.isDragging && lda_button.inX && lda_button.inY :
        color = Color(0,0,1,1)
        typeString.set_text("LDA")
        opCode = 500
        
        lda_button.inX = false
        lda_button.inY = false
        lda_button.setOriginalPos()
        
    if sto_button.isDragging && sto_button.inX && sto_button.inY :
        color = Color(0,0,1,1)
        typeString.set_text("STO")
        opCode = 300
        
        sto_button.inX = false
        sto_button.inY = false
        sto_button.setOriginalPos()
        
    if hlt_button.isDragging && hlt_button.inX && hlt_button.inY :
        color = Color(0,0,0,1)
        typeString.set_text("HLT")
        typeString.set("custom_colors/default_color", Color(1,1,1,1))
        opCode = 0
        
        hlt_button.inX = false
        hlt_button.inY = false
        hlt_button.setOriginalPos()


func _on_Address_changed():
    address = get_node("Address").text         # set the address value after mouse entered



