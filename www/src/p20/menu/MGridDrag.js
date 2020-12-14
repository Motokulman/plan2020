

//драгер сцены и расчеты максимумов, тут функция позиции к плану



import { MKrai } from './MKrai.js';//полосочки
import { SpDebugPixi } from '../spSten/SpDebugPixi.js';//пикси отрисовка



export class MGridDrag  {
    constructor(par,fun) {          
        this.type="MGridDrag";
        var self=this;
        this.par=par
        this.fun=fun

        this.otstup=par.otstup;
        this.otstup1=par.otstup1;
        this.wh=par.wh;

        this.width=100;
        this.height=100;

        this._mashtab=1;
        this._menuIndex=-1;
        this.sizeMax=par.sizeMax;

        this.dCont = new DCont(this.par.dCont);
        this.visiPixi = this.par.par.visiPixi;

        this.mKrai = new MKrai(this, function(s,p){ //полосочки            
            
        });
        



        this.debugPixi = new SpDebugPixi();
        this.par.par.cont2d.addChild(this.debugPixi.content2d);
        this.debugPixi.content2d.scale.set(0.1,0.1); 
        
        //this.grid = new PGrid(this.par.par.c2dSloi1,this.sizeMax, 20);

        

        this.panel = new DPanel(this.dCont,this.otstup,this.otstup*4+this.wh);
        this.panel.div.appendChild(this.visiPixi.div);

        //////////////////////////////
        var sp={x:0,y:0,x1:0,y1:0,s:0,o:null}

        this.cont=this.par.par.content2d;
        this.p20
        function mMove(e){
            self.cont.x=sp.x+(e.clientX-sp.x1);
            self.cont.y=sp.y+(e.clientY-sp.y1);
            self.korestPosit()
        }

        function mUp(e){           
            document.removeEventListener("mouseup", mUp);
            document.removeEventListener("mousemove", mMove); 
        }

        this.downFont=function(e){                        
            sp.x1=e.data.originalEvent.clientX//+self.cont.x;
            sp.y1=e.data.originalEvent.clientY; 
            sp.x=self.cont.x;
            sp.y=self.cont.y;
            sp.s= self.cont.scale.x;          
            document.addEventListener("mouseup", mUp);
            document.addEventListener("mousemove", mMove); 

           

        }
        this.klikGoem=function(e){ 
            let o={position:self.getPositPlan()}
            self.par.mDragScane.sobSP("downFont",o,e);
        }

        var rect = {x:0,y:0}//
        var point={x:0,y:0}
        var point1={x:0,y:0}

        this.getPositPlan  = function(poz){

            rect = self.panel.div.getBoundingClientRect();
            point.x=((dcmParam.globXY.x-rect.x)/scal/self.width)*2-1;
            point.y=((dcmParam.globXY.y-rect.y)/scal/self.height)*2-1;
            let xx =(self.width/2*point.x)/self._mashtab-self.cont.x/self._mashtab;
            let yy =(self.height/2*point.y)/self._mashtab-self.cont.y/self._mashtab;   

            if(poz!=undefined){
                poz.x=xx
                poz.y=yy
                return poz 
            }
            return {x:xx,y:yy}
        }



        /////////////////////////////////////


        var pp={x:0,y:0,w:0,h:0}
        var pp1={x:0,y:0,w:this.sizeMax,h:this.sizeMax}
        this.rectScane={x:0,y:0,x1:0,y1:0,w:100,h:100};

        this.korestPosit  = function(){
            let s=this.sizeMax*this._mashtab;
            let s1=s/pp.w;
            if(s/pp.h<s1)s1=s/pp.h;
            if(s1<1){//коректируем маштаб
                this.mashtab/=s1;
                let s=this.sizeMax*this._mashtab;
                return;
            }


            pp1.h=pp1.w=s;          
            pp1.x=self.cont.x-pp1.w/2
            pp1.y=self.cont.y-pp1.w/2


            if(pp.x<pp1.x)self.cont.x=pp.x+this.sizeMax/2*this._mashtab
            if(pp.x+pp.w>pp1.x+pp1.w)self.cont.x=-(pp.x+this.sizeMax/2*this._mashtab)
            

            if(pp.y<pp1.y)self.cont.y=pp.y+this.sizeMax/2*this._mashtab
            if(pp.y+pp.h>pp1.y+pp1.h)self.cont.y=-(pp.y+this.sizeMax/2*this._mashtab)    

                   
            pp1.x=self.cont.x-pp1.w/2
            pp1.y=self.cont.y-pp1.w/2          
            this.mKrai.set(pp,pp1)
            this.fun("render")



            this.rectScane.w=pp.w/this._mashtab;
            this.rectScane.h=pp.h/this._mashtab;

            this.rectScane.x=-self.cont.x/this._mashtab-this.rectScane.w/2;
            this.rectScane.x1=-self.cont.x/this._mashtab+this.rectScane.w/2;

            this.rectScane.y=-self.cont.y/this._mashtab-this.rectScane.h/2;
            this.rectScane.y1=-self.cont.y/this._mashtab+this.rectScane.h/2;
           
        }
        
        //////////////////////////


        this.setRect = function (r,ot,b) {  
            if(ot==undefined)ot=0
            
          
            /*this.debugPixi.clear()
            this.debugPixi.dRect(r,0x0000ff)
            this.debugPixi.dRect(pp,0xff0000)
            this.debugPixi.dRect(pp1,0x00ff00)*/

            var s=pp.w/(r.w+ot*2)
            if(s>pp.h/(r.h+ot*2))s=pp.h/(r.h+ot*2)
            this.mashtab=s



            self.korestPosit();
            

            self.cont.x=-r.x*this._mashtab -r.w*this._mashtab/2
            self.cont.y=-r.y*this._mashtab -r.h*this._mashtab/2
            
            if(b==true){
                this.setRect(r,ot/this._mashtab)
            }
            self.fun("mashtab",self._mashtab) 
        }



        ///////////////////////////


        

        var _point=null
        var _point1={x:0,y:0}
        var sahW=0.05;
        var hhh, www;
        this.mousewheel = function (e) {       
                trace('mousewheel')
            var delta=-1;
            var p=e.delta
            if(e.wheelDelta==undefined){
                p=e.wheelDelta
            }
            if(e.delta)if(e.delta<0)delta=1;
            if(e.deltaY)if(e.deltaY<0)delta=1;
            if(e.detail)if(e.detail<0)delta=1;
            
            if(e.wheelDelta!=undefined){
                if(e.wheelDelta>0)delta=-1;
                else delta=1;
            }
            var s=-delta*(self._mashtab*sahW)+self._mashtab;            
            if(s<0.01)s=0.01;       
            _point=self.getPositPlan()
            _point1.x=_point.x;
            _point1.y=_point.y;

            self.mashtab=s;
            _point=self.getPositPlan()
            self.cont.x-= (_point1.x-_point.x)*self._mashtab  
            self.cont.y-= (_point1.y-_point.y)*self._mashtab

            self.korestPosit();

            self.fun("mashtab",self._mashtab)      
        }


        this.panel.div.addEventListener('mousewheel', this.mousewheel)
        this.panel.div.addEventListener("DOMMouseScroll", this.mousewheel);

        //////////////////////////////////

        

        this.setSP=function(sp){            
            this.mKrai.setSP(sp)
        }

        this.setP20=function(p20){
            this.p20=p20;
            p20.sGposition=  this.sGposition  

            //подвешиваем события 
            this.p20.rulimActivSP.name="xz";
            this.p20.rulimActivSP.graphics.on('mousedown', this.klikGoem)      
        }

        this.sGposition = function(_o){
            if(_o==undefined){
                var o={}
                o.x=self.cont.x
                o.y=self.cont.y
                o.mashtab=self._mashtab

                o.visi3D=self.par.par.visi3D.getObj()
                return o
            }           
            
            self.cont.x= _o.x;
            self.cont.y= _o.y;
            self.mashtab=_o.mashtab;            
            if(_o.visi3D!=undefined)self.par.par.visi3D.setObj(_o.visi3D)
            self.fun("mashtab",self._mashtab) 
            return null
        }



        
        

   

        var scal=1
        this.sizeWindow = function(w,h,s){            
            scal=s
            this.panel.width= w/s-this.otstup*3-this.wh/2;
            this.panel.height= h/s-this.otstup*6-this.wh-this.wh/2; 

            this.width=Math.round(this.panel.width);
            this.height=Math.round(this.panel.height);

            this.visiPixi.sizeWindow(this.width,this.panel.height)
            this.visiPixi.render();


            pp.w=this.width
            pp.h=this.height

            pp.x=-this.width/2;
            pp.y=-this.height/2;

            this.par.par.cont2d.position.set(this.width/2,this.height/2)

            this.mKrai.sizeWindow(this.width,this.height,s)
            self.korestPosit();
        }


    }

    set mashtab(value) {      
        if(this._mashtab!=value){
            this._mashtab= value;
            this.cont.scale.x=this.cont.scale.y=value 
            this.mKrai.mashtab= value;
            this.korestPosit();
        }
    }    
    get mashtab() { return  this._mashtab;}

    set menuIndex(value) {      
        if(this._menuIndex!=value){
            this._menuIndex= value;
            this.mKrai.menuIndex= value;
        }
    }    
    get menuIndex() { return  this._menuIndex;}
    
}
