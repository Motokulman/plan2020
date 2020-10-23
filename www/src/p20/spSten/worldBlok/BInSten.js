
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
            trace("!!!",self.par.par)
            if(self.par.par.par.sobSP!=undefined)self.par.par.par.sobSP("downBlok",self,e)
        }

        this.graphics.interactive = true;            
        this.graphics.on('mousedown', this.onDragStart);



        this.dragWHD=function(w,h,d){  
            if(w!==undefined){
                this._width=w;
                this._height=h;
                this._delph=d;
            }
            
            this.graphics.clear();
            this.graphics.beginFill(0x222222, 0.3);
            this.graphics.drawRect(-this._width/2,-this._delph/2,this._width,this._delph);
            this.graphics.endFill()

            if(this.typeStr1 == "Window"){

                this.graphics.lineStyle(20, 0x000000, 1);
                this.graphics.drawRect(-this._width/2,-this._delph/2,this._width,this._delph);
                this.graphics.drawRect(-this._width/2,-40,this._width,80);
            }
            if(this.typeStr1 == "Door"){
                this.graphics.lineStyle(20, 0x000000, 1);
                this.graphics.drawRect(-this._width/2,-this._delph/2,this._width,this._delph);
                this.graphics.moveTo(0,-this._delph/2-200);
                this.graphics.lineTo(0,+this._delph/2+200);
            }

        }

        this.init()
    }

}