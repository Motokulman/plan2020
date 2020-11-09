
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

        this.stAct=new BTAct(this);

        this.onDragStart=function(e){            
            if(self.par.par.par.sobSP!=undefined)self.par.par.par.sobSP("downBlok",self,e)
        }

        this.graphics.interactive = true;            
        this.graphics.on('mousedown', this.onDragStart);

        this.graphics.on('mouseover', function(e){     
            self.stAct.sahPlus=10;      
        });
        this.graphics.on('mouseout', function(e){       
            self.stAct.sahPlus=0;    
        });



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
            
            // this.par.par._colorLine_;
            // this.par.par._sizeLine;

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

            this.stAct.draw1();
        }



        this.drawActive=function(){
            
            this.stAct.sahAct=this._active ? 40: 0;
        }

        this.init()
    }

}

export function BTAct (par) {

    var self = this;
    this.type = 'BTAct';
    this.par = par;
    this._sahAct=0;

    this._sahPlus=0;

  
    this.graphics = new PIXI.Graphics();
    this.par.content2d.addChild(this.graphics);
    this.graphics.alpha=this._sahAct/100;

    this.draw1=function(){
        this.graphics.clear();


        this.graphics.clear();
        this.graphics.beginFill(par.par.par.colorUI);
        this.graphics.drawRect(-this.par._width/2,-this.par._delph/2,this.par._width,this.par._delph);
        this.graphics.endFill()
            
        
       
        

    }

    this.corektSetGet=function(){

        this.graphics.alpha = (this._sahAct+this._sahPlus)/100; 
        this.par.par.render()

    }

}
BTAct.prototype = {


    set sahAct (v) {
        if (this._sahAct === v) return;         
        this._sahAct = v;
        this.corektSetGet()
    },
    get sahAct () {

        return this._sahAct;
    },

    set sahPlus (v) {
        if (this._sahPlus === v) return;        
        this._sahPlus = v;
        this.corektSetGet()
    },
    get sahPlus () {

        return this._sahPlus;
    },
}