
import { PlaneXZ } from '../../plus/PlaneXZ.js';

export class SS3D  {
  	constructor(par,fun) {  		
  		this.type="SS3D";
        var self=this;
        this.par=par;

        this._height=par._height;
		this._height1=par._height1;
        this._life= par._life;

        var sahh=0
        this.aVKol=0
        this._mashtabText=8;

        this._distans=0;
        this._delph=0;
		this._rotation=0;

		this._color=this.par._color;
		this._color1=this.par._color1;
		this._color2=this.par._color2;
		this._color3=this.par._color3;
		this._color4=this.par._color4;

		this._boolLitel=true;

		this.korektRect=this.par.par.par.korektRect;
		this.korektLine=this.par.par.par.korektLine;


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
   		
       	this.pS={x:0,y:0,w:100,h:100}//Параметры текстурировнаия и начало энного




        this.dragPost=function(){
        	this.draw1();
        }



		this.draw1 = function () {
			this._distans=this.par._distans;
			this._delph=this.par._delph;
			this._rotation=this.par._rotation;
			
            this.cont3d.position.z=-(this._height+this._height1)
       		
            


            this.cont3d.visible=this.par.par._boolMax;
            this.cont3dL.visible=!this.par.par._boolMax;
            if(this.par.par._boolMax==true){
				this.drawGrani();
				this.drawVerg();
            }else{
            	this.drawLittel();
            	this.par.par.addObjFun1(this.par);
            }

            
            
            

		}


		this.drawLittel = function () {
			this.lineSegments.scale.set(this._distans,(this._height+this._height1),1);
			this.lineSegments.position.x=this._distans/2;
			this.lineSegments.position.z=-(this._height+this._height1)/2;
		}

		this.vergLittel=new VergLittel(this,this.par.par.pm.matDop.getIDReturn(this._color4))



		
		this.arrGrani=[];//этажа
		this.arrGrani[0]=new SGrani(this,0,this.par.par.pm.matDop.getIDReturn(this._color));
		this.arrGrani[1]=new SGrani(this,1,this.par.par.pm.matDop.getIDReturn(this._color1));
		this.arrGrani[2]=new SGrani(this,0,this.par.par.pm.matDop.getIDReturn(this._color2));
		this.arrGrani[3]=new SGrani(this,1,this.par.par.pm.matDop.getIDReturn(this._color3));
		for (var i = 0; i < this.arrGrani.length; i++)this.arrGrani[i].idArr=i
		this.arrGrani[0].boolInvert	=true
		this.arrGrani[1].boolInvert	=true

		
		this.arrGrani[0].arr[2].vergLittel=this.vergLittel

		this.drawVerg= function () {
			
			this.arrGrani[0].dragGeometry();			
			this.arrGrani[1].dragGeometry();
			/////////////////////////
			this.arrGrani[2].dragGeometry();			
			this.arrGrani[3].dragGeometry();


			this.vergLittel.setGrani(this.arrGrani[0],this.arrGrani[1]);




		}



		this.drawGrani = function () {
			//if(this.par.idArr!=0)return;
			

			
			//Порядок важен	
			this.arrGrani[0].dragPost();
			this.arrGrani[1].dragPost();
			this.arrGrani[0].setGrani1(this.arrGrani[1]);//!!! переворачиваем 			

			this.arrGrani[2].dragPost();
			this.arrGrani[3].dragPost();
			this.arrGrani[2].setGrani1(this.arrGrani[3]);//!!! переворачиваем 

			this.par.par.metodRezolk.setSten(this.par);


			


			
		}


		this.redrahHHH = function () {			
			this.arrGrani[0].h=this.arrGrani[1].h=this._height
			this.arrGrani[1].y=this.arrGrani[0].y = 0//-this._height1
			this.arrGrani[2].h=this._height1
			this.arrGrani[2].y=this._height
			this.arrGrani[3].h=this._height1
			this.arrGrani[3].y=this._height
		}
		this.redrahHHH()


		this.testMaterial= function () {	
			
		}  
		this.testMaterial();

    }

    set height(value) {
        if(this._height!=value){
            this._height= value;
        	this.redrahHHH()
        }
    }    
    get height() { return  this._height;}  

    set height1(value) {
        if(this._height1!=value){
            this._height1= value;
        	this.redrahHHH()
        }
    }    
    get height1() { return  this._height1;}  


     

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


    set color(value) {
        if(this._color!=value){
            this._color= value;
            this.arrGrani[0].material=this.par.par.pm.matDop.getIDReturn(this._color)
            this.testMaterial()                      
        }
    }    
    get color() { return  this._color;}

    set color1(value) {
        if(this._color1!=value){
            this._color1= value;
            this.arrGrani[1].material=this.par.par.pm.matDop.getIDReturn(this._color1)
            this.testMaterial()                      
        }
    }    
    get color1() { return  this._color1;}

    set color2(value) {
        if(this._color2!=value){
            this._color2= value;
            this.arrGrani[2].material=this.par.par.pm.matDop.getIDReturn(this._color2)
            this.testMaterial()                      
        }
    }    
    get color2() { return  this._color2;}

    set color3(value) {
        if(this._color3!=value){
            this._color3= value;
            this.arrGrani[3].material=this.par.par.pm.matDop.getIDReturn(this._color3)
            this.testMaterial()                      
        }
    }    
    get color3() { return  this._color3;}

    set color4(value) {
        if(this._color4!=value){
            this._color4= value;
            this.vergLittel.material=this.par.par.pm.matDop.getIDReturn(this._color3)
            this.testMaterial()                      
        }
    }    
    get color4() { return  this._color4;}



}


export class SGrani{
	constructor( par , sahTextur, material) {
		this.type = 'SGrani';	
		this.par=par;
		this.sahTextur=sahTextur;//Повороты текстур
		this.y=0;
		this.h=300;
		this.arrPosit=this.par.par.arrPosit;
		this.arrPosit1=this.par.par.arrPosit1;
		this._distans=0;
		this._material=material
		this.korektRect=this.par.korektRect
		this.cont3d = new THREE.Object3D();
	    this.par.cont3d.add(this.cont3d);
	  	this.boolVergDrag=false 
	  	this.idArr=-1 

	  	this.boolInvert=false;

	  	
	  	


	    this.arrP=[new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3()]
	    this.arrPGlob=[new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3()]
	    this.arr=[];	
		for (var i = 0; i < 5; i++) {
			this.arr[i]=new GronSten(this);
			this.arr[i].idArr=i;
		}

		this.clearAL=function(){
			for (var i = 0; i < 5; i++) {
				this.arr[i].clearAL()
			}
			
		}



		var a,d,a1
		var poin=new THREE.Vector3()
		var pNull=new THREE.Vector3()
		this.invertToGlob=function(){
			a=this.par._rotation;
			poin.x=par.par.position._x;
			poin.y=par.par.position._y;
			
			for (var i = 0; i < this.arrP.length; i++) {
				a1=calc.getAngle(pNull,this.arrP[i])
				d=calc.getDistance(pNull,this.arrP[i])

				calc.getVector(d,a1+a, this.arrPGlob[i])
				this.arrPGlob[i].x+=poin.x;
				this.arrPGlob[i].y+=poin.y;				
			}
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
				this.arrP[2].set(-this.arrPosit[5].x,this.arrPosit[5].y,0);
				this.arrP[1].set(-this.arrPosit[4].x,this.arrPosit[4].y,0);				
				this.arrP[0].set(-this.arrPosit[3].x,this.arrPosit[3].y,0);
			}
			this.sahW=0;
			for (var i = 0; i < 5; i++) {
				this.arr[i].setPosit(this.arrP[i],this.arrP[i+1])
				
				if(this.arr[i].dist==0){
					if(this.arr[i].mesh.visible!=false)this.arr[i].mesh.visible=false					
				}else{
					if(this.arr[i].mesh.visible!=true)this.arr[i].mesh.visible=true
				}
				this.arr[i].rendSahTextur=this.sahTextur
			}

			if(this.sahTextur==0){
				for (var i = 0; i < 5; i++) {
					this.arr[i].pS.y=0;
					this.arr[i].pS.w=100;
					this.arr[i].pS.h=100;
					this.arr[i].pS.x=this.sahW;										
					if(i>=2)this.sahW+=this.arr[i].dist					
					
				}
			}

			if(this.sahTextur==1){
				for (var i =4 ; i >=0; i--) {
					if(i<=1){
						this.sahW+=(this.arr[i].dist)//%this.arr[i].pS.w;
					
					}					
					this.arr[i].pS.y=0;
					this.arr[i].pS.w=100;
					this.arr[i].pS.h=100;
					this.arr[i].pS.x=-this.sahW;	
				}
			}
			if(this.boolInvert==true)this.invertToGlob()
		}

		this.setGrani1=function(grani){
			grani.arr[3].redragP();
			grani.arr[4].redragP();
			grani.arr[3].rendSahTextur=this.sahTextur;
			grani.arr[4].rendSahTextur=this.sahTextur;
			grani.arr[3].pS.x=this.sahW;
			grani.arr[4].pS.x=this.sahW+grani.arr[3].dist;


			this.arr[0].redragP();
			this.arr[1].redragP();

			this.arr[0].rendSahTextur=grani.sahTextur;
			this.arr[1].rendSahTextur=grani.sahTextur;

			this.arr[0].pS.x=-this.arr[0].dist-grani.sahW;
			this.arr[1].pS.x=-this.arr[0].dist-this.arr[1].dist-grani.sahW;
		}
		this.sahW=0

		this.dragGeometry=function(){
			if(this.h==0){
				this.cont3d.visible=false
				return
			}else{
				this.cont3d.visible=true
			}

			this.korektRect.boolDebug=false;
			this.boolVergDrag=false;

			this.korektRect.colizY= this.par._height1+ this.par._height;//-this.arrP[i].x;


			for (var i = 0; i < 5; i++) {
				//if(this.par.par.idArr==0)if(this.idArr==1)if(i==2)	this.korektRect.boolDebug=true;	
				/*if(this.arr[i].vergLittel!=undefined){
					this.korektRect.boolDebug=true;	
					
				}*/
				if(this.arr[i].dist!=0){
					if(i==2){									
						this.korektRect.colizX=-this.arrP[i].x;
						this.arr[i].setNaRect(
						0,this.par.par.windows.world,
						this.h,
						this.y,null,this.arrP[i].x);


					}
					else{
						this.arr[i].setNaRect(
						0,null,
						this.h,
						this.y,null,0);
					}
					if(this.arr[i].boolVergDrag==true)this.boolVergDrag=true;
				}
				this.korektRect.boolDebug=false;
			}			
		}
	}
	set material(value) {		
        if(this._material!==value){
            this._material= value;
            for (var i = 0; i < 5; i++) {
                this.arr[i].material= value;
            }          
        }
    }    
    get material() { return  this._material;}




}




export class GronSten {
    constructor( par ) {
    	var self = this;
		this.type = 'GronSten';	
		this.par=par;
		this.geometry=new PlaneXZ();	
		this.rendSahTextur=0
		this.idArr=-1
		this._material=par._material

		this.vergLittel=undefined

		this.mesh=new THREE.Mesh(this.geometry,this._material)//this.par.par.par.par.mat);	
		this.mesh.rotation.x=Math.PI/2;


		this.cont3d = new THREE.Object3D();
	    this.par.cont3d.add(this.cont3d);
		this.cont3d.add(this.mesh);

		
		this.p=new THREE.Vector3();
		this.p1=new THREE.Vector3();
		

		this.arrLine=[];
		this.arrLineCesh=[]	

		this.clearAL=function(){
			this.arrLine.length=0;			
		}

		this.getLine=function(){
			if(this.arrLineCesh[this.arrLine.length]==undefined){
				this.arrLineCesh[this.arrLine.length]={p:{x:0,y:0},p1:{x:0,y:-100}}
			}		
			this.arrLine.push(this.arrLineCesh[this.arrLine.length])		
			return this.arrLine[this.arrLine.length-1];
		}



		//////////////////////////////////////////1
		this.arrLine1=[];
		this.arrLineCesh1=[]	

		this.clearAL1=function(){
			this.arrLine1.length=0;			
		}

		this.getLine1=function(){
			if(this.arrLineCesh1[this.arrLine1.length]==undefined){
				this.arrLineCesh1[this.arrLine1.length]={p:{x:0,y:0,z:0},p1:{x:0,y:-100,z:0}}
			}		
			this.arrLine1.push(this.arrLineCesh1[this.arrLine1.length])		
			return this.arrLine1[this.arrLine1.length-1];
		}

		//////////////////////////////////////////2
		this.arrLine2=[];
		this.arrLineCesh2=[]	

		this.clearAL2=function(){
			this.arrLine2.length=0;			
		}

		this.getLine2=function(){
			if(this.arrLineCesh2[this.arrLine2.length]==undefined){
				this.arrLineCesh2[this.arrLine2.length]={p:{x:0,y:0,z:0},p1:{x:0,y:-100,z:0}}
			}		
			this.arrLine2.push(this.arrLineCesh2[this.arrLine2.length])		
			return this.arrLine2[this.arrLine2.length-1];
		}

		/////////////////////






		
		var ppe=new THREE.Vector3()
		var ppe1=new THREE.Vector3()
		var ppzzz=new THREE.Vector3()
		var ppNull=new THREE.Vector3()

		var pRez={p:ppe,p1:ppe1}


		var a,d, a1, d1
		var t,t1,bbb
		this.isLocalToGlob=function(_p,_p1){			
			bbb=false;

			if(this.par.sahTextur==1&&(this.idArr==4||this.idArr==3)){
				bbb=true;
			}
			if(this.par.sahTextur==0&&(this.idArr==0||this.idArr==1)){
				bbb=true;
			}
			if(bbb==true){	
				t1=this.par.arrPGlob[this.idArr];
				t=this.par.arrPGlob[this.idArr+1];
			}else{
				t=this.par.arrPGlob[this.idArr];
				t1=this.par.arrPGlob[this.idArr+1];
			}
			

			ppzzz.x=_p.x-t.x;
			ppzzz.y=_p.y-t.y;

			a=calc.getAngle(ppNull,ppzzz);
			d=calc.getDistance(ppNull,ppzzz);
			calc.getVector(d,0,ppe);
			ppe.z=this.par.par.par._height+this.par.par.par._height1+_p.z;

			
			ppzzz.x=_p1.x-t.x;
			ppzzz.y=_p1.y-t.y;

			a=calc.getAngle(ppNull,ppzzz);
			d=calc.getDistance(ppNull,ppzzz);
			calc.getVector(d,0,ppe1);
			ppe1.z=this.par.par.par._height+this.par.par.par._height1+_p1.z;		
			return pRez
		}






		this.rect={x:0,y:0,w:700,h:300};

		this.dist=0;
		this.angel=0;

		this.pS={x:0,y:0,w:100,h:100}

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
			this.setPRed();
		}

		this.setPRed=function(){
			this.angel=calc.getAngle(this.p,this.p1);
			this.dist=calc.getDistance(this.p,this.p1);
			this.cont3d.position.x=this.p.x;
			this.cont3d.position.y=this.p.y;
			this.cont3d.rotation.z=this.angel;
		}

		this.boolVergDrag=false
		




		var xSm
		this.setNaRect=function(_x,_coliz,_h,_y,_nGeom,_xSm){		
			this.boolVergDrag=false

			/*if(this.par.par.par.idArr==0&&this.arrLine[0].p1.y!=220){
				this.arrLine=[{p:{x:22,y:-20},p1:{x:590,y:220}}];
			}*/

			xSm=0;
			if(_xSm!=undefined)xSm=_xSm;
		
			this.rect.y=_y;
			this.rect.h=_h;
			//this.rect.x=xSm;
			//this.mesh.position.x=-xSm;

			this.rect.w=this.dist;

			//this.mesh.position.z=-_h;
			this.par.korektRect.rect=this.rect;	
			this.par.korektRect.coliz=_coliz;	

			this.par.korektRect.arrLine=this.arrLine;
			
			this.par.korektRect.pS=this.pS;
			this.par.korektRect.korektGrid();
			this.par.korektRect.setGeom(this.geometry, this.rendSahTextur);
			
			this.korektLine();

			this.boolVergDrag=this.par.korektRect.boolVergDrag;

			if(this.vergLittel!==undefined)this.vergLittel.drawWindow(this.par.korektRect, _xSm);

			
		}
		var line,ll
		this.korektLine=function(){	
			if(this.par.par.idArr>=2)return
			this.clearAL1();
			this.clearAL2();

			

			if(this.dist!=0){

				if(this.idArr==2){
					line= this.par.korektRect.getLine1();
					//trace(this.idArr,this.p,this.angel,this.dist);				
					for (var i = 0; i < line.length; i++) {
						ll=this.getLine1()
						ll.p.x=line[i].p.x+this.p.x;
						ll.p.z=line[i].p.y;
						ll.p.y= this.p.y;
						ll.p1.x=line[i].p1.x+this.p.x;
						ll.p1.z=line[i].p1.y;
						ll.p1.y= this.p.y;
					}
				}

				/*if(this.idArr==0||this.idArr==1){
					
					line= this.par.korektRect.getLine1();

					

					if(line.length!=0||line.length!=1){

						if(this.par.par.par.idArr==0)trace(this.idArr,this.p,this.angel,this.dist,line);	

						for (var i = 0; i < line.length; i++) {
							
							ll=this.getLine1()
							trace(i+"  ############# "+this.par.idArr)
							this.povorot(ll.p, this.p, this.angel)
							trace(">",this.point)

							ll.p.x=this.point.x;
							ll.p.z=this.point.y;
							ll.p.y= line[i].p.z;

							this.povorot(ll.p1, this.p, this.angel)

							ll.p1.x=this.point.x;
							ll.p1.z=this.point.y;
							ll.p1.y= line[i].p1.z;


							ll.p.x=line[i].p.x;
							ll.p.z=line[i].p.y;
							ll.p.y= this.p.y;
							ll.p1.x=line[i].p1.x;
							ll.p1.z=line[i].p1.y;
							ll.p1.y= this.p.y;
						}


					}
					
				}*/
				




				//if(this.arrLine1.length!=0)trace("line==",this.arrLine1)
			}
		}


		this.point=new THREE.Vector3()
		this.pNull=new THREE.Vector3()
		var dd
		this.povorot=function(p, pOt, angel){	
			//trace(p,"   ",angel,pOt)
			dd=p.x;
			calc.getVector(dd,-angel,this.point)

			this.point.x+=pOt.x;
			this.point.y+=pOt.y;	

		}


    }


    set material(value) {		
        if(this._material!==value){
            this._material= value;
            this.mesh.material=this._material;            
        }
    }    
    get material() { return  this._material;}

}



export class VergLittel{
    constructor( par , material) {
    	var self = this;
		this.type = 'VergLittel';	
		this.par=par;
		this.geometry=new PlaneXZ();	
		this.rendSahTextur=0;

		this.korektLine=this.par.korektLine;

		this._material=material;
		this.mesh=new THREE.Mesh(this.geometry,this._material)
		this.par.cont3d.add(this.mesh)
		this.normalPosit=new THREE.Vector3(0,1,0)


		this.geometry1=new PlaneXZ();
		this._material1=material;
		this.mesh1=new THREE.Mesh(this.geometry1,this._material1)
		this.par.cont3d.add(this.mesh1)



		this.arrLine=[];
		this.arrLineCesh=[]	

		this.clearAL=function(){
			this.arrLine.length=0;			
		}

		this.getLine=function(){
			if(this.arrLineCesh[this.arrLine.length]==undefined){
				this.arrLineCesh[this.arrLine.length]={p:{x:0,y:0,z:0},p1:{x:0,y:-100,z:0}}
			}		
			this.arrLine.push(this.arrLineCesh[this.arrLine.length])		
			return this.arrLine[this.arrLine.length-1];
		}




		var i,j,k,line,ll,ggg
		this.setGrani=function(gran,gran1){	
			this.clearAL();
			
		

			if(gran.boolVergDrag==false&&gran1.boolVergDrag==false){
				i=0
				for (j = 0; j < this.par.arrGrani[i].arr.length; j++) {
					line=this.par.arrGrani[i].arr[j];
					
					if(line.dist!=0){
						ll=this.getLine()
						ll.p.x=line.p.x
						ll.p.y=line.p.y
						ll.p.z=line.p.z
						ll.p1.x=line.p1.x
						ll.p1.y=line.p1.y
						ll.p1.z=line.p1.z
					}

				}
				i=1
				for (j = 0; j < this.par.arrGrani[i].arr.length; j++) {
					line=this.par.arrGrani[i].arr[j];
					
					if(line.dist!=0){
						ll=this.getLine()
						ll.p.x=line.p.x
						ll.p.y=line.p.y
						ll.p.z=line.p.z
						ll.p1.x=line.p1.x
						ll.p1.y=line.p1.y
						ll.p1.z=line.p1.z
					}
				}
			}else{

				for (i = 0; i < 2; i++) {
					for (j = 0; j < this.par.arrGrani[i].arr.length; j++) {

						for (k = 0; k < this.par.arrGrani[i].arr[j].arrLine1.length; k++) {

							line=this.par.arrGrani[i].arr[j].arrLine1[k]			
							ll=this.getLine()
							ll.p.x=line.p.x
							ll.p.y=line.p.y
							ll.p.z=line.p.z
							ll.p1.x=line.p1.x
							ll.p1.y=line.p1.y
							ll.p1.z=line.p1.z
						}
					}
				}

			}

			
			this.korektLine.arrLine=this.arrLine;
			this.korektLine.start()
			this.korektLine.setGeom(this.geometry);/**/

			



			if(this.par.par.idArr==0){
				/*trace(this.arrLine)
				var s=JSON.stringify(this.arrLine)
				trace(s)
				trace(this.par.par.idArr+">>>>>>>>>>",this.arrLine)
				trace(this.korektLine.aTri);*/
			}
		}	


		this.drawWindow=function(kR,xxx){
			trace(this.par.par._delph)
			this.mesh1.position.x=xxx
			kR.setGeomBool1(this.geometry1, this.par.par._delph);
		}
		

	}
	set material(value) {		
        if(this._material!==value){
            this._material= value;
            this.mesh.material=this._material;            
        }
    }    
    get material() { return  this._material;}
}








/*
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
*/




/*

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
            this.setAttribute( 'position', new THREE.Float32BufferAttribute( vertices, 3));
        }
        this.upNull();
    }
}*/


