extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var pageNum
var slotNumShouldChangeColor = []

# Called when the node enters the scene tree for the first time.
func _ready():

    pageNum = 1
    setBlockNum()
    
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func setBlockNum():
    
    var pageNumberOffset = (pageNum-1) * 10
    
    for  i in range(10):
        get_parent().get_node("slot" + String(i) + "/blockNum").set("custom_colors/font_color", Color(1,1,1,1))
        
        
    for  i in range(10):
        get_parent().get_node("slot" + String(i) + "/blockNum").set_text(String(i + pageNumberOffset))
        
        for x in slotNumShouldChangeColor:
            if x == i+pageNumberOffset:
                get_parent().get_node("slot" + String(i) + "/blockNum").set("custom_colors/font_color", Color(1,0.597,0,1))
            
    
    slotNumShouldChangeColor = []


func notifyPageChanged():
    
    
    for i in range(10):
        get_parent().get_node("slot" + String(i))._on_page_changed()            # update block when page changed

func nextPagePressed():
    
    if pageNum >= 10 :
        print("page number is 10, no action taken")
    
    else:
        pageNum += 1
        get_parent().get_node("pageNumDisplayText").set_text("Page: " + String(pageNum) + " / 10")
        notifyPageChanged()


func previousPagePressed():
    
    if pageNum <= 1:
        print("page number is 0, no action taken")
    
    else:
        pageNum -= 1
        get_parent().get_node("pageNumDisplayText").set_text("Page: " + String(pageNum) + " / 10")
        notifyPageChanged()

func checkBranching():
    for i in range (11):
        if i == 0:
                continue
        
        for y in range(10):                                                      
            if get_parent().get_node("slot" + String(y)).slotDetailsObj[i].typeString == "BRZ" || get_parent().get_node("slot" + String(y)).slotDetailsObj[i].typeString == "BRP" || get_parent().get_node("slot" + String(y)).slotDetailsObj[i].typeString == " BR":
                
                var address = get_parent().get_node("slot" + String(y)).slotDetailsObj[i].address
                var slotNum = y + (i-1)*10
                
                if int(address) > slotNum:
                    for z in range(int(address)):
                        if z <= slotNum:
                            continue
                        
                        slotNumShouldChangeColor.append(z)
    
    
    
        

