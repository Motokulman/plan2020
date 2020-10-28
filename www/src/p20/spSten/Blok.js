
import { Body } from './colozi/Body.js';

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
        this._depth=100;
        this._boolSten=false;
        this._rotation=0
        this.boxHelper=undefined
        this._life=true;
        this._parent=undefined

        this.uuid=calc.generateRendom(2);

        this.content2d = new PIXI.Container();

        

        this.body=undefined;
        this.shape=undefined;
        this.init = function(){
            trace("init====================================="+this.type)
            this.body=new Body();
            this.shape=new Shape();
            this.shape.setRect(obj.rect);
            this.body.addShape(this.shape)
            this.dragWHD();
        }


esrtg
        
        this._x=0;
        this._y=0;
        this._z=0;
        this.vector;
        this.setPosition=function(x,y,z){   
            this._x=x
            this._y=y   
            this._z=z
            if(self._parent!=undefined){
                if(self._parent.type=="SPLWindow"){                    
                    this.vector=self._parent.getGlob(x,y,z,this)
                 
                    this.content2d.x=this.vector.x;
                    this.content2d.y=this.vector.z;
                    this.render();
                }
            }


        }

        
        this.render=function(){  
            this.par.render()
        }

        this.dragWHD=function(){  
            
        }

        this.setObj=function(o){           
           
        }
        this.getObj=function(){
            var o={}           
            return  o
        }
        trace("===========================================================================",this.type);
        //if(this.type=="Blok") 
            this.init();

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

    set depth(value) {
        if(this._depth!=value){
            this._depth= value;
            this.dragWHD();         
        }
    }    
    get depth() { return  this._depth;}  

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