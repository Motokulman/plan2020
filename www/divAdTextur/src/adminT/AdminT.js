

import { TextureBD } from './TextureBD.js';
import { TexturePhoto } from './TexturePhoto.js';
import { MVisi3D } from './visi3D/MVisi3D.js';
import { SceneSB } from './visi3D/SceneSB.js';

export class AdminT {    
    constructor() {
    	this.type="AdminT";
    	var self=this;
        this.whv = 62;
        this.otstup = 2
        this.linkO = 'https://alphakp.ru'

        // this._activeGallery = false
        this.param={}
        this.param.bool=false;
        this.localStorage = new LocalStorage(null, "toty5");
        for(var i in self.localStorage.object){
            if(this.param[i]!=undefined)this.param[i]=self.localStorage.object[i]
        }
        this._activeGallery = this.param.bool

        window.dcmParam = new DCM();   

        this.dCont = new DCont(document.body);

        this.div= document.createElement('div');
        this.div.style.position = 'fixed';
        this.div.style.top = '0px';
        this.div.style.left = '0px';

        //порезаный от пикси вювер
        this.visi3D = new MVisi3D(this.div, null, false, true, false, true, false);     

        var loader = new THREE.TextureLoader();
        this.texture = loader.load(null)
        this.texture.wrapS = THREE.RepeatWrapping;
        this.texture.wrapT = THREE.RepeatWrapping;
      
        var o='{"ambient":{"works":true,"active":true,"color":"#fdffff","intensity":0.71},"shadow":{"works":true,"active":true,"mapSize":4096,"color":"#8c8c8c","bias":-0.0014,"intensity":1.01,"radius":1.27,"bAlphaForCoating":false,"fixation":true,"rotationX":0.93,"rotationZ":0.73,"distance":500,"cubWidth":1000,"cubHeight":1000,"distanceUpdateShadow":65.41},"sky":{"works":true,"active":true,"color":"#ffffff","link":"resources/image/sky.jpg","rotZ":2.73,"radius":40000,"x":0,"y":0,"z":0},"mirror":{"works":true,"link":"null","exposure":1.44,"gamma":2.87,"xz":"reflect","link1":"null","exposure1":-1,"gamma1":-1},"visi3D":{"works":true,"alwaysRender":false,"fov":40,"far":77175,"minZum":0,"maxZum":3090,"zume":250,"minRotationX":3.14,"maxRotationX":0,"rotationX":0.94,"rotationZ":0.17,"debug":true,"isDragPan":false,"alphaAd":false,"globZ":0,"powerZum":1},"fog":{"works":true,"active":false,"color":"#ffffff","near":0,"far":0},"effect":{"works":true,"active":false,"edgeStrength":3,"edgeGlow":0,"pulsePeriod":0,"linkTextur":"null","visibleEdgeColor":"#ffffff","hiddenEdgeColor":"#190a05"}}'
        var scene=JSON.parse(o); 
        this.sceneSB=new SceneSB(this.visi3D);
        for (var i = 0; i <  this.sceneSB.array.length; i++) {
            if (scene[this.sceneSB.array[i].name] === undefined) {
                scene[this.sceneSB.array[i].name] = {};                
            }            
            this.sceneSB.array[i].setBasa(scene[this.sceneSB.array[i].name]);
        }
        this.visi3D.isDragPan=true;


        this.material =  new THREE.MeshBasicMaterial({color:0xffffff});
        this.mash = new THREE.Mesh(new THREE.SphereGeometry(50, 32, 32), this.material);
        self.visi3D.objShadow(this.mash,true)
        self.visi3D.groupObject.add(this.mash)

        this.textureBD=new TextureBD(this,function(s,p,p1){
            if (s === 'novaTexeur') {
                self.material.map=p;
            }
            if (s === 'renderMat') {
                self.material.needsUpdate=true
            }
            if (s === 'novaTexeurBig') {
                self.material[p] = p1
                self.material.needsUpdate=true
            }
            self.visi3D.intRend=1
        })

        this.panel=new DPanel(this.dCont,this.otstup,this.otstup)
        this.but= new DButton(this.panel.content,this.otstup,this.otstup, 'Lib', function(){
                self.activeGallery = self.activeGallery == false ? true : false;
                this.alpha = self.activeGallery == false ? 1 : 0.5;

                self.localStorage.object.bool = self.activeGallery
                self.localStorage.save();

                self.sizeWindow()
            })

        this.window=new DWindow(this.dCont,300, 0,"3d")
        this.window.width=300
        this.window.height=300

        this.window.dragBool = false;
        this.window.hasMinimizeButton = false;

        this.window.content.div.appendChild(this.div)
        this.visi3D.sizeWindow(0,0,this.window.width,this.window.height);

        this.tick = function () {
            TWEEN.update();
            self.visi3D.upDate();            
            requestAnimationFrame(self.tick );          
        }
        this.tick()

        self.visi3D.intRend=1

        this.aa = new TexturePhoto(this.div, this.visi3D, 10, 10)

        this.sizeWindow = function(w,h){  
            var w = document.documentElement.clientWidth;
            var h = document.documentElement.clientHeight;

            this.textureBD.sizeWindow(w, h)

            this.panel.x = this.otstup
            this.panel.y = this.otstup
            this.panel.width = w - (this.otstup*2)
            this.panel.height = this.whv - (this.otstup*2)

            this.but.height = this.panel.height - (this.otstup*4)
            this.but.width = this.but.height 

            this.window.x = this.textureBD.width+this.otstup
            this.window.y = this.whv 
            this.window.width = w - this.textureBD.width - (this.otstup*3)
            this.window.height = h - this.whv - (this.otstup)

            this.visi3D.sizeWindow(0, 0,  this.window.width, this.window.height - 32);
        }
    }

    set activeGallery (value) {
        if (this._activeGallery != value) {
            this._activeGallery = value;
            this.textureBD.activeGallery=value
        }           
    }
    get activeGallery () { return this._activeGallery; }
}  




export function LocalStorage(fun,_key) {
    this.fun = fun;
    var self = this;
    this.object;
    this.key = _key||'shirt';
    this.object; // тут храняться все данные с localStorage
    var b;
    // инициализация localStorage
    this.initLoad=function() {
        b=true;
        this.object = window.localStorage[this.key];
        if(this.object == "undefined")b=false;
        if(this.object == undefined)b=false;
        
        // проверка пуст ли  localStorage
        if(b == false) {
            this.object = this.getStartObj(); // если localStorage пуст, записываем обьект с функции getStartObj
        }else {
            this.object = jQuery.parseJSON(this.object); // если localStorage не пуст записываем содержимое предварительно
        }   
        if(this.fun)self.fun();
    }
    
    // если localStorage пуст, записываем обьект
    this.getStartObj = function() {
        var obj = {
            activ:false,
            dubag:false,
            menu:{},
            xz:{}
        };
        return obj;
    }

    // сохраняем в localStorage данные
    this.save = function() {        
        window.localStorage[this.key] = JSON.stringify(self.object);
    }

    // сохраняем в localStorage данные
    this.clear = function() {
        window.localStorage[this.key] = undefined;
    }
    self.initLoad();
}



