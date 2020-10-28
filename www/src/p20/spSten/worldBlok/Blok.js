
import { Body } from '../colozi/Body.js';
import { Shape } from '../colozi/Shape.js';

export class Blok  {
    constructor(par,obj,fun) {          
        this.type="Blok";
        var self=this;
        this.par=par;
        this.obj=obj;
        this.fun=fun;

        this.id=obj.id;
        this.icon=obj.icon;

        this.typeStr=obj.str[0]
        this.typeStr1=obj.str[1]

        this.idArr=-1;

        this._width=100;
        this._height=100;
        this._delph=100;
        this._boolSten=false;
        this._rotation=0
        this.boxHelper=undefined
        this._life=true;
        this._parent=undefined

        this.uuid=calc.generateRendom(2);

        this.content2d = new PIXI.Container();

        
        this.funInit=undefined
        this.body=undefined;
        this.shape=undefined;
        this.init = function(){            
            this.body=new Body();
            this.body.target=this
            this.body.drag=this.drag;
            this.shape=new Shape();
            this.shape.setRect(obj.rect);
            this.body.addShape(this.shape);
            this._width=obj.rect[3];
            this._height=obj.rect[5];
            this._delph=obj.rect[4];
            this.dragWHD();

            if(this.funInit!=undefined)this.funInit()
        }


        this.clear= function(){ 
            if(this._parent!=undefined)this._parent.removeBlok(this);
            this.life=false
        }
        
        this.vector;
        this.setPosition=function(x,y,z){   
            if(self._parent!=undefined){
                if(self._parent.type=="SPLWindow"){                    
                    this.vector=self._parent.getGlob(x,y,z,this)                 
                
                    this.setReal(this.vector.x,this.vector.y,this.vector.z)
                    this.render();
                }
            }
        }

        this._x=0;
        this._y=0;
        this._z=0;
        this.setReal=function(x,y,z){
            this._x=x;
            this._y=y;
            this._z=z;
            this.body.position.set(x,0);
            if(this._parent)this._parent.drawDeb();            
        }

        this.drag=function(){            
            self.content2d.x=self.body.position.x;
            self.content2d.y=0;
        }

        
        this.render=function(){  
            this.par.render()
        }

        this.dragWHD=function(){  
            
        }

        this.funSetObj=undefined
        this.funGetObj=undefined

        this.setObj=function(o){

            this._width=o.w;
            this._height=o.h;
            this._delph=o.d;    


            this.setReal(o.x,o.y,o.z);
            this.dragWHD();

            if(this.funSetObj)this.funSetObj(o)
        }
        this.getObj=function(){
            var o={}
            o.id=this.id;
            o.x= this._x;
            o.y= this._y;
            o.z= this._z;
            o.w= this._width;
            o.h= this._height;
            o.d= this._delph;
            if(this.funGetObj)this.funGetObj(o);
            return  o
        }
        //trace("===========================================================================",this.type);
        //if(this.type=="Blok")this.init(); 
            

    }



    set width(value) {
        if(this._width!=value){
            this._width= value;                   
            this.dragWHD();                       
        }
    }    
    get width() { return  this._width;}   

    set height(value) {
        if(this._height!=value){
            this._height= value;
            this.dragWHD();
            
            
        }
    }    
    get height() { return  this._height;}   

    set delph(value) {
        if(this._delph!=value){
            this._delph= value;
            this.dragWHD();         
        }
    }    
    get delph() { return  this._delph;}  

    set life(value) {
        if(this._life!=value){         
            this._life= value;   
            if(this._parent!=undefined){
                if(this._parent.removeBlok!=undefined){
                    this._parent.removeBlok(this)
                }
            }
            this.par.render()           
        }
    }    
    get life() { return  this._life;}

    set parent(value) {
        if(this._parent!=value){
            this.parentOld=this._parent

            this._parent= value;
            if(value==undefined){
                this._life=false;
            }else{
                this._life=true;
            }

            this.par.render();
        }
    }    
    get parent() { return  this._parent;}
}