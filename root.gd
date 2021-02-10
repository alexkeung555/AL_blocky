extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var draggingIconIsDisplaying

const LinkedList = preload("LinkedList.gd")
var blockLinkedList 


# Called when the node enters the scene tree for the first time.
func _ready():
    draggingIconIsDisplaying = false
    get_node("hintTextDisplayer").push_align(3)
    reset_LMC_linkedList()
    
    #blockLinkedList.insertNode(0,901)
    #blockLinkedList.insertNode(1,902)
    #blockLinkedList.insertNode(4,800)

    #var readLinkedList = blockLinkedList
    #print(readLinkedList.printall())
    
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func reset_LMC_linkedList():
    blockLinkedList = LinkedList.List.new()                                                                              # re-init linkedList
    blockLinkedList._init()

func compile_LMC():
    print("compile LMC")
    reset_LMC_linkedList()
    
    for page_num in range (11):              #1-11
        if page_num == 0:
            continue
        
        for slot_num in range (10):              #0-9
            var typeString = get_node("slot" + String(slot_num)).slotDetailsObj[page_num].typeString
            
            if typeString != "":
                var slot = slot_num + (page_num-1) * 10
                var opCode = get_node("slot" + String(slot_num)).slotDetailsObj[page_num].opCode
                var address = int(get_node("slot" + String(slot_num)).slotDetailsObj[page_num].address)
                    
                if typeString != "DAT":                                 # address checking, shouldn't exceed 0-99 except DAT block
                    if address > 99 || address < 0:
                       get_node("hintTextDisplayer").text = "Compilation error! \n The address of slot " + String(slot) + " shouldn't exceed 0-99!"
                       reset_LMC_linkedList()
                       return
                
                blockLinkedList.insertNode( slot, opCode + address)                  # add to linkedList
    
    print(blockLinkedList.printall())

func changeChildIndex(node, index):
    move_child(node, index)

func updateSlots():
    var pageNum = get_node("pageNumDisplayText").pageNum
    
    for i in range (10):
        var addressBinding = get_node("slot" + String(i)).slotDetailsObj[pageNum].addressBinding
        get_node("slot" + String(i)).get_node("Address").set_visible(!addressBinding)               # address slot binding update


func backToMenu():
    get_tree().change_scene("res://MainMenu.tscn")
