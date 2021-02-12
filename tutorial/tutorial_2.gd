extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    $Intro.popup_centered()
    

func _on_Intro_OK_Button_pressed():
    $Intro.set_visible(false)            # hide intro 1
    
    $slotsBG.set_visible(true)          #   slot elements set visible
    $slot0.set_visible(true)
    $slot1.set_visible(true)
    $slot2.set_visible(true)
    $slot3.set_visible(true)
    
    $Intro2.set_visible(true)                        # pop up intro2
    $AnimationPlayer.play("slot_animation")
    

func _on_intro2_OK_Button_pressed():
    $AnimationPlayer.stop()
    $Intro2.set_visible(false)
    $Intro3.set_visible(true)
    $IN.set_visible(true)
    $slot0.set_visible(true)
    
    $slot1.set_visible(false)                   # slot elements set not visible
    $slot2.set_visible(false)
    $slot3.set_visible(false)
    


func _on_slot0_mouse_entered():
    var IN_block = get_node("IN")
    print("In rect")
    
    if IN_block.position != IN_block.originalPos:                   # intro 3 finished
        $slot0.color = Color(0,1,0,1)
        $slot0.get_node("typeString").text = "IN"
        $IN.setOriginalPos()
        $ADD.setOriginalPos()
        
        $IN.set_visible(false)
        $Intro3.set_visible(false)
        $slot1.set_visible(true)
        $slot2.set_visible(true)
        $slot3.set_visible(true)
        
        $Intro4.set_visible(true)
        $AnimationPlayer.play("address_field_anime")
        

func _on_intro4_ok_Button_pressed():
    $Intro4.set_visible(false)
    $Intro5.set_visible(true)
    

func _on_intro5_ok_Button_pressed():
    $Intro5.set_visible(false)
    $Intro6.set_visible(true)
    $AnimationPlayer.stop()                               #stop the address animation
    
    $slot0.set_visible(false)
    $slot1.set_visible(true)
    $slot2.set_visible(false)
    $slot3.set_visible(false)
    
    $slot1.get_node("address").set_visible(false)
    
    $ADD.set_visible(true)
    

func _on_slot1_mouse_entered():
    var ADD_block = get_node("ADD")
    print("In rect")
    
    if ADD_block.position != ADD_block.originalPos:
        $slot1.color = Color(1,1,0,1)
        $slot1.get_node("typeString").text = "ADD"
        
        $ADD.setOriginalPos()
        $IN.setOriginalPos()
        
        $slot1.get_node("address").set_visible(true)
        

func _on_slot1_address_text_changed():
    
    if $slot1.get_node("address").text == "10":                   # intro 6 finished
        $Intro6.set_visible(false)
        $ADD.set_visible(false)
        
        $Intro7.set_visible(true)
        

func _on_intro7_ok_Button_pressed():
    $Intro7.set_visible(false)
    $Intro8.set_visible(true)

func _on_slot1_discard_pressed():
    
    $slot1.color = Color(1,1,1,1)
    $slot1.get_node("typeString").text = ""
    $slot1.get_node("address").text = "00" 
    
    $Intro7.set_visible(false)
    $Intro8.set_visible(false)
    $Intro9.set_visible(true)
    

func _on_intro9_ok_Button_pressed():
    $Intro9.set_visible(false)
    $Intro10.set_visible(true)
    
    $slot0.set_visible(false)
    $slot1.set_visible(false)
    $slot1.get_node("address").set_visible(false)
    
    $slot2.get_node("typeString").text = "SUB"
    $slot2.get_node("address").text = "15"
    $slot2.color = Color(1,1,0,1)
    
    $slot2.set_visible(true)
    $slot3.set_visible(true)
    
    

func _on_slot3_mouse_entered():
    
    if $SUB.position.y > $slot3.rect_position.y:                   # Intro 10 OK
        
        $SUB.set_visible(false)
        $slot2.get_node("Position2D").set_script(null)
        
        $slot3.color = Color(1,1,0,1)
        $slot3.get_node("typeString").text = "SUB"
        $slot3.get_node("address").text = "15"
        
        $slot0.get_node("typeString").text = "BRZ"
        $slot0.color = Color(1,0.597,0,1)
        $slot0.get_node("address").text = "4"
        
        $slot1.get_node("typeString").text = "LDA"
        $slot1.color = Color(0,0,1,1)
        $slot1.get_node("address").text = "99"
        
        $slot2.get_node("typeString").text = "ADD"
        $slot2.color = Color(1,1,0,1)
        $slot2.get_node("address").text = "98"
        
        $slot0.set_visible(true)
        $slot1.set_visible(true)
        $slot2.set_visible(true)
        $slot3.set_visible(true)
        
        $slot3.get_node("address").set_visible(true)
        $slot0.get_node("address").set_visible(true)
        $slot1.get_node("address").set_visible(true)
        $slot2.get_node("address").set_visible(true)
        
        $Intro10.set_visible(false)
        $Intro11.set_visible(true)
        
        

func _on_intro11_ok_Button_pressed():
    $Intro11.set_visible(false)
    $Intro12.set_visible(true)
    
    $slot1.get_node("Label").set("custom_colors/font_color", Color(1,0.597,0,1))
    $slot2.get_node("Label").set("custom_colors/font_color", Color(1,0.597,0,1))

func _on_intro12_ok_Button_pressed():
    $slot0.set_visible(false)
    $slot1.set_visible(false)
    $slot2.set_visible(false)
    $slot3.set_visible(false)
    $slotsBG.set_visible(false)
    $Intro12.set_visible(false)
    $Intro13.set_visible(true)

func _on_intro13_ok_Button_pressed():
    _on_backButton_pressed()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func _on_backButton_pressed():
    print("Change scene: Tutorial Menu")
    get_tree().change_scene("res://tutorialMenu.tscn")






















