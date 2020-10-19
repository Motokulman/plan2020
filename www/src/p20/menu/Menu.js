
import { MLeft } from './MLeft.js';
import { MDragScane } from './MDragScane.js';
import { MObject } from './MObject.js';
import { MGridDrag } from './MGridDrag.js';

import { MStart} from './MStart.js';


import { LocalStorage } from './LocalStorageE6.js';

export class Menu  {
    constructor(par,fun) {    	
		this.type="Menu";		
		var self=this;
		this.par=par;
		this.fun=fun;

		this.wh=48;
		this.otstup=12;
		this.otstup1=10;
		this.sizeMax=100000;

		dcmParam.activButton="#f28044";
		this._menuIndex=-1;

	    this.dCont=new DCont(this.par.dCont);




	    this.localStorage=par.par.localStorage;//new LocalStorage(function(){},"planer2020")

	   
	    
	    this.array=[]



		this.array[this.array.length] = this.mGridDrag = new MGridDrag(this, function(s,p,p1){             
           	self.fun(s,p,p1)
        });



	    this.array[this.array.length]=this.sStart=new MStart(this, function(s,p){             
           	if(s=="index")self.menuIndex=p;
        });

        


	    this.array[this.array.length]=this.mLeft=new MLeft(this, function(s,p){             
           	if(s=="index")self.menuIndex=p;
        });

		this.array[this.array.length]=this.mDragScane=new MDragScane(this, function(s,p){             
           	
        });
	   
		this.array[this.array.length]=this.mObject = new MObject(this,function(s,p){
           // self.fun(s,p)
        });


		this.setP20=function(p20){
			this.p20=p20;
			this.mDragScane.setP20(p20)
		}

		this.setSP=function(sp){
			this.mDragScane.setSP(sp)
			this.mGridDrag.setSP(sp)
		}


	    this.object;
	    this.setObject=function(object){
	    	this.object=object;

	    	let p=0;	    
	    	for (var i = this.array.length - 1; i >= 0; i--) {
	    		if(this.array[i].testObj)if(this.array[i].testObj(object)==true){	    		
	    			p=i;
	    			break;
	    		}	    			
	    	}	    	
	    	this.openMenu(p);
	    }

	    /*this.openMenu=function(p){
			for (var i = 0; i < this.array.length; i++) {
				if(this.array[i].dCont==undefined)continue;				
	    		if(i==p)this.array[i].dCont.visible = true;
	    		else this.array[i].dCont.visible = false;
	    	}
	    	
	    } 
	    this.openMenu(0);*/

		this.setApi=function(s,p,p1){
			if(s=="activObject"){
				this.setObject(p);
			}
	    } 

	    this.setObj=function(o){
	    	this.sStart.setObj(o)    	
	    	
            
        }

        this.setArrObj=function(o){
        	this.sStart.setArrObj(o)       	
        	this.mDragScane.redrag();
        }



       /* this.upDate=function(){
        	if(honeyTest){
        		honeyTest.upDate()
        	}
        }*/


	    this.sizeWindow=function(w,h,s){
	    	if(s==undefined)s=1	    	
	    	for (var i = this.array.length - 1; i >= 0; i--) {
	    		if(this.array[i].sizeWindow)this.array[i].sizeWindow(w,h,s);
	    	}
	    }
	    this.menuIndex=0;
	}

	set menuIndex(value) {		
        if(this._menuIndex!=value){
            this._menuIndex= value;
            this.mLeft.index=value;
            this.mDragScane.menuIndex= value;
            this.mGridDrag.menuIndex= value;
        }
    }    
    get menuIndex() { return  this._menuIndex;}
} 

