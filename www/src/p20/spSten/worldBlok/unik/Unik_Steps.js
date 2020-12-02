import { PlaneXZ } from '../../../plus/PlaneXZ.js';
export class Unik_Steps {
	constructor(par) { 	
  		var self=this;
  		this.type="Unik_Steps";
        this.par = par;
        this.graphics=this.par.graphics
       
        this.par.planeXZ=new PlaneXZ();
        this.par.lineSegments.geometry=this.par.planeXZ    

        this.sizeLine = this.par.par._sizeLine

        this.arrayInfo=[ 
            {tipe:'DSliderBig', name: 'slider1', param: 'w', title: 'width', min: 1, max: 5000, okrug: 10},
            {tipe:'DSliderBig', name: 'slider2', param: 'h', title: 'height', min: 1, max: 5000, okrug: 10},
            // {tipe:'DSliderBig', name: 'slider3', param: 'd', title: 'delph', min: 1, max: 5000, okrug: 10},
            // {tipe:'DSliderBig', name: 'slider4', param: 'height1', title: 'height1', min: 1, max: 5000, okrug: 10},
        ];

        this._w = 1000
        this._h = 1000
        this._d = 500
        this._height1 = 500

        var kolH = 150 
        var kolW = 500 

        var sah1=0;
        var sah=0;

        this.arrP = []
        this.getPoint=function(){
            if(this.arrP[sah1]===undefined)this.arrP[sah1]=new THREE.Vector3();
            return this.arrP[sah1]
        }

        this.array = []
        this.setP=function(x,y,z){
            if(this.array[sah]===undefined)this.array[sah]=new THREE.Vector3();
            if(x!=undefined)this.array[sah].set(x,y,z)
            sah++
        }
       
        this.array = []
        var ww,hh,dd, ddd
        this.upStart=function(){
            sah=0
            ww=this.par._width-this.sizeLine
            hh=this.par._height
            dd=this.par._delph

            var _ww=kolW;
            this.step = Math.floor(this._height1/kolH)           
            

            if((this.step)*kolW>hh){
                this.setP(0, kolH, hh+dd/2); 
                var xz=1
                var ii
                var b=false
                for (var i = kolH*2; i < this._height1; i+=kolH) {
                    ii=hh-xz*kolW+dd/2
                    
                    if(ii<dd/2){
                        this.setP(0, i, dd/2 );
                        b=i
                        break
                    }
                    this.setP(0, i, hh-xz*kolW+dd/2); 
                    xz++    
                }
                if(b==false){
                    this.setP(0, i-kolH, dd/2);
                }
            }else{
                var _hh1=(this.step)*kolW;      
                var _hh2=hh-_hh1+dd/2
                this.setP(0,this._height1,dd/2);
                this.setP(0,this._height1,_hh2); 

                for (var i = 0; i < this.step; i++) {
                    this.setP(0, this._height1-kolH*(i+1), _hh2+(i+1)*kolW);
                }
            }

            for (var i = 1; i < this.array.length; i++) {
                for (var j = 0; j < i; j++) {
                    if (this.array[i].z < this.array[j].z){
                        var pp = this.array[i]
                        this.array[i] = this.array[j]
                        this.array[j] = pp
                    }

                }
            }
            return
        }


        this.drag3D=function(){
           sah1=0;
            this.par.planeXZ.clearPoint()

            for (var i = 0; i < sah; i++) {
                var p0=this.getPoint()
                p0.set(this.array[i].x-(ww/2), -this.array[i].y, -this.array[i].z );
                sah1++; 

                var p1=this.getPoint()
                p1.set(this.array[i].x+(ww/2), -this.array[i].y, -this.array[i].z );
                sah1++; 

                var p2=this.getPoint()
                if (this.array[i-1])p2.set(this.array[i].x-(ww/2), -this.array[i-1].y, -this.array[i].z);
                else p2.set(this.array[i].x-(ww/2), -this.array[i].y, -this.array[i].z);
                sah1++;

                var p3=this.getPoint()
                if (this.array[i-1])p3.set(this.array[i].x+(ww/2), -this.array[i-1].y, -this.array[i].z);
                else p3.set(this.array[i].x+(ww/2), -this.array[i].y, -this.array[i].z);
                sah1++; 

                this.par.planeXZ.addLine(p2, p3)
                this.par.planeXZ.addLine(p0, p1)

                if (i>0 && i < sah){
                    this.par.planeXZ.addLine(this.arrP[sah1-2], p0)
                    this.par.planeXZ.addLine(p1, this.arrP[sah1-1])

                    this.par.planeXZ.addLine(this.arrP[sah1-7], p3)
                    this.par.planeXZ.addLine(this.arrP[sah1-8], p2)
                }
                

            }

            this.par.planeXZ.addLine({x:this.arrP[0].x, y:this.arrP[sah1-3].y, z:this.arrP[0].z}, {x:this.arrP[1].x, y:this.arrP[sah1-3].y, z:this.arrP[1].z})

            this.par.planeXZ.addLine({x:this.arrP[0].x, y:this.arrP[sah1-3].y, z:this.arrP[0].z}, {x:this.arrP[0].x, y:this.arrP[0].y, z:this.arrP[0].z})
            this.par.planeXZ.addLine({x:this.arrP[0].x, y:this.arrP[sah1-3].y, z:this.arrP[0].z}, {x:this.arrP[0].x, y:this.arrP[sah1-3].y, z:this.arrP[sah1-3].z})

            this.par.planeXZ.addLine({x:this.arrP[1].x, y:this.arrP[sah1-3].y, z:this.arrP[1].z}, {x:this.arrP[1].x, y:this.arrP[1].y, z:this.arrP[1].z})
            this.par.planeXZ.addLine({x:this.arrP[1].x, y:this.arrP[sah1-3].y, z:this.arrP[1].z}, {x:this.arrP[sah1-3].x, y:this.arrP[sah1-3].y, z:this.arrP[sah1-3].z})

            this.par.planeXZ.upDate()
        }



        this.drag2D=function(){
            sah1=0;
            this.graphics.clear();

            this.graphics.beginFill(0xffffff, 0.2);
            this.graphics.drawRect(-ww/2, -dd/2, ww, hh+dd);


            //this.graphics.drawRect(0, dd/2, this._height1, hh);  
            this.graphics.lineStyle(10, 0x000000, 1);  
            for (var i = 0; i < sah; i++) {

                // this.graphics.drawRect(this.array[i].y, this.array[i].z,50+i*20,50+i*20)
                // this.graphics.drawRect(this.array[i].x+3000, this.array[i].y,50+i*20,50+i*20)



                var p0=this.getPoint()
                p0.set(this.array[i].x-(ww/2), this.array[i].y, this.array[i].z );
                sah1++; 

                var p1=this.getPoint()
                p1.set(this.array[i].x+(ww/2), this.array[i].y, this.array[i].z );
                sah1++; 

                this.graphics.moveTo(p0.x, p0.z)
                this.graphics.lineTo(p1.x, p1.z)

                 if (i>0){
                    this.graphics.moveTo(this.arrP[sah1-4].x, this.arrP[sah1-4].z)
                    this.graphics.lineTo(p0.x, p0.z)

                    this.graphics.moveTo(p1.x, p1.z)
                    this.graphics.lineTo(this.arrP[sah1-3].x, this.arrP[sah1-3].z)
                }
                
            }

            this.par.stAct.draw1(-ww/2, -dd/2, ww, hh+dd)


            this.graphics.endFill()
        }


        this.dragWHD=function(){
            this.upStart()//Создет точки для отрисовки
            this.drag3D()
            this.drag2D()
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


    set height1(value) {
        if(this._height1!=value){
            this._height1 = value;
            this.par.dragWHD()
            this.par.par.render()
        }
    }    
    get height1() { return  this._height1;}


    set w(value) {
        if(this._w!=value){
            this._w = value;
            this.par._width= value;
            if(this.korWit)this.korWit()
          	this.par.dragWHD()
          	this.par.par.render()
        }
    }    
    get w() { return  this._w;}


    set h(value) {
        if(this._h!=value){
            this._h = value;
            this.par._height= value;
          	this.par.dragWHD()
			this.par.par.render()
        }
    }    
    get h() { return  this._h;}


    set d(value) {
        if(this._d!=value){
            this.par._delph = value;
            this.par.dragWHD()
            this.par.par.render()
        }
    }    
    get d() { return  this._d;}
}

/*
        this.postParent=function(){
            if(this.par.parent==undefined){
            
            }
        }


        // this.upStartOld=function(){
        //     sah=0
        //     this.step = Math.round(this._height1/this.stepheight1)
        //     this.delph = this.par._delph/2
        //     this.par.planeXZ.clearPoint()

        //     for (var i = 0; i < this.step; i++) {
        //         let d = (this.stepheight1*(this.step-(i+1)))
        //         let dd = (this.stepheight1*(this.step-(i)))

        //         let h = this.stepHeight*(this.step-i)
        //         let hh = this.stepHeight*(this.step-i)

        //         if(this.array[sah]===undefined)this.array[sah]=new THREE.Vector3();
        //         this.array[sah].set(0, -this._height1+dd, this.delph+hh);
        //         if (i == 0)this.array[sah].set(0, 0, this.delph+hh);
        //         sah++;

        //         if(this.array[sah]===undefined)this.array[sah]=new THREE.Vector3();
        //         this.array[sah].set(0, -this._height1+d, this.delph+h);
        //         sah++;
        //     }

        //     if(this.array[sah]===undefined)this.array[sah]=new THREE.Vector3();
        //     this.array[sah].set(0, -this._height1, this.delph);
        //     sah++;

        //     if(this.array[sah]===undefined)this.array[sah]=new THREE.Vector3();
        //     this.array[sah].set(0, 0, this.delph);
        //     sah++;

        //     if(this.array[sah]===undefined)this.array[sah]=new THREE.Vector3();
        //     this.array[sah].set(0, 0, this.delph+this.height);
        //     sah++;
        // }





var defolt={width:1000, height:1000, delph:1000, step:4, bool:false, bool1:true, bool2:false}
       this.clearDefolt=function(){
            this._width=defolt.width;
            this._height=defolt.height;
            this._delph=defolt.delph;
            this._step = defolt.step
            
            this._bool = defolt.bool
            this._bool1 = defolt.bool1
            this._bool2 = defolt.bool2
        }
        this.clearDefolt();



   //  set step(value) {
   //      if(this._step!=value){
   //          this._step= value;
   //           this.par.dragWHD()
            // this.par.par.render()
   //      }
   //  }    
   //  get step() { return  this._step;}


   //  set bool(value) {
   //      if(this._bool!=value){
   //          this._bool= value;
   //          this.par.dragWHD()
            // this.par.par.render()     
   //      }
   //  }    
   //  get bool() { return  this._bool;}  

   //  set bool1(value) {
   //      if(this._bool1!=value){
   //          this._bool1= value;
   //          this.par.dragWHD()
            // this.par.par.render()     
   //      }
   //  }    
   //  get bool1() { return  this._bool1;}  


   //  set bool2(value) {
   //      if(this._bool2!=value){
   //          this._bool2= value;
   //          this.par.dragWHD()
            // this.par.par.render()     
   //      }
   //  }    
   //  get bool2() { return  this._bool2;}  


*/

