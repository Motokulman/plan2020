
import { Calc } from './Calc.js';

export class KorektRect  {
    constructor(fun) {         
        this.type="KorektRect";        
        var self=this;
        this.fun=fun
        
        this.funRender=undefined

        this.pS={x:0,y:0,w:1000,h:1000}//Параметры текстурировнаия и начало энного


        this.rect={x:0,y:0,w:1000,h:1000};


        this.r={x:0,y:0,w:100,h:100,type:0};
        this.r1={x:0,y:0,w:100,h:100,type:0};

        this.array=[];
        this.arrayCesh=[];



        var w
        this.setSten=function(ohH1W,_x,_x1){
            _x=-200
            _x1=_x1||0

            w=ohH1W.width!=undefined?ohH1W.width : ohH1W._distans
            this.rect.x=_x;
            this.rect.w=w-_x+_x1;
            this.rect.x1=this.rect.x+this.rect.w;

            this.rect.y=0;
            this.rect.h=ohH1W.height;
            this.rect.h1=ohH1W.height1;
            
        }





        this.korekt1=function(){
            this.r.x=this.rect.x;
            this.r.y=this.rect.y;
            this.r.w=this.rect.w;
            this.r.h=this.rect.h;
            this.r.type=0;
        }

        var rect    
        this.sah=0
        this.setRect=function(r){
            this.rect=r;
        }

        this.clear=function(){
            this.sah=0
            for (var i = 0; i < this.array.length; i++) {
                this.array[i].life=false;
            }
        }

        this.getR=function(){
            if(this.array[this.sah]==undefined){
                this.array[this.sah]=new BoxRect()
                this.array[this.sah].idArr=this.sah
            }
            this.sah++
            return this.array[this.sah-1]
        }

        this.korektGrid=function(){
            this.clear()
            this.naStart()
            this.render();
        }

        
        //наполняем первыми боксами
        var ww,hh,b,b1,b2,b3
        this.naStart=function(){
            for (var j = this.rect.y;  j< this.rect.h; j+=this.pS.h) {
                b=false
                b1=false
                b2=false
                b3=false
                if(j==0)b=true

                hh=this.pS.h;    
                if(j+hh>this.rect.h){
                    hh=this.rect.h-j;
                    b2=true;
                }                    
                if(j+hh==this.rect.h) b2=true


                for (var i = this.rect.x; i < this.rect.w; i+=this.pS.w) {
                    b3=false
                    if(i == this.rect.x){
                        b3=true                        
                    }
                    

                    b1=false;
                    ww=this.pS.w;
                    if(i+ww>this.rect.w){
                        ww=this.rect.w-i;
                        b1=true;
                    }                    
                    if(i+ww==this.rect.w) b1=true
                    this.creatNS(i,j,ww,hh,b,b1,b2,b3)
                }    
                

            }
        }

        this.creatNS=function(x,y,w,h,b,b1,b2,b3){
            rect=this.getR()
            rect.x=x
            rect.y=y
            rect.w=w
            rect.h=h
            rect.setP(x,y,w,h,b,b1,b2,b3)

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

export class BoxRect  {
    constructor() {         
        this.type="BoxRect";        
        var self=this;
        this.idArr=-1;

        this.x=0
        this.y=0
        this.w=1000
        this.h=1000

        this.bool=[false,false,false,false];



        this.setP=function(x,y,w,h,b,b1,b2,b3){        
            this.x=x
            this.y=y
            this.w=w
            this.h=h

            this.bool[0]=b
            this.bool[1]=b1
            this.bool[2]=b2
            this.bool[3]=b3
        }

    }
}