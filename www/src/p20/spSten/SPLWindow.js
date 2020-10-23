
//import { Splice } from './../sp/Splice.js';




export class SPLWindow  {
  	constructor(par,fun) {  
  		var self = this;		
  		this.type="SPLWindow";
  		this.uuid=calc.generateRendom(2);
  		this.par=par;	
  		this.fun=fun;

  		this._delph=par._delph;


  		this.content2d = new PIXI.Container();
  		this.par.content2d.addChild(this.content2d);	

  		this.array=[]
  		var _blok, ii
  		this.addBlok = function(blok){
	    	if(blok.parent!=undefined)blok.parent.removeBlok(blok)  	
  			//if(this.isArrPos(blok)!=-1)this.removeBlok(blok)  
  			this.delph=par._delph;


  			blok.delph=this._delph
  			this.array.push(blok)
  			blok.parent=this;
  			this.content2d.addChild(blok.content2d)

  			
	    	return -1;	    	
	    }

	    this.removeBlok = function(blok){	    	
	    	ii=this.isArrPos(blok);		    	
	    	if(ii!=-1){
	    		_blok=this.array[ii]	    		
	    		this.array.splice(ii, 1);	    		
	    		this.content2d.removeChild(_blok.content2d);
	    		_blok.parent = undefined;
	    		this.removeBlok(blok);
	    		return _blok;	
	    	}	    	
	    	return ii;	    		
	    }
	    this.isArrPos = function(blok){
	    	for (var i = 0; i < this.array.length; i++) {
	    		if(this.array[i].uuid==blok.uuid){    			
	    			return  i;	    			
	    		}
	    	}
	    	return -1;
	    }

	    this.vector=new THREE.Vector3();
	    this.vr=new THREE.Vector3();
	    var d
	    this.getGlob = function(x,y,z,blok){
	    	this.vector.set(x,y,z)
	    	d=calc.getDistance(this.vector,this.par.position)

	    	this.vr.x=d
	    	this.vr.y=0;
	    	this.vr.z=0;
	    	return this.vr
	    }

	    this.setObj=function(o){

	        for (var i = 0; i < o.array.length; i++) {
	        	let blok= this.par.par.worldBlok.getBlok(o.array[i].id);
	        	if(blok){
	        		blok.setObj(o.array[i])
	        		this.addBlok(blok)
	        	}
	        }     
           
        }
        this.getObj=function(){
            var o={}
            o.array=[]
         	for (var i = 0; i < this.array.length; i++) {
         		o.array.push(this.array[i].getObj())
         	}
            return  o
        }


  	}

    set delph(value) {      
        if(this._delph!=value){
            this._delph= value;
            console.warn("this._delph@@@@@@@@",this._delph)
            for (var i = 0; i < this.array.length; i++) {
                this.array[i].delph = value;
            }
        }
    }    
    get delph() { return  this._delph;}

}

