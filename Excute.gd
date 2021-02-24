extends Node2D

onready var input = get_node("Input");
onready var output = get_node("Output");

var inputtext;
signal enter;
    
func _ready():
    var Linklist = get_node("/root/generatedLMC").get_LMC_linkedList();
    var Executor = self.Excutor.new();
    
    var text = Linklist.printall();
    output.text =str(output.text, '\n' + '\n' , text ,'\n'+'\n');
    var listarray =  Executor.List_ToArr(Linklist);
    execute(listarray,0,0);
    
func input():
    input.visible = true;
    yield(self,"enter");
    
func _on_Input_text_entered(new_text):
    input.clear();
    inputtext = int(new_text);
    input.visible = false;
    emit_signal("enter");
    
    

            
        
func backToMenu():
    get_tree().change_scene("res://MainMenu.tscn");

class Excutor:

    var listarray=[];

    func _init():
        var ACC = 0;
        var PC;
        var listarray=[];
        
    func List_ToArr(List):
        if (List.next ==null):
            return null;
        for i in (100):
            listarray.insert(i," ");
        var currNode = List.next;
        listarray[int(currNode.index)] = currNode.data;
        while (currNode.nextNode != null):
            currNode = currNode.nextNode
            listarray[int(currNode.index)] = currNode.data;
        return listarray;
        
        
func execute(listarray,PC,ACC):
    if(PC>listarray.size()-1):
        return null;
    if(str(listarray[PC]) == " "):
        return null;
    if(listarray[PC] == 0):
        return null;
    var instruction = str(listarray[PC]);
    if(instruction.length()!=3):
        return null;
    var STR_address = instruction.substr(1);
    if(STR_address.substr(0,1) == "0"):
        STR_address = STR_address.substr(1);
    var address = int(STR_address);
    var text = "Instruction: ";
    match instruction.substr(0,1):
            "1":      #Add
                text += "ADD "
                ACC = ACC + listarray[address];
                PC+=1;
            
            "2":      #SUB
                text += "SUB ";
                ACC = ACC - listarray[address];
                PC+=1;
            
            "3":      #STA
                text += "STA ";
                listarray[address] = ACC;
                PC+=1;
            
            "5":      #LDA
                text += "LDA ";
                ACC = listarray[address];
                PC+=1;
            
            "6":      #BRA
                text += "BRA ";
                PC = address;
            
            "7":      #BRZ
                text += "BRZ ";
                if(ACC==0):
                    PC = address;
                else:
                    PC+=1;
            
            "8":      #BRP
                text += "BRP ";
                if(ACC>=0):
                    PC = address;
                else:
                    PC+=1;
            
            "9":      #INPUT OUPPUT
                if(listarray[PC] == 901):
                    ACC = 1;    #Input case set to 1 when testing  
                    input();
                    yield(self,"enter");  
                    ACC = inputtext;        
                    text += "INPUT ";         
                else:
                    text += "OUTPUT ";     
                PC+=1;
                
    text += '\n' + " PC: " + str(PC) + " ACC: " + str(ACC) + '\n';  
    output.text+=text;
    execute(listarray,PC,ACC);







