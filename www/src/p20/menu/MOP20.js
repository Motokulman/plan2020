

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
            trace(this.window.width-this.otstup*2)
            this.window.title="P20";
            var a = this.get()

            for (var i = 0; i < a.length; i++) {
                this.window.content.add(a[i])
            }
        }


        this.array=[]
        this.arrayCehs = []
        this.buttons=[]

        this.get=function(value){
            var width = 207
            var yy=this.otstup;
            var wh=40;  

            for (var i = 0; i < this.object.array.length; i++) {
                this.buttons[i]=new DButton(null,yy,yy+i*(wh+this.otstup),""+i,function(){
                    self.object.index=this.idArr
                    self.drag();
                })
                this.buttons[i].width=width;
                this.buttons[i].height=wh
                this.buttons[i].idArr=i;
            }

            yy+=this.buttons.length*(wh+this.otstup); 

            this.buttons[this.buttons.length-1] = new DButton(null,this.otstup,yy,"Добавить этаж",function(){self.object.creatFloor()})  
            this.buttons[this.buttons.length-1].width=width

            yy+=(wh+this.otstup);
            this.window.height=yy+32;

            return this.buttons
            
        }
             
        
        this.drag=function(){
            if(self.bool!=false){
                for (var i = 0; i < this.buttons.length; i++) {
                    if(i==self.object.index)this.buttons[i].color=dcmParam.activButton;
                    else this.buttons[i].color=dcmParam.color;
                    this.postIn()
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
