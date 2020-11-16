

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

            this.button = new DButton(this.window.content, this.otstup, this.otstup, "Добавить этаж",function(){
                trace(self.object.array)
                self.object.creatFloor();
                self.drag();
            });
            this.button1 = new DButton(this.window.content, this.otstup, this.otstup+32, "delete этаж",function(){
                trace(self.object.array)
                self.object.clearFloor();
                self.drag();
                // self.kill()
            });             
            this.button.width = this.button1.width = this.window.width - this.otstup *2
            this.button.height = this.button1.height = 32

        }


        this.array = []
        this.arrayF = []

 
        this.getM20Gron=function(){
        }
             
        this.sobbb=function(s,p,p1){
            if(s=="index")self.object.index=p;
            // for (var i = 0; i < self.array.length; i++) {
            //     if(self.array[i].idArr==p)self.array[i].button.alpha=0.5;
            //     else self.array[i].button.alpha=1;
            //     self.drag()
            // }
            self.drag(p)
        }

        this.drag=function(p){
            // trace(p)
            if(self.bool!=false){
                for (var i = 0; i < self.array.length; i++) {
                    self.array[i].active=false;
                    self.array[i].bool=false;
                }

                for (var i = 0; i < self.object.array.length; i++) {
                    if(self.array[i]==undefined)self.array[i]=new M20Gron(self, i, self.sobbb)

                    self.array[i].active= i==self.object.index ? false : true; 
                    self.array[i].bool= i==self.object.index ? true : false; 
                    // self.array[i].active=true;
                    self.array[i].setObject(self.object.array[i])   

                    //if(i!=0)self.array[i].y=self.array[i-1].y+self.array[i-1].height

                    // if (p != undefined){
                    //     if (self.array[i].idArr == p){
                    //         self.array[i].active=false
                    //         self.array[i].bool=true
                    //     }  else {
                    //         self.array[i].active=true
                    //         self.array[i].bool=false
                    //     }
                    // }


                }


                this.button.y=self.object.array.length*(32 + this.otstup)+ this.otstup
                this.button1.y=self.object.array.length*(32 + this.otstup)+ 32 + this.otstup *2
                this.window.height= this.button1.y+this.button1.height+this.otstup+32
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

        this.kill=function(p){
            // trace('1223434')
            // p = p!=undefined ? p : undefined

            // if(this.object!=undefined){
            //     self.object.array.splice(self.object.array.length-1,1)
            //     if(self.arrayF[self.array.length-1]!=undefined){
            //         self.arrayF[self.array.length-1].active=false
            //         self.arrayF.splice(self.arrayF.length-1,1)
            //     }
            //     self.array[self.array.length-1].active=false
            //     self.array.splice(self.array.length-1,1)

            //     this.drag(p-1)
            //     }            
            }


        this.sizeWindow = function(w,h,s){ 
            this.dCont.x=w/s-this.width       
            }
      	}
}


export class M20Gron  {
    constructor(par,idArr,fun, bool) {  
     
        this.type="M20Gron";
        var self=this;
        this.idArr=idArr

        this.otstup=par.otstup;



        this._active=true;
        this.dCont=new DCont(par.window.content);

        this.button = new DButton(this.dCont, this.otstup, this.otstup+idArr*(32 + this.otstup), "этаж: "+idArr,function(){
            fun("index",self.idArr)
        });
        this.button.width = par.window.width - this.otstup*2

        this.text = new DLabel(this.dCont, this.button.width/11, this.button.y+this.button.height/4, ""+idArr)
        this.text.color="#FFFFFF"

        this.object
        this.setObject=function(_spStageSten){
            this.object=_spStageSten
        }


        this._bool=false
        this.dCont1=new DCont(par.window.content);
        this.dCont1.visible=this._bool
        this.dCont1.x = this.otstup
        this.dCont1.y = this.otstup+idArr*(32 + this.otstup)

        this.pan = new DPanel(this.dCont1, -100, 0)
        this.pan.height = 32
        this.pan.width = 500

        this.bu = new DButton(this.pan.content, 0, 0, self.button.text)
        this.bu1 = new DInput(this.pan.content, 60, 0, self.button.text)
        this.bu2 = new DButton(this.pan.content, 100, 0, "X",function(){
                par.kill(self.idArr)
        });   
    }

    set active(value) {
        if(this._active!=value){
            this._active= value;
            this.dCont.visible= value;     
        }
    }    
    get active() { return  this._active;}


    set bool(value) {
        if(this._bool!=value){
            this._bool= value;
            this.dCont1.visible= value;     
        }
    }    
    get bool() { return  this._bool;}
}
