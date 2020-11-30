

import { PlaneXZ } from '../../plus/PlaneXZ.js';
//отрисовка стен

export class SSP3D  {
  	constructor(par,fun) {  		
  		this.type="SSP3D";
        var self=this;
        this.par=par;
        this._active = false;
        

        this.content3d = new THREE.Object3D();
        this.par.par.content3d.add(this.content3d);

        this.cont3d = new THREE.Object3D();
        this.content3d.add(this.cont3d);

        this.cont3dL = new THREE.Object3D();
        this.content3d.add(this.cont3dL); 


        this.planeXZ=new PlaneXZ();



    	this.lineSegments = new THREE.LineSegments(
            this.planeXZ,
            this.par.par.lineBasicMaterial1
        )
        this.cont3dL.add(this.lineSegments);

        this.kol=0
        this.arrPoint=[];





		this.draw1 = function () {
            if(this.par.array.length>=2){
                this.lineSegments.visible=true;

                this.planeXZ.clearPoint()
                this.kolPointDrag();
                for (var i = 0; i < this.kol; i++) {
         
                    
                    if(i!=this.kol-1){

                        this.planeXZ.addLine(this.arrPoint[i],this.arrPoint[i+1]);
                    }else{
                        this.planeXZ.addLine(this.arrPoint[i],this.arrPoint[0]);
                    }
                }
              

                this.planeXZ.upDate()

            }else{
                this.lineSegments.visible=false;
            }
			
		}

        this.kolPointDrag = function () {
            this.kol=this.par.array.length;
            for (var i = 0; i < this.par.array.length; i++) {
                if(this.arrPoint[i]==undefined)this.arrPoint[i]=new THREE.Vector3();
                this.arrPoint[i].x=this.par.array[i].position.x;
                this.arrPoint[i].y=this.par.array[i].position.y;
                this.arrPoint[i].z=0;
            }
        }
    }

	set active(value) {
        if(this._active!=value){
            this._active= value;            

        }
    }    
    get active() { return  this._active;}

    set life(value) {
        if(this._life!=value){
            this._life= value;
            if(this._life==true)this.par.par.content3d.add(this.content3d);
            else if(this.content3d.parent!=undefined)this.content3d.parent.remove(this.content3d);
                       
        }
    }    
    get life() { return  this._life;}
}


