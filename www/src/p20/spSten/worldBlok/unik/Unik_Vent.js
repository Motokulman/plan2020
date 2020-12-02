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

        trace('Unik_Vent')
        
        this.dragWHD=function(){
        }    
	}

    // set height1(value) {
    //     if(this._height1!=value){
    //         this._height1 = value;
    //         this.par.dragWHD()
    //         this.par.par.render()
    //     }
    // }    
    // get height1() { return  this._height1;}

}

