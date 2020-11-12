

import { MOBaza } from './MOBaza.js';

export class MOP20 extends MOBaza {
  	constructor(par,fun) {  
        super(par,fun);
  		this.type="MOP20";
        this.typeNa="P20";
  		var self=this;


       
        this.dCont=new DCont(par.dCont);


        this.bool=true
        this.button=undefined;
        this.button1=undefined;

        this.postIn=function(){
            this.window.title="P20";
            /*var a = this.get()
            for (var i = 0; i < a.length; i++) {
                this.window.content.add(a[i])
            }*/


            this.button = new DButton(this.window.content, this.otstup, this.otstup, "Добавить этаж",function(){
                self.object.creatFloor();
                self.drag();
            });
            this.button1 = new DButton(this.window.content, this.otstup, this.otstup+30, "delete этаж",function(){
                
            });             
        }


        this.array = []
 

        this.getM20Gron=function(){

            
           
        }
             
        this.sobbb=function(s,p,p1){
            if(s=="index")self.object.index=p;
        }

        this.drag=function(){
            if(self.bool!=false){
                trace(self.object.array)

                for (var i = 0; i < self.array.length; i++) {
                    self.array[i].active=false;
                }

                for (var i = 0; i < self.object.array.length; i++) {
                    if(self.array[i]==undefined)self.array[i]=new M20Gron(self, i, self.sobbb)
                    self.array[i].active=true; 
                    self.array[i].setObject(self.object.array[i])   
                }
                trace(self.array)

                this.button.y=self.object.array.length*36
                this.button1.y=self.object.array.length*36+36
               /* for (var i = 0; i < this.buttons.length; i++) {
                    if(i==self.object.index)this.buttons[i].color=dcmParam.activButton;
                    else this.buttons[i].color=dcmParam.color;
                    this.postIn()
                }*/ 

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

  

}


export class M20Gron  {
    constructor(par,idArr,fun) {  
     
        this.type="M20Gron";
        var self=this;
        this.idArr=idArr

        this._active=true;

        this.otstup=2;
        this.dCont=new DCont(par.dCont);

        this.button = new DButton(this.dCont, this.otstup, this.otstup+idArr*36, "этаж: "+idArr,function(){
            fun("index",self.idArr)
        });

        this.object
        this.setObject=function(_spStageSten){
            this.object=_spStageSten
            
        }

    }
    set active(value) {
        if(this._active!=value){
            this._active= value;
            this.dCont.visible= value;     
        }
    }    
    get active() { return  this._active;}
}