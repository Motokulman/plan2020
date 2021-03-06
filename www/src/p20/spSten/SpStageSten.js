
//import { TriangulateShape } from './TriangulateShape.js';
import { SpliceSten } from './sten/SpliceSten.js';
import { SpPointSten } from './SpPointSten.js';
import { SpVPXz } from './SpVPXz.js';
import { SpDebugPixi } from './SpDebugPixi.js';
//import { Pol3D } from './Pol3D.js';
import { SpStage } from './../sp/SpStage.js';
import { Calc } from './../Calc.js';
import { SPLineWord } from './SPLineWord.js';
import { WorldBlok } from './worldBlok/WorldBlok.js';
import { SPGroup} from './SPGroup.js';
import { SpPolygon } from './polygon/SpPolygon.js';
import { PlaneXZ } from '../plus/PlaneXZ.js';
import { SPMetod } from './SPMetod.js';
import {SPMetodRezolka} from './SPMetodRezolka.js';

import {TriangulateShape} from './polygon/TriangulateShape.js';

/**
* Мир для сращалок дорог
* @class
* @extends SpStage
*/
export function SpStageSten (par,  fun) {
	SpStage.call(this);
	var self = this;
	this.type = 'SpStageSten';
	
	this.par=par;
	this.tipSplice = 'SpliceSten';
	this.tipPoint = 'SpPointSten';
	this.fun = fun;
	this.uuid=calc.generateRendom(2);
	this.objectBase=par.objectBase;
	this.pm=par.pm;
	
	this.aDefolt=par.aDefolt;

	this._boolMax=true

	//var ooo=this.pm.matDop.getIDReturn(15);



	this.name='xzStart';

	this._delph = 50;
	
	this._colorUI=0x008cba;
	this._colorUI1=0xf3f3f3;
	this._colorUIActive=0xf28044;


	this._color="#c5d6e0";
	this._colorP=0xc5d6e0;
	this._colorP1=0xc5d6e0;


	this._carrier = true;// несущия
	this._out = true;// несущия
	this._adjacent = true;// несущия

    this._colorC0 = "#222222";
    this._colorC1 = "#222222";
    this._colorC0_ = 0x222222;
    this._colorC1_ = 0x222222;

    this._delphC0 = 100;
    this._delphC1 = 100;
    this._delphPlus=0

	this._mashtab=par._mashtab;

	//this._mashtab = 1;
	this._amSten=false;
	this._amPoint=true;
	this._amPol=false;
	this._activMouse=false;


	this._colorLine = "#000000";
    this._colorLine_ = 0x000000;
	this._sizeLine = 10;

	this._height=300;
	this._height1=0;


	this._activeSten=-1;
	this._activePoint=-1;
	this._activePol=-1;

	this._alpha=1;
	this._status=2;

	this.boolText = true;
	this.content2d = new PIXI.Container();
	this.par.content2d.addChild(this.content2d)
	
	this.contNiz = new PIXI.Container();
	this.content2d1 = new PIXI.Container();
	this.content2d2 = new PIXI.Container();
	this.content2dPoint = new PIXI.Container();	
	this.cont2dLine = new PIXI.Container();
	this.cont2dBlok = new PIXI.Container();

	this.cont2dVerh = new PIXI.Container();

	this.cont2dGroup = new PIXI.Container();


	this.content2d.addChild(this.contNiz);
	this.content2d.addChild(this.content2d1);
    this.content2d.addChild(this.content2d2);
    this.content2d.addChild(this.content2dPoint);
    this.content2d.addChild(this.cont2dBlok);
    this.content2d.addChild(this.cont2dLine);
    this.content2d.addChild(this.cont2dVerh);
    this.content2d.addChild(this.cont2dGroup);



    this.content3d = new THREE.Object3D();
    this.par.content3d.add(this.content3d);




    this.planeXZ=new PlaneXZ()

    this.boxBufferGeometry=new THREE.BoxBufferGeometry( 1, 1, 1 )
    this.meshBasicMaterial=new THREE.MeshBasicMaterial( {color: 0x008cba} )

    this.lineBasicMaterial = new THREE.LineBasicMaterial( { color: 0x00ff00, linewidth: 10});
    this.lineBasicMaterial1 = new THREE.LineBasicMaterial( { color: 0x0000ff, linewidth: 10});
    this.lineBasicMaterial2 = new THREE.LineBasicMaterial( { color: 0xff0000, linewidth: 10});


    this.texture = new THREE.TextureLoader().load('resources/image/pic.png');  
    this.texture.wrapS = THREE.RepeatWrapping;
	this.texture.wrapT = THREE.RepeatWrapping;
	this.texture.repeat.y=-1;




	this.mat=new THREE.MeshBasicMaterial( {color: 0xff8cba, map:this.texture } )
    this.mat1=new THREE.MeshBasicMaterial( {color: 0x00800a, map:this.texture } )
    

	this.lineWord=new SPLineWord(this);
	this.worldBlok=new WorldBlok(this);
	this.group=new SPGroup(this);
	this.metod=new SPMetod(this);

	this.metodRezolk=new SPMetodRezolka(this);

	this.triangulateShape=new TriangulateShape()

	this.colorT=new THREE.Color()
	this.convertC=function(c,a){
		this.colorT.set(c)
		if(a!=undefined){
			this.colorT.r*=a[0]
			this.colorT.g*=a[1]
			this.colorT.b*=a[2]
		}
		
		return this.colorT.getHex()
	}





	
	this.getPoint=function(str){ return new SpPointSten(this);}
	this.getSplice=function(str){return new SpliceSten(this);}
	this.getPol=function(str){ return new SpPolygon(this,str);}
	this.getVP=function(str){ return new SpVPXz(this);}


	this.getInfo=function(a){ 
		for (var i = 0; i < this.arrSplice.length; i++) {
			if (this.arrSplice[i].life == false) continue;
			this.arrSplice[i].getInfo(a);
		}	
	}


	
	this.render=function(){	
		if(this.par.renderDebag)this.par.renderDebag()
	}

	//возврощает габаритный контейнер
	this.getRect=function(aPoint, aSten, avp){ 

		if(aPoint==undefined){
			aPoint=[];
			for (var i = 0; i < this.arrPoint.length; i++) {			
				if (this.arrPoint[i].life==false) continue;					
				aPoint.push(this.arrPoint[i])											
			}
		}
		if(aSten==undefined){
			aSten=[];
			for (var i = 0; i < this.arrSplice.length; i++) {
				if (this.arrSplice[i].life == false) continue;				
				aSten.push(this.arrSplice[i])
			}
		}

		if(avp==undefined){
			avp=[];
			for (var i = 0; i < this.avp.length; i++) {
				if (this.avp[i].life == false) continue;				
				avp.push(this.avp[i])
			}
		}

		var r={x:9999999,y:999999,x1:-9999999,y1:-9999999,w:0,h:0}
		for (var i = 0; i < avp.length; i++) {
			korRect(r,avp[i].position)	
		}

		for (var i = 0; i < aPoint.length; i++) {
			korRect(r,aPoint[i].position)	
		}
		for (var i = 0; i < aSten.length; i++) {
			aSten[i].poiskGran();
			korRect(r,aSten[i].arrGran[0]);
			korRect(r,aSten[i].arrGran[1]);
			korRect(r,aSten[i].arrGran[2]);
			korRect(r,aSten[i].arrGran[3]);
		}

		r.w=r.x1-r.x
		r.h=r.y1-r.y
		return r;
	}
	function korRect(r,p){
		if(r.x>p.x)r.x=p.x;
		if(r.y>p.y)r.y=p.y;
		if(r.x1<p.x)r.x1=p.x;
		if(r.y1<p.y)r.y1=p.y;	
	}

	this.dragStyleObj=function(o){				
		for (var s in o) {
			if(this[s]!=undefined)this[s]=o[s]
		}
		this.bigDrag()
	}

	this.getDelphToBoolS=function(b,b1,b2){	
		let r=this._delphC0;
		if(b==true){
			r=this._delphC1;
		}
		if(b1==true && b==true)r+=this._delphPlus;
		return r;
	}

	var arrAvtiv=[]
	this.setActive=function(ao){
		arrAvtiv.length=0;
		if(ao!=undefined){
			if(ao[0]!=undefined){
				for (var i = 0; i < ao.length; i++) {
					arrAvtiv.push(ao[i])
				}
			}else{
				arrAvtiv.push(ao)
			}
		}
		if(ao==undefined){
			this.group.active=false
		}

		for (var i = 0; i < this.arrPoint.length; i++) {			
			if (this.arrPoint[i].life==false) continue;
			if(this.testSetActive(this.arrPoint[i])==true)this.arrPoint[i].active=true
			else this.arrPoint[i].active=false;
		}
		for (var i = 0; i < this.arrSplice.length; i++) {
			if (this.arrSplice[i].life == false) continue;	
			if(this.testSetActive(this.arrSplice[i])==true)this.arrSplice[i].active=true
			else this.arrSplice[i].active=false;
			for (var j = 0; j < this.arrSplice[i].windows.array.length; j++) {
				if(this.testSetActive(this.arrSplice[i].windows.array[j])==true)this.arrSplice[i].windows.array[j].active=true
				else this.arrSplice[i].windows.array[j].active=false;
			}
		}

		for (var i = 0; i < this.arrPol.length; i++) {			
			if (this.arrPol[i].life==false) continue;
			if(this.testSetActive(this.arrPol[i])==true)this.arrPol[i].active=true
			else this.arrPol[i].active=false;
		}
		for (var i = 0; i < this.avp.length; i++) {			
			if (this.avp[i].life==false) continue;
			if(this.testSetActive(this.avp[i])==true)this.avp[i].active=true
			else this.avp[i].active=false;
		}

		this.render();
	}
	this.testSetActive=function(o){
		if(arrAvtiv.length==0)return false
		for (var i = 0; i < arrAvtiv.length; i++) {
			if(arrAvtiv[i].uuid==o.uuid)return true;
		}
		return false	
	}

			


	this.bigDrag=function(){		
		for (var i = 0; i < this.arrSplice.length; i++) {
			if (this.arrSplice[i].life==false) continue;				
			this.arrSplice[i].dragPost();
		}

		for (var i = 0; i < this.arrPoint.length; i++) {			
			if (this.arrPoint[i].life==false) continue;					
			this.arrPoint[i].dragPost();											
		}
	}



	this.arrFun=[];
	this.arrObj=[];

	this.addObjFun=function(o){
		for (let i = 0; i < this.arrObj.length; i++) {
			if(this.arrObj[i]._uuid==o._uuid){
				return;
			}
		}
		
		this.arrObj.push(o);
	}

	this.doRender=function(){
		if(self.arrObj.length==0)return false;	
		//this.debugPixi.clearD();

		for (let i = 0; i < self.arrObj.length; i++) {
			self.arrObj[i].dragPost();
			
		}
		self.arrObj.length=0;
		return true;	
	}	



	this.arrFun1=[];
	this.arrObj1=[];

	this.addObjFun1=function(o){
		for (let i = 0; i < this.arrObj1.length; i++) {
			if(this.arrObj1[i]._uuid==o._uuid){
				return;
			}
		}
		
		this.arrObj1.push(o);
	}

	this.doRender1=function(){
		if(self.arrObj1.length==0)return false;	
		//this.debugPixi.clearD();

		for (let i = 0; i < self.arrObj1.length; i++) {
			
			self.arrObj1[i].dragPost();
			
		}
		self.arrObj1.length=0;
		self.fun("startTikInfo");
		return true;	
	}	

}
SpStageSten.prototype = Object.create(SpStage.prototype);
SpStageSten.prototype.constructor = SpStageSten;

SpStageSten.prototype.getObj = function (_activ) {
	var o = SpStage.prototype.getObj.call(this, _activ);	
	o.height=this._height;
	o.height1=this._height1;
	
	o.lineWord=this.lineWord.getObj();

	//o.worldBlok=this.lineWord.getObj()

	o.name=this.name;
	
	return o;
};
SpStageSten.prototype.setObj = function (o) {	
	SpStage.prototype.setObj.call(this, o);
	if(o.height)this.height=o.height
	if(o.height1)this.height1=o.height1
	if(o.name)this.name=o.name;	
		
	if(o.lineWord)this.lineWord.setObj(o.lineWord);
	//if(o.worldBlok)this.lineWord.setObj(o.worldBlok);	
	
	this.bigDrag()		
};



SpStageSten.prototype.craetSplice1 = function () {	
	var s=SpStage.prototype.craetSplice1.call(this);	
	s.col3d=this.col3d;//сторона стенки
	s.col3d1=this.col3d1;//сторона стенки
	s.activMouse=this._amSten;
	s.boolText=this.boolText;
	return s
};

SpStageSten.prototype.craetPoint = function () {	
	var s=SpStage.prototype.craetPoint.call(this);
	s.activMouse=this._amPoint;	
	s.position._z=this.height+this.height1;	
	return s
};


SpStageSten.prototype.craetPol = function (type) {	
	var s=SpStage.prototype.craetPol.call(this,type);
	s.activMouse=this._amSten;
	s.col3d2=this.col3d2;
	return s
};

SpStageSten.prototype.craetVP = function () {
	var s=SpStage.prototype.craetVP.call(this);
	s.activMouse=this._amPoint;	
	s.position._z=this.height+this.height1;	
	return s
};






SpStageSten.prototype.getGronVP = function (uuid) {
	var o = SpStage.prototype.getGronVP.call(this, uuid);	
	if(o!=null)return o;	

	for (var i = 0; i < this.arrSplice.length; i++) {
		if (this.arrSplice[i].life==false) continue;							
		if(this.arrSplice[i].getGronVP(uuid)!=null) return this.arrSplice[i].getGronVP(uuid);
	}

	
	return null;
};

SpStageSten.prototype.clear = function () {	
	var s=SpStage.prototype.clear.call(this);
	this.lineWord.clear()
	return s
};


Object.defineProperties(SpStageSten.prototype, {
	
	status: {
		set: function (value) {	
			if(this._status!=value)	{
				this._status = value;
				
				if(this._status==2){//не видем - не активный
					this.content2d.visible=false
					this.content3d.visible=false
				}
				if(this._status==1){//видный-неактивный 
					this.content2d.visible=true
					this.content3d.visible=true
					//this.fun("addChild","c2dSloi",this.content2d);
				}
				if(this._status==0){//видный-неактивный 
					this.content2d.visible=true
					this.content3d.visible=true
					//this.fun("addChild","c2dSloi2",this.content2d);
				}
				this.render()
			}			
		},
		get: function () {			
		 	return this._status;
		}
	},



	boolMax: {
		set: function (value) {	
			if(this._boolMax!=value)	{
				this._boolMax = value;
				

				if(this._boolMax==true)this.doRender1()
			}			
		},
		get: function () {			
		 	return this._boolMax;
		}
	},


	mashtab: {
		set: function (value) {	
			if(this._mashtab!=value)	{
				this._mashtab = value;
				/*for (var i = 0; i < this.arrSplice.length; i++) {
					if (this.arrSplice[i].life==false) continue;				
					this.arrSplice[i].draw1();
				}*/
			}			
		},
		get: function () {			
		 	return this._mashtab;
		}
	},

/*	height: {
		set: function (value) {	
			if(this._height!=value)	{
				this._height = value;
				trace("@@@@@@@@@@",value)
				for (var i = 0; i < this.arrSplice.length; i++) {
					this.arrSplice[i].height=this._height;
					this.arrSplice[i].draw1();
					//this.addObjFun(this.arrSplice[i])
				}
				this.bigDrag()
				this.par.korektHeight()
			}			
		},
		get: function () {			
		 	return this._height;
		}
	},*/

	height: {
		set: function (value) {	
					
			
			for (var i = 0; i < this.arrSplice.length; i++) {				
				if(this.arrSplice[i].height>=this._height){
					this.arrSplice[i].height = value;
					this.arrSplice[i].draw1();
				}				
			}
			var pp,ppOld
			ppOld=	Math.round(this._height+this._height1)	
			pp=	Math.round(value+this._height1)
			for (var i = 0; i < this.avp.length; i++) {				
				if(this.avp[i].position.z>=ppOld){
					//this.avp[i].position.z=pp
				}
			}
			for (var i = 0; i < this.arrPoint.length; i++) {				
				if(this.arrPoint[i].position.z>=ppOld){
					this.arrPoint[i].position.z=pp
				}
			}	

			for (var i = 0; i < this.arrPoint.length; i++) {
				//if(-Math.round(this.arrPoint[i].position.z)==Math.round(this._height+this._height1)){
					//this.arrPoint[i].position.z=-Math.round(this._height+this._height1)
				//}


				if (!this.arrPoint[i].life) continue;
				this.arrPoint[i].dragGG();								
			}

			this._height = value;





		},
		get: function () { return this._height; }
	},


	height1: {
		set: function (value) {	
			if(this._height1!=value)	{
				this._height1 = value;
				for (var i = 0; i < this.arrSplice.length; i++) {
					this.arrSplice[i].height1=this._height1;
					this.arrSplice[i].draw1();
				}
			}			
		},
		get: function () {			
		 	return this._height1;
		}
	},

	carrier: {
		set: function (value) {			
			if (this._carrier === value) return;			
			this._carrier = value;
			this._delph =this.getDelphToBoolS(this._carrier,this._out,this._adjacent);
			
		},
		get: function () { return this._carrier; }
	},

	out: {
		set: function (value) {			
			if (this._out === value) return;			
			this._out = value;
			this._delph =this.getDelphToBoolS(this._carrier,this._out,this._adjacent);
			
		},
		get: function () { return this._out; }
	},

	adjacent: {
		set: function (value) {			
			if (this._adjacent === value) return;			
			this._adjacent = value;
			this._delph =this.getDelphToBoolS(this._carrier,this._out,this._adjacent);
			
		},
		get: function () { return this._adjacent; }
	},


	colorC0: {
		set: function (value) {	
			if(this._colorC0 == value)	return			
			this._colorC0 = value;			
			this._colorC0_ =this.convertC(value)			
			for (var i = 0; i < this.arrSplice.length; i++) {								
				this.arrSplice[i].draw1();
			}
		},
		get: function () {			
		 	return this._colorC0;
		}
	},

	colorC1: {
		set: function (value) {
			if(this._colorC1 == value)	return							
			this._colorC1 = value;
			
			this._colorC1_ =this.convertC(value)			
			for (var i = 0; i < this.arrSplice.length; i++) {								
				this.arrSplice[i].draw1();
			}
		},
		get: function () {			
		 	return this._colorC1;
		}
	},

	delphC0: {
		set: function (value) {	
			if(this._delphC0 == value)	return					
			this._delphC0 = value;			
			this._delph=this.getDelphToBoolS(this._carrier,this._out,this._adjacent)				
			for (var i = 0; i < this.arrSplice.length; i++) {
				this.arrSplice[i].delph =this.getDelphToBoolS(this.arrSplice[i].carrier,this.arrSplice[i].out,this.arrSplice[i].adjacent)					
			}
		},
		get: function () {			
		 	return this._delphC0;
		}
	},

	delphC1: {
		set: function (value) {	
			if(this._delphC1 == value)	return					
			this._delphC1 = value;
			this._delph=this.getDelphToBoolS(this._carrier,this._out,this._adjacent)		
						
			for (var i = 0; i < this.arrSplice.length; i++) {
				this.arrSplice[i].delph =this.getDelphToBoolS(this.arrSplice[i].carrier,this.arrSplice[i].out,this.arrSplice[i].adjacent)					
			}
		},
		get: function () {			
		 	return this._delphC1;
		}
	},

	delphPlus: {
		set: function (value) {	
			if(this._delphPlus == value)	return					
			this._delphPlus = value;			
			this._delph=this.getDelphToBoolS(this._carrier,this._out,this._adjacent)				
			for (var i = 0; i < this.arrSplice.length; i++) {								
				if(this.arrSplice[i].carrier==true){
					this.arrSplice[i].delph =this.getDelphToBoolS(this.arrSplice[i].carrier,this.arrSplice[i].out,this.arrSplice[i].adjacent)					
				}				
			}
		},
		get: function () {			
		 	return this._delphPlus;
		}
	},

	

	


	color: {
		set: function (value) {	
				
			this._color = value;
			
			this._colorP =this.convertC(value)
			this._colorP1 = this.convertC(value,[0.8,0.8,0.8])
			for (var i = 0; i < this.arrSplice.length; i++) {
				this.arrSplice[i].colorP = this._colorP;
				this.arrSplice[i].colorP1 = this._colorP1;				
				this.arrSplice[i].draw1();
			}
		},
		get: function () {
			
		 	return this._color;
		}
	},


	alpha: {
		set: function (value) {			
			this._alpha = value;
			for (var i = 0; i < this.arrSplice.length; i++) {
				this.arrSplice[i].alpha = this._alpha;
				this.arrSplice[i].draw1();
			}
		},
		get: function () { return this._alpha; }
	},




	



	amSten: {
		set: function (value) {
			if(this._amSten != value){
				this._amSten = value;
				for (var i = 0; i < this.arrSplice.length; i++) {
					if (!this.arrSplice[i].life) continue;	
					this.arrSplice[i].activMouse =  value;
									
				}
			}
		},
		get: function () { return this._amSten; }
	},
	

	amPoint: {
		set: function (value) {
			if(this._amPoint != value){
				this._amPoint = value;
				for (var i = 0; i < this.arrPoint.length; i++) {
					if (!this.arrPoint[i].life) continue;					
					this.arrPoint[i].activMouse =  value;								
				}
			}
		},
		get: function () { return this._amPoint; }
	},

	amPol: {
		set: function (value) {
			if(this._amPol != value){
				this._amPol = value;
				for (var i = 0; i < this.arrPol.length; i++) {
					if (!this.arrPol[i].life) continue;				
					this.arrPol[i].activMouse = value;
									
				}
			}
		},
		get: function () { return this._amPol; }
	},

	activMouse: {
		set: function (value) {			
			this._activMouse= value;
			this.amPol= value;	
			this.amPoint= value;	
			this.amSten= value;	
		},
		get: function () { return this._activMouse; },
	},


///////////////////////////////////////////////////////////


	colorLine: {
		set: function (value) {	
			if(this._colorLine == value)	return			
			this._colorLine = value;			
			this._colorLine_ =this.convertC(value)
			this.worldBlok._colorLine_=this._colorLine_;		
			this.worldBlok.colorLine=this._colorLine_;	
					
			for (var i = 0; i < this.arrSplice.length; i++) {								
				this.arrSplice[i].draw1();
			}
		},
		get: function () {			
		 	return this._colorLine;
		}
	},


	sizeLine: {
		set: function (value) {	
			if(this._sizeLine == value)	return					
			this._sizeLine = value;			
			this.worldBlok.sizeLine=value;			
			for (var i = 0; i < this.arrSplice.length; i++) {
				this.arrSplice[i].delph =this.getDelphToBoolS(this.arrSplice[i].carrier,this.arrSplice[i].out,this.arrSplice[i].adjacent)					
			}
		},
		get: function () {			
		 	return this._sizeLine;
		}
	},

///////////////////////////////////////////////////////////
	



	activeSten: {
		set: function (value) {
			
			this._activeSten = value;
			for (var i = 0; i < this.arrSplice.length; i++) {
				if (!this.arrSplice[i].life) continue;	
				if(i==this._activeSten){
					this.arrSplice[i].active = true;
				}else{
					this.arrSplice[i].active = false;
				}				
			}
		},
		get: function () { return this._activeSten; }
	},


	activePoin: {
		set: function (value) {
			
			this._activePoin = value;
			for (var i = 0; i < this.arrPoint.length; i++) {
				if (!this.arrPoint[i].life) continue;	
				if(i==this._activePoin){
					this.arrPoint[i].active = true;
				}else{
					this.arrPoint[i].active = false;
				}				
			}
		},
		get: function () { return this._activePoin; }
	},
	activePol: {
		set: function (value) {
			
			this._activePol = value;
			for (var i = 0; i < this.arrPol.length; i++) {
				if (!this.arrPol[i].life) continue;	
				if(i==this._activePol){
					this.arrPol[i].active = true;
				}else{
					this.arrPol[i].active = false;
				}				
			}
		},
		get: function () { return this._activePol; }
	},	

});


