extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var currentShowBlock : String
var tempString
var semaphoreForAnimePlayer1 : bool = false
var semaphoreForAnimePlayer2 : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
    currentShowBlock = ""
    #$AnimationPlayer.play("tut1_anime_IN")
    #$AnimationPlayer.play_backwards("tut1_anime_IN")

func _on_backButton_pressed():
    print("Change scene: Tutorial Menu")
    get_tree().change_scene("res://tutorialMenu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func reversedAnime():
    if currentShowBlock != "":
        $AnimationPlayer2.play_backwards("tut1_anime_" + currentShowBlock)
    else:
        semaphoreForAnimePlayer2 = false                                    # first play, animationPlayer 2 no need to play at first

func setSemaphoreTrue():
    semaphoreForAnimePlayer1 = true
    semaphoreForAnimePlayer2 = true

func checkSemaphore():
    if !semaphoreForAnimePlayer1 && !semaphoreForAnimePlayer2:
        return true
    else:
        return false

func _on_AnimationPlayer_animation_finished(anim_name):
    semaphoreForAnimePlayer1 = false
    #print("Animeplayer1 finished")

func _on_AnimationPlayer2_animation_finished(anim_name):
    semaphoreForAnimePlayer2 = false
    #print("Animeplayer2 finished")


func _on_IN_pressed():
    
    
    if currentShowBlock != "IN" && checkSemaphore():
        setSemaphoreTrue()
        $AnimationPlayer.play("tut1_anime_IN")
        reversedAnime()
        
        currentShowBlock = "IN"

func _on_OUT_pressed():
    
    
    if currentShowBlock != "OUT" && checkSemaphore():
        setSemaphoreTrue()
        reversedAnime()
        $AnimationPlayer.play("tut1_anime_OUT")
        currentShowBlock = "OUT"


func _on_SUB_pressed():
    
    
    if currentShowBlock != "SUB" && checkSemaphore():
        setSemaphoreTrue()
        reversedAnime()
        $AnimationPlayer.play("tut1_anime_SUB")
        currentShowBlock = "SUB"


func _on_STO_pressed():
    
    
    if currentShowBlock != "STO" && checkSemaphore():
        setSemaphoreTrue()
        $AnimationPlayer.play("tut1_anime_STO")
        reversedAnime()
        currentShowBlock = "STO"


func _on_BRZ_pressed():
    
    
    if currentShowBlock != "BRZ" && checkSemaphore():
        setSemaphoreTrue()
        $AnimationPlayer.play("tut1_anime_BRZ")
        reversedAnime()
        currentShowBlock = "BRZ"


func _on_BRP_pressed():
    
    
    if currentShowBlock != "BRP" && checkSemaphore():
        setSemaphoreTrue()
        $AnimationPlayer.play("tut1_anime_BRP")
        reversedAnime()
        currentShowBlock = "BRP"


func _on_HLT_pressed():
    
    
    if currentShowBlock != "HLT" && checkSemaphore():
        setSemaphoreTrue()
        $AnimationPlayer.play("tut1_anime_HLT")
        reversedAnime()
        currentShowBlock = "HLT"



func _on_BR_pressed():
    
    
    if currentShowBlock != "BR" && checkSemaphore():
        setSemaphoreTrue()
        $AnimationPlayer.play("tut1_anime_BR")
        reversedAnime()
        currentShowBlock = "BR"


func _on_LDA_pressed():
    
    
    if currentShowBlock != "LDA" && checkSemaphore():
        setSemaphoreTrue()
        $AnimationPlayer.play("tut1_anime_LDA")
        reversedAnime()
        currentShowBlock = "LDA"


func _on_ADD_pressed():
    
    
    if currentShowBlock != "ADD" && checkSemaphore():
        setSemaphoreTrue()
        $AnimationPlayer.play("tut1_anime_ADD")
        reversedAnime()
        currentShowBlock = "ADD"


func _on_DAT_pressed():
    
    
    if currentShowBlock != "DAT" && checkSemaphore():
        setSemaphoreTrue()
        $AnimationPlayer.play("tut1_anime_DAT")
        reversedAnime()
        currentShowBlock = "DAT"


