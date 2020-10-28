
import { World } from './colozi/World.js';

import { SpDebugPixi } from './SpDebugPixi.js';



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

  		this.deb=new SpDebugPixi()
  		this.content2d.addChild(this.deb.content2d);
  		this.deb.al=0.3
  		//this.deb.content2d.alpha=0.15;
  		//this.deb.content2d.visible=false

  		this.world=new World(function(s,p){
  			if(s=="korektPosition"){
  				self.par.draw1(true)
  			}

  			if(s=="clearBodys"){
  				for (var i = 0; i < p.length; i++) {  					
  					self.removeBlok(p[i].target)
  				}
  			}
  		});
  		this.world.deb=this.deb


  		this.array=[];
  		var _blok, ii
  		this.addBlok = function(blok){
	    	if(blok.parent!=undefined)blok.parent.removeBlok(blok)  	
  			//if(this.isArrPos(blok)!=-1)this.removeBlok(blok)  
  			this.delph=par._delph;
  			blok.delph=this._delph;
  			this.array.push(blok);
  			this.world.add(blok.body);
  			blok.parent=this;
  			this.content2d.addChild(blok.content2d)  
  			this.par.draw1(true)
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
	    		this.world.remove(blok.body);
	    		this.par.draw1(true)
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

	    this.isBlokPlace = function(blok){
	    	if(blok && blok.body )return this.world.line_x.isBlokPlace(blok.body)
	    	
	    	return false;
	    }


	    this.vector=new THREE.Vector3();
	    this.vr=new THREE.Vector3();
	    var d;
	    this.getGlob = function(x,y,z,blok){
	    	this.vector.set(x,y,z);
	    	d=calc.getDistance(this.vector,this.par.position)
	    	this.vr.x=d;
	    	this.vr.y=0;
	    	this.vr.z=0;
	    	return this.vr;
	    }

	    var arrNum=[]
	    this.getNumBlok = function () {
	    	arrNum.length=0
	    	if(this.array.length!=0){
	    		for (var i = 0; i < this.array.length; i++) {
	    			//if(this.array[i].obj.rect1!=undefined){
	    				arrNum.push(this.array[i].body.position.x+this.array[i].rect1.x);
	    				arrNum.push(this.array[i].body.position.x+this.array[i].rect1.x+this.array[i].rect1.w);
	    			//}
	    		}
	    	}
	    	trace(arrNum)
	    	return arrNum;
	    }




	    var xx,xx1,ww
	    this.draw = function () {
	    	
			xx=this.par.arrPosit[1].x<this.par.arrPosit[4].x ? -this.par.arrPosit[1].x : -this.par.arrPosit[4].x	    	
	    	xx1=this.par.arrPosit1[1].x<this.par.arrPosit1[4].x ? this.par.arrPosit1[1].x : this.par.arrPosit1[4].x	    	
	    	ww=-xx+xx1+this.par._distans;


			this.world.rect.x=xx;
			this.world.rect.w=ww;
			this.world.rect.y=-this._delph/2;
			this.world.rect.h=this._delph;

			this.world.dragRect();

			
			this.drawDeb()
		}
		this.drawDeb = function () {
			if(this.deb)this.world.drawDeb()
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
            for (var i = 0; i < this.array.length; i++) {
                this.array[i].delph = value;
            }
        }
    }    
    get delph() { return  this._delph;}

}

