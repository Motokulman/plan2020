
import { World } from '../colozi/World.js';

import { SpDebugPixi } from '../SpDebugPixi.js';



export class SPLWindow  {
  	constructor(par,fun) {  
  		var self = this;		
  		this.type="SPLWindow";
  		this.uuid=calc.generateRendom(2);
  		this.par=par;	
  		this.fun=fun;

  		this._delph = par._delph;
  		this._height=par._height;
		this._height1=par._height1;
		this.sizeLine=par._sizeLine;
  		this.content2d = new PIXI.Container();
  		this.par.cont2dOfset.addChild(this.content2d);

  		


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

		this.deb=new SpDebugPixi()
  		this.content2d.addChild(this.deb.content2d);
  		this.deb.al=0.3
  		//this.world.deb=this.deb


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
  			blok.redrahHHH(this._height);
  			
  			this.par.content3d.add(blok.content3d)  
	    	return -1;	    	
	    }

	    this.removeBlok = function(blok){	    	
	    	ii=this.isArrPos(blok);		    	
	    	if(ii!=-1){
	    		_blok=this.array[ii]	    		
	    		this.array.splice(ii, 1);	    		
	    		this.content2d.removeChild(_blok.content2d);
	    		this.par.content3d.remove(blok.content3d)  
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



	   /* var arrNum2=[]
	    var arrNum=[]
	    this.getNumBlok = function () {
	    	arrNum.length=0
	    	arrNum2.length=0

	    	


	    	if(this.array.length!=0){
	    		for (var i = 0; i < this.array.length; i++) {	
	    			arrNum2.push(this.array[i])
	    		}
				arrNum2.sort(function(a, b){					
					return a.body.position.x - b.body.position.x
				})


	    		for (var i = 0; i < arrNum2.length; i++) {	    			
	    			arrNum.push(arrNum2[i].body.position.x+arrNum2[i].rect.x);
	    			arrNum.push(arrNum2[i].body.position.x+arrNum2[i].rect.x+arrNum2[i].rect.w);
	    			
	    		}
	    	}


	    	
	    	return arrNum;
	    }*/

	    this.colCentr=parseInt("0000010000",2);

	    var arrNum2=[]
	    var arrNum=[];
	    var arrBody=[];
	    this.getNumBlok = function () {
	    	
	    	arrNum.length=0
	    	arrNum2.length=0
	    	arrBody.length=0

	    	
	    	for (var i = 0; i < this.world.array.length; i++) {	
	    		if((this.world.array[i].col&this.colCentr)!==0){ 
					arrBody.push(this.world.array[i])

	    		}
	    	}
	    	if(arrBody.length==0)return arrNum;

	    	arrBody.sort(function(a,b){
	    		return a.position.x-b.position.x
	    	})

	    	for (var i = 0; i < arrBody.length; i++) {
	    		arrNum2.push(arrBody[i].position.x+arrBody[i].rect.x,arrBody[i].position.x+arrBody[i].rect.x1);	    		
	    	}
	    	this.sort2(arrNum2);
	    	
	    	

	    	return arrNum2
	    	/**/




	    	/*if(this.array.length!=0){
	    		for (var i = 0; i < this.array.length; i++) {	
	    			arrNum2.push(this.array[i])
	    		}
				arrNum2.sort(function(a, b){					
					return a.body.position.x - b.body.position.x
				})


	    		for (var i = 0; i < arrNum2.length; i++) {	    			
	    			arrNum.push(arrNum2[i].body.position.x+arrNum2[i].rect.x);
	    			arrNum.push(arrNum2[i].body.position.x+arrNum2[i].rect.x+arrNum2[i].rect.w);
	    			
	    		}
	    	}*/


	    	
	    	return arrNum;
	    }

	    var j
	    this.sort2=function (_a) {
            if(_a.length==2)return
            j=_a.length-2
            for (var i = 0; i < j; i+=2) {
                if(_a[i+1]>=_a[i+2]){
                    if(_a[i+1]>=_a[i+3]){
                        _a.splice(i+2, 2)
                        this.sort2(_a);
                        return
                    }else{
                        _a[i+1]=_a[i+3];
                        _a.splice(i+2, 2)
                        this.sort2(_a);
                        return 
                    }                    
                } 
            }    
        }



	    

	    var xx,xx1,ww
	    this.draw = function () {
	    	
			xx=this.par.arrPosit[1].x<this.par.arrPosit[4].x ? -this.par.arrPosit[1].x : -this.par.arrPosit[4].x	    	
	    	xx1=this.par.arrPosit1[1].x<this.par.arrPosit1[4].x ? this.par.arrPosit1[1].x : this.par.arrPosit1[4].x	    	
	    	ww=-xx+xx1+this.par._distans;


			this.world.rect.x=xx;
			this.world.rect.w=ww;
			this.world.rect.x1=ww+xx;
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

    set height(value) {
        if(this._height!=value){
            this._height= value;
            for (var i = 0; i < this.array.length; i++) {
                this.array[i].redrahHHH(this._height);
            }        	
        }
    }    
    get height() { return  this._height;}  

    set height1(value) {
        if(this._height1!=value){
            this._height1= value;
            for (var i = 0; i < this.array.length; i++) {
                this.array[i].redrahHHH();
            }        	
        }
    }    
    get height1() { return  this._height1;}  

}

