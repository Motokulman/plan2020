
import { Calc } from './Calc.js';

export class KorektRect  {
    constructor(fun) {         
        this.type="KorektRect";        
        var self=this;
        this.fun=fun
        
        this.funRender=undefined

        this.rect={x:0,y:0,x1:0,y1:0,w:100,h:100,h1:0, s:0,o:null}


        this.r={x:0,y:0,w:100,h:100,type:0};
        this.r1={x:0,y:0,w:100,h:100,type:0};


        var w
        this.setSten=function(ohH1W,_x,_x1){
            _x=_x||0
            _x1=_x1||0
            w=ohH1W.width!=undefined?ohH1W.width : ohH1W._distans
            this.rect.x=_x;
            this.rect.w=w-_x+_x1;
            this.rect.x1=this.rect.x+this.rect.w;

            this.rect.y=0;
            this.rect.h=ohH1W.height;
            this.rect.h1=ohH1W.height1;

            this.render();
        }

        this.korekt1=function(){
            this.r.x=this.rect.x;
            this.r.y=this.rect.y;
            this.r.w=this.rect.w;
            this.r.h=this.rect.h;
            this.r.type=0;
        }

        
        this.setColisi=function(colisi,_xOfset){
                
        }





        this.render=function(){
            if(this.funRender!=undefined){
                this.funRender()

            }
        }

    }



    set parent(value) {
        if(this._parent!=value){
            this._parent= value;           
        }
    }    
    get parent() { return  this._parent;}
}