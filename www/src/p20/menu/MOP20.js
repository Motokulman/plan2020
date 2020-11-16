

import { MOBaza } from './MOBaza.js';

export class MOP20 extends MOBaza {
  	constructor(par,fun) {  
        super(par,fun);
  		this.type="MOP20";
        this.typeNa="P20";
  		var self=this;

        this.otstup = 5
        this.wh = 32
               
        this.dCont=new DCont(par.dCont);


        this.bool=true
        this.button=undefined;

        this.postIn=function(){
            this.window.title="P20";

            this.button = new DButton(this.window.content, this.otstup, this.otstup, "Добавить этаж",function(){
                self.object.creatFloor();
                self.drag();
            });
            this.button.width =  this.window.width - this.otstup *2
            this.button.height = this.wh

            this.image = new DImage(this.button, this.otstup, this.otstup, "../resources/image/plus.png");
            this.image.height = this.image.width = this.wh-this.otstup
        }


        this.array = []
        this.arrayF = []

 
        this.getM20Gron=function(){
        }
             
        this.sobbb=function(s,p,p1){
            if(s=="index")self.object.index=p;
            if(s=="clear")self.object.clearFloor(p);

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

                    self.array[i].setObject(self.object.array[i])

                    if(i!=0)self.array[i].y=self.array[i-1].y+self.array[i-1].height;
                    if (self.object.array.length == 2 || i==0) self.array[i].button1.activMouse=false
                }

                let yy = self.array[self.object.array.length-1].y+self.array[self.object.array.length-1].height
                this.button.y = yy
                if (self.object.array.length >= 5) {
                    this.button.activMouse=false;
                    this.button.visible=false;
                } else {
                    this.button.activMouse=true;
                    this.button.visible=true;
                    yy = this.button.y+this.button.height+this.otstup+32
                }
                this.window.height= yy
            }            
        }

        this.postSO=function(){ 
            this.bool=true;
            this.object.sp.setActive();           
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
    constructor(par,idArr,fun, bool) {  
     
        this.type="M20Gron";
        var self=this;
        this.par = par;
        this.idArr=idArr
        this.otstup=par.otstup;
        this.height=0;
        this.wh = par.wh
        this._y=idArr*(this.wh)+this.otstup;
        this._butText = this.par.object.name
        this._active=true;

        this.dCont=new DCont(par.window.content);
        this.dCont.visible=this._active;
        this.dCont.x = this.otstup;
        this.dCont.y = this._y

        this.button = new DButton(this.dCont, 0, 0, this._butText,function(){fun("index",self.idArr)}, "../resources/image/floor"+idArr+".png");
        this.button.width = par.window.width - this.otstup*2;
        // this.button.color=dcmParam.activButton;
        this.button.color=dcmParam.color;

        this.object;
        this.setObject=function(_spStageSten){
            this.object=_spStageSten
            let ss="этаж:"+self.idArr;
            if(this.object.name!=undefined){
                if(this.object.name=="xzStart"){ 
                    this.object.name=ss;
                }
            }else{
                this.object.name=ss;
            }
            this.input.text=this.button.text=this.object.name;

        };
        this.dCont.height=this.button.height+this.otstup




        this._bool=false;
        this.dCont1=new DCont(par.window.content);
        this.dCont1.visible=this._bool;
        this.dCont1.x = this.otstup;
        this.dCont1.y = this._y

        this.panel = new DPanel(this.dCont1, 0, 0);
        this.panel.height = this.wh * 2 + this.otstup*3;
        this.panel.width = par.window.width - this.otstup*2;
        this.panel.color=dcmParam.activButton

        this.image1 = new DImage(this.panel.content, 0, this.otstup, "../resources/image/floor"+idArr+".png");
        this.image1.height = this.image1.width = this.wh-this.otstup

        this.input = new DInput(this.panel.content, this.otstup*2+this.image1.width-2, this.otstup, this._butText, function(){
            //self.butText=this.value;
            self.object.name=this.value;
        });
        this.input.width = this.panel.width - this.image1.width - this.otstup*3;
        this.input.timeFun=1  

        this.button1 = new DButton(this.panel.content, this.panel.width-this.wh-this.otstup, this.input.height+this.otstup*2, "X",function(){
            fun("clear", self.idArr)
        }, "../resources/image/p0.png");
        this.button1.width = this.wh;

        this.dCont1.height=this.panel.height+ this.otstup

        this.height = this._active==true ? this.dCont.height : this.dCont1.height
    }

    set active(value) {
        if(this._active!=value){
            this._active= value;
            this.dCont.visible= value;
            if(this._active==true)this.height=this.dCont.height
        }
    }    
    get active() { return  this._active;}


    set bool(value) {
        if(this._bool!=value){
            this._bool= value;
            this.dCont1.visible = value;
            if(this._bool==true)this.height=this.dCont1.height
        }
    }    
    get bool() { return  this._bool;}

    set y(value) {
        if(this._y!=value){
            this._y=value;
            this.dCont.y=value
            this.dCont1.y=value

        }
    }    
    get y() { return  this._y;}

    set butText(value) {
        if(this._butText!=value){
            this._butText=value;
            this.button.text=value
            this.input.text=value
        }
    }    
    get butText() { return  this._butText;}
}
