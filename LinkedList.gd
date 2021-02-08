extends Reference

class List:
    extends Reference
    var head;
    var next = node.new(null,null);
    
    func _init():
        head =  node.new(null,null);
        
    func insertNode(Index,x):
        if(Index<0):
            return null;            
        elif(Index==0 && next.data ==null):
            var newnode = node.new(Index,x);
            newnode.data = x;
            newnode.index = Index;
            next = newnode;
        elif(Index==0):
            var newnode = node.new(Index,x);
            newnode.data = x;
            newnode.index = Index;
            newnode.nextNode = next;
            next = newnode;
        else:
            var currNode = next;
            while (currNode.index != Index && currNode.nextNode!=null):
                currNode = currNode.nextNode;
            var newnode = node.new(Index,x);
            newnode.data = x;
            newnode.index = Index;
            newnode.nextNode = currNode.nextNode;
            newnode.preNode = currNode;
            currNode.nextNode = newnode;
   
    func deleteNode(Index):
        var currNode = next;
        var preNode;
        while (currNode.index != Index && currNode.nextNode!=null):
            preNode = currNode;
            currNode = currNode.nextNode;
        preNode.next = currNode.nextNode;
        currNode = currNode.nextNode;
        currNode.preNode = preNode;
                
    func printall():
        if(next==null):
            return null;
        var currNode = next;
        var stra = "1. " + str(currNode.data);
        var count = 1;
        while (currNode.nextNode != null):
            currNode = currNode.nextNode
            count+=1;
            stra =  stra + '\n' + str(count) + ". " + str(currNode.data);            
        return stra;
        
class node:
    var nextNode = null;
    var preNode = null;
    var data ;
    var index;
    
    func _init(number,x):
        var data = x;
        var index = number;
        
