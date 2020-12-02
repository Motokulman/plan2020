


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

		this.korektRect=this.par.par.par.korektRect;


       /* this.content3d = new THREE.Object3D();
        this.par.par.content3d.add(this.content3d);*/

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
   		
       	this.pS={x:0,y:0,w:1000,h:1000}//Параметры текстурировнаия и начало энного

    	
        this.dragPost=function(){
        	this.draw1();
        }



		this.draw1 = function () {
			this._distans=this.par._distans;
			this._delph=this.par._delph;
			this._rotation=this.par._rotation;
	
            
            //this.drawBig()
            this.drawGrani();
            this.drawLittel()
			
			//this.mesh.position.x=this._distans/2;						
		}


		this.drawLittel = function () {
			this.lineSegments.scale.set(this._distans,this.par._height,1);
			this.lineSegments.position.x=this._distans/2;
			this.lineSegments.position.z=-this.par._height/2;
		}

		this.arrP=[new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3()]
		this.arrP1=[new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3()]

		this.arr=[];//этажа
		this.arr1=[];//этажа

		for (var i = 0; i < 5; i++) {
			this.arr[i]=new GronSten(this);
			this.arr[i].idArr=i;

			this.arr1[i]=new GronSten(this);
			this.arr1[i].idArr=i;
		}


		this.arrGrani=[];//этажа
		this.arrGrani[0]=new SGrani(this,0)
		this.arrGrani[1]=new SGrani(this,1)
		this.arrGrani[2]=new SGrani(this,0)
		this.arrGrani[3]=new SGrani(this,1)

		this.drawGrani = function () {
			if(this.par.idArr!=0)return
			this.arrGrani[0].dragPost();
			this.arrGrani[0].dragGeometry();
		}



/*

		this.plusVor(-this.arrPosit[0].x,this.arrPosit[0].y)

			this.plusVor(this.arrPosit1[5].x+this._distans,this.arrPosit1[5].y)*/
	

		this.rect={x:0,y:0,w:7000,h:3000};
		var ss,ss1,ss2
		this.drawBig = function () {
			
			//if(this.par.idArr!=0)return






				
			this.arrP[0].set(-this.par.arrPosit[2].x,this.par.arrPosit[2].y,0);
			this.arrP[1].set(-this.par.arrPosit[1].x,this.par.arrPosit[1].y,0);
			this.arrP[2].set(-this.par.arrPosit[0].x,this.par.arrPosit[0].y,0);

			this.arrP[3].set(this.par.arrPosit1[5].x+this.par._distans, this.par.arrPosit1[5].y,0);
			this.arrP[4].set(this.par.arrPosit1[4].x+this.par._distans, this.par.arrPosit1[4].y,0);
			this.arrP[5].set(this.par.arrPosit1[3].x+this.par._distans, this.par.arrPosit1[3].y,0);


			for (var i = 0; i <5; i++) {					
				this.arr[i].setPosit(this.arrP[i],this.arrP[i+1])
			}


			this.arrP1[5].set(this.par.arrPosit1[2].x+this.par._distans,this.par.arrPosit1[2].y,0);
			this.arrP1[4].set(this.par.arrPosit1[1].x+this.par._distans,this.par.arrPosit1[1].y,0);
			this.arrP1[3].set(this.par.arrPosit1[0].x+this.par._distans,this.par.arrPosit1[0].y,0);


			this.arrP1[2].set(-this.par.arrPosit[4].x,this.par.arrPosit[4].y,0);
			this.arrP1[1].set(-this.par.arrPosit[5].x,this.par.arrPosit[5].y,0);
			this.arrP1[0].set(-this.par.arrPosit[3].x,this.par.arrPosit[3].y,0);
		
			



			
			
			

			
			
			


			for (var i = 0; i <5; i++) {					
				this.arr1[i].setPosit(this.arrP1[i],this.arrP1[i+1])
			}

			
/*
			this.arr[2].setNaRect(
			0,this.par.windows.world,
			this.par._height,
			this.pS,0, this.arr[2].p.x)


			return
*/
			ss=0
			var sahh
			var sasa
			var bb
			for (var i = 0; i <5; i++) {				
				sasa=0;
			
				bb=false;

				if(i==0 || i==1 ){
					this.arr[i].redragP()
					this.arr[i].setNaRect(
					ss,null,
					this.par._height,
					this.pS,1,0)
					bb=true
				}
				if(i==2){
					this.arr[i].setNaRect(
					ss,this.par.windows.world,
					this.par._height,
					this.pS,0,this.arr[i].p.x)
					bb=true
				}


				if(bb==false){
					this.arr[i].setNaRect(
					ss,null,
					this.par._height,
					this.pS,0,0)
				}			

				if(i==2){						
					if(this.arr[i].dist!=0){
						ss=(this.arr[i].dist-(Math.floor(this.arr[i].dist/this.pS.w)*this.pS.w))							
					}
				}
				if(i==3){
					ss1=ss;
					if(this.arr[i].dist!=0){
						ss1=(this.arr[i].dist-(Math.floor(this.arr[i].dist/this.pS.w)*this.pS.w))+ss;							
					}
				}
				if(i==4){
					ss2=ss1;
					if(this.arr[i].dist!=0){
						ss2=(this.arr[i].dist-(Math.floor(this.arr[i].dist/this.pS.w)*this.pS.w))+ss1;							
					}
				}
				
			}

			
			


			for (var i = 0; i <5; i++) {
				bb=false;
				if(i==4 || i==3 ){
					if(this.arr1[i].dist!=0){					
						this.arr1[i].redragP()					
						this.arr1[i].setNaRect(
						ss2,null,
						this.par._height,
						this.pS,0)
						bb=true;
					}
				}

				if(i==2){				
					this.arr1[i].setNaRect(
					0,this.par.windows.world,
					this.par._height,
					this.pS,1,this.arr1[i].p.x)
					bb=true;
				}

				if(bb==false){	
					this.arr1[i].setNaRect(
					0,null,
					this.par._height,
					this.pS,1)
				}				
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
        }
    }    
    get life() { return  this._life;}

}


export class SGrani{
	constructor( par , sahTextur) {
		this.type = 'SGrani';	
		this.par=par;
		this.sahTextur=sahTextur;//Повороты текстур
		this.y=0;
		this.h=1000;
		this.arrPosit=this.par.par.arrPosit;
		this.arrPosit1=this.par.par.arrPosit1;
		this._distans=0;
		this.korektRect=this.par.korektRect

		this.cont3d = new THREE.Object3D();
	    this.par.cont3d.add(this.cont3d);

	    this.arrP=[new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3()]
	    this.arr=[];	
		for (var i = 0; i < 5; i++) {
			this.arr[i]=new GronSten(this);
			this.arr[i].idArr=i;
		}

		
		this.dragPost=function(){
			this._distans=this.par.par._distans;
			if(this.sahTextur==0){				
				this.arrP[0].set(-this.arrPosit[2].x,this.arrPosit[2].y,0);
				this.arrP[1].set(-this.arrPosit[1].x,this.arrPosit[1].y,0);
				this.arrP[2].set(-this.arrPosit[0].x,this.arrPosit[0].y,0);				
				this.arrP[3].set(this.arrPosit1[5].x+this._distans, this.arrPosit1[5].y,0);
				this.arrP[4].set(this.arrPosit1[4].x+this._distans, this.arrPosit1[4].y,0);
				this.arrP[5].set(this.arrPosit1[3].x+this._distans, this.arrPosit1[3].y,0);
			}
			if(this.sahTextur==1){
				this.arrP[5].set(this.arrPosit1[2].x+this._distans,this.arrPosit1[2].y,0);
				this.arrP[4].set(this.arrPosit1[1].x+this._distans,this.arrPosit1[1].y,0);
				this.arrP[3].set(this.arrPosit1[0].x+this._distans,this.arrPosit1[0].y,0);
				this.arrP[2].set(-this.arrPosit[4].x,this.arrPosit[4].y,0);
				this.arrP[1].set(-this.arrPosit[5].x,this.arrPosit[5].y,0);
				this.arrP[0].set(-this.arrPosit[3].x,this.arrPosit[3].y,0);
			}

			for (var i = 0; i < 5; i++) {
				this.arr[i].setPosit(this.arrP[i],this.arrP[i+1])
				if(this.arr[i].dist==0){
					if(this.arr[i].mesh.visible!=false)this.arr[i].mesh.visible=true					
				}else{
					if(this.arr[i].mesh.visible!=true)this.arr[i].mesh.visible=false
				}
			}	
		}

		this.dragGeometry=function(){
			if(this.h==0){
				this.cont3d.visible=false
				return
			}else{
				this.cont3d.visible=true
			}
			for (var i = 0; i < 5; i++) {
				if(this.arr[i].dist!=0){
					this.arr[i].setNaRect(
					0,null,
					this.h,
					this.par.pS,0,0);


				}				
			}

			
		}
	}
}




export class GronSten {
    constructor( par ) {
    	var self = this;
		this.type = 'GronSten';	
		this.par=par
		this.geometry=new PlXZ()	
		this.mesh=new THREE.Mesh(this.geometry,this.par.par.par.par.mat);	
		this.mesh.rotation.x=Math.PI/2;

		this.cont3d = new THREE.Object3D();
	    this.par.cont3d.add(this.cont3d);
		this.cont3d.add(this.mesh);

		
		this.p=new THREE.Vector3();
		this.p1=new THREE.Vector3();
		

		this.rect={x:0,y:0,w:7000,h:3000};

		this.dist=0;
		this.angel=0;

		this.pS={x:0,y:0,w:1000,h:1000}

		this.setPosit=function(_p,_p1){
			this.p=_p;
			this.p1=_p1;

			this.setPRed()

		}
		var pp
		this.redragP=function(){
			pp=this.p
			this.p=this.p1
			this.p1= pp
			this.setPRed()
		}

		this.setPRed=function(){
			this.angel=calc.getAngle(this.p,this.p1);
			this.dist=calc.getDistance(this.p,this.p1);

			this.cont3d.position.x=this.p.x;
			this.cont3d.position.y=this.p.y;
			this.cont3d.rotation.z=this.angel;
		}


		

		var xSm
		this.setNaRect=function(_x,_coliz,_h,pS,_nGeom,_xSm){
		
			xSm=0;
			if(_xSm!=undefined)xSm=_xSm;
		
			this.rect.y=0;
			this.rect.h=_h;
			this.rect.x=xSm;
			this.mesh.position.x=-xSm;
			this.rect.w=this.dist;
		

			this.mesh.position.z=-_h;
			this.par.korektRect.rect=this.rect;	
			this.par.korektRect.coliz=_coliz	


			this.pS.x=_x;
			this.pS.w=pS.w;		
			this.pS.h=pS.h;	
			this.par.korektRect.pS=this.pS

			this.par.korektRect.korektGrid();
			this.par.korektRect.setGeom(this.geometry, _nGeom);

			trace(this.rect)
		}

    }
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

export class PlXZ extends THREE.BufferGeometry {
    constructor( ) {
        super();
        var vertices = [];
        this.upNull=function(){            
            var wh=1000;
            vertices.push(-wh,-wh,0);
            vertices.push(-wh,-wh,0);
            vertices.push(-wh, wh,0);

            vertices.push(-wh,-wh,0);
            vertices.push(-wh,-wh,0);
            vertices.push(wh,-wh,0);

            vertices.push(wh,-wh,0);
            vertices.push(wh,wh,0);
            vertices.push(wh,wh,0);

            vertices.push(-wh,wh,0);
            vertices.push(-wh,wh,0);
            vertices.push(wh,wh,0); 
            this.setAttribute( 'position', new THREE.Float32BufferAttribute( vertices, 3 ) );
        }
        this.upNull();
    }
}


