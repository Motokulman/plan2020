


import { PositionFun } from './Calc.js';
/**
* Базовый клас для точек
* @class
*/
export function SpVP (_stage) {
	var self = this;
	this.type = 'SpVP';
	this.tipe = 'SpVP';
	this.stage = _stage;
	this.par = _stage;
	this.idArr=-1;

	this._life = true;
	this._inSten=false;

	
	this._uuid = calc.generateUUID();
	
	this._objInLine=undefined;

	this.array=[];
	this.arrayClass = [];// базовые классы

	this.addObjInLine= function (objInLine) {

	}

	this.drawpositVP = function () {

	}

	this.drawposit = function () {
		for (var i = 0; i < self.array.length; i++) {
			if(self.array[i].drawpositVP)self.array[i].drawpositVP(self);
		}
		self.drawpositVP();
		/*for (var i = 0; i < self.arrayClass.length; i++) {
			if(self.arrayClass[i].drawpositVP)self.arrayClass[i].drawpositVP(self);
		}*/
	}

	this.position = new PositionFun(0,0,this.drawposit);

}

SpVP.prototype = {

	set life (v) {
		if (this._life == v) return;
		this._life = v;
		for (var ii = 0; ii < this.arrayClass.length; ii++) {
			if (this.arrayClass[ii].life != undefined) this.arrayClass[ii].life = this._life;
		}

	},
	get life () {
		return this._life;
	}

	/*,

	getObj: function () {
		var o = {};
		o.type = this.type;
		o.idArr = this.idArr;
		o.position = this.position.getObj();
		return o;
	},
	setObj: function (o) {
		// this.type = o.type;
		this.position.setPoint(o.position);
	},

	restart: function (_point) {
	},
*/
	

};
