
import { Blok } from './Blok.js';
import { Unik_Steps } from './unik/Unik_Steps.js';
import { Unik_Vent } from './unik/Unik_Vent.js';


export class BInSten extends Blok {  
  	constructor(par,obj,fun) { 
        super(par,obj,fun); 		
  		this.type="BInSten";
  		var self=this;
        this.par=par;

        this.graphics = new PIXI.Graphics();
        this.content2d.addChild(this.graphics);
        this.graphics.beginFill(0x00ff00, 0.5);    
        this.graphics.drawCircle(0,0,150);

        this.stAct=new BTAct(this);


        this.planeXZ=this.par.planeXZ //new PlaneXZ(); 
        this.lineSegments = new THREE.LineSegments(
        //this.lineSegments = new THREE.Line(   
            this.planeXZ,
            this.par.lineBasicMaterial2
        )
        trace('this.planeXZ',this.planeXZ)

        /*this.lineSegments = new THREE.Mesh(   
            this.planeXZ
        )*/
        
        this.cont3dL.add(this.lineSegments);
        this.lineSegments.rotation.x=Math.PI/2




        // this.planeXZ=par.planeXZ;
        // this.lineSegments = new THREE.LineSegments(
        //     this.planeXZ,
        //     this.par.lineBasicMaterial2
        // )
        // this.cont3dL.add(this.lineSegments);
        // this.lineSegments.rotation.x=Math.PI/2



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

        

        if(this.typeStr1 == "Unik_Steps")this.unik = new Unik_Steps(self)  
        if(this.typeStr1 == "Unik_Vent")this.unik = new Unik_Vent(self)  
                          




  

        this.funInit=function(){ 
            
                     
        }

       



        this.dragWHD=function(w,h,d){  
            if(w!==undefined){
                this._width=w;
                this._height=h;
                this._delph=d;
            }
            

            let sizeLine=this.par._sizeLine
            let colorLine=this.par._colorLine_


            if(this.unik!=undefined){
                this.unik.dragWHD(); 
                return;
            }



            this.graphics.clear();
            this.graphics.beginFill(0x222222, 0.01);

            this.graphics.drawRect(-this._width/2-sizeLine,-this._delph/2-sizeLine,this._width+(sizeLine*2),this._delph+(sizeLine*2));
            this.graphics.endFill()



            if(this.typeStr1 == "Window"){

                this.graphics.lineStyle(sizeLine, colorLine, 1);
                this.graphics.drawRect(this.rect.x,-this._delph/2-(sizeLine/2),this.rect.w,this._delph+sizeLine);
                this.graphics.lineStyle(sizeLine/2, colorLine, 1);
                this.graphics.drawRect(this.rect.x,-40,this.rect.w,80);
            }
            if(this.typeStr1 == "Door"){
                this.graphics.lineStyle(sizeLine, colorLine, 1);
                this.graphics.drawRect(this.rect.x,-this._delph/2-(sizeLine/2),this.rect.w, this._delph+sizeLine);

                this.graphics.lineStyle(sizeLine/2, colorLine/2, 1);

                let cc = calc.getVector(-this._delph/2 - this._delph/2, 0);
                let pp = calc.getVector(this.rect.x - this.rect.w/5, 90);
                let ppp = calc.getVector(Math.abs(this.rect.x - this.rect.w/5), 45);

                this.graphics.moveTo(this.rect.x, cc.y);
                this.graphics.lineTo(this.rect.w/2, cc.y);
                this.graphics.moveTo(this.rect.x, cc.y);
                this.graphics.lineTo(pp.x, pp.y);
                this.graphics.moveTo(pp.x, pp.y);
                this.graphics.quadraticCurveTo(ppp.x + (ppp.x /4), -ppp.y + (ppp.y /4) , this.rect.w/2, cc.y)
            }
            if(this.typeStr1 == "Not"){
                this.graphics.lineStyle(sizeLine/2, colorLine, 1);
                this.graphics.drawRect(this.rect.x-(sizeLine*1.5)/2,-this._delph/2-(sizeLine*1.5)/2,this.rect.w+sizeLine*1.5, this._delph+sizeLine*1.5);
            }
            this.stAct.draw1();

           

            this.lineSegments.scale.set(this.rect.w,this.rect.h,1);
        }

        this.postParent=function(){            
            if(this.unik!=undefined)if(this.unik.postParent!=undefined)this.unik.postParent()
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

    this.clear=function(){
        this.graphics.clear();
    }

    this.draw1=function(x,y,w,h){
        this.graphics.clear();
        this.graphics.beginFill(par.par.par.colorUI);
        if(w==undefined){
            this.graphics.drawRect(-this.par._width/2,-this.par._delph/2,this.par._width,this.par._delph);
        }else{
            this.graphics.drawRect(x,y,w,h);
        }
        this.graphics.endFill()
    }


    this.drawRect1=function(x,y,w,h){
        this.graphics.beginFill(par.par.par.colorUI);
        if(w!=undefined){
            this.graphics.drawRect(x,y,w,h);
        }
        this.graphics.endFill()
    }
    this.drawTriangle=function(x, y, x1, y1, x2, y2){
        this.graphics.lineStyle(0, 0x222222, 1);
        this.graphics.beginFill(par.par.par.colorUI);
        if(x!=undefined){
            this.graphics.moveTo(x, y)
            this.graphics.lineTo(x1, y1)
            this.graphics.lineTo(x2, y2)
            this.graphics.lineTo(x, y)
        }
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