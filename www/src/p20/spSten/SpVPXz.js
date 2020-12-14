
import { SpVP } from './../sp/SpVP.js';
import { PTButton } from './PTButton.js';
//import {PointSten3D } from './PointSten3D.js';

/**
* Данные для точек дороги
* @class
* @extends SpPoint
*/
export function SpVPXz (_stage) {
	SpVP.call(this);
	var self = this;
	this.type = 'SpVPXz';
	this.tipe = 'SpVP';
	this.stage = _stage;
	this.par = _stage;
	this._height = 300;


	this._active=false
	this._activMouse=_stage._amPoint

	this.content2d = new PIXI.Container();
	this.stage.content2dPoint.addChild(this.content2d);


	/*this.graphics = new PIXI.Graphics();
    this.content2d.addChild(this.graphics);
    this.graphics.interactive = true;
    
  	this.stAct=new PTAct(this)


    this.graphics.beginFill(0x00ff00, 0.5);    
    this.graphics.drawCircle(0,0,10);*/

    this.funDragMenu=undefined;


    this.button=new PTButton(this,this.stage._colorUIActive,this.stage._colorUI,this.stage._colorUI1,8);
    this.content2d.addChild(this.button.graphics)
    this.graphics=this.button.graphics
	this.graphics.interactive = true;


    this.onDragStart=function(e){
    	if(_stage.par.sobSP!=undefined)_stage.par.sobSP("downVP",self,e)
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
   
    	/*for (var i = 0; i < a1.length; i++) {
    	
    		a1[i].dragPost();
    	}*/
    }

    this.drawpositVP = function () {
    	
    	this.doFunRend();
    	for (var i = 0; i < this.arrayObj.length; i++) {    		
    		//if(this.arrayObj[i].tipe=="SpPolygon"){
    			this.par.addObjFun(this.arrayObj[i])
    		//}
       	}
    	if(this.funDragMenu!=undefined)this.funDragMenu()
	}




    this.dragPost=function(){   	
    	 
    	this.content2d.x=this.position.x;
		this.content2d.y=this.position.y;

		
    	/*this.dragVokrug();    	 	
		this.content2d.x=this.position.x;
		this.content2d.y=this.position.y;*/


		

		//if(this.funDragMenu!=undefined)this.funDragMenu();
		
	}



	this.doFunRend=function(){ 
		this.par.addObjFun(this)
	}





	/*this.getTypeConnect = function () {
		var res = ['AidPoint'];
		if (this.arrIdSten.length > 0) {
			res.push('Sten');
		}
		return res;
	};*/
}
SpVPXz.prototype = Object.create(SpVP.prototype);
SpVPXz.prototype.constructor = SpVPXz;

SpVPXz.prototype.getObj = function () {
	var o = SpVP.prototype.getObj.call(this);
	return o;
};
SpVPXz.prototype.setObj = function (o) {
	SpVP.prototype.setObj.call(this, o);

	// if(o.type != undefined) this.type = o.type;
};


Object.defineProperties(SpVPXz.prototype, {
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

/*

	height: {
		set: function (value) {
			if (this._height == value) return;
			this._height = value;
			for (var ii = 0; ii < this.arrayClass.length; ii++) {
				if ('height' in this.arrayClass[ii]) this.arrayClass[ii].height = this._height;
			}
		},
		get: function () { return this._height; }
	},*/
	activMouse: {
		set: function (value) {
			if (this._activMouse == value) return;
			this._activMouse = value;
			this.graphics.interactive = value; 
			this.button.activMouse = value;	
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
			//this.activMouse = value;			
			if(this._life==true)this.stage.content2dPoint.addChild(this.content2d);
			else if(this.content2d.parent!=undefined)this.content2d.parent.removeChild(this.content2d);
		},
		get: function () { return this._life; }
	},

});

