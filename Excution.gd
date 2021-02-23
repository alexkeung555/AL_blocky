extends Node

class Executor:
    var ACC;
    var PC;
    var listarray=[];

    
    func _init():
        var ACC = 0;
        var PC;
        var listarray=[];
        
        
    func List_ToArr(List):
        if (List.next ==null):
            return null;
        ACC = 0;
        var currNode = List.next;
        var count = 1;
        listarray.insert(int(currNode.index),currNode.data);
        while (currNode.nextNode != null):
            currNode = currNode.nextNode
            while(count!=currNode.index):
                listarray.insert(count," ");
                count+=1;
            listarray.insert(int(currNode.index),currNode.data);
            count +=1;
        execute(listarray,0);
    
    func execute(listarray,PC):
        if(str(listarray[PC]) == null || str(listarray[PC]) == " "):
            return null;
        var instruction = str(listarray[PC]);
        var STR_address = instruction.substr(1);
        if(STR_address.substr(0,1) == "0"):
            STR_address = STR_address.substr(1);
        var address = int(STR_address);

        match instruction.substr(0,1):
            "1":      #Add
                print("Add")
                ACC = ACC + listarray[address];
                PC+=1;
            
            "2":      #SUB
                print("SUB")
                ACC = ACC - listarray[address];
                PC+=1;
            
            "3":      #STA
                print("STA")
                listarray[address] = ACC;
                PC+=1;
            
            "5":      #LDA
                ACC = listarray[address];
                PC+=1;
            
            "6":      #BRA
                print("BRA")
                PC = address;
            
            "7":      #BRZ
                print("BRZ")
                if(ACC==0):
                    PC = address;
                else:
                    PC+=1;
            
            "8":      #BRP
                print("BRP")
                if(ACC>=0):
                    PC = address;
                else:
                    PC+=1;
            
            "9":      #INPUT OUPPUT
                if(listarray[PC] == 901):
                    ACC = 1;    #Input case set to 1 when testing     
                    print("INPUT");          
                else:
                    print("OUPPUT ACC: " + str(ACC));       
                PC+=1;
          
        execute(listarray,PC);  
    
        
