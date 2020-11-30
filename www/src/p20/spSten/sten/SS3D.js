


export class SS3D  {
  	constructor(par,fun) {  		
  		this.type="SS3D";
        var self=this;
        this.par=par;


        this._life= par._life;

        var sahh=0
        this.aVKol=0
        this._mashtabText=8;

        this._distans=0;
        this._delph=0;
		this._rotation=0;

		this._boolLitel=true;


        this.content3d = new THREE.Object3D();
        this.par.par.content3d.add(this.content3d);

	    this.cont3d = new THREE.Object3D();
	    this.par.content3d.add(this.cont3d);

	    this.cont3dL = new THREE.Object3D();
	    this.par.content3d.add(this.cont3dL); 
	           


		/*this.c3dM = new THREE.Object3D();
        this.content3d.add(this.c3dM);
        this.mesh = new THREE.Mesh(
         	this.par.par.boxBufferGeometry,
         	this.par.par.meshBasicMaterial
        )
        this.c3dM.add(this.mesh);*/

        

   		this.lineSegments = new THREE.LineSegments(
         	this.par.par.planeXZ,
         	this.par.par.lineBasicMaterial
        )
        this.cont3dL.add(this.lineSegments);
        this.lineSegments.rotation.x=Math.PI/2;

        

       	var p= parseInt("11100001000", 2);
       	var p1=parseInt("00011111111", 2);
   		


    	
        this.dragPost=function(){
        	this.draw1();
        }



		this.draw1 = function () {
			this._distans=this.par._distans;
			this._delph=this.par._delph;
			this._rotation=this.par._rotation;
			//this.mesh.scale.set(this._distans,this._delph,100);
            

			this.lineSegments.scale.set(this._distans,this.par._height,1);
			this.lineSegments.position.x=this._distans/2;
			this.lineSegments.position.z=-this.par._height/2;

			//this.mesh.position.x=this._distans/2;

						
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
			
                       
        }
    }    
    get life() { return  this._life;}

}



//отрисовывает активную хрень над
export function STAct (par) {
	var self = this;
	this.type = 'STAct';
	this.par = par;
	this._sahAct=0;

	this._sahPlus=0;

	this.arrVorur=this.par.arrVorur;	
	this.graphics = new PIXI.Graphics();
    this.par.content2d.addChild(this.graphics);
    this.graphics.alpha=this._sahAct/100;

    this.draw1=function(){
		this.graphics.clear();	
		
		this.graphics.beginFill(par.par.colorUI);		
		this.graphics.moveTo(this.par.arrVorur[0].x,this.par.arrVorur[0].y);
		for (var i = 1; i < this.par.aVKol; i++) {
			this.graphics.lineTo(this.par.arrVorur[i].x,this.par.arrVorur[i].y);				
		}
		this.graphics.lineTo(this.par.arrVorur[0].x,this.par.arrVorur[0].y);
    }

    this.corektSetGet=function(){
		this.graphics.alpha = (this._sahAct+this._sahPlus)/100;	
		this.par.par.par.render()
    }

}
STAct.prototype = {


	set sahAct (v) {
		if (this._sahAct === v) return;			
		this._sahAct = v;
		this.corektSetGet()
	},
	get sahAct () {

		return this._sahAct;
	},

	set sahPlus (v) {
		if (this._sahPlus === v) return;		
		this._sahPlus = v;
		this.corektSetGet()
	},
	get sahPlus () {

		return this._sahPlus;
	},
}