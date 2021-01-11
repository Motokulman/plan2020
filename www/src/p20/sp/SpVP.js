


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
	this.gronVL=undefined;
	
	this._uuid = calc.generateRendom(2);
	this.uuid = this._uuid;
	
	this._objInLine=undefined;

	this.array=[];
	this.arrayClass = [];// базовые классы


	this.addObjInLine= function (objInLine) {

	}

	this.drawpositVP = function () {

	}

	this.arrayObj=[]
	this.addPol = function (pol) {
		this.arrayObj.push(pol);
	}

	this.removePol = function (pol) {
		this.arrayObj.push(pol);
	}

	this.removePol = function (pol) {
		var r=null
		trace(this.arrayObj)
		for (var i = 0; i < this.arrayObj.length; i++) {

			if(pol.uuid==this.arrayObj[i].uuid){
				this.arrayObj.splice(i,1)
				if(r==null)r=0
				r++;
				pol.removePoint(this)
				i=0;
			}
		}
		if(this.arrayObj.length==0)this.clear()
		this.stage.render()		
		return r;
	};

	this.clear= function () {		
		for (var ii = 0; ii < this.arrayClass.length; ii++) {
			if (typeof (this.arrayClass[ii].clear) === 'function') this.arrayClass[ii].clear();
		}

		for (var i = this.arrayObj.length-1; i >=0; i--) {			
			if(this.arrayObj[i]!=undefined)this.removePol(this.arrayObj[i])
		}

		this.life = false;
		this.stage.render()
	}
	

	



	this.drawposit = function () {	
		console.warn("zzzz",self.position.z)
		for (var i = 0; i < self.array.length; i++) {
			if(self.array[i].drawpositVP)self.array[i].drawpositVP(self);
		}
		self.drawpositVP();		
	}

	this.position = new PositionFun(0,0,0,this.drawposit);





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
	},

	getObj: function () {
		var o = {};
		o.uuid = this._uuid;		
		o.position = this.position.getObj();		

		if(this.gronVL!=undefined){			
			o.gronVL={};			
			o.gronVL.uuid=this.gronVL.par.uuid;
			o.gronVL.pros=this.gronVL.pros;
			o.gronVL.os=this.gronVL.par.os;

			
		}		

		return o;
	},
	setObj: function (o) {		
		if(o.uuid)this.uuid=this._uuid=o.uuid
		this.position.setPoint(o.position);
		if(o.gronVL!=undefined){			
			var oo = this.par.getGronVP(o.gronVL.uuid);			
			if(oo!=null){
				var oo1 = oo.add(this)
				oo1.pros=o.gronVL.pros
			}
			
		}
		
	},

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
