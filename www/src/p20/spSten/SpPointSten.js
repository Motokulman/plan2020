
import { SpPoint } from './../sp/SpPoint.js';
import { PTButton } from './PTButton.js';
//import {PointSten3D } from './PointSten3D.js';

/**
* Данные для точек дороги
* @class
* @extends SpPoint
*/
export function SpPointSten (_stage) {
	SpPoint.call(this);
	var self = this;
	this.type = 'SpPointSten';
	this.tipe = 'SpPointSten';
	this.stage = _stage;
	this.par = _stage;
	this._height = 300;

	this._active=false
	this._activMouse=_stage._amPoint

	this.content2d = new PIXI.Container();
	this.stage.content2dPoint.addChild(this.content2d);


	/*this.graphics = new PIXI.Graphics();
    this.content2d.addChild(this.graphics);
    
    
    //this.stAct=new PTAct(this)

    this.graphics.beginFill(0xff0000, 0.3);    
    this.graphics.drawCircle(0,0,15);*/

    this.funDragMenu=undefined;

    this.button=new PTButton(this,this.stage._colorUIActive,this.stage._colorUI,this.stage._colorUI1,15);
    this.content2d.addChild(this.button.graphics)
    this.graphics=this.button.graphics
	this.graphics.interactive = true;

    this.onDragStart=function(e){
    	if(_stage.par.sobSP!=undefined)_stage.par.sobSP("downPoint",self,e)
    }

    this.graphics.interactive = this._activMouse;            
    this.graphics.on('mousedown', this.onDragStart);

    this.graphics.on('mouseover', function(e){    	
    	//self.stAct.sahPlus=10; 
    	self.button.activOver=true;
    });
    this.graphics.on('mouseout', function(e){    	
    	//self.stAct.sahPlus=0; 
    	self.button.activOver=false;
    });





    this.funDragVokrug=function(a,a1){   
   
    	for (var i = 0; i < a1.length; i++) {
    	
    		a1[i].dragPost();
    	}
    }



    this.dragPost=function(){   	
    	//this.drag(); 
    	this.dragVokrug();    	 	
		this.content2d.x=this.position.x;
		this.content2d.y=this.position.y;


		/*for (var i = 0; i < this.arrSHron.length; i++) {
			this.arrSHron[i].sten.drag();
			this.arrSHron[i].sten.dragPost();
		}*/


		if(this.funDragMenu!=undefined)this.funDragMenu();
		
	}



	this.doFunRend=function(){ 
		this.par.addObjFun(this)
	}





	this.getTypeConnect = function () {
		var res = ['AidPoint'];
		if (this.arrIdSten.length > 0) {
			res.push('Sten');
		}
		return res;
	};
}
SpPointSten.prototype = Object.create(SpPoint.prototype);
SpPointSten.prototype.constructor = SpPointSten;

SpPointSten.prototype.getObj = function () {
	var o = SpPoint.prototype.getObj.call(this);
	o.type = this.type;

	return o;
};
SpPointSten.prototype.setObj = function (o) {
	SpPoint.prototype.setObj.call(this, o);

	// if(o.type != undefined) this.type = o.type;
};


Object.defineProperties(SpPointSten.prototype, {
	// Отображение точек

	active: {
		set: function (value) {
			if (this._active == value) return;
			this._active = value;
			//this.stAct.sahAct=value ? 40: 0;
			this.button.active=this._active
			for (var ii = 0; ii < this.arrayClass.length; ii++) {
				if ('active' in this.arrayClass[ii]) this.arrayClass[ii].active = this._active;
			}
		},
		get: function () { return this._active; }
	},

	height: {
		set: function (value) {
			if (this._height == value) return;
			this._height = value;
			for (var ii = 0; ii < this.arrayClass.length; ii++) {
				if ('height' in this.arrayClass[ii]) this.arrayClass[ii].height = this._height;
			}
		},
		get: function () { return this._height; }
	},
	activMouse: {
		set: function (value) {
			if (this._activMouse == value) return;
			this._activMouse = value;
			this.button.activMouse = value;	
			this.graphics.interactive = value; 
			console.warn(this.idArr+"   "+this._activMouse+"   "+this._life)
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
					
			if(this._life==true)this.stage.content2dPoint.addChild(this.content2d);
			else if(this.content2d.parent!=undefined)this.content2d.parent.removeChild(this.content2d);
		},
		get: function () { return this._life; }
	},

});





