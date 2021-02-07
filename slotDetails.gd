extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const LinkedList = preload("LinkedList.gd")

var slotNum
var address
var typeString
var opCode

var slotDetailsObj = [0,0,0,0,0,0,0,0,0,0,0]               # 0 not access
var originalSlotDetailsObj = [0,0,0,0,0,0,0,0,0,0,0]       #
var currentPageNumObj

# Called when the node enters the scene tree for the first time.
func _ready():
    
    currentPageNumObj = get_parent().get_node("pageNumDisplayText")
    currentPageNumObj.pageNum = 1                                               #init page 1 
    
    for i in range(11):
        slotDetailsObj[i] = SlotDetails.new()
        slotDetailsObj[i].slotNum = get_position_in_parent() - 1
        slotDetailsObj[i].typeString = ""
        slotDetailsObj[i].address = get_node("Address").text
        slotDetailsObj[i].opCode = 0
        slotDetailsObj[i].color = Color(1,1,1,1)
        slotDetailsObj[i].textColor =  Color(0,0,0,1)
    
    originalSlotDetailsObj = slotDetailsObj                                     #copy original details
    
    slotNum = get_position_in_parent() - 1
    typeString = get_node("typeString")
    address = get_node("Address").text
    opCode = 0
    
    

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass
    

func discardSingleSlotProperties():
        print("pressed " + String(slotNum))
        
        slotDetailsObj[currentPageNumObj.pageNum] = SlotDetails.new()
        slotDetailsObj[currentPageNumObj.pageNum].slotNum = get_position_in_parent() - 1
        slotDetailsObj[currentPageNumObj.pageNum].typeString = ""
        slotDetailsObj[currentPageNumObj.pageNum].address = "00"
        slotDetailsObj[currentPageNumObj.pageNum].opCode = 0
        slotDetailsObj[currentPageNumObj.pageNum].color = Color(1,1,1,1)
        slotDetailsObj[currentPageNumObj.pageNum].textColor =  Color(0,0,0,1)
        _on_page_changed()
        get_parent().get_node("hintTextDisplayer").text = "Block discarded!"

func resetProperties():
    
    for i in range(11):
        slotDetailsObj[i] = SlotDetails.new()
        slotDetailsObj[i].slotNum = get_position_in_parent() - 1
        slotDetailsObj[i].typeString = ""
        slotDetailsObj[i].address = "00"
        slotDetailsObj[i].opCode = 0
        slotDetailsObj[i].color = Color(1,1,1,1)
        slotDetailsObj[i].textColor =  Color(0,0,0,1)
        
    _on_page_changed()
    get_parent().get_node("hintTextDisplayer").text = "All slots reset!"


func _on_ColorRect_mouse_entered():
    
    var in_button = get_parent().get_node(" IN")
    var out_button = get_parent().get_node("OUT")
    var add_button = get_parent().get_node("ADD")
    var sub_button = get_parent().get_node("SUB")
    var br_button = get_parent().get_node(" BR")
    var brz_button = get_parent().get_node("BRZ")
    var brp_button = get_parent().get_node("BRP")
    var lda_button = get_parent().get_node("LDA")
    var sto_button = get_parent().get_node("STO")
    var hlt_button = get_parent().get_node("HLT")
    
    if in_button.isDragging && in_button.inX && in_button.inY :
        
        slotDetailsObj[currentPageNumObj.pageNum].color = Color(0,1,0,1)
        slotDetailsObj[currentPageNumObj.pageNum].textColor = Color (0,0,0,1)
        slotDetailsObj[currentPageNumObj.pageNum].typeString = " IN"
        slotDetailsObj[currentPageNumObj.pageNum].opCode = 901
        
        color = slotDetailsObj[currentPageNumObj.pageNum].color
        typeString.set_text(slotDetailsObj[currentPageNumObj.pageNum].typeString)
        typeString.set("custom_colors/default_color", slotDetailsObj[currentPageNumObj.pageNum].textColor)
        
        in_button.inX = false
        in_button.inY = false
        in_button.setOriginalPos()
        
        get_parent().get_node("hintTextDisplayer").text = "You put a" + slotDetailsObj[currentPageNumObj.pageNum].typeString + " block in slot " + String(get_node("blockNum").text)
    
    if out_button.isDragging && out_button.inX && out_button.inY  :
        
        slotDetailsObj[currentPageNumObj.pageNum].color = Color(0,1,0,1)
        slotDetailsObj[currentPageNumObj.pageNum].textColor = Color (0,0,0,1)
        slotDetailsObj[currentPageNumObj.pageNum].typeString = "OUT"
        slotDetailsObj[currentPageNumObj.pageNum].opCode = 902
        
        color = slotDetailsObj[currentPageNumObj.pageNum].color
        typeString.set_text(slotDetailsObj[currentPageNumObj.pageNum].typeString)
        typeString.set("custom_colors/default_color", slotDetailsObj[currentPageNumObj.pageNum].textColor)
        
        out_button.inX = false
        out_button.inY = false
        out_button.setOriginalPos()
        
        get_parent().get_node("hintTextDisplayer").text = "You put a " + slotDetailsObj[currentPageNumObj.pageNum].typeString + " block in slot " + String(get_node("blockNum").text)
    
    if add_button.isDragging && add_button.inX && add_button.inY  :
        
        slotDetailsObj[currentPageNumObj.pageNum].color = Color(1,1,0,1)
        slotDetailsObj[currentPageNumObj.pageNum].textColor = Color (0,0,0,1)
        slotDetailsObj[currentPageNumObj.pageNum].typeString = "ADD"
        slotDetailsObj[currentPageNumObj.pageNum].opCode = 100
        
        color = slotDetailsObj[currentPageNumObj.pageNum].color
        typeString.set_text(slotDetailsObj[currentPageNumObj.pageNum].typeString)
        typeString.set("custom_colors/default_color", slotDetailsObj[currentPageNumObj.pageNum].textColor)
        
        add_button.inX = false
        add_button.inY = false
        add_button.setOriginalPos()
        
        get_parent().get_node("hintTextDisplayer").text = "You put a " + slotDetailsObj[currentPageNumObj.pageNum].typeString + " block in slot " + String(get_node("blockNum").text)
    
    if sub_button.isDragging && sub_button.inX && sub_button.inY  :
        
        slotDetailsObj[currentPageNumObj.pageNum].color = Color(1,1,0,1)
        slotDetailsObj[currentPageNumObj.pageNum].textColor = Color (0,0,0,1)
        slotDetailsObj[currentPageNumObj.pageNum].typeString = "SUB"
        slotDetailsObj[currentPageNumObj.pageNum].opCode = 200
        
        color = Color(slotDetailsObj[currentPageNumObj.pageNum].color)
        typeString.set_text(slotDetailsObj[currentPageNumObj.pageNum].typeString)
        typeString.set("custom_colors/default_color", slotDetailsObj[currentPageNumObj.pageNum].textColor)
        
        sub_button.inX = false
        sub_button.inY = false
        sub_button.setOriginalPos()
        
        get_parent().get_node("hintTextDisplayer").text = "You put a " + slotDetailsObj[currentPageNumObj.pageNum].typeString + " block in slot " + String(get_node("blockNum").text)
    
    if br_button.isDragging && br_button.inX && br_button.inY  :
        
        slotDetailsObj[currentPageNumObj.pageNum].color = Color(1,0.597,0,1)
        slotDetailsObj[currentPageNumObj.pageNum].textColor = Color (0,0,0,1)
        slotDetailsObj[currentPageNumObj.pageNum].typeString = " BR"
        slotDetailsObj[currentPageNumObj.pageNum].opCode = 600
        
        color = slotDetailsObj[currentPageNumObj.pageNum].color
        typeString.set_text(slotDetailsObj[currentPageNumObj.pageNum].typeString)
        typeString.set("custom_colors/default_color", slotDetailsObj[currentPageNumObj.pageNum].textColor)
        
        br_button.inX = false
        br_button.inY = false
        br_button.setOriginalPos()
        
        get_parent().get_node("hintTextDisplayer").text = "You put a" + slotDetailsObj[currentPageNumObj.pageNum].typeString + " block in slot " + String(get_node("blockNum").text)
        
    if brz_button.isDragging && brz_button.inX && brz_button.inY  :
        
        slotDetailsObj[currentPageNumObj.pageNum].color = Color(1,0.597,0,1)
        slotDetailsObj[currentPageNumObj.pageNum].textColor = Color (0,0,0,1)
        slotDetailsObj[currentPageNumObj.pageNum].typeString = "BRZ"
        slotDetailsObj[currentPageNumObj.pageNum].opCode = 700
        
        color = slotDetailsObj[currentPageNumObj.pageNum].color
        typeString.set_text(slotDetailsObj[currentPageNumObj.pageNum].typeString)
        typeString.set("custom_colors/default_color", slotDetailsObj[currentPageNumObj.pageNum].textColor)
        
        brz_button.inX = false
        brz_button.inY = false
        brz_button.setOriginalPos()
        
        get_parent().get_node("hintTextDisplayer").text = "You put a " + slotDetailsObj[currentPageNumObj.pageNum].typeString + " block in slot " + String(get_node("blockNum").text)
        get_parent().get_node("pageNumDisplayText").checkBranching()
        get_parent().get_node("pageNumDisplayText").setBlockNum()
        
    if brp_button.isDragging && brp_button.inX && brp_button.inY  :
        
        slotDetailsObj[currentPageNumObj.pageNum].color = Color(1,0.597,0,1)
        slotDetailsObj[currentPageNumObj.pageNum].textColor = Color (0,0,0,1)
        slotDetailsObj[currentPageNumObj.pageNum].typeString = "BRP"
        slotDetailsObj[currentPageNumObj.pageNum].opCode = 800
        
        color = slotDetailsObj[currentPageNumObj.pageNum].color
        typeString.set_text(slotDetailsObj[currentPageNumObj.pageNum].typeString)
        typeString.set("custom_colors/default_color", slotDetailsObj[currentPageNumObj.pageNum].textColor)
        
        brp_button.inX = false
        brp_button.inY = false
        brp_button.setOriginalPos()
        
        get_parent().get_node("hintTextDisplayer").text = "You put a " + slotDetailsObj[currentPageNumObj.pageNum].typeString + " block in slot " + String(get_node("blockNum").text)
        get_parent().get_node("pageNumDisplayText").checkBranching()
        get_parent().get_node("pageNumDisplayText").setBlockNum()
        
        
    if lda_button.isDragging && lda_button.inX && lda_button.inY  :
        
        slotDetailsObj[currentPageNumObj.pageNum].color = Color(0,0,1,1)
        slotDetailsObj[currentPageNumObj.pageNum].textColor = Color (0,0,0,1)
        slotDetailsObj[currentPageNumObj.pageNum].typeString = "LDA"
        slotDetailsObj[currentPageNumObj.pageNum].opCode = 500
        
        color = slotDetailsObj[currentPageNumObj.pageNum].color
        typeString.set_text(slotDetailsObj[currentPageNumObj.pageNum].typeString)
        typeString.set("custom_colors/default_color", slotDetailsObj[currentPageNumObj.pageNum].textColor)
        
        lda_button.inX = false
        lda_button.inY = false
        lda_button.setOriginalPos()
        
        get_parent().get_node("hintTextDisplayer").text = "You put a " + slotDetailsObj[currentPageNumObj.pageNum].typeString + " block in slot " + String(get_node("blockNum").text)
        
    if sto_button.isDragging && sto_button.inX && sto_button.inY  :
        
        slotDetailsObj[currentPageNumObj.pageNum].color = Color(0,0,1,1)
        slotDetailsObj[currentPageNumObj.pageNum].textColor = Color (0,0,0,1)
        slotDetailsObj[currentPageNumObj.pageNum].typeString = "STO"
        slotDetailsObj[currentPageNumObj.pageNum].opCode = 300
        
        color = slotDetailsObj[currentPageNumObj.pageNum].color
        typeString.set_text(slotDetailsObj[currentPageNumObj.pageNum].typeString)
        typeString.set("custom_colors/default_color", slotDetailsObj[currentPageNumObj.pageNum].textColor)
        
        sto_button.inX = false
        sto_button.inY = false
        sto_button.setOriginalPos()
        
        get_parent().get_node("hintTextDisplayer").text = "You put a " + slotDetailsObj[currentPageNumObj.pageNum].typeString + " block in slot " + String(get_node("blockNum").text)
        
    if hlt_button.isDragging && hlt_button.inX && hlt_button.inY  :
        
        slotDetailsObj[currentPageNumObj.pageNum].color = Color(0,0,0,1)
        slotDetailsObj[currentPageNumObj.pageNum].typeString = "HLT"
        slotDetailsObj[currentPageNumObj.pageNum].textColor = Color (1,1,1,1)
        slotDetailsObj[currentPageNumObj.pageNum].opCode = 0
        
        color = slotDetailsObj[currentPageNumObj.pageNum].color
        typeString.set_text(slotDetailsObj[currentPageNumObj.pageNum].typeString)
        typeString.set("custom_colors/default_color", slotDetailsObj[currentPageNumObj.pageNum].textColor)
        
        hlt_button.inX = false
        hlt_button.inY = false
        hlt_button.setOriginalPos()
        
        get_parent().get_node("hintTextDisplayer").text = "You put a " + slotDetailsObj[currentPageNumObj.pageNum].typeString + " block in slot " + String(get_node("blockNum").text)
    


func _on_Address_changed():
    
    address = get_node("Address").text         # set the address value after mouse entered
    slotDetailsObj[currentPageNumObj.pageNum].address = get_node("Address").text
    get_parent().get_node("pageNumDisplayText").checkBranching()
    get_parent().get_node("pageNumDisplayText").setBlockNum()

func _on_page_changed():
    
    currentPageNumObj = get_parent().get_node("pageNumDisplayText")
    
    color = slotDetailsObj[currentPageNumObj.pageNum].color
    typeString.set_text(slotDetailsObj[currentPageNumObj.pageNum].typeString)
    typeString.set("custom_colors/default_color", slotDetailsObj[currentPageNumObj.pageNum].textColor)
    get_node("Address").set_text(slotDetailsObj[currentPageNumObj.pageNum].address)
    get_parent().get_node("pageNumDisplayText").checkBranching()
    get_parent().get_node("pageNumDisplayText").setBlockNum()                   # set block Number 
    

class SlotDetails:
    var slotNum
    var address
    var typeString
    var opCode
    var color : Color
    var textColor : Color
    





