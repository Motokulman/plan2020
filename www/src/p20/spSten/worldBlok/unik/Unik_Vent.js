import { PlaneXZ } from '../../../plus/PlaneXZ.js';
export class Unik_Vent {
	constructor(par) { 	
  		var self=this;
  		this.type="Unik_Vent";
        this.par = par;
        this.graphics=this.par.graphics
       
        this.par.planeXZ=new PlaneXZ();
        this.par.lineSegments.geometry=this.par.planeXZ    

        this.sizeLine = this.par.par._sizeLine

        this.arrayInfo=[ 
            {tipe:'DSliderBig', name: 'slider1', param: 'wh', title: 'wh', min: 1, max: 500, okrug: 10},
            {tipe:'DSliderBig', name: 'slider2', param: 'numHeight', title: 'numHeight', min: -3000, max: -1, okrug: 10},
            {tipe:'DCheckBox', name: 'check1', param: 'bool', title: 'bool'},
            {tipe:'DCheckBox', name: 'check2', param: 'bool1', title: 'bool1'},
            {tipe:'DCheckBox', name: 'check3', param: 'bool2', title: 'bool2'},
            {tipe:'DCheckBox', name: 'check4', param: 'bool3', title: 'bool3'},
        ];

        this._glavBool = true
        this._bool = false
        this._bool1 = true
        this._bool2 = false
        this._bool3 = false
        this._numHeight = -2000

        this._bottom = 110
        this._height = -3000
        this._wh=undefined;

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

        this.upStart=function(){
            this._delph = this.par._delph/2;   
            this._wh = this.par._width
            this._wh1 = this._bool == true ? this.par._width/2 : this.par._width

            wh = this._wh - this. sizeLine
            wh1 = this._wh1 - this. sizeLine

            whT = this._wh*0.9
            whT1 = this._wh1*0.9    

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
            this.setP( whT/2, bottom, -whT1/2, triangle); 
            this.setP(-whT/2, bottom, -whT1/2, triangle);  
            this.setP(-whT/2, bottom,  whT1/2, triangle); 

            // Башня
            sah=0
            this.setP( wh/2, bottom,  wh1/2, tower); 
            this.setP( wh/2, bottom,  this._delph, tower); 
            this.setP(-wh/2, bottom,  this._delph, tower); 
            this.setP(-wh/2, bottom,  wh1/2, tower); 

            // Стрелочка
            sah=0
            this.setP(  0, bottom,  this._delph*1.1, arrow); 
            this.setP( 50, bottom,  this._delph+100, arrow); 
            this.setP(-50, bottom,  this._delph+100, arrow); 
        }

        // Задаем высоту
        this.level=function(_s, p, p1){
            let s = {x: _s.x, y: _s.y, z: _s.z}
            if (p == 'bot') s.y = this._bottom
            if (p == 'mid') s.y = this._height/2
            if (p == 'top') s.y = this._height
            if (p == 'wallBot') s.y = this._numHeight          
            if (p == 'wallMid') s.y = this._numHeight - (this.wh/2)
            if (p == 'wallTop') s.y = this._numHeight - this.wh

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
            if (_position != undefined) a = this.level(a, _position)
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
            sah=this.array[_structures].length;
            sah1=0;
            this.graphics.beginFill(0xff2222, 0);
            this.graphics.lineStyle(this.sizeLine, 0x222222, 1);
            if (_structures == triangle) {
                this.graphics.lineStyle(0, 0x808080 , 1);
                this.graphics.beginFill(0x808080 , 1);
            }

            this.graphics.moveTo(this.array[_structures][1].x, this.array[_structures][1].z)
            for (var i = 0; i < sah+1; i++) {
                var p0=this.getP(_structures, _position)
                this.graphics.lineTo(p0.x, p0.z)
            }
            this.graphics.endFill()
        }


        this.drag3D=function(){
            this.par.planeXZ.clearPoint()
            if (this._bool1 == true) this.getStructures3D(triangle, undefined, undefined, 1, 1, 0 )
            if (this._bool2 == true) {
                this.getStructures3D(tower, 'wallBot', 'wallTop')
                this.getStructures3D(arrow, 'wallMid', 'wallMid', 1, 0, 0)
            }
            if (this._bool3 == true) this.getStructures3D(cube, 'wallBot', 'wallTop')
            if (this.glavBool == true) this.getStructures3D(cube)
            this.par.planeXZ.upDate()
        }

        var n;
        this.drag2D=function(){
            this.graphics.clear();
            this.graphics.beginFill(0x222222, 0.01);
            this.graphics.drawRect(-this.wh/2, -this._delph, this.wh, this._delph*2);
            this.graphics.endFill()

            if (this._bool3 == true) this.getStructures2D(cube, 'path')

            if (this._bool2 == true){
                this.getStructures2D(tower, n = this._bool3 == true ? 'path' : undefined)
                this.getStructures2D(arrow)
            }

            if (this._bool1 == true)this.getStructures2D(triangle)

            if (this.glavBool == true) this.getStructures2D(cube)



            this.par.stAct.draw1(-this.wh/2, -this._delph, this.wh, this._delph*2);
            this.graphics.endFill()
        }


        this.dragWHD=function(){
            this.upStart()
            this.drag2D()
            this.drag3D()

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

    set numHeight(value) {
        if(this._numHeight!=value){
            this._numHeight = value;
            this.par.dragWHD()
            this.par.par.render()
        }
    }    
    get numHeight() { return  this._numHeight;}

    set glavBool(value) {
        if(this._glavBool!=value){
            this._glavBool = value;
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
            this.par.dragWHD()
            this.par.par.render()
        }
    }    
    get bool1() { return  this._bool1;}

    set bool2(value) {
        if(this._bool2!=value){
            this._bool2 = value;
            this.par.dragWHD()
            this.par.par.render()
        }
    }    
    get bool2() { return  this._bool2;}

    set bool3(value) {
        if(this._bool3!=value){
            this._bool3 = value;
            this.par.dragWHD()
            this.par.par.render()
        }
    }    
    get bool3() { return  this._bool3;}
}

