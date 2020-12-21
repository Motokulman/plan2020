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
            // this.image1.link = this.par.gallery.arrayObj[this.index].src
            trace(  'this.par.gallery.arrayObj', this.par.gallery.arrayObj)

            yy = this.image1.width + this.par.margin
            for (var i = 0; i < 3; i++) {
                
                var b=new DButton(this.pan1, yy + (this.par.margin)+ww*i, this.par.margin, '', function(){
                    trace(this.idArr)
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


        // this.mSort=new MSort(this, this.w1);
        // this.mSort.dCont.y=287
        // this.mSort.visible=false


        this.comboSort = new DComboBox(this.w1.content, this.margin, this.margin, null, this.cSort)      
        this.comboSort.width = this.w1.width - (this.margin*3)


        this._width = 100;
        this._height = 100;

        let butOffset = 32;

        this.gallery = new GalleryN(this.w1.content, this.margin, (this.margin*2) + this.comboSort.height , () => {
            this.par.dragPic.testDrag(15, this.clik.bind(this), this.drag.bind(this));
        });
        this.gallery.width = this.w1.width - (this.margin*3);
        this.gallery.kolII = 4;
        this.gallery.widthPic = 46;
        this.gallery.heightPic = 46;
        this.gallery.visible = true


        let b;
        let ww = 28;

        // for (let i = 0; i < 4; i++) {
        //     b = new DButton(this.w, (this.margin + ww) * i + this.margin, this.margin, " ", this.down.bind(this, i));
        //     b.idArr = i;
        //     b.width = ww;
        //     b.height = ww;
        //     if (i == 0) b.text = "+";
        //     if (i == 1) b.text = "-";
        //     if (i == 2) b.text = "<";
        //     if (i == 3) b.text = ">";
        // }


        this.texture = new TextureObject(this.w, ' ', (objDin, reload, dontSave) => {
            if (objDin) {
                this.objectBase.textures[this.index] = objDin;
                aGlaf.s3d.pm.tex.updateTexture(objDin, reload);
                if (!dontSave) {
                    aGlaf.save();
                }
            }
            this.redragTime();
        });
        window.textureObject = this.texture;

        this.texture.window.y = butOffset;

        var aZZ=[]
        this.reDrag=function(){       
            var b=true
            trace("objArray",self.objArray)

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


        if(localS.object.sortTex==undefined)localS.object.sortTex=-2
        setTimeout(function() {self.sort = localS.object.sortTex;}, 10); 

        this.cSort=function(){
            trace(this)
            trace(self)
            // if (this.index != this.array.length-1){
            //     var lll = []
            //     for (var i = 0; i < self.objArray.length; i++) {
            //         if (self.objArray[i].texture_type == this.array[this.index]) lll.push(self.objArray[i])
            //     }
            //     self.gallery.start(lll);
            // } else {self.gallery.start(self.objArray)}
        }


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
        // this.par.dragPic.start(32, aGlaf.resursData + "" + dragObj.id + "/64.png", dragObj);
        this.par.dragPic.start(32, aGlaf.resursData + "" + dragObj.id + "/64.png", dragObj);
    }

    redragTime() {
        aGlaf.plusLink = "?x=" + Math.random();
        this.reDrag();
        setTimeout(function () {
            aGlaf.plusLink = '';
        }, 500);
    }

    /*reDrag() {
        this.gallery.start(this.objectBase.textures);
        this.texture.visible = !!this.gallery.array.length;
        this.gallery.index = this.index;
    }*/





    // down(butId) {

    //     if (butId == 0) {//создание
    //         this.creatMat();
    //     }

    //     if (butId == 1) {//Убиваем

    //         if (this.objDin != undefined) {

    //             function kill (){
    //                 var dir = '../' + aGlaf.resursData + selfTBD.objDin.id;
    //                 php.load({ tip: "removeDirRec", dir: dir }, e => {
    //                     var a = selfTBD.index;
    //                     var b = selfTBD.objectBase.textures.splice(a, 1);
    //                     aGlaf.save();
    //                     selfTBD.reDrag();
    //                     if(a>selfTBD.objectBase.textures.length-1)a=selfTBD.objectBase.textures.length-1;
    //                     selfTBD.index=a;
    //                 });

    //             }
    //             if(aGlaf.durak==false){
    //                 kill()
    //                 return
    //             }

    //             this.par.mInfo.setFun("Удаление обьекта", "Обьект будет удален из бд, не вычещаеться из дерева, и может привести к падениям, короче окуратно!!!",
    //                 () => {
    //                     kill()
                        
    //                 }
    //             );
    //         }
    //     }
    //     if (butId == 2) {//<<<<<<
    //         if (this.objDin != undefined) {
    //             var a = this.index;
    //             if (a > 0) {
    //                 var b = this.objectBase.textures.splice(a, 1);
    //                 this.objectBase.textures.splice(a - 1, 0, b[0])
    //                 aGlaf.save();
    //                 this.reDrag()
    //                 this.index = a - 1;
    //             }
    //         }
    //     }

    //     if (butId == 3) {//>>>>>>

    //         if (this.objDin != undefined) {
    //             var a = this.index;
    //             if (a < this.objectBase.textures.length - 1 && a != -1) {
    //                 var b = this.objectBase.textures.splice(a, 1);
    //                 this.objectBase.textures.splice(a + 1, 0, b[0])
    //                 aGlaf.save();
    //                 this.reDrag();
    //                 this.index = a + 1;
    //             }
    //         }
    //     }
    // }


    creatMat() {
        var id = "t_" + this.grtMaxPlus();

        function plus (_id){
            selfTBD.creatMatName(_id)

        }
        if(aGlaf.durak==false){
            plus(id);
            return;
        }

        this.par.mInfo.setFunInput(
            "Создание матерьяла",
            "Задаюм имя идишника матерьяла, если такой есть то он не срабоает",
            id,
            () => {
                plus(selfTBD.par.mInfo.text)   
            }
        );

    }

    creatMatName(name) {
        var b = true;
        let self = this;
        php.load({ tip: 'getDiractFiles', dir: '../' + aGlaf.resursData }, function (e) {
            var a = e.split(",");
            for (var i = 0; i < a.length; i++) {
                if (a[i] == name) {
                    b = false
                }
            }

            if (b == false) {
                self.par.mInfo.setFun("Такой иди есть!!", "Удалите его в начале", function () { })
            } else {
                var id = name;
                php.load({ tip: 'mkdir', dir: '../' + aGlaf.resursData + id }, function (e) {
                    
                    php.load({ tip: 'copy', dirWith: '../' + aGlaf.resurs + 'base/256.png', dir: '../' + aGlaf.resursData + id + '/pic.png' }, function (e) {
                    });

                    php.load({ tip: 'copy', dirWith: '../' + aGlaf.resurs + 'base/32.png', dir: '../' + aGlaf.resursData + id + '/32.png' }, function (e) {
                    });
                    php.load({ tip: 'copy', dirWith: '../' + aGlaf.resurs + 'base/100.png', dir: '../' + aGlaf.resursData + id + '/100.png' }, function (e) {
                    });
                    php.load({ tip: 'copy', dirWith: '../' + aGlaf.resurs + 'base/128.png', dir: '../' + aGlaf.resursData + id + '/128.png' }, function (e) {
                    });
                    php.load({ tip: 'copy', dirWith: '../' + aGlaf.resurs + 'base/256.png', dir: '../' + aGlaf.resursData + id + '/256.png' }, function (e) {
                    });

                    php.load({ tip: 'copy', dirWith: '../' + aGlaf.resurs + 'base/64.png', dir: '../' + aGlaf.resursData + id + '/64.png' }, function (e) {
                        let texture = {
                            id: id,
                            title: id.split('_')[1],
                            rx: 1,
                            ry: 1,
                            type: 'png',
                        };
                        self.objectBase.textures.unshift(texture);
                        aGlaf.save();
                        self.reDrag();
                        self._index = -1;
                        self.index = 0;
                    });
                });
            }
        });
    }

    grtMaxPlus() {
        var r = 0;
        var a = []
        for (var i = 0; i < this.objectBase.textures.length; i++) {
            a = this.objectBase.textures[i].id.split("_");
            if (a[1] * 1 > r) r = a[1] * 1;
        }
        r += 1;
        return r
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
            this.texture.setObj(this.objDin);

            this.mnXZ.init();
            this.mnXZ.index=value;
/*
            aGlaf.menu.menuVerh.bIn[0].text = this.gallery.array[0].object.id
            aGlaf.menu.menuVerh.bIn[1].text = this.gallery.array[1].object.id*/
           
        }
    }

    get index () {
        return this._index;
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

    get active () {
        return this._active;
    }


    set sort (value) {
        if(this._sort!=value){
            this._sort=value; 

            localS.object.sortTex=value
            localS.save()
            // this.mSort.sort=value; 
            this.reDrag()             
        }            
    }

    get sort () {
        return this._sort;
    }


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


       /* 

        //self.obj3d.material.map = self.par.pm.tex.getById(aGlaf.menu.dragPic.object.id);


       var bat=new DButton(this.panel,0,0,"",function(){

        })
        this.bat.width = this.bat.height =this.panel.width; 
        this.bat.alpha=0*/



        //this.par.dragPic.start(32, aGlaf.resursData + "" + dragObj.id + "/64.png", dragObj);

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
            self.objDin.rx = this.value;
            self.fun(self.objDin);
            self.textXZ()
        });

        this.ryInput = new DInput(this.info, 0, yy, "1", function () {
            self.objDin.ry = this.value;
            self.fun(self.objDin);
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
            self.objDin.px = this.value;
            self.fun(self.objDin);
            self.textXZ()
        });
        this.pyInput = new DInput(this.info, 0, yy, "1", function () {
            self.objDin.py = this.value;
            self.fun(self.objDin);
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
            self.objDin.wNa = this.value;
            self.fun(self.objDin);
            self.textXZ()
        });
        this.hNaInput = new DInput(this.info, 0, yy, "1000", function () {
            self.objDin.hNa = this.value;
            self.fun(self.objDin);
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



////////////////////////////

        // this.buttonDebug = new DButton(this.panel, 0, yy, "Debug");
        // this.buttonDebug.width =  this.panel.width - this.margin*2



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

        this.titleInput.visible=false
        this.buttonSet .visible=false


        var o, j, p;
        this.textXZ = function(){           
            let p = JSON.stringify(self.objDin)
            self.titleInput.value=p
        }  

        this.dragMenu = function(){    
             trace("dragMenu")

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

        
        this.redragParam=function(objDin){
            if (objDin.json != undefined) objDin.json =  JSON.parse(objDin.json)
            if (objDin.json != undefined) var e = objDin.json

            if (objDin == undefined) objDin = []
            if (objDin != undefined) objDin = e
            if (objDin.rx == undefined) objDin.rx = 1
            if (objDin.ry == undefined) objDin.ry = 1
            if (objDin.py == undefined) objDin.py = 1
            if (objDin.px == undefined) objDin.px = 1
            if (objDin.wNa == undefined) objDin.wNa = 1
            if (objDin.hNa == undefined) objDin.hNa = 1
            if (objDin.src == undefined) {
                objDin.src = objDin.src
                objDin.id = null
            }

            this.rxInput.value = objDin.rx;
            this.ryInput.value = objDin.ry;
            this.pxInput.value = objDin.px;
            this.pyInput.value = objDin.py;
            this.wNaInput.value = objDin.wNa;
            this.hNaInput.value = objDin.hNa;


            trace('this.objDin.json', objDin.json)
        }


        this.info.visible = true;
        this._height = this.window.height = this.lineHeight * 4;


    }

    setObj(objDin) {
        this.objDin = objDin;
        console.warn('this.objDin', objDin)
        
        this.redraw();
        // this.redragTextur();
        this.redragParam(objDin)
        this.textXZ();
        

    }

    redraw() {
        // let l= aGlaf.resursData + this.objDin.id + '/' + 'pic.' + this.objDin.type;
        let l = 'https://alphakp.ru' + this.objDin.src
        this.image._link = '';
        this.image.link = l;
    }

    async setResizedImage(width, height) {

        const type = this.image.link.split('.').pop();

        const img = await resizeImage(this.image.link, width, height, type);

        const resp = await uploadFile(img,  '../' + this.image.link);

        console.warn(resp)
        trace()
        trace('img', img)
        trace('this.image.link', this.image.link)




        if (resp === 'ok') {
            this.fun(this.objDin, true, true);
            this.redraw();

        }
    }

    async uploadImage(image) {
        trace('obj1image1', image)
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
        trace("@@@@@!!@@",dest); 
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

    trace('serverURL', serverURL)
    let data = new FormData();

    data.append('tip', 'saveFile');
    data.append('file', file);
    data.append('dest', dest);

    console.warn('>>>>>>>>>>>>>', dest)

    return $.ajax({
        url: serverURL,
        dataType: 'text',
        cache: false,
        contentType: false,
        processData: false,
        data: data,
        type: 'post',
        success: function function_name(data) {  
            trace(data)
        }
    });
}





function GalleryN(dCont, _x, _y, _fun) {
    DGallery.call(this, dCont, _x, _y, _fun);
               
    this.type="GalleryN";
    this.linkO='https://alphakp.ru'
   
    trace('GalleryN ')
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








/*















///////////////////////////////////////////////




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
            
            // // for (var i = 0; i < aGlaf.objectBase.textures.length; i++) {
                
            // //     var b=new DButton(this.dCont, this.par.widthBig+(this.par.margin*2)+ww*i, this.par.margin, aGlaf.objectBase.textures[i].id, function(){
            // //         trace(this.idArr)
            // //         self.par.index=this.idArr;

            // //         let a=php.ser.split("?");
            // //         history.pushState(null, null, a[0]+'?t='+self.par.gallery.array[this.idArr].object.id);

            // //     });
            // //     b.idArr=i;
            // //     b.width=ww-2;  
            // //     this.array.push(b);
            // // }







            /////////////////////////////////////





        this.reDrag=function(){       
            var b=true
            trace("objArray",self.objArray)
            this.gallery.start(self.objArray);
            this.texture.visible = !!this.gallery.array.length;


            if(this._sort==-1){
                this.gallery.start(self.objectBase.textures);
                b=false; 
            }
            if(this._sort==-2){
                aZZ=[];
                for (var i = 0; i < self.objectBase.textures.length; i++) {
                    if(self.objectBase.textures[i].sort==undefined)self.objectBase.textures[i].sort=-1;
                    if(self.objectBase.textures[i].sort==-1){
                        aZZ.push(self.objectBase.textures[i])
                    }
                }
                this.gallery.start(aZZ);            
                b=false; 
            }

            if(b==true){
                aZZ=[];
                for (var i = 0; i < self.objectBase.textures.length; i++) {
                    if(self.objectBase.textures[i].sort==undefined)self.objectBase.textures[i].sort=-1;
                    if(self.objectBase.textures[i].sort==this._sort){
                        aZZ.push(self.objectBase.textures[i])
                    }
                }
                this.gallery.start(aZZ);
            }
            this.texture.visible = !!this.gallery.array.length;
            
        }

        self.par.dragPic.addFunAp(function(){        
            // var num=self.mSort.testXY(self.par.dragPic._x, self.par.dragPic._y); 
            // if(num!=null){
            //     self.gallery.array[self.gallery.index].object.sort=num;
            //     self.reDrag()
            //     aGlaf.save();
            //     return
            // }       
        })

*/