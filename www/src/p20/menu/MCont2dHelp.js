



import { SpDebugPixi } from '../spSten/SpDebugPixi.js';

export class MCont2dHelp  {
  	constructor(par,fun) {  		
  		this.type="MDragScane";
  		var self=this;
        this.par=par
        this.fun=fun

        this.sp=undefined;

      
       
        this.helpDP=new SpDebugPixi();
        this.helpDP.alpha=0.3

     
        this.helpDP.color=new THREE.Color(dcmParam.color).getHex()
        this.helpDP.colorActiv=new THREE.Color(dcmParam.activButton).getHex()




        this.clear = function(){ 
            this.helpDP.clear()
        }

        this.setSP = function(sp){ 
            this.sp=sp;
            this.sp.content2d.addChild(this.helpDP.content2d)
        }

  		this.sizeWindow = function(w,h,s){ 
            if(this.cont){
               
            }      		            	
  		}        
  	}
}
