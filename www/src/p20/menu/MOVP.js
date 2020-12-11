

import { MOBaza } from './MOBaza.js';

export class MOVP extends MOBaza {
  	constructor(par,fun) {  
        super(par,fun);
  		this.type="MOVP";
        this.typeNa="SpVPXz";
  		var self=this;


        this.whSize=5555555
       

        this.dCont=new DCont(par.dCont);
        
        this.button=undefined;
        this.slid
        this.slid1
        this.bool=true
        this.postIn=function(){
           
            this.window.title=this.type

            var yy=this.otstup1
            this.button=new DButton(this.window.content,this.otstup1,yy,"",function(){
                self.bool=false;
                self.object.clear();                
            },"resources/image/p0.png");
            this.button.width=this.button.height=this.wh;

            yy+=this.wh+this.otstup1;
            

            this.slid=new DSliderBig(this.window.content, this.otstup1,yy, function(s){ 
                self.bool=false
                self.object.position.x=self.slid.value
            }, "x",  -this.whSize/2, this.whSize/2)
            this.slid.width=this.width-this.otstup1*2
            this.slid.okrug=1

            this.slid.funChange=function(){
                self.bool=true
                self.drag()
            }
            yy+=this.otstup1+this.wh


            this.slid1=new DSliderBig(this.window.content, this.otstup1,yy, function(s){ 
                self.bool=false
                self.object.position.y=self.slid1.value
            }, "y",  -this.whSize/2, this.whSize/2)
            this.slid1.width=this.width-this.otstup1*2          
            this.slid1.okrug=1;

            this.slid1.funChange=function(){
                self.bool=true
                self.drag()
            }
            yy+=this.otstup1+this.wh

            this.slid2=new DSliderBig(this.window.content, this.otstup1,yy, function(s){ 
                self.bool=false
              
                self.object.position.z=self.slid2.value
               
            }, "z",  -this.whSize/2, this.whSize/2)
            this.slid2.width=this.width-this.otstup1*2
            
            this.slid2.okrug=1;

            this.slid2.funChange=function(){
                self.bool=true
                self.drag()
            }
            yy+=this.otstup1+this.wh

            this.window.height=yy+32;
        }

        
        
        this.drag=function(){
            if(self.bool!=false){
                self.slid.min=self.object.position.x-500;
                self.slid.max=self.object.position.x+500;
                self.slid.value=Math.round(self.object.position.x);
                
                self.slid1.min=self.object.position.y-500;
                self.slid1.max=self.object.position.y+500;
                self.slid1.value=Math.round(self.object.position.y);
                
                self.slid2.min=self.object.position.z-500;
                self.slid2.max=self.object.position.z+500;
                
                self.slid2.value=Math.round(self.object.position.z); 

            }            
        }

       

        this.postSO=function(){ 
            this.bool=true           
            this.object.funDragMenu=this.drag
            this.object.par.setActive(this.object);
            this.window.title="MOVP  "+this.object.idArr//+" : "+ this.object.uuid;
            this.drag()
        }
        this.clear=function(){
            if(this.object!=undefined){
                this.bool=true
                this.object.funDragMenu=undefined;
            }
            this.active=false
        }


        this.sizeWindow = function(w,h,s){ 
            this.dCont.x=w/s-this.width       
        }
  	}

    set index(value) {
        if(this._index!=value){
            this._index= value;
                  
        }
    }  

}
