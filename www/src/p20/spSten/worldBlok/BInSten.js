
import { Blok } from './Blok.js';

export class BInSten extends Blok {  
  	constructor(par,obj,fun) { 
        super(par,obj,fun); 		
  		this.type="BInSten";
  		var self=this;


        

       
        this.graphics = new PIXI.Graphics();
        this.content2d.addChild(this.graphics);
        this.graphics.beginFill(0x00ff00, 0.5);    
        this.graphics.drawCircle(0,0,150);

        this.onDragStart=function(e){            
            if(self.par.par.par.sobSP!=undefined)self.par.par.par.sobSP("downBlok",self,e)
        }

        this.graphics.interactive = true;            
        this.graphics.on('mousedown', this.onDragStart);


        this.rect1={}

        this.funInit=function(){ 
            this.rect1.x= -this._width/2;
            this.rect1.y= -this._height/2;
            this.rect1.z= -this._delph/2;
            this.rect1.w= this._width;
            this.rect1.h= this._height;
            this.rect1.d= this._delph;


            if(this.obj.rect1!=undefined){
                
                this.rect1.x= this.obj.rect1[0];
                this.rect1.y= this.obj.rect1[1];
                this.rect1.z= this.obj.rect1[2];
                this.rect1.w= this.obj.rect1[3];
                this.rect1.h= this.obj.rect1[4];
                this.rect1.d= this.obj.rect1[5];
            }
            trace(this.rect1)
            
        }

       



        this.dragWHD=function(w,h,d){  
            if(w!==undefined){
                this._width=w;
                this._height=h;
                this._delph=d;
            }
            
            this.graphics.clear();
            this.graphics.beginFill(0x222222, 0.01);
            this.graphics.drawRect(-this._width/2,-this._delph/2,this._width,this._delph);
            this.graphics.endFill()

            if(this.typeStr1 == "Window"){

                this.graphics.lineStyle(20, 0x000000, 1);
                this.graphics.drawRect(this.rect1.x,-this._delph/2,this.rect1.w,this._delph);
                this.graphics.drawRect(this.rect1.x,-40,this.rect1.w,80);
            }
            if(this.typeStr1 == "Door"){
                this.graphics.lineStyle(20, 0x000000, 1);
                this.graphics.drawRect(this.rect1.x,-this._delph/2,this.rect1.w,this._delph);
                this.graphics.moveTo(0,-this._delph/2-200);
                this.graphics.lineTo(0,+this._delph/2+200);
            }
        }

        this.init()
    }

}