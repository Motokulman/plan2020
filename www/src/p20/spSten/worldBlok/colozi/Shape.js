
export class Shape  {
    constructor() {         
        this.type="Shape";        
        var self=this;
        this.name="rect";

        this.rect = [0,0,0,100,100,100];


        this.setRect=function(rect) {
            for (var i = 0; i < rect.length; i++) {
                if(this.rect[i]!=undefined&&rect[i])this.rect[i] = rect[i];
            }
        } 
        
    }



    set parent(value) {
        if(this._parent!=value){
            this._parent= value;           
        }
    }    
    get parent() { return  this._parent;}
}