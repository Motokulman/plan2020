

class TextureBD  {
    constructor(menu, fun) {
        var self=this;
        this.type = "TextureBD";
        this.par = menu;
        window.selfTBD=this;
        this.margin = aGlaf.otstup;
        this.wh = aGlaf.wh;
        this.whv = aGlaf.whv;
        this.widthBig = aGlaf.widthBig;
        this.objectBase = this.par.objectBase;
        this._active=true

        this.linkO = 'https://alphakp.ru'
        this.objArray = []
        
        this.dCont = new DCont(this.par.dCont);

        this.w = new DPanel(this.dCont, aGlaf.otstup, this.whv, '');
        this.w.width = this.widthBig;

        this.w1 = new DPanel(this.dCont, aGlaf.otstup, this.whv, '');
        this.w1.width = this.widthBig;



        this.gallery = new TextureGallery(this.dCont,0,30,function(s,p){
            self.textureObject.openId(p.id)
            let a=php.ser.split("?");
            history.pushState(null, null, a[0]+'?t='+p.id);
        });


        this.textureObject = new TextureObject(this.w, ' ', (objDin) => {
        });


        window.textureObject = this.textureObject;
        this.textureObject.window.y = 32;

        this.reDrag=function(){
            this.gallery.start(this.objArray);
            if(this.objArray.length==0){
                this.textureObject.visible=false
            }else{
                this.textureObject.visible=true
                this.textureObject.openId(this.objArray[0].id)
                this.gallery.openId(this.objArray[0].id)
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
    }

    sizeWindow (w, h) {
        this._width = w;
        this._height = h;
        this.w.height = h - this.whv - this.margin;
        this.w.x = this.margin+200;
    
        this.w1.height = h - this.whv - this.margin;
        this.w1.x = this.margin;
    }

    set active (value) {
        if (this._active != value) {
            this._active = value;

            if (value == true) {
                this.dCont.add(this.w)
                this.dCont.add(this.w1)
                this.mnXZ.init();
            } else {
                this.dCont.remove(this.w)
                this.dCont.remove(this.w1)
            }
        }           
    }
    get active () { return this._active; }

    set index (value) {
    }
    get index () { return this._index; }
}