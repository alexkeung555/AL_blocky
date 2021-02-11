extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var currentShowBlock : String
var tempString

# Called when the node enters the scene tree for the first time.
func _ready():
    currentShowBlock = ""
    #$AnimationPlayer.play("tut1_anime_IN")
    #$AnimationPlayer.play_backwards("tut1_anime_IN")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func reversedAnime():
    if currentShowBlock!= "":
        $AnimationPlayer2.play_backwards("tut1_anime_" + currentShowBlock)
        

func _on_backButton_pressed():
    print("Change scene: Tutorial Menu")
    get_tree().change_scene("res://tutorialMenu.tscn")

func _on_IN_pressed():
    
    if currentShowBlock != "IN":
        $AnimationPlayer.play("tut1_anime_IN")
        reversedAnime()
        
        currentShowBlock = "IN"

func _on_OUT_pressed():
    
    if currentShowBlock != "OUT":
        reversedAnime()
        $AnimationPlayer.play("tut1_anime_OUT")
        currentShowBlock = "OUT"


func _on_SUB_pressed():
    
    if currentShowBlock != "SUB":
        reversedAnime()
        $AnimationPlayer.play("tut1_anime_SUB")
        currentShowBlock = "SUB"


func _on_STO_pressed():
    
    if currentShowBlock != "STO":
        $AnimationPlayer.play("tut1_anime_STO")
        reversedAnime()
        currentShowBlock = "STO"


func _on_BRZ_pressed():
    
    if currentShowBlock != "BRZ":
        $AnimationPlayer.play("tut1_anime_BRZ")
        reversedAnime()
        currentShowBlock = "BRZ"


func _on_BRP_pressed():
    
    if currentShowBlock != "BRP":
        $AnimationPlayer.play("tut1_anime_BRP")
        reversedAnime()
        currentShowBlock = "BRP"


func _on_HLT_pressed():
    
    if currentShowBlock != "HLT":
        $AnimationPlayer.play("tut1_anime_HLT")
        reversedAnime()
        currentShowBlock = "HLT"



func _on_BR_pressed():
    
    if currentShowBlock != "BR":
        $AnimationPlayer.play("tut1_anime_BR")
        reversedAnime()
        currentShowBlock = "BR"


func _on_LDA_pressed():
    
    if currentShowBlock != "LDA":
        $AnimationPlayer.play("tut1_anime_LDA")
        reversedAnime()
        currentShowBlock = "LDA"


func _on_ADD_pressed():
    
    if currentShowBlock != "ADD":
        $AnimationPlayer.play("tut1_anime_ADD")
        reversedAnime()
        currentShowBlock = "ADD"


func _on_DAT_pressed():
    
    if currentShowBlock != "DAT":
        $AnimationPlayer.play("tut1_anime_DAT")
        reversedAnime()
        currentShowBlock = "DAT"
