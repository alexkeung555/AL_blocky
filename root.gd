extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var draggingIconIsDisplaying

const LinkedList = preload("LinkedList.gd")
var blockLinkedList = LinkedList.List.new()

# Called when the node enters the scene tree for the first time.
func _ready():
    draggingIconIsDisplaying = false
    get_node("hintTextDisplayer").push_align(3)
    
    blockLinkedList._init()
    blockLinkedList.insertNode(0,901)
    blockLinkedList.insertNode(1,902)
    blockLinkedList.insertNode(4,800)

    var readLinkedList = blockLinkedList
    print(readLinkedList.printall())
    
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func changeChildIndex(node, index):
    move_child(node, index)

func updateSlots():
    var pageNum = get_node("pageNumDisplayText").pageNum
    
    for i in range (10):
        var addressBinding = get_node("slot" + String(i)).slotDetailsObj[pageNum].addressBinding
        get_node("slot" + String(i)).get_node("Address").set_visible(!addressBinding)               # address slot binding update


func backToMenu():
    get_tree().change_scene("res://MainMenu.tscn")
