import { PlaneXZ } from '../../../plus/PlaneXZ.js';
export class Unik_Vent {
	constructor(par) { 	
  		var self=this;
  		this.type="Unik_Vent";
        this.par = par;
        this.graphics=this.par.graphics
       
        this.par.planeXZ=new PlaneXZ();
        this.par.lineSegments.geometry=this.par.planeXZ    

        this._delph = this.par._delph/2;   
        this._wh = this.par._width
        this._wh1 = this._bool == true ? this.par._width/2 : this.par._width

        this._glavBool = true
        this._bool = false
        this._bool1 = false
        this._bool2 = false
        this._bool3 = false
        this._numHeightGlav = 200;
        this._numHeight= -200;

        this._bottom = 0;
        this._height = 300;
        this._height1 = 100;
        this._wh=this.par._width;
        this.wh_but = (200-(2*4))/4

        this.arrayInfo=[ 
            {tipe:'DCheckBox', name: 'check1', param: 'bool', title: '', width:this.wh_but, height:this.wh_but, color1:"#008CBA", link0: "resources/image/unikVent_0_0.png", link1: "resources/image/unikVent_0_1.png", activMouse: true },
            {tipe:'DCheckBox', name: 'check4', param: 'bool3', title: '', width:this.wh_but, height:this.wh_but, color1:"#008CBA", link0: "resources/image/unikVent_3_0.png", link1: "resources/image/unikVent_3_1.png", activMouse: true, _param:{boolX:true}},
            {tipe:'DCheckBox', name: 'check2', param: 'bool1', title: '', width:this.wh_but, height:this.wh_but, color1:"#008CBA", link0: "resources/image/unikVent_1_0.png", link1: "resources/image/unikVent_1_1.png", activMouse: true, _param:{boolX:true}},
            {tipe:'DCheckBox', name: 'check3', param: 'bool2', title: '', width:this.wh_but, height:this.wh_but, color1:"#008CBA", link0: "resources/image/unikVent_2_0.png", link1: "resources/image/unikVent_2_1.png", activMouse: true,  _param:{boolX:true}},
            {tipe:'DSliderBig', name: 'slider1', param: 'wh', title: 'wh', min: 1, max: this._delph, okrug: 10, activMouse: true},
            {tipe:'DSliderBig', name: 'slider2', param: 'numHeightGlav', title: 'numHeight', min: self._height1, max: self._height-self._wh, okrug: 10, activMouse: true},
        ];



        this.t3D = new Tr3D(this)






        var sah=0;
        var sah1=0;

        var cube = 0;
        var triangle = 1;
        var tower = 2;
        var arrow = 3;
        var wh, wh1, whT, whT1, height, bottom;

        var i = 0
        this.getSize=function(){
            if (this._bool == true) {
                this.par._width = this.par._width *2           
                this._wh = this.par._width
                this._wh1 = this.par._width /2
            }
            if (this._bool != true) {
                this.par._width = this.par._width /2            
                this._wh = this.par._width
                this._wh1 = this.par._width
            }
            this.korWit()
        }

        this.array = [[],[],[],[]]
        this.setP=function(x,y,z, _form){
            var form = _form
            if(this.array[form][sah]===undefined)this.array[form][sah]=new THREE.Vector3();
            if(x!=undefined)this.array[form][sah].set(x,y,z)
            sah++
        }

        // задаем начальные точки
        this.upStart=function(){
           
            this.control()
          
            this._delph = this.par._delph/2;   
            this._wh = this.par._width
         
            this._wh1 = this._bool == true ? this.par._width/2 : this.par._width

            this.sizeLine = this.par.par._sizeLine

            wh = this._wh - this. sizeLine
            wh1 = this._wh1 - this. sizeLine

            whT = this._wh
            whT1 = this._wh1

            height = this._height
            bottom = this._bottom

            // куб
            sah=0
            this.setP( wh/2, bottom,  wh1/2, cube); 
            this.setP( wh/2, bottom, -wh1/2, cube); 
            this.setP(-wh/2, bottom, -wh1/2, cube);  
            this.setP(-wh/2, bottom,  wh1/2, cube); 

            // Треугольник
            sah=0
            this.setP( wh/2, bottom,  wh1/2, triangle); 
            this.setP( wh/2, bottom, -wh1/2, triangle); 
            this.setP(-wh/2, bottom, -wh1/2, triangle);  
            // this.setP(-whT/2, bottom,  whT1/2, triangle); 

            // Башня
            sah=0
            this.setP( wh/2, bottom,  wh1/2, tower); 
            this.setP( wh/2, bottom,  this._delph, tower); 
            this.setP(-wh/2, bottom,  this._delph, tower); 
            this.setP(-wh/2, bottom,  wh1/2, tower); 

            // Стрелочка
            sah=0
            this.setP(  0, bottom,  this._delph*1.1, arrow); 
            this.setP( wh1/4, bottom,  this._delph+(wh1/2), arrow); 
            this.setP(-wh1/4, bottom,  this._delph+(wh1/2), arrow); 
        }

        // Задаем высоту
        this.level=function(_s, p, p1){
            let s = {x: _s.x, y: _s.y, z: -_s.z}

            if (p == 'bot') s.y = this._bottom
            if (p == 'mid') s.y = this._height/2
            if (p == 'top') s.y = this._height
                
            if (p == 'wallBot') s.y = this._numHeight 
            if (p == 'wallMid') s.y = this._numHeight - (this.wh/4)
            if (p == 'wallTop') s.y = this.bool == true ? this._numHeight - (this.wh/2) : this._numHeight - (this.wh)

            if (p == 'wallBot' && p1 == cube || p == 'wallTop' && p1 == cube) if (s.z == wh1/2) s.z = this._delph
            if (p == 'wallBot' && p1 == cube || p == 'wallTop' && p1 == cube) if (s.z == -wh1/2) s.z = -this._delph

            if (p == 'path') s.z = s.z > 0 ? this._delph : -this._delph
            return s
        }


        // Получаем точку из массива
        var a;
        this.getP=function(_form, _position){
            let form = _form
            if(this.array[form][sah1]!=undefined){
                a = this.array[form][sah1]
            } else {
                sah1 = 0
                a = this.array[form][sah1]
            }
            sah1++

            // Задаем высоту
            if (_position != undefined) a = this.level(a, _position, form)
            return a
        }

        
        // Отрисовываем объект в 3D
        this.getStructures3D=function(_structures, _position, _position1, _bool, _bool1, _bool2){
            sah=4;
            sah1=0;

            let position = _position != undefined ? _position : 'bot'
            let position1 = _position1 != undefined ? _position1 : 'top'

            if (_bool != false ){
                for (var i = 0; i < sah; i++) {
                    sah1--
                    var p0=this.getP(_structures, position)
                    var p1=this.getP(_structures, position)
                    this.par.planeXZ.addLine(p0, p1)
                }
            }

            if (_bool1 != false ){
                for (var i = 0; i < sah; i++) {
                    sah1--
                    var p0=this.getP(_structures, position1)
                    var p1=this.getP(_structures, position1)
                    this.par.planeXZ.addLine(p0, p1)
                }
            }

            if (_bool2 != false ){
                for (var i = 0; i < sah; i++) {
                    var p0=this.getP(_structures, position)
                    sah1--
                    var p1=this.getP(_structures, position1)
                    this.par.planeXZ.addLine(p0, p1)
                }
            }
        }


        // Отрисовываем объект в 2D
        this.getStructures2D=function(_structures, _position){
            sah=this.array[_structures].length+1;
            sah1=0;
            this.graphics.beginFill(0xff2222, 0);
            this.graphics.lineStyle(this.sizeLine, 0x222222, 1);
            if (_structures == triangle) {
                this.graphics.lineStyle(0, 0x808080 , 1);
                this.graphics.beginFill(0x808080 , 1);
            }

            this.graphics.moveTo(this.array[_structures][0].x, this.array[_structures][0].z)
            for (var i = 0; i < sah+2; i++) {
                var p0=this.getP(_structures, _position)
                this.graphics.lineTo(p0.x, p0.z)
            }
            this.graphics.endFill()
        }


        // Задаем что нужно отрисовать в 3D
        this.drag3D=function(){
            this.par.planeXZ.clearPoint()

            if (this._bool3 == true) this.getStructures3D(cube, 'wallBot', 'wallTop')

            if (this._bool3 != true) {
                if (this._bool1 == true) this.getStructures3D(triangle, undefined, undefined, 1, 1, 0 )
                if (this._bool2 == true) {
                    this.getStructures3D(tower, 'wallBot', 'wallTop')
                    this.getStructures3D(arrow, 'wallMid', 'wallMid', 1, 0, 0)
                }
                if (this.glavBool == true) this.getStructures3D(cube)
            }

            this.par.planeXZ.upDate()
        }


        // Задаем что нужно отрисовать в 2D
        this.drag2D=function(){
            let n;
            this.graphics.clear();
            this.par.stAct.clear()

            if (this._bool3 == true) this.getStructures2D(cube, 'path')

            if (this._bool3 != true) {
                if (this._bool1 == true)this.getStructures2D(triangle)
                if (this._bool2 == true){
                    this.getStructures2D(tower, n = this._bool3 == true ? 'path' : undefined)
                    this.getStructures2D(arrow)
                    this.par.stAct.drawTriangle(0, this._delph*1.1, this._wh1/4, this._delph+(this._wh1/2), -this._wh1/4, this._delph+(this._wh1/2));
                }
                if (this.glavBool == true) this.getStructures2D(cube)
            }

            this.par.stAct.drawRect1(-this.wh/2, -this._delph, this.wh, this._delph*2);

            this.graphics.endFill()
        }


        this.dragWHD=function(){
            this.upStart()
            this.drag2D()
            this.drag3D()
            this.ddddd()

        }    


        this.setObj=function(o){
            if(o==undefined)return
            this.par.dragWHD();
            this.korWit();
        }


        this.getObj=function(){
            var o={}
            return  o
        }

        this.korWit=function(){           
            this.par.rect.x=-this.par._width/2;
            this.par.rect.x1=this.par._width/2;
            this.par.rect.w=this.par._width;
            this.par.shape.setRect(this.par.rect);
            this.par.setReal(this.par._x,this.par._y,this.par._z);
        }



        this.par.redrahHHH=function(){ 
            if(self.par.parent!=undefined){
                self._height=-(self.par.parent._height+self.par.parent._height1)
                self._height1=-(self.par.parent._height1)
                // self._delph=-(self.par.parent._delph)
                self.par.dragWHD()
            }
        }


        this.postParent=function (){            
            if(this.par.parent!=undefined){
                this.par.redrahHHH()
                
            }
        }

        this.control=function (){

                for (var i = 0; i <  this.arrayInfo.length; i++) {
                    let rrr = this.arrayInfo[i].param
                    if (rrr == 'numHeightGlav') {
                        this.arrayInfo[i].min = Math.abs(this._height1)
                        if (this.numHeightGlav < this.arrayInfo[i].min) this.numHeightGlav = this.arrayInfo[i].min
                    }

                    if (rrr == 'numHeightGlav') {
                        this.arrayInfo[i].max = Math.abs(this._height)-this._wh
                        if (this.numHeightGlav > this.arrayInfo[i].max) this.numHeightGlav = this.arrayInfo[i].max
                    }

                    if (rrr == 'wh') {
                        this.arrayInfo[i].max = Math.abs(this._delph)
                        if (this.wh > this.arrayInfo[i].max) this.wh = this.par._width
                    }
                }
        }

        var e;  
        this.ddddd=function(){
            for (var i = 0; i < this.arrayInfo.length; i++) {
                if(this.bool2 != true && this._bool3 != true) {
                    if (this.arrayInfo[i].param == 'numHeightGlav') this.arrayInfo[i].activMouse = false
                    if(this.bool3 != true) if (this.arrayInfo[i].param == 'bool1') this.arrayInfo[i].activMouse = true
                    if(this.bool3 != true) if (this.arrayInfo[i].param == 'bool2') this.arrayInfo[i].activMouse = true

                } else {
                    if(this.bool3 == true) {
                        if (this.arrayInfo[i].param == 'bool1') this.arrayInfo[i].activMouse = false
                        if (this.arrayInfo[i].param == 'bool2') this.arrayInfo[i].activMouse = false
                    } else {
                        if (this.arrayInfo[i].param == 'bool1') this.arrayInfo[i].activMouse = true
                        if (this.arrayInfo[i].param == 'bool2') this.arrayInfo[i].activMouse = true
                    }

                    if (this.arrayInfo[i].param == 'numHeightGlav') this.arrayInfo[i].activMouse = true
                }
            }
            
            this.control()
        }


        
        
        this.t3D.setGrani()

        // this.drawVerg= function () {
        //     this.vergLittel.setGrani(this.arrGrani[0],this.arrGrani[1]);
        // }

	}

    set wh(value) {
        if(this._wh!=value){
            this.par._width = value;
            this._wh1 = value;
            this._wh = value;

            if(this.korWit)this.korWit()
            this.par.dragWHD()
            this.par.par.render()
        }
    }    
    get wh() { return  this._wh;}

    set numHeightGlav(value) {
        if(this._numHeightGlav!=value){
            this._numHeightGlav = value;
            this._numHeight= -value;
            // this.ddddd()
            this.par.dragWHD()
            this.par.par.render()
        }
    }    
    get numHeightGlav() { return  this._numHeightGlav;}

    set glavBool(value) {
        if(this._glavBool!=value){
            this._glavBool = value;

            // this.ddddd()
            this.par.dragWHD()
            this.par.par.render()
        }
    }    
    get glavBool() { return  this._glavBool;}

    set bool(value) {
        if(this._bool!=value){
            this._bool = value;
            this.getSize()

            if(this.korWit)this.korWit()
            this.par.dragWHD()
            this.par.par.render()
        }
    }    
    get bool() { return  this._bool;}


    set bool1(value) {
        if(this._bool1!=value){
            this._bool1 = value;
            // this.ddddd()
            this.par.dragWHD()
            this.par.par.render()
        }
    }    
    get bool1() { return  this._bool1;}

    set bool2(value) {
        if(this._bool2!=value){
            this._bool2 = value;
            // this.ddddd()
            this.par.dragWHD()
            this.par.par.render()
        }
    }    
    get bool2() { return  this._bool2;}

    set bool3(value) {
        if(this._bool3!=value){
            this._bool3 = value;
            // this.ddddd()
            this.par.dragWHD()
            this.par.par.render()
        }
    }    
    get bool3() { return  this._bool3;}
}






export class Tr3D {
    constructor(par) {  
        var self=this;
        this.type="tr3D";
        this.par = par;
        this.geometry=new PlaneXZ();    
        this.rendSahTextur=0;

        this.texture = new THREE.TextureLoader().load('resources/image/pic.png');  
        this.texture.wrapS = THREE.RepeatWrapping;
        this.texture.wrapT = THREE.RepeatWrapping;
        this.texture.repeat.y=-1
        this._material=new THREE.MeshBasicMaterial( {color: 0xffffff, map:this.texture } )
        
        this.mesh=new THREE.Mesh(this.geometry,this._material)

        this.par.par.cont3d.add(this.mesh)

       // this.normalPosit=new THREE.Vector3(0,1,0)


        var arr= {x:1, y:1, z:1}
        var arr1= {x:0, y:0, z:0}
        var arr2= {x:3, y:3, z:3}

        this.setGrani=function(){         
            this.geometry.clear()

            var r=33
            var r1=2
            var r2=1
            for (var i = 0; i < 400; i++) {
                this.geometry.addTri(
                    new THREE.Vector3(Math.random()*r-r/2,Math.random()*r-r/2,Math.random()*r-r/2),
                    new THREE.Vector3(Math.random()*r-r/2,Math.random()*r-r/2,Math.random()*r-r/2),
                    new THREE.Vector3(Math.random()*r-r/2,Math.random()*r-r/2,Math.random()*r-r/2),

                    new THREE.Vector3(Math.random()*r1-r1/2,Math.random()*r1-r1/2,Math.random()*r1-r1/2),
                    new THREE.Vector3(Math.random()*r1-r1/2,Math.random()*r1-r1/2,Math.random()*r1-r1/2),
                    new THREE.Vector3(Math.random()*r1-r1/2,Math.random()*r1-r1/2,Math.random()*r1-r1/2),

                    new THREE.Vector2(Math.random()*r2,Math.random()*r2),
                    new THREE.Vector2(Math.random()*r2,Math.random()*r2)

                    )
               /* this.geometry.addTri(arr-i,arr1,arr2)
                this.geometry.addTri(arr2+i,arr1,arr)*/
            }

            this.geometry.redrag(true)
        }       
    }
}