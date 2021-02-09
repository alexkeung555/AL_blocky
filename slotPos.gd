extends Position2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var previousDirection
var directionLock
var previousMousePos
var direction : bool
var originalTreeIndex
var targetTreeIndexOffset
var slotNumForDroppingBlock
var sizeX
var sizeY
var isDragging
var inX
var inY
var desiredPos
var blockNum : int
var targetSlotNum
var slotIsDragging : bool

var x
var y
var originalPos: Vector2
var slotPosYinPageArray = [0,0,0,0,0,0,0,0,0,0]
var originalPosYinPageAray = [0,0,0,0,0,0,0,0,0,0]
var slotNodeName = [0,0,0,0,0,0,0,0,0,0,]
var swapped = [false,false,false,false,false,false,false,false,false,false]

# Called when the node enters the scene tree for the first time.
func _ready():
    
    directionLock = false
    direction = true
    targetTreeIndexOffset = 1
    blockNum= int(get_parent().get_node("blockNum").text)
    slotIsDragging = false
    originalTreeIndex = get_parent().get_position_in_parent() - 1
    originalPos = get_parent().rect_position
    
    inX = false
    inY = false
    isDragging = false
    
    sizeX = get_parent().get_size().x
    sizeY = get_parent().get_size().y
    
    for i in range(10):
        
        var path = "slot" + String(i)
        slotPosYinPageArray[i] = get_parent().get_parent().get_node(path).get_node("Position2D").get_parent().rect_position.y
        originalPosYinPageAray[i] = get_parent().get_parent().get_node(path).get_node("Position2D").get_parent().rect_position.y
        slotNodeName[i] = path

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    
    if previousMousePos != null:
        if desiredPos.y > previousMousePos:                                        # true is down, false is up
            direction = true
        else:
            direction = false
    
    if !directionLock:
        previousDirection = direction
        directionLock = true
    
    if isDragging && inX && inY :
        #print("slot should move")
        
        if previousMousePos == null:
            return
        
        var IconTexture
        var pageNum = get_parent().currentPageNumObj.pageNum
        var nodeName = get_parent().slotDetailsObj[pageNum].typeString
        
        if nodeName == "" :
            pass
        else:
            if !get_parent().get_parent().draggingIconIsDisplaying:
                
                IconTexture = get_parent().get_parent().get_node(nodeName).get_texture()
                
                get_parent().get_parent().get_node("DraggingIcon").set_texture(IconTexture)
                get_parent().get_parent().draggingIconIsDisplaying = true
                
        get_parent().get_parent().get_node("DraggingIcon").visible = true
        
        if desiredPos.y < originalPosYinPageAray[0]-1 || desiredPos.y > originalPosYinPageAray[9]-1:
            pass
        else:
            get_parent().get_parent().get_node("DraggingIcon").position.x = get_parent().rect_position.x
            get_parent().get_parent().get_node("DraggingIcon").position.y = desiredPos.y
        
        
        
        var inSlotOrder = int(desiredPos.y - originalPosYinPageAray[0]) % 40
        targetSlotNum = int(desiredPos.y - originalPosYinPageAray[0]) / 40
        
        
        if previousDirection != direction:
            directionLock = false
            return
        
            
        if inSlotOrder <= 3:                                                                                                                    # set value based on rendering speed, lower speed sys might have to set higher value
            
            if targetSlotNum-1 < 0 ||  targetSlotNum > 9:                                       # upper and lower swap limit
                return
            
            slotNumForDroppingBlock = targetSlotNum
            #print("up: " +  String(targetSlotNum-1) + " down: " + String(targetSlotNum))
            
            if swapped[targetSlotNum]:           # avoid duplicate swapping
                return
            
            
            var color
            var typeString
            var textColor
            var address
            var opCode
            var addressBinding
            
            color = get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).slotDetailsObj[pageNum].color                                                                                                #move value to temp
            typeString = get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).slotDetailsObj[pageNum].typeString
            textColor = get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).slotDetailsObj[pageNum].textColor
            address = get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).slotDetailsObj[pageNum].address
            opCode = get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).slotDetailsObj[pageNum].opCode
            addressBinding = get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).slotDetailsObj[pageNum].addressBinding
            
            get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).slotDetailsObj[pageNum].typeString = get_parent().get_parent().get_node("slot" + String(targetSlotNum)).slotDetailsObj[pageNum].typeString            #swap text from down to up
            get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).slotDetailsObj[pageNum].color = get_parent().get_parent().get_node("slot" + String(targetSlotNum)).slotDetailsObj[pageNum].color
            get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).slotDetailsObj[pageNum].opCode = get_parent().get_parent().get_node("slot" + String(targetSlotNum)).slotDetailsObj[pageNum].opCode
            get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).slotDetailsObj[pageNum].textColor = get_parent().get_parent().get_node("slot" + String(targetSlotNum)).slotDetailsObj[pageNum].textColor
            get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).slotDetailsObj[pageNum].address = get_parent().get_parent().get_node("slot" + String(targetSlotNum)).slotDetailsObj[pageNum].address
            get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).slotDetailsObj[pageNum].addressBinding = get_parent().get_parent().get_node("slot" + String(targetSlotNum)).slotDetailsObj[pageNum].addressBinding
            
            get_parent().get_parent().get_node("slot" + String(targetSlotNum)).slotDetailsObj[pageNum].typeString = typeString                                                                                                            #swap text from temp to up
            get_parent().get_parent().get_node("slot" + String(targetSlotNum)).slotDetailsObj[pageNum].color = color
            get_parent().get_parent().get_node("slot" + String(targetSlotNum)).slotDetailsObj[pageNum].opCode = opCode
            get_parent().get_parent().get_node("slot" + String(targetSlotNum)).slotDetailsObj[pageNum].address = address
            get_parent().get_parent().get_node("slot" + String(targetSlotNum)).slotDetailsObj[pageNum].textColor = textColor
            get_parent().get_parent().get_node("slot" + String(targetSlotNum)).slotDetailsObj[pageNum].addressBinding = addressBinding
            
            #get_parent().get_parent().get_node("pageNumDisplayText").notifyPageChanged()
            
            if direction:
                get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).color = get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).slotDetailsObj[pageNum].color                                                          # update slots (down scoll)
                get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).get_node("typeString").text = get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).slotDetailsObj[pageNum].typeString
                get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).get_node("typeString").set("custom_colors/default_color", get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).slotDetailsObj[pageNum].textColor)
                get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).get_node("Address").text = get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).slotDetailsObj[pageNum].address
                #get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).get_node("Address").set_visible(get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).slotDetailsObj[pageNum].addressBinding)          # binding address slot
            
                get_parent().get_parent().get_node("slot" + String(targetSlotNum)).color = Color(1,1,1,1)
                get_parent().get_parent().get_node("slot" + String(targetSlotNum)).get_node("typeString").text = ""
                get_parent().get_parent().get_node("slot" + String(targetSlotNum)).get_node("typeString").set("custom_colors/default_color", Color(0,0,0,1))
                get_parent().get_parent().get_node("slot" + String(targetSlotNum)).address = get_parent().get_parent().get_node("slot" + String(targetSlotNum)).slotDetailsObj[pageNum].address
            else:
                get_parent().get_parent().get_node("slot" + String(targetSlotNum)).color = get_parent().get_parent().get_node("slot" + String(targetSlotNum)).slotDetailsObj[pageNum].color                                                          # update slots (up scoll)
                get_parent().get_parent().get_node("slot" + String(targetSlotNum)).get_node("typeString").text = get_parent().get_parent().get_node("slot" + String(targetSlotNum)).slotDetailsObj[pageNum].typeString
                get_parent().get_parent().get_node("slot" + String(targetSlotNum)).get_node("typeString").set("custom_colors/default_color", get_parent().get_parent().get_node("slot" + String(targetSlotNum)).slotDetailsObj[pageNum].textColor)
                get_parent().get_parent().get_node("slot" + String(targetSlotNum)).get_node("Address").text = get_parent().get_parent().get_node("slot" + String(targetSlotNum)).slotDetailsObj[pageNum].address
                #get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).get_node("Address").set_visible(get_parent().get_parent().get_node("slot" + String(targetSlotNum)).slotDetailsObj[pageNum].addressBinding)
            
                get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).color = Color(1,1,1,1)
                get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).get_node("typeString").text = ""
                get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).get_node("typeString").set("custom_colors/default_color", Color(0,0,0,1))
                get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).address = get_parent().get_parent().get_node("slot" + String(targetSlotNum-1)).slotDetailsObj[pageNum].address
            
            swapped[targetSlotNum] = true
            print("swapped")
            
            get_parent().get_parent().updateSlots()
            
            #if desiredPos.y > slotPosYinPageArray[blockNum + targetTreeIndexOffset] :
            
            #get_parent().get_node("typeString").text = typeString
            #get_parent().color = get_parent().get_parent().get_node(slotNodeName[blockNum + targetTreeIndexOffset]).slotDetailsObj[pageNum].color
            
            #empty the next slot after swapping
            #get_parent().get_parent().get_node(slotNodeName[blockNum + targetTreeIndexOffset]).get_node("typeString").text = ""
            #get_parent().get_parent().get_node(slotNodeName[blockNum + targetTreeIndexOffset]).color = Color(1,1,1,1)
        
        #get_parent().get_parent().changeChildIndex (get_parent() , get_parent().get_parent().get_child_count() - 1)            # change the layer to first rendering
        
        #get_parent().rect_position.y = desiredPos.y                               # change position of the selected slot
        
        #if direction:
            #get_parent().get_parent().get_node("slot" + String(originalTreeIndex+1)).rect_position.y = originalPosYinPageAray[originalTreeIndex+1] - offset
        
        #else:
            #get_parent().get_parent().get_node("slot" + String(originalTreeIndex-1)).rect_position.y = originalPosYinPageAray[originalTreeIndex-1] + offset

func _input(event):
   # Mouse in viewport coordinates.
    if event is InputEventMouseButton :
        print("Mouse Click/Unclick at: ", event.position)
        
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
            print("stop Dragging")
            
            isDragging = false
            get_parent().get_parent().get_node("DraggingIcon").visible = false
            
            
            if slotNumForDroppingBlock != null:
                
                if direction:
                    var pageNum = get_parent().currentPageNumObj.pageNum
                    get_parent().get_parent().get_node("slot" + String(slotNumForDroppingBlock)).color = get_parent().get_parent().get_node("slot" + String(slotNumForDroppingBlock)).slotDetailsObj[pageNum].color                                                          # update slots
                    get_parent().get_parent().get_node("slot" + String(slotNumForDroppingBlock)).get_node("typeString").text = get_parent().get_parent().get_node("slot" + String(slotNumForDroppingBlock)).slotDetailsObj[pageNum].typeString
                    get_parent().get_parent().get_node("slot" + String(slotNumForDroppingBlock)).get_node("typeString").set("custom_colors/default_color", get_parent().get_parent().get_node("slot" + String(slotNumForDroppingBlock)).slotDetailsObj[pageNum].textColor)
                    get_parent().get_parent().get_node("slot" + String(slotNumForDroppingBlock)).get_node("Address").text = get_parent().get_parent().get_node("slot" + String(slotNumForDroppingBlock)).slotDetailsObj[pageNum].address
                else:
                    var pageNum = get_parent().currentPageNumObj.pageNum
                    get_parent().get_parent().get_node("slot" + String(slotNumForDroppingBlock-1)).color = get_parent().get_parent().get_node("slot" + String(slotNumForDroppingBlock-1)).slotDetailsObj[pageNum].color                                                          # update slots
                    get_parent().get_parent().get_node("slot" + String(slotNumForDroppingBlock-1)).get_node("typeString").text = get_parent().get_parent().get_node("slot" + String(slotNumForDroppingBlock-1)).slotDetailsObj[pageNum].typeString
                    get_parent().get_parent().get_node("slot" + String(slotNumForDroppingBlock-1)).get_node("typeString").set("custom_colors/default_color", get_parent().get_parent().get_node("slot" + String(slotNumForDroppingBlock-1)).slotDetailsObj[pageNum].textColor)
                    get_parent().get_parent().get_node("slot" + String(slotNumForDroppingBlock-1)).get_node("Address").text = get_parent().get_parent().get_node("slot" + String(slotNumForDroppingBlock-1)).slotDetailsObj[pageNum].address
                
                
                get_parent().get_parent().draggingIconIsDisplaying = false
                get_parent().get_parent().get_node("pageNumDisplayText").notifyPageChanged()
                print("dropping"  + String(slotNumForDroppingBlock))
                print(swapped)
                
                directionLock = false
                
                for i in range(10):
                    swapped[i] = false
                
            
            
        else:
            print("start Dragging")
            isDragging = true
            previousMousePos = event.position.y
            
            if inX && inY:
                get_parent().get_node("typeString").text = ""
                get_parent().color = Color(1,1,1,1)
            
            
        
        
        
    elif event is InputEventMouseMotion:
        #print("Mouse Motion at: ", event.position)
        desiredPos = event.position
       
