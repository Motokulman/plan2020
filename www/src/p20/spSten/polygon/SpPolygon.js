

import { SpPol } from './../../sp/SpPol.js';
import { SSPolygon2D } from './SSPolygon2D.js';

export function SpPolygon (_stage) {
	SpPol.call(this,_stage);
	var self = this;
	this.type = 'SpPolygon';
	this.tipe = 'SpPolygon';
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
	
	this.arrayClass=[]
    //хрень под
    this.content2d = new PIXI.Container();
	_stage.content2d1.addChild(this.content2d);


	this.ssPolygon2d=new SSPolygon2D(this);


	this.draw1 = function (b) {
		this.ssPolygon2d.draw1();
	}


	this.drag = function () {
		self.par.addObjFun(self);
	};


	this.dragPost=function(){		

		this.draw1();
	}



	var rez,bp,bp1,res
	var arrayCol=[]
	this.isRect=function(r,b){
		//return this.matematik.isRect(r,b)
	}


	///////////////////////////////
	
	/*
    
	this.animat=function(time){
		this.ss2d.animat(time)
	}

*/
	
}
SpPolygon.prototype = Object.create(SpPol.prototype);
SpPolygon.prototype.constructor = SpPolygon;

SpPolygon.prototype.getObj = function () {
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
SpPolygon.prototype.setObj = function (o) {
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
SpPolygon.prototype.compare = function (_sten) {
	var rez = true;
	if (!Splice.prototype.compare(this, _sten)) rez = false;
	return rez;
};
SpPolygon.prototype.setSten = function (_sten) {
	Splice.prototype.setSten.call(this, _sten);
};
SpPolygon.prototype.restart = function () {
	Splice.prototype.restart(this);
	//this.windows.clear();
	//this.content2d.addChild(this.sten2D.content2d);
	//this.stage.configureSplice(this);
};

SpPolygon.prototype.drag = function () {
	Splice.prototype.drag.call(this);
	this.stage.addObjFun(this);
	
};
Object.defineProperties(SpPolygon.prototype, {

	life: {
		set: function (value) {
			if (this._life == value) return;
			this._life = value;		
			for (var ii = 0; ii < this.arrayClass.length; ii++) {
				if ('life' in this.arrayClass[ii]) this.arrayClass[ii].life = this._life;
			}


			
/*
			if(this._life==true)this.stage.content2d2.addChild(this.content2d);
			else if(this.content2d.parent!=undefined)this.content2d.parent.removeChild(this.content2d);
*/
			if(this._life==true)this.stage.content2d1.addChild(this.content2d);
			else if(this.content2d.parent!=undefined)this.content2d.parent.removeChild(this.content2d);



		},
		get: function () { return this._life; }
	},

});



