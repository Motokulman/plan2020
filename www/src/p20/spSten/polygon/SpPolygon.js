

import { SpPol } from './../../sp/SpPol.js';
import { SSPolygon2D } from './SSPolygon2D.js';
import { SSP3D } from './SSP3D.js';

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
	this._active = false;

	this._uuid=calc.generateRendom(2);
	
	this.arrayClass=[]
    //хрень под
    this.content2d = new PIXI.Container();
	_stage.content2d1.addChild(this.content2d);


	this.cont2dVerh = new PIXI.Container();
	_stage.cont2dVerh.addChild(this.cont2dVerh);
	this.cont2dVerh.visible=false

	this.ssPolygon2d=new SSPolygon2D(this);
	this.ssP3d=new SSP3D(this);

	this.arrayClass.push(this.ssPolygon2d);
	this.draw1 = function (b) {
		this.ssPolygon2d.draw1();
	}


	this.drag = function () {
		self.par.addObjFun(self);
	};


	this.dragPost=function(){
		this.draw1();
		this.ssP3d.draw1();
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
	var o = SpPol.prototype.getObj.call(this);
	trace(">>>>>>>>>>",o)
	return o;
};
SpPolygon.prototype.setObj = function (o) {
	SpPol.prototype.setObj.call(this, o);
	trace("000000000",o)
	
};
SpPolygon.prototype.compare = function (_sten) {
	var rez = true;
	if (!SpPol.prototype.compare(this, _sten)) rez = false;
	return rez;
};
SpPolygon.prototype.setSten = function (_sten) {
	SpPol.prototype.setSten.call(this, _sten);
};
SpPolygon.prototype.restart = function () {
	SpPol.prototype.restart(this);
	//this.windows.clear();
	//this.content2d.addChild(this.sten2D.content2d);
	//this.stage.configureSpPol(this);
};

SpPolygon.prototype.drag = function () {
	SpPol.prototype.drag.call(this);
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


			

			if(this._life==true)this.stage.cont2dVerh.addChild(this.cont2dVerh);
			else if(this.cont2dVerh.parent!=undefined)this.cont2dVerh.parent.removeChild(this.cont2dVerh);

			if(this._life==true)this.stage.content2d1.addChild(this.content2d);
			else if(this.content2d.parent!=undefined)this.content2d.parent.removeChild(this.content2d);

			this._setAllParam('life', this._life);

		},
		get: function () { return this._life; }
	},
	active: {
		set: function (value) {
			if (this._active === value) return;			
			this._active = value;
			this.cont2dVerh.visible=this._active

			this._setAllParam('active', this._active);
		},
		get: function () { return this._active; }
	},

});



