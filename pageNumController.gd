extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var pageNum

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
        get_parent().get_node("slot" + String(i) + "/blockNum").set_text(String(i + pageNumberOffset))


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

