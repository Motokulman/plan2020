

import { TextureGallery } from './TextureGallery.js';
import { TextureObject } from './TextureObject.js';

export class TextureBD  {
    constructor(par, fun) {
        var self=this;
        this.type = "TextureBD";
        this.par = par;
        this.fun=fun;
        window.selfTBD=this;
        this.otstup = 2;
        this.wh = 100
        this.whv = 62;
        this.widthBig = 200;
        this.param=this.par.param

        this._active=true
        this._activeGallery=false

        this.linkO = 'https://alphakp.ru'
        this.objArray = []

        
        this.dCont = new DCont();
        if(this.par)if(this.par.dCont)this.par.dCont.add(this.dCont)

        this.w = new DPanel(this.dCont, (this.otstup*2)+200, this.whv, '');
        this.w.width = this.widthBig;


        this.getLocation=function(){
            let ser = window.location.href;
            trace('ser.split("?id=");',ser.split("?id="))
            return ser.split("?id=");
        }
        this.setLocation=function(p, p1){
            let a = self.getLocation()
            history.pushState(null, null, a[0] + '?id=' + p);
        }


        this.gallery = new TextureGallery(this.dCont, this.otstup,this.whv,function(s,p){
            if(s === 'downObj') {
                self.textureObject.openId(p.id)
                self.setLocation(p.id)
            }
        });
        this.gallery.visible = false

        this.textureObject = new TextureObject(this.w,function(s,p,p1){ 
            if(self.fun) self.fun(s,p,p1)
        })


        window.textureObject = this.textureObject;
        this.textureObject.window.y = 32;
        this.width = this.gallery._width + this.textureObject._width

        this.reDrag=function(){
            this.gallery.start(this.objArray);
            if(this.objArray.length==0){
                this.textureObject.visible=false
            }else{
                let a = self.getLocation()[self.getLocation().length-1]
                if (a===undefined || a==='') a=1
                let vvv = this.gallery.openId(a)
                this.setLocation(a)
                this.textureObject.visible=vvv
                if (vvv) this.textureObject.openId(a)
            }
        }

        //Получаем список текстур с сервера
        this.getTexturs=function(f){
            var obj={
                url: 'https://alphakp.ru/api/texture/',
                type: 'GET',
                success:function(e){
                    f(e);
                }
            }
            $.ajax(obj) 
        }

        this.startrrr=function(){
            this.getTexturs(function(e){
                self.objArray=e;
                self.reDrag()
            })
        }
        this.startrrr()
        this.activeGallery = this.param.bool
    }

    sizeWindow (w, h) {
        this._width = w;
        this._height = h;
        this.w.height = h - this.whv - this.otstup;
        this.w.x = this.activeGallery == true ? (this.otstup*2)+200 : this.otstup;
        this.width = this.activeGallery == true ? this.gallery._width + this.textureObject._width + this.otstup : this.textureObject._width + this.otstup
    }

    set active (value) {
        if (this._active != value) {
            this._active = value;

            if (value == true) {
                this.dCont.add(this.w)
                this.mnXZ.init();
            } else {
                this.dCont.remove(this.w)
            }
        }           
    }
    get active () { return this._active; }

    set activeGallery (value) {
        if (this._activeGallery != value) {
            this._activeGallery = value;
            this.gallery.visible = value
        }           
    }
    get activeGallery () { return this._activeGallery; }

    set index (value) {
    }
    get index () { return this._index; }
}