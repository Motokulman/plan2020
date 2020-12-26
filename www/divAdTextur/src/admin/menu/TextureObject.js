
class TextureObject {
    constructor(_dCont, name, _fun) {
        let self = this;
        this.type = 'TextureObject';

        this.dCont = _dCont
        this.name = name;
        this.fun = _fun;

        this.objDin = undefined

        this._width = _dCont._width;
        this.lineHeight = 32;
        this.margin = 4;

        this._height = 32;
        this._wh = 64;
        this.allWh = this._width - (this.margin * 3);

        this._active = true;

        this.window = new DCont(this.dCont, 0, 0, this.name);
        this.window.width = this._width - this.margin * 1;

        this.info = new DCont(this.window, 0, 0)
        this.info.y = -32+this.margin;
        this.info.width = this.allWh

        this.panel = new DPanel(this.info, this.margin, 0);
        this.panel.width = this.panel.height = this.allWh
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


        var check = []
        var n = this.margin;
        var boolXZ=["map",null,"alphaMap",null,"bumpMap",null,"normalMap",null,"displacementMap",null,"ligthMap",null,"aoMap",null,"emissiveMap",null]
        for (var i = 1; i < boolXZ.length; i+=2) {
                var c = new DCheckBox(this.info, n, yy, ' ', function () {
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

        this.titleInput.visible=false
        this.buttonSet .visible=false

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
            this.saveTime()
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

            this.saveTime()
        }


        this.info.visible = true;
        this._height = this.window.height = this.lineHeight * 4;


        this.openId=function(id){
            var obj={//то что посылаем через аякс на сервер, собственно тут сам запрос
                url: "https://alphakp.ru/api/texture/"+id,
                type: 'GET',
                success:function(e){
                   // f(e);
                    self.setObj(e)
                }
            }
            $.ajax(obj) 
        }

        this.save=function(){ 
            var obj={
                url: 'https://alphakp.ru/graphics/texture/'+self.objDin.id+'/set_texture',
                type: 'POST',
                data: {
                    json: JSON.stringify(self.object)
                },
                'cache': false,
                'async': false,
            }
            $.ajax(obj) 
        }

        this.sah=0
        this.saveTime=function(){
            this.sah++;
            var s=this.sah;
            setTimeout(function() {
                if(self.sah==s)self.save()
                    trace('(this.object)', (self.objDin.id))
            }, 500);
        } 
    }


    setObj(objDin) {
        this.objDin = objDin;
        console.warn('this.objDin', objDin)
        
        this.redraw();
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


    set visible(value) {
        if (this._visible == value) return;
        this._visible = value;
        if (value == true) {
            this.dCont.add(this.window)
        } else {
            this.dCont.remove(this.window)
        }
    }
    get visible() { return this._visible; }


    set height(v) {
        if (this._height == v) return;
        this._height = v;
    }
    get height() { return this._height; }
}
