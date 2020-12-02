
/*

import { Windows } from './Windows.js';
import { Sten3D } from './Sten3D.js';
*/
import { Splice } from './../../sp/Splice.js';
import { SPLWindow } from './SPLWindow.js';
import { SS2D } from './SS2D.js';
import { SS3D } from './SS3D.js';

import { SSMatematik} from './SSMatematik.js';
/**
* Стена(линия)
* @class
* @extends Splice
*/
export function SpliceSten (_stage) {
	Splice.call(this,_stage);
	var self = this;
	this.type = 'SpliceSten';
	this.tipe = 'SpliceSten';
	this.stage = _stage;
	this.par = _stage;
	this._boolText = true;
	this._active = false;
	this.idUi=Math.round(Math.random()*1000);
	this.sUi = -1;
	this._offset=0;
	this._bChaz=false;
	this._delph = _stage._delph;// толщина линии

	this._uuid=calc.generateRendom(2);

	this._height=_stage._height;
	this._height1=_stage._height1;

	this._carrier = _stage.carrier;// несущия
	this._out = _stage.out;// несущия
	this._adjacent = _stage.adjacent;// несущия

	

	if(this._carrier==true)this._delph =_stage._delphC1;
	else this._delph =_stage._delphC0;
    
    this.alpha =_stage._alpha;    
    this.colorP = _stage._colorP;
    this.colorP1 = _stage._colorP1;
	this._height = this.stage._height;



    this.aVKol=0
    this.arrVorur = [new Position(), new Position(), new Position(), new Position(), new Position(), new Position(), new Position(), new Position()];

    this.arrGran = [new Position(), new Position(), new Position(), new Position()];
	this.rectBig={x:0,y:0,x1:0,y1:0,w:0,h:0,o:null}



    //хрень под
    this.content2d1 = new PIXI.Container();
	_stage.content2d1.addChild(this.content2d1);
	//хрень над
	this.content2d = new PIXI.Container();
	_stage.content2d2.addChild(this.content2d);

	//смещеная над
    this.cont2dOfset = new PIXI.Container();
	


	this.content3d = new THREE.Object3D();
    this.par.content3d.add(this.content3d);




	this.matematik=new SSMatematik(this);
	



	//отрисовываем 2д стены
    this.ss2d=new SS2D(this);
    this.ss3d=new SS3D(this);
    this.arrayClass.push(this.ss2d);
    this.arrayClass.push(this.ss3d);
    this.content2d.addChild(this.cont2dOfset);

    //отрисовываем окна
    this.windows=new SPLWindow(this);
    this.arrayClass.push(this.windows);


    //докидуем окна
    this.addBlok = function(blok){    	
    	if(blok==undefined)return -1;
    	return this.windows.addBlok(blok);   	
    }

    //removeBlok окна
    this.removeBlok = function(blok){
    	if(blok==undefined)return -1;
    	return this.windows.removeBlok(blok);   	
    }





 



    this.numBlok=0
    var numBlok
	this.draw1 = function (b) {
		if(b==undefined)this.windows.draw()		
		this.ss2d.draw1();
		this.ss3d.draw1();
		this.par.render();
	}




	this.dragPost=function(){		
		this.content2d.x=this.position.x;
		this.content2d.y=this.position.y;
		this.content2d.rotation=this._rotation;
	

		this.content2d1.x=this.position.x;
		this.content2d1.y=this.position.y;
		this.content2d1.rotation=this._rotation;

		this.content3d.position.x=this.position.x;
		this.content3d.position.y=this.position.y;
		this.content3d.rotation.z=this._rotation;

		
		
		
		this.ss3d.dragPost();
		this.draw1();
		this.stage.render();
		this.poiskGran();
	}



	////////////////////////////////
	var a1,d1,a
	var pNull=new Position()


	this.poiskGran=function(){
		this.matematik.poiskGran()
	}

	var rez,bp,bp1,res
	var arrayCol=[]
	this.isRect=function(r,b){
		return this.matematik.isRect(r,b)
	}


	///////////////////////////////
	
	
    
	this.animat=function(time){
		this.ss2d.animat(time)
	}


	//////////////////////////////
	var p,p1,p2
	var bb,a,pr;
	var sten;
	var pp,pp1,pp2
	this.korectOffset=function(){
		this.matematik.korectOffset()		
	}
}
SpliceSten.prototype = Object.create(Splice.prototype);
SpliceSten.prototype.constructor = SpliceSten;

SpliceSten.prototype.getObj = function () {
	var o = Splice.prototype.getObj.call(this);
	o.type = this.type;
	o.windows = this.windows.getObj();
	o.colorSten = this.colorSten;
	o.height = this.height;
	o.sUi=this.sUi;
	o.idUi=this.idUi;	
	o.offset=this.offset;
	o.bChaz=this.bChaz;

	o.carrier=this.carrier;
	o.out=this.out;
	o.adjacent=this.adjacent;
	return o;
};
SpliceSten.prototype.setObj = function (o) {
	Splice.prototype.setObj.call(this, o);
	if (o.windows !== undefined) this.windows.setObj(o.windows);
	if (o.boolText!== undefined)  this.boolText=o.boolText;
	if (o.height!== undefined)  this.height=o.height;
	//if (o.col3d!== undefined ) this.col3d=o.col3d;
	if (o.idUi!== undefined ) this.idUi=o.idUi;
	if (o.sUi!== undefined ) this.sUi=o.sUi;		
	if (o.offset!== undefined ) this.offset=o.offset;
	if (o.bChaz!== undefined ) this.bChaz=o.bChaz;	

	if (o.carrier!== undefined ) this.carrier=o.carrier;
	if (o.out!== undefined ) this.out=o.out;
	if (o.adjacent!== undefined ) this.adjacent=o.adjacent;	
	
};
SpliceSten.prototype.compare = function (_sten) {
	var rez = true;
	if (!Splice.prototype.compare(this, _sten)) rez = false;
	return rez;
};
SpliceSten.prototype.setSten = function (_sten) {
	Splice.prototype.setSten.call(this, _sten);
};
SpliceSten.prototype.restart = function () {
	Splice.prototype.restart(this);
	//this.windows.clear();
	//this.content2d.addChild(this.sten2D.content2d);
	//this.stage.configureSplice(this);
};

SpliceSten.prototype.drag = function () {
	Splice.prototype.drag.call(this);
	this.stage.addObjFun(this);
	
};
Object.defineProperties(SpliceSten.prototype, {
	height: {
		set: function (value) {
			if (this._height === value) return;			
			this._height = value;
			this._setAllParam('height', this._height);
		},
		get: function () { return this._height; }
	},
	height1: {
		set: function (value) {
			if (this._heigh1 === value) return;			
			this._height1 = value;
			this._setAllParam('height1', this._height1);
		},
		get: function () { return this._height; }
	},

	boolText: {
		set: function (value) {
			if (this._boolText === value) return;			
			this._boolText = value;			
			this._setAllParam('boolText', this._boolText);
		},
		get: function () { return this._boolText; }
	},


	active: {
		set: function (value) {
			if (this._active === value) return;			
			this._active = value;
	

			this._setAllParam('active', this._active);
		},
		get: function () { return this._active; }
	},

	activMouse: {
		set: function (value) {
			if (this._activMouse == value) return;
			this._activMouse = value;			
			for (var ii = 0; ii < this.arrayClass.length; ii++) {
				if ('activMouse' in this.arrayClass[ii]) this.arrayClass[ii].activMouse = this._activMouse;
			}
		},
		get: function () { return this._activMouse; }
	},


	life: {
		set: function (value) {
			if (this._life == value) return;
			this._life = value;		
			for (var ii = 0; ii < this.arrayClass.length; ii++) {
				if ('life' in this.arrayClass[ii]) this.arrayClass[ii].life = this._life;
			}

			if(this._life==true)this.par.content3d.add(this.content3d);
			else if(this.content3d.parent!=undefined)this.content3d.parent.remove(this.content3d);
			

			if(this._life==true)this.stage.content2d2.addChild(this.content2d);
			else if(this.content2d.parent!=undefined)this.content2d.parent.removeChild(this.content2d);

			if(this._life==true)this.stage.content2d1.addChild(this.content2d1);
			else if(this.content2d1.parent!=undefined)this.content2d1.parent.removeChild(this.content2d1);



		},
		get: function () { return this._life; }
	},
	
	carrier: {
		set: function (value) {			
			if (this._carrier === value) return;			
			this._carrier = value;			
			this.delph=this.par.getDelphToBoolS(this._carrier,this._out,this._adjacent)	
			this.draw1();				
			
		},
		get: function () { return this._carrier; }
	},

	out: {
		set: function (value) {			
			if (this._out === value) return;			
			this._out = value;
			this.delph=this.par.getDelphToBoolS(this._carrier,this._out,this._adjacent)	
			this.draw1();
			
		},
		get: function () { return this._out; }
	},

	adjacent: {
		set: function (value) {			
			if (this._adjacent === value) return;			
			this._adjacent = value;
			this.delph=this.par.getDelphToBoolS(this._carrier,this._out,this._adjacent)	
			this.draw1();
			
		},
		get: function () { return this._adjacent; }
	},

	offset: {
		set: function (value) {
			if (this._offset === value) return;
			this._offset = value;	
			this.cont2dOfset.position.y=this._offset
			this._setAllParam('offset', this._offset);
			if(this.funDragMenu!=undefined)this.funDragMenu();
			this.stage.render()
		},
		get: function () { return this._offset; }
	},
	
	bChaz: {
		set: function (value) {
			if (this._bChaz === value) return;
			this._bChaz = value;	
		
			this._setAllParam('bChaz', this._bChaz);
			if(this.funDragMenu!=undefined)this.funDragMenu();
			this.stage.render()
		},
		get: function () { return this._bChaz; }
	},
});



