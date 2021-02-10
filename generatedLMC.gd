extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const LinkedList = preload("LinkedList.gd")
var blockLinkedList = LinkedList.List.new()

# Called when the node enters the scene tree for the first time.
func _ready():
    print("Loaded: generatedLMC")
    
    

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func get_LMC_linkedList():
    return blockLinkedList

func set_LMC_linkedList(lmc):
    
    blockLinkedList = LinkedList.List.new()
    blockLinkedList._init()
    
    blockLinkedList = lmc
    
    print("LMC linkedList replaced")
    print(blockLinkedList.printall())

