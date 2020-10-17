
//import { TriangulateShape } from './TriangulateShape.js';
import { SpliceSten } from './SpliceSten.js';
import { SpPointSten } from './SpPointSten.js';
import { SpDebugPixi } from './SpDebugPixi.js';
//import { Pol3D } from './Pol3D.js';
import { SpStage } from './../sp/SpStage.js';
import {  Calc } from './../Calc.js';


import {  SPLineWord } from './SPLineWord.js';
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
	

	this._color="#c5d6e0";
	this._colorP=0xc5d6e0;
	this._colorP1=0xc5d6e0;

	this._mashtab=par._mashtab;

	//this._mashtab = 1;
	this._amSten=false;
	this._amPoint=false;
	this._amPol=false;
	this._activMouse=false;

	this._activeSten=-1;
	this._activePoint=-1;
	this._activePol=-1;
	this._height = 300;

	this._alpha=1;

	this._status=2;
	




	this.boolText = true;
	this.content2d = new PIXI.Container();

	this.content2d1 = new PIXI.Container();
	this.content2d2 = new PIXI.Container();
	this.content2dPoint = new PIXI.Container();	
	this.cont2dLine = new PIXI.Container();


	this.content2d.addChild(this.content2d1);
    this.content2d.addChild(this.content2d2);
    this.content2d.addChild(this.content2dPoint);
    this.content2d.addChild(this.cont2dLine);



	/*this.debugPixi = new SpDebugPixi();
	this.spCalc.setDebug(this.debugPixi);
	this.content2d.addChild(this.debugPixi.content2d);*/




	this.lineWord=new SPLineWord(this);


	


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





	
	this.getPoint=function(){ return new SpPointSten(this);}
	this.getSplice=function(){ 
	
		return new SpliceSten(this);
	}/**/
	//this.getPol=function(){ return new Pol3D(this);}


	this.arrFun=[];
	this.arrObj=[];
	

	
	this.render=function(){
		
		
		if(this.par.renderDebag)this.par.renderDebag()

	}

	//возврощает габаритный контейнер
	this.getRect=function(aPoint, aSten){ 

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

		var r={x:9999999,y:999999,x1:-9999999,y1:-9999999,w:0,h:0}
		for (var i = 0; i < aPoint.length; i++) {
			korRect(r,aPoint[i].position)	
		}
		for (var i = 0; i < aSten.length; i++) {
			aSten[i].poiskGran()
			korRect(r,aSten[i].arrGran[0])
			korRect(r,aSten[i].arrGran[1])
			korRect(r,aSten[i].arrGran[2])
			korRect(r,aSten[i].arrGran[3])

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


	this.addObjFun=function(o){
		for (let i = 0; i < this.arrObj.length; i++) {
			if(this.arrObj[i].idRandom==o.idRandom){
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

	
}
SpStageSten.prototype = Object.create(SpStage.prototype);
SpStageSten.prototype.constructor = SpStageSten;

SpStageSten.prototype.getObj = function (_activ) {
	var o = SpStage.prototype.getObj.call(this, _activ);	
	o.color=this._color;
	o.alpha=this._alpha;
	o.lineWord=this.lineWord.getObj()

	
	return o;
};
SpStageSten.prototype.setObj = function (o) {	
	SpStage.prototype.setObj.call(this, o);
	if(o.color)this.color=o.color
	if(o.alpha)this.alpha=o.alpha	
	if(o.lineWord)this.lineWord.setObj(o.lineWord)
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
	return s
};


SpStageSten.prototype.craetPol = function () {	
	var s=SpStage.prototype.craetPol.call(this);
	s.activMouse=this._amSten;
	s.col3d2=this.col3d2;
	return s
};




Object.defineProperties(SpStageSten.prototype, {
	
	status: {
		set: function (value) {	
			if(this._status!=value)	{
				this._status = value;
				if(this.content2d.parent!=undefined)this.content2d.parent.removeChild(this.content2d)	
				if(this._status==2){//не видем - не активный
					
				}
				if(this._status==1){//видный-неактивный 
					this.fun("addChild","c2dSloi",this.content2d);
				}
				if(this._status==0){//видный-неактивный 
					this.fun("addChild","c2dSloi2",this.content2d);
				}
			}			
		},
		get: function () {			
		 	return this._status;
		}
	},

	mashtab: {
		set: function (value) {	
			if(this._mashtab!=value)	{
				this._mashtab = value;
				
			}			
		},
		get: function () {			
		 	return this._mashtab;
		}
	},
	



	color: {
		set: function (value) {	
				
			this._color = value;
			
			this._colorP=this.convertC(value)
			this._colorP1=this.convertC(value,[0.8,0.8,0.8])
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




	height: {
		set: function (value) {			
			this._height = value;
			for (var i = 0; i < this.arrSplice.length; i++) {
				this.arrSplice[i].height = this._height;
			}

			for (var i = 0; i < this.arrPoint.length; i++) {
				if (!this.arrPoint[i].life) continue;					
				this.arrPoint[i].dragGG();								
			}

		},
		get: function () { return this._height; }
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
		get: function () { return this._activMouse; }
	},



	



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
