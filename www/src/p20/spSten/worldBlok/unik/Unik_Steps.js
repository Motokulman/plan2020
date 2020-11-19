
export class Unik_Steps {
	constructor(par) { 
		// super(par, obj, w, h, d); 		
  		var self=this;
  		this.type="Unik_Steps";
        this.par = par;
        this.graphics=this.par.graphics

        var defolt={width:1000, height:1000, delph:1000, step:4, bool:false, bool1:true, bool2:false}

        this._width=1000;
        this._height=1000;
        this._delph=1000;
        this._step = 4

        

        this._bool = false
        this._bool1 = true
        this._bool2 = false

        this._heightStep = 100
        
        this.w;
        this.h;
        this.d;

		this.clearDefolt=function(){
			this._width=defolt.width;
        	this._height=defolt.height;
        	this._delph=defolt.delph;
        	this._step = defolt.step
        	
	        this._bool = defolt.bool
	        this._bool1 = defolt.bool1
	        this._bool2 = defolt.bool2
	        }
        this.clearDefolt();


        this.dragWHD=function(_w,_h,_d){
        	if (_w != undefined){
	        	this.w = _w;
	        	this.h = _h;
	        	this.d = _d;
		    }
        	trace (this.w,this.h,this.d)
        	this.graphics.clear()
        	this.graphics.beginFill(0x222222, 0);
			this.graphics.lineStyle(10, 0x000000, 1);
        	// this.graphics.drawRect(-this._width/2, this.d/2, this._width, this._height);

        	var xl = 0;
        	var xr = 0;
        	var yy = 0;

        	for (var i = 0; i < this._step; i++) {
	        	if (this._bool == true) {
	        		this.graphics.beginFill(0x222222, 0);
					this.graphics.lineStyle(10, 0x000000, 1);
		        	this.graphics.moveTo(-this._width/2, this.d/2);
		        	this.graphics.lineTo(-this._width/2-this._heightStep*i, this.d/2);
		        	this.graphics.lineTo(-this._width/2-this._heightStep*i, this.d/2+this._height);
		        	if (this._bool1 == false)this.graphics.lineTo(-this._width/2, this.d/2+this._height);
		        	if (this._bool1 == true)this.graphics.lineTo(-this._width/2 - this._heightStep*i, this.d/2+this._height + this._heightStep*i);
	        		xr += this._heightStep
	        	}

	        	if (this._bool1 == true) {
	        		this.graphics.beginFill(0x222222, 0);
					this.graphics.lineStyle(10, 0x000000, 1);
		        	if (this._bool == false)this.graphics.moveTo(-this._width/2, this.d/2+this._height);
		        	this.graphics.lineTo(-this._width/2, this.d/2+this._height + this._heightStep*i);
		        	this.graphics.lineTo(this._width - (this._width/2), this.d/2+this._height + this._heightStep*i);
		        	if (this._bool2 == false)this.graphics.lineTo(this._width - (this._width/2), this.d/2+this._height);
		        	if (this._bool2 == true)this.graphics.lineTo(this._width - (this._width/2) + this._heightStep*i, this.d/2+this._height+ this._heightStep*i);
	        		yy += this._heightStep
	        	}

	        	if (this._bool2 == true) {
	        		this.graphics.beginFill(0x222222, 0)
					this.graphics.lineStyle(10, 0x000000, 1);
		        	if (this._bool1 == false)this.graphics.moveTo(this._width - (this._width/2), this.d/2+this._height);
		        	this.graphics.lineTo(this._width - (this._width/2) + this._heightStep*i, this.d/2+this._height);
		        	this.graphics.lineTo(this._width - (this._width/2) + this._heightStep*i, this.d/2);
		        	this.graphics.lineTo(this._width - (this._width/2), this.d/2);
		        	xl += this._heightStep
	        	}
        	}

			this.graphics.beginFill(0x222222, 0.1);
			this.graphics.lineStyle(10, 0x000000, 1);
        	this.graphics.drawRect(-this._width/2-xr, this.d/2, this._width+xl+xr, this._height+yy);
        }            

        

        this.setObj=function(o){
        	if(o==undefined)return
        	if(o.width==undefined)return	
        	this._width= o.width;
	        this._height= o.height;
	        this._delph= o.delph;
	        this._step = o.step;

	        this._bool = o.bool;
	        this._bool1 = o.bool1;
	        this._bool2 = o.bool2;

	        this.par.dragWHD()

            trace('(o(o(o(o',o)
        }
        this.getObj=function(){
            var o={}
            // o.xz="ghjghjghj"

			o.width = 	this._width;
			o.height = this._height;
			o.delph =  this._delph;
			o.step =  this._step;

			o.bool =  this._bool;
			o.bool1 = this._bool1;
			o.bool2 = this._bool2;

            return  o
        }
	}

    set width(value) {
        if(this._width!=value){
            this._width= value;            
          	this.par.dragWHD()
          	this.par.par.render()
        }
    }    
    get width() { return  this._width;}    

    set height(value) {
        if(this._height!=value){
            this._height= value;
          	this.par.dragWHD()
			this.par.par.render()
        }
    }    
    get height() { return  this._height;}


    set step(value) {
        if(this._step!=value){
            this._step= value;
          	this.par.dragWHD()
			this.par.par.render()
        }
    }    
    get step() { return  this._step;}


    set bool(value) {
        if(this._bool!=value){
            this._bool= value;
            this.par.dragWHD()
			this.par.par.render()     
        }
    }    
    get bool() { return  this._bool;}  

    set bool1(value) {
        if(this._bool1!=value){
            this._bool1= value;
            this.par.dragWHD()
			this.par.par.render()     
        }
    }    
    get bool1() { return  this._bool1;}  


    set bool2(value) {
        if(this._bool2!=value){
            this._bool2= value;
            this.par.dragWHD()
			this.par.par.render()     
        }
    }    
    get bool2() { return  this._bool2;}  
}
