class MNXZ  {
    constructor(dc, par, fun) {
        var self=this;
        this.type = "TextureBD";
        this.par = par;
        this._index = -1;

        this.dCont = undefined;
        
        this.array=[]
        this.init=function(){
            if(this.dCont!=undefined)return
            this.dCont = new DCont(dc);

            var ww=34
            
            var yy = this.par.margin
            this.pan1 = new DPanel (this.dCont, this.par.widthBig, this.par.margin)
            this.image1 = new DImage(this.pan1, yy, this.par.margin, null)
            this.image1.width = this.image1.height = this.pan1.height - (this.par.margin*3) 

            yy = this.image1.width + this.par.margin
            for (var i = 0; i < 3; i++) {
                
                var b=new DButton(this.pan1, yy + (this.par.margin)+ww*i, this.par.margin, '', function(){
                 
                });
                b.idArr=i;
                b.width=ww-2;  
                this.array.push(b);
            }

            yy += ((this.par.margin)+ww)*this.array.length
            this.pan1.width = yy
        }
    }
    set index (value) {
        if (this._index !== value) {
            this._index = value;
            for (var i = 0; i < this.array.length; i++) {
                this.array[i].alpha=i==value?0.5:1
            }
        }
    }
    get index () { return this._index; }
}



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
        this._active=false

        this._sort=-2   

        this.linkO = 'https://alphakp.ru'
        this.objArray = []
        

        this.dCont = new DCont(this.par.dCont);

        this.w = new DPanel(null, aGlaf.otstup, this.whv, '');
        this.w.width = this.widthBig;
        this.w.dragBool = false;
        this.w.hasMinimizeButton = false;

        this.w1 = new DPanel(null, aGlaf.otstup, this.whv, '');
        this.w1.width = this.widthBig;
        this.w1.dragBool = false;
        this.w1.hasMinimizeButton = false;


        this.mnXZ=new MNXZ(this.w,this,function(s,p){

        })
        // this.gallery=new TextureGallery(this, this.w1);




        this.comboSort = new DComboBox(this.w1.content, this.margin, this.margin, null, this.cSort)      
        this.comboSort.width = this.w1.width - (this.margin*3)


        this._width = 100;
        this._height = 100;

        let butOffset = 32;

        this.gallery = new GalleryN(this.w1.content, this.margin, (this.margin*2) + this.comboSort.height , () => {
            self.texture.openId(self.gallery.array[self.gallery.index].object.id)
            trace(self.gallery.array[self.gallery.index].object.id)
           // this.par.dragPic.testDrag(15, this.clik.bind(this), this.drag.bind(this));

        });
        this.gallery.width = this.w1.width - (this.margin*3);
        this.gallery.kolII = 4;
        this.gallery.widthPic = 46;
        this.gallery.heightPic = 46;
        this.gallery.visible = true


        let b;
        let ww = 28;


        this.texture = new TextureObject(this.w, ' ', (objDin, reload, dontSave) => {

        });
        window.textureObject = this.texture;

        this.texture.window.y = butOffset;

        var aZZ=[]
        this.reDrag=function(){       
            var b=true
            console.warn("objArray",self.objArray)

            this.gallery.start(self.objArray);
            this.texture.visible = !!this.gallery.array.length;

            var sortArr = [];
            for (var i = 0; i < this.gallery.arrayObj.length; i++) {
                sortArr.push(this.gallery.arrayObj[i].texture_type);
            }
            sortArr.push("All");

            this.comboSort.array = sortArr;
        }

        self.par.dragPic.addFunAp(function(){        

        })




        this.getTexturs=function(f){
            var obj={//то что посылаем через аякс на сервер, собственно тут сам запрос
                url: 'https://alphakp.ru/api/texture/',
                type: 'GET',
                success:function(e){
                    trace('obj1e', e)
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
        // this.index = 0;
        this.active = true;
    }

    find(objDinId) {
        let o = this.gallery.array.find(o => o.object.id === objDinId);
        return o && o.object;
    }

    show(objDin) {
        this.index = this.gallery.array.findIndex(o => o.object.id === objDin.id);
    }

    clik() {
        let a=php.ser.split("?");
        this.index = this.gallery.index;
        history.pushState(null, null, a[0]+'?t='+this.gallery.array[this.index].object.id);
    }

    drag() {
        this.index = this.gallery.index;
        let dragObj = this.gallery.array[this.gallery.index].object;
        this.par.dragPic.start(32, aGlaf.resursData + "" + dragObj.id + "/64.png", dragObj);
    }

    redragTime() {
        aGlaf.plusLink = "?x=" + Math.random();
        this.reDrag();
        setTimeout(function () {
            aGlaf.plusLink = '';
        }, 500);
    }




    sizeWindow (w, h) {
        this._width = w;
        this._height = h;
        this.w.height = h - this.whv - this.margin;
        this.w.x = this.margin+200;
    
        this.w1.height = h - this.whv - this.margin;
        this.w1.x = this.margin;
    }

    set index (value) {
        if (this._index !== value && this.gallery.array[value] != undefined) {
            this._index = value;
            this.gallery.index = value;

            this.objDin = this.gallery.array[value].object;
            this.texture.openId(this.objDin.id)
            //this.texture.setObj(this.objDin);

            this.mnXZ.init();
            this.mnXZ.index=value;
        }
    }
    get index () { return this._index; }

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

    set sort (value) {
        if(this._sort!=value){
            this._sort=value; 

            localS.object.sortTex=value
            localS.save()
            // this.mSort.sort=value; 
            this.reDrag()             
        }            
    }

    get sort () { return this._sort; }

}

class TextureObject {
    constructor(par, name, _fun) {
        let self = this;
        this.type = 'TextureObject';

        this.par = par;
        this.name = name;
        this.fun = _fun;

        this.dCont = new DCont(this.par)

        this._width = par._width;
        this.lineHeight = 32;
        this.margin = 4;

        this._height = 32;
        this._wh = 64;
        this.allWh = this._width - (this.margin * 3);


        this._active = false;

        this.window = new DCont(null, 0, 0, this.name);
        this.window.width = this._width - this.margin * 1;


        this.info = new DCont(this.window, 0, 0)
        this.info.visible = this._active;
        this.info.y = -32+this.margin;
        this.info.width = this.allWh


        this.panel = new DPanel(this.info, this.margin, 0);
        this.panel.width = this.panel.height = this.allWh//this._wh - this.margin;
        this.panel.color1 = "#777777"

        this.image = new DImage(this.panel, 0, 0, null, function () {
            self.image.width = self.image.height = self.panel.width;

            if (self.image.picWidth > self.image.picHeight) {
                self.image.height = self.panel.width * (self.image.picHeight / self.image.picWidth);
            }
            if (self.image.picWidth < self.image.picHeight) {
                self.image.width = self.panel.width * (self.image.picWidth / self.image.picHeight);
            }

            var a = self.image.link.split("/");
            var s = a[a.length - 1];
            if (s.length > 20) s = s.substr(0, 20) + "..";
            self.resLabel.text = self.image.picWidth + "x" + self.image.picHeight + "px";

            self.size256But.visible = self.image.picWidth > 256 || self.image.picHeight > 256;
            self.size512But.visible = self.image.picWidth > 512 || self.image.picHeight > 512;

            if (Number.isInteger(Math.log2(self.image.picWidth)) && Number.isInteger(Math.log2(self.image.picHeight))) {
                self.resLabel.colorText1 = self.colorT;
                self.resizeButton.visible = false;
            } else {
                self.resLabel.colorText1 = '#ff0000';
                self.resizeButton.visible = true;
            }
        });

        this.image.width = this.image.height = this.panel.width;

        var yy = this.panel.height+(this.margin*2)

        this.size256But = new DButton(this.info, 0, yy, '256', async () => {
            const width = Math.min(2 ** Math.floor(Math.log2(this.image.picWidth)), 256);
            const height = Math.min(2 ** Math.floor(Math.log2(this.image.picHeight)), 256);
            this.setResizedImage(width, height);
        });
        this.size512But = new DButton(this.info, 0, yy, '512', async () => {
            const width = Math.min(2 ** Math.floor(Math.log2(this.image.picWidth)), 512);
            const height = Math.min(2 ** Math.floor(Math.log2(this.image.picHeight)), 512);
            this.setResizedImage(width, height);
        });
        this.resizeButton = new DButton(this.info, 0, yy, "res", async () => {
            const width = 2 ** Math.floor(Math.log2(self.image.picWidth));
            const height = 2 ** Math.floor(Math.log2(self.image.picHeight));
            this.setResizedImage(width, height);
        });

        this.size256But.width = this.size512But.width = this.resizeButton.width =  (this.allWh-this.margin*2) / 3;
        this.size256But.height = this.size512But.height = this.lineHeight / 2 - this.margin * 2;
        this.resizeButton.height = this.lineHeight - this.margin * 2;

        this.size256But.x = this.margin;
        this.size512But.x = this.size256But.x + this.size256But.width + this.margin;
        this.resizeButton.x = this.size512But.x + this.size512But.width + this.margin;

        this.size256But.visible = this.size512But.visible = this.resizeButton.visible = false;

        yy +=  this.size256But.height+this.margin;

        this.resLabel = new DLabel(this.panel, this.margin, yy, "null")
        this.resLabel.fontSize = 12;
        this.colorT = this.resLabel.colorText1;

        yy -=  this.size512But.height+this.margin;
        yy +=  this.resizeButton.height+this.margin;

        this.loadButton = new DButton(this.info, this.margin,  yy, "load", function (b) {
            self.uploadImage(this.files[0]);
        });
        this.loadButton.width = this.allWh;
        this.loadButton.height = this.lineHeight - this.margin * 2;
        this.loadButton.startFile();


        yy+= this.loadButton.height+this.margin;


        this.rxLabel = new DLabel(this.info, 0, yy, "rx:");
        this.ryLabel = new DLabel(this.info, 0, yy, "ry:");

        this.rxInput = new DInput(this.info, 0, yy, "1", function () {
            self.textXZ()
        });

        this.ryInput = new DInput(this.info, 0, yy, "1", function () {
            self.textXZ()
        });

        this.rxInput.height = this.ryInput.height = this.loadButton.height;
        this.rxLabel.width = this.ryLabel.width = 23;
        this.rxInput.width = this.ryInput.width = ((this.allWh - (this.rxLabel.width * 2)) - (this.margin*7)) / 2;
        this.rxLabel.x = this.margin;
        this.rxInput.x = this.rxLabel.x + this.rxLabel.width + this.margin*2;
        this.ryLabel.x = this.rxInput.x + this.rxInput.width + this.margin*2;
        this.ryInput.x = this.ryLabel.x + this.ryLabel.width + this.margin*2;

        this.rxInput.setNum(0.1);
        this.ryInput.setNum(0.1);

        yy+= this.rxInput.height+this.margin;

        this.pxLabel = new DLabel(this.info, 0, yy, "px:");
        this.pyLabel = new DLabel(this.info, 0, yy, "py:");

        this.pxInput = new DInput(this.info, 0, yy, "1", function () {
            self.textXZ()
        });
        this.pyInput = new DInput(this.info, 0, yy, "1", function () {
            self.textXZ()
        });

        this.pxLabel.width = this.pyLabel.width = 23;
        this.pxInput.width = this.pyInput.width =   ((this.allWh - (this.pxLabel.width * 2)) - (this.margin*7)) / 2;
        this.pxInput.height = this.pyInput.height = this.loadButton.height;
        this.pxLabel.x = this.margin;
        this.pxInput.x = this.pxLabel.x + this.pxLabel.width + this.margin*2;
        this.pyLabel.x = this.pxInput.x + this.pxInput.width + this.margin*2;
        this.pyInput.x = this.pyLabel.x + this.pyLabel.width + this.margin*2;

        this.pxInput.setNum(0.1);
        this.pyInput.setNum(0.1);

        yy += this.pxInput.height+this.margin;

        this.wNaLabel = new DLabel(this.info, 0, yy, "wNa:");
        this.hNaLabel = new DLabel(this.info, 0, yy, "hNa:");

        this.wNaInput = new DInput(this.info, 0, yy, "1000", function () {
            self.textXZ()
        });
        this.hNaInput = new DInput(this.info, 0, yy, "1000", function () {
          /*  self.objDin.hNa = this.value;
            self.fun(self.objDin);
            // self.setObj(self.objDin)*/
            self.textXZ()
        });

        this.wNaLabel.fontSize = this.hNaLabel.fontSize = 12;
        this.wNaLabel.width = this.hNaLabel.width = 23;
        this.wNaInput.width = this.hNaInput.width =  ((this.allWh - (this.wNaLabel.width * 2)) - (this.margin*7)) / 2;
        this.wNaInput.height = this.hNaInput.height = this.loadButton.height;
        
        this.wNaLabel.x = this.margin;
        this.wNaInput.x = this.wNaLabel.x + this.wNaLabel.width + this.margin*2;
        this.hNaLabel.x = this.wNaInput.x + this.wNaInput.width + this.margin*2;
        this.hNaInput.x = this.hNaLabel.x + this.hNaLabel.width + this.margin*2;

        this.wNaInput.setNum(0.1);
        this.hNaInput.setNum(0.1);
        
        yy += this.hNaInput.height + this.margin;

        this.buttonLoadSous = new DButton(this.info, this.margin, yy, "Load Sous");
        this.buttonLoadSous.width =  this.allWh

        yy += this.buttonLoadSous.height 


        var c;
        var n = this.margin;

        var check = []
        var boolXZ=["map",null,"alphaMap",null,"bumpMap",null,"normalMap",null,"displacementMap",null,"ligthMap",null,"aoMap",null,"emissiveMap",null]
        for (var i = 1; i < boolXZ.length; i+=2) {
                c = new DCheckBox(this.info, n, yy, ' ', function () {
                    self.redragTextur(this.idArr);
                });
                c.idArr = i;
                c.height = (this.allWh-(this.margin*7))/8
                n += c.height+this.margin
                check.push(c)
        }   
        check[0].value=true;

        yy += c.height + this.margin*2

        this.titleInput = new DTextArea(this.info, this.margin,yy,'', function () {
        });
        this.titleInput.width = this.allWh
        this.titleInput.height = 200;

        yy += this.titleInput.height + this.margin

        this.buttonSet = new DButton(this.info, this.margin, yy, "Set", function(){
            let p = JSON.parse(self.titleInput.value)
            if(p!=null){
                self.setObj(p)
            }
        });
        this.buttonSet.width = this.allWh

        // this.titleInput.visible=false
        // this.buttonSet .visible=false


        var o, j, p;
        this.textXZ = function(){   
            self.object.rx=self.rxInput.value
            self.object.ry=self.ryInput.value
            self.object.px=self.pxInput.value
            self.object.py=self.pyInput.value
            self.object.wNa=self.wNaInput.value
            self.object.hNa=self.hNaInput.value

            self.fun(self.object);

            let p = JSON.stringify(self.object)
            self.titleInput.value=p
        }  

        var boolCheck=undefined
        var id=undefined
        this.texturXZ=undefined
        this.matXZ=undefined
        this.redragTextur=function(){
            if(aGlaf.s3d){
                this.matXZ=aGlaf.s3d.sMaterial.mesh.material;
                this.texturXZ=aGlaf.s3d.pm.tex.getById(this.objDin.id);
                boolCheck = false
                for (var i = 0; i < boolXZ.length; i+=2) {
                    if(check[i/2].value==true){
                        id = i/2
                        boolCheck = true
                        this.matXZ[boolXZ[i]]=this.texturXZ
                    }
                    else {
                        this.matXZ[boolXZ[i]]=null
                    }
                    
                }
                if (boolCheck != true){
                    check[id].value=true
                    this.redragTextur()
                }
                this.matXZ.needsUpdate=true
            }
        }

        this.objDin = undefined;//гронитель обьекта бд
        this.object= undefined;//json наш обьект

         
        this.redragParam=function(obj){

            this.object=obj

            if (this.object.rx == undefined) this.object.rx = 1
            if (this.object.ry == undefined) this.object.ry = 1
            if (this.object.py == undefined) this.object.py = 1
            if (this.object.px == undefined) this.object.px = 1
            if (this.object.wNa == undefined) this.object.wNa = 100
            if (this.object.hNa == undefined) this.object.hNa = 100
            if (this.object.src == undefined) {
                this.object.src = {src:"null",id:null}               
            }

            this.rxInput.value = this.object.rx;
            this.ryInput.value = this.object.ry;
            this.pxInput.value = this.object.px;
            this.pyInput.value = this.object.py;
            this.wNaInput.value = this.object.wNa;
            this.hNaInput.value = this.object.hNa;
        }


        this.info.visible = true;
        this._height = this.window.height = this.lineHeight * 4;


        this.openId=function(id){
            var obj={//то что посылаем через аякс на сервер, собственно тут сам запрос
                url: "https://alphakp.ru/api/texture/"+id,
                type: 'GET',
                success:function(e){
                    trace('obj1e', e)
                   // f(e);
                    self.setObj(e)
                }
            }
            $.ajax(obj) 
        }

        this.save=function(){ 
          /*  var ss  =JSON.stringify(this.objectBase); 
            var l = "../"+this.par.resurs+"config.json";        
            aGlaf.php.load({tip:"saveJSON", link:l, text:ss},function(e){
            });  */  
            traec("sfsfsdfsdfsfsdf")  
        }

        this.sah=0
        this.saveTime=function(){
            this.sah++;
            var s=this.sah;
            setTimeout(function() {
                if(self.sah==s)self.save()
            }, 500);
        } 
    }


    setObj(objDin) {
        this.objDin = objDin;
        console.warn('this.objDin', objDin)
        
        this.redraw();
        // this.redragTextur();
        var conf=objDin.json;
        if (objDin.json != undefined){
            if(typeof objDin.json == "string") conf =  JSON.parse(objDin.json)
        } else conf={}

        this.redragParam(conf)
        this.textXZ();
        

    }

    redraw() {
        let l = 'https://alphakp.ru' + this.objDin.src
        this.image._link = '';
        this.image.link = l;
    }

    async setResizedImage(width, height) {
        const type = this.image.link.split('.').pop();
        const img = await resizeImage(this.image.link, width, height, type);
        const resp = await uploadFile(img,  '../' + this.image.link);

        if (resp === 'ok') {
            this.fun(this.objDin, true, true);
            this.redraw();

        }
    }

    async uploadImage(image) {
        if (image && image.size > 2096000) {
            aGlaf.menu.mInfo.setFun(
                "Фаил велик!!",
                "Сорян но не катит, фаил больше 2 метров, если очень нужно качество, то тестируем в слабом, а потом ручками меняем в директории resources/data/<<иди обьекта>>/textur/<<имя файла>>",
                function () {
                }
            );
            return
        }

        var type = image.name.split('.').pop();
        var imageMin = await resizeImageFile(image, 64, 64, type);
        var dest = '../' + aGlaf.resursData + this.objDin.id + '/' + '64.png';

        var resp = await uploadFile(imageMin, dest);
    
        if (resp !== 'ok') {
            return;
        }


        var type = image.name.split('.').pop();
        var imageMin = await resizeImageFile(image, 100, 100, type);
        var dest = '../' + aGlaf.resursData + this.objDin.id + '/' + '100.png';
        var resp = await uploadFile(imageMin, dest);
        if (resp !== 'ok') {
            return;
        }

        var type = image.name.split('.').pop();
        var imageMin = await resizeImageFile(image, 32, 32, type);
        var dest = '../' + aGlaf.resursData + this.objDin.id + '/' + '32.png';
        var resp = await uploadFile(imageMin, dest);
        if (resp !== 'ok') {
            return;
        }

        var type = image.name.split('.').pop();
        var imageMin = await resizeImageFile(image, 128, 128, type);
        var dest = '../' + aGlaf.resursData + this.objDin.id + '/' + '128.png';
        var resp = await uploadFile(imageMin, dest);
        if (resp !== 'ok') {
            return;
        }

        var type = image.name.split('.').pop();
        var imageMin = await resizeImageFile(image, 256, 256, type);
        var dest = '../' + aGlaf.resursData + this.objDin.id + '/' + '256.png';
        var resp = await uploadFile(imageMin, dest);
        if (resp !== 'ok') {
            return;
        }


        var type = image.name.split('.').pop();
        var dest = '../' + aGlaf.resursData + this.objDin.id + '/' + 'pic.' + type;
        var resp = await uploadFile(image, dest);
        if (resp !== 'ok') {
            return;
        }

        if (this.objDin.type !== type) {
            php.load({
                tip: 'unlink',
                dir: '../' + aGlaf.resursData + this.objDin.id + '/' + 'pic.' + this.objDin.type
            });

            this.objDin.type = type;
            this.fun(this.objDin, true);
            this.redraw();
        } else {
            this.fun(this.objDin, true, true);
            this.redraw();
        }
    }

    set visible(value) {
        if (this._visible == value) return;
        this._visible = value;
        if (value == true) {
            this.dCont.add(this.window)
        } else {
            this.dCont.remove(this.window)
        }
    }

    get visible() {
        return this._visible;
    }


    set visibleDebug(value) {
        if (this._visibleDebug != value){
            this._visibleDebug = value
            this.dContDebug.visible=this._visibleDebug
        }
    }
    get visibleDebug() { return this._visibleDebug }

    set height(v) {
        if (this._height == v) return;
        this._height = v;
    }

    get height() {
        return this._height;
    }
}

function resizeImageFile(file, width, height, type = 'png') {
    const reader = new FileReader(file);
    reader.readAsDataURL(file);

    return new Promise((res, rej) => {
        reader.onload = event => {
            res(resizeImage(event.target.result, width, height, type, file.name));
        };
    });
}

function resizeImage(src, width, height, type = 'png', fileName = '_') {
    return new Promise((res, rej) => {
        const img = new Image();
        img.src = src;
        const mime = type === 'png' ? 'image/png' : 'image/jpeg';
        img.onload = () => {
            const elem = document.createElement('canvas');
            elem.width = width;
            elem.height = height;
            const ctx = elem.getContext('2d');
            ctx.drawImage(img, 0, 0, width, height);
            ctx.canvas.toBlob((blob) => {
                const image = new File([blob], fileName);
                res(image);
            }, mime);
        };
    });
}

function uploadFile(file, dest) {
    let serverURL = php.server + "src/phpBase.php";


    let data = new FormData();

    data.append('tip', 'saveFile');
    data.append('file', file);
    data.append('dest', dest);



    return $.ajax({
        url: serverURL,
        dataType: 'text',
        cache: false,
        contentType: false,
        processData: false,
        data: data,
        type: 'post',
        success: function function_name(data) {  
     
        }
    });
}





function GalleryN(dCont, _x, _y, _fun) {
    DGallery.call(this, dCont, _x, _y, _fun);
               
    this.type="GalleryN";
    this.linkO='https://alphakp.ru'
   

    this.createZamen=function(){            
        var r=new BoxXZ(this.content, 0, 0, this.downBtn, this);            
        return r;
    }

    this.dragColorGal=function(){
        for (var i = 0; i < this.array.length; i++) {
            this.array[i].dragColorGal()
        }
    }


    
}
GalleryN.prototype = Object.create(DGallery.prototype);
GalleryN.prototype.constructor = GalleryN;

Object.defineProperties(GalleryN.prototype, {

    index: {// Активный элемент
        set: function (value) {
            
            if (this.array[value] != undefined) {
                this.korektPoIndex(value);
            }
            
            this._index = value;
           

            for (var i = 0; i < this.array.length; i++) {
                if (this._index == i) this.array[i].activ = true;
                else this.array[i].activ = false;
            }

        },
        get: function () {
            return this._index;
        }
    },
})







function BoxXZ(dCont, _x, _y, _fun, par) {
    DBox.call(this, dCont, _x, _y, _fun);
    this.type = 'BoxXZ';
    var self=this
    this.par = par;


    this.dragColorGal=function(){
        if(this.object.c!=undefined){                    
            
            if(this._color1 != this.object.c){
                this._color1 = this.object.c;
                this.panel.color1=this._color1;
                this.draw()
            }
        }else{
         
            if(this._color1 != this.par._color1){
                this._color1 = this.par._color1;
                this.panel.color1=this._color1;
                this.draw();
            }
        }
    }


    this.startLoad = function (_obj) {
        this.object = _obj;
        // var link=aGlaf.resursData+""+_obj.id+"/64.png"+aGlaf.plusLink
        var link= self.par.linkO + _obj.src



        
        this.dragColorGal()

       
        if(_obj.id!=undefined){
            this.label.visible=true
            this.label.text=_obj.id
            this.label.div.style.pointerEvents="none";
            this.label.fontSize=10;
        }
        
        
        this.image.visible = true;
        if (this.image.link == link) {
            if (self.funLoad) self.funLoad();
           
        } else {
            this.image.width = 100;
            this.image.height = 100;
            this.image.link = link;

        }
       
        this.draw();
    };

    this.draw = function () {
        ss = (this._width - this._otstup * 2) / this.image.picWidth;
        if (ss > (this._height - this._otstup * 2) / this.image.picHeight)ss = (this._height - this._otstup * 2) / this.image.picHeight;
        this.image.x = 0;
        this.image.width=this.image.picWidth*ss;
        this.image.height=this.image.picHeight*ss;

        this.image.x = (this._width - this.image.picWidth * ss) / 2;
        this.image.y = (this._height - this.image.picHeight * ss) / 2;

        this.label.x = 2//(this._width - this.label.curW) / 2;
        this.label.y = this._height - 11;

        if (this.postDraw) this.postDraw();
    };

}
BoxXZ.prototype = Object.create(DBox.prototype);
BoxXZ.prototype.constructor = BoxXZ;
