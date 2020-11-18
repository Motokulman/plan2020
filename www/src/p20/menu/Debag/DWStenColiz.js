
import { VisiPixi } from '../../../libMy/VisiPixi.js';
import { SpDebugPixi } from '../../spSten/SpDebugPixi.js';//пикси отрисовка
export class DWStenColiz extends DCont{
    constructor(dC) {
        super()
        var self=this;
        this.type="DWStenColiz"

        this.dC=dC
        this._active = false 
        this._otstup = 5
        this._width=600
        this._height=600

        var scale=0.1;
        var otstup=50; 

        this.dCont=new DCont(this.dC)

        this.pan = new DPanel (this.dCont,otstup,otstup)
        this.pan.width = this._width;
        this.pan.height = this._height;
        this.pan.visible = this.active;







        /*this.slider = new DSliderBig (this.pan, this._otstup, this._otstup, function(){self.width=this.value;}, 'width', 200, 800)
        this.slider.value = this._width
        this.slider1 = new DSliderBig (this.pan, this._otstup, this.slider.height + this._otstup * 2, function(){self.height=this.value;}, 'height', 150, 800)
        this.slider1.value = this._height*/


        this.kr
        this.setKR=function(kr){
            this.kr=kr;
        }

        this.visiPixi=undefined//new VisiPixi();   
        this.content2d = new PIXI.Container();
        this.content2d.position.x=otstup;
        this.content2d.position.y=otstup;

        this.debugPixi = new SpDebugPixi();
        this.content2d.addChild(this.debugPixi.content2d);
        this.debugPixi.content2d.scale.set(scale,scale); 
        var dp=this.debugPixi

        this.drag=function(){
            

           // if(self.par.active==false)return
            
            if(self.visiPixi==undefined){
                self.visiPixi=new VisiPixi(); 
                self.visiPixi.content2d.addChild(self.content2d);
                self.dCont.div.appendChild(self.visiPixi.div)
            }

            self.pan.width=Math.round(self.kr.rect.w*scale)
            self.pan.height=Math.round(self.kr.rect.h*scale)

            self.width=self.pan.width+otstup*2
            self.height=self.pan.height+otstup*2

            dp.clear()
            dp.dRect(self.kr.rect)


            self.visiPixi.render();
        }


        this.funDrwgWG=null
        this.funxz=function(){
            if(this.funDrwgWG!=undefined)this.funDrwgWG(this._width,this._height)
        }

    }

    set active(value) {
        if(this._active!=value){
            this._active = value;
            this.pan.visible = this.active
            if(this.kr){
                if(value==true){
                    this.kr.funRender=this.drag;
                }else{
                    this.kr.funRender=undefined;
                }
            }
        }       
    }   
    get active() { return  this._active;} 

    set width(value) { 
        if(this._width!=value){
            this._width=value;
            //this.pan.width=value
            //this.slider.value = value;
            this.visiPixi.sizeWindow(this._width,this._height)
           this.funxz();
        }
    }   
    get width() { return  this._width}

    set height(value) { 
        if(this._height!=value){
            this._height=value;
            //this.pan.height=value
            //this.slider1.value = value;
            this.visiPixi.sizeWindow(this._width,this._height)
            this.funxz();
        }
    }   
    get height() { return  this._height}
}