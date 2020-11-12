

import { MOBaza } from './MOBaza.js';

export class MOP20 extends MOBaza {
  	constructor(par,fun) {  
        super(par,fun);
  		this.type="MOP20";
        this.typeNa="P20";
  		var self=this;


        this.whSize=5555555;
       

        this.dCont=new DCont(par.dCont);

        
        this.buttons=undefined;
        this.slid
        this.slid1
        this.bool=true
        this.postIn=function(){           
            this.window.title="P20";
            this.buttons=[]
            var yy=this.otstup;
            var wh=(this.window.width-this.otstup)/this.object.array.length-this.otstup;        
            for (var i = 0; i < this.object.array.length; i++) {
                this.buttons[i]=new DButton(this.window.content,this.otstup+i*(wh+this.otstup),yy,""+i,function(){
                    self.object.index=this.idArr
                    self.drag();
                })
                this.buttons[i].width=this.buttons[i].height=wh;
                this.buttons[i].idArr=i;
            }           
            yy+=wh+this.otstup; 

            var b= new DButton(this.window.content,this.otstup,yy,"Плюс новый этаж",function(){
                self.object.creatFloor()
            })  
            b.width=this.window.width-this.otstup;

            yy+=b.height+this.otstup; 

            this.window.height=yy+32;
        }

        
        
        this.drag=function(){
            if(self.bool!=false){
                for (var i = 0; i < this.buttons.length; i++) {
                    if(i==self.object.index)this.buttons[i].color=dcmParam.activButton;
                    else this.buttons[i].color=dcmParam.color;
                }                
            }            
        }

       

        this.postSO=function(){ 
            this.bool=true;           
            this.drag()
        }
        this.clear=function(){
            if(this.object!=undefined){                
                this.bool = true
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
