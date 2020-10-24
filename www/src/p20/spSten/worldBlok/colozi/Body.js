


export class Body  {
  	constructor() {  		
  		this.type="Body";
  		var self=this;

        this.array=[]
        this.addShape=function(shape) {
            this.array.push(shape)
            shape.parent=this;
        }
        this.removeShape=function(shape) {
            
        }
    }



    set parent(value) {
        if(this._parent!=value){
            this._parent= value;           
        }
    }    
    get parent() { return  this._parent;}
}