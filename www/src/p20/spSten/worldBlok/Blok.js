
import { Body } from '../colozi/Body.js';
import { Shape } from '../colozi/Shape.js';

export class Blok  {
    constructor(par,obj,fun) {          
        this.type="Blok";
        var self=this;
        this.par=par;
        this.objBase=obj;
        this.obj=obj.obj;
        this.fun=fun;

        this.id=obj.id;
        this.icon="resources/data/"+this.id+"/128.png";

        trace(obj.icon)

        this.typeStr=this.obj.str[0]
        this.typeStr1=this.obj.str[1]

        this.idArr=-1;

        this._active=false;
        this.sizeLine = this.par.par.sizeLine
       

        this._width=100;
        this._height=100;
        this._delph=100;
        
        this._boolSten=false;
        this._rotation=0    
        this.boxHelper=undefined
        this._life=true;
        this._parent=undefined;

        this.unik=undefined;
        this.uuid=calc.generateRendom(2);

        this.content2d = new PIXI.Container();


        this.content3d = new THREE.Object3D();
        this.cont3d = new THREE.Object3D();
        this.content3d.add(this.cont3d);
        this.cont3dL = new THREE.Object3D();
        this.content3d.add(this.cont3dL); 

        
        this.funInit=undefined
        this.body=undefined;
        this.shape=undefined;

        
        this.rect={}
        this.rect.x= this.obj.mod.r[0];
        this.rect.y= this.obj.mod.r[1];
        this.rect.z= this.obj.mod.r[2];
        this.rect.w= this.obj.mod.r[3];
        this.rect.h= this.obj.mod.r[4];
        this.rect.d= this.obj.mod.r[5];





        this._width=this.rect.w;
        this._height=this.rect.h;
        this._delph=this.rect.d;  

        trace(">>>>>>>>>>>>>>",this._width)      

        this.col=parseInt(this.obj.str[2],2)
        this.col1=parseInt(this.obj.str[3],2)
        this.offset=this.obj.num[0];       
        
       

        this.init = function(){            
            this.body=new Body();
            this.body.target=this
            this.body.drag=this.drag;
            this.shape=new Shape();
            this.shape.setRect(this.rect);
            this.body.addShape(this.shape);
            this.body.col=this.col
            this.body.col1=this.col1
            this.body.offset=this.offset

            this._width=this.obj.mod.r[3];
            this._height=this.obj.mod.r[5];
            this._delph=this.obj.mod.r[4];
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
                    this.vector=self._parent.getGlob(x,y,this.body.position._y,this) 
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
            this.body.position.set(x,y);
            if(this._parent)this._parent.drawDeb();            
        }

        this.drag=function(){            
            self.content2d.x=self.body.position.x;
            self.content2d.y=0;
            trace(">>>",self.body.position)
            self.content3d.position.x=self.body.position.x;            
            self.content3d.position.z=-self.body.position.y;


        }


        this.redrahHHH=function(h){  
            trace("#redrahHHH##",h);
        }

        
        this.render=function(){  
            this.par.render()
        }
        
        this.dragWHD=function(w,h,d){  
            if(w!==undefined){
                this._width=w;
                this._height=h;
                this._delph=d;
            }
        }

        this.funSetObj=undefined
        this.funGetObj=undefined

        this.setObj=function(o){

            this._width=o.w||o.width;
            this._height=o.h||o.height;
            this._delph=o.d||o.delph;   

            if(this.unik!=undefined)if(this.unik.setObj!=undefined)if(o.unik!=undefined)this.unik.setObj(o.unik)
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
            o.width= this._width;
            o.height= this._height;
            o.delph= this._delph;

            if(this.unik!=undefined)if(this.unik.getObj!=undefined)o.unik=this.unik.getObj();
            if(this.funGetObj)this.funGetObj(o);
            trace(o)
            return  o
        }
        //trace("===========================================================================",this.type);
        //if(this.type=="Blok")this.init(); 
        
       


        this.drawActive=undefined
    }
    set active(value) {
        if(this._active!=value){
            this._active= value;                   
            if(this.drawActive!=undefined)this.drawActive();                   
        }
    }    
    get active() { return  this._active;}   


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
                if(this._parent.sizeLine)this.sizeLine=this._parent.sizeLine

            }
            this.par.render();
          
            if(this.postParent!=undefined)this.postParent()
        }
    }    
    get parent() { return  this._parent;}

}