

import { SpPol } from './../../sp/SpPol.js';
import { SSPolygon2D } from './SSPolygon2D.js';
import { SSP3D } from './SSP3D.js';

import { PUnikBase } from './PUnikBase.js';


export function SpPolygon (_stage, _unikName) {
	SpPol.call(this,_stage);
	var self = this;
	this.type = 'SpPolygon';
	this.tipe = 'SpPolygon';

	this.unikName="PUnikBase";


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
	
	this.triangulateShape = this.stage.triangulateShape;

	this.arrayClass=[]
    //хрень под
    this.content2d = new PIXI.Container();
	_stage.content2d1.addChild(this.content2d);


	this.cont2dVerh = new PIXI.Container();
	_stage.cont2dVerh.addChild(this.cont2dVerh);
	this.cont2dVerh.visible=false;


	



	this.ssPolygon2d=new SSPolygon2D(this);
	this.ssP3d=new SSP3D(this);



	if(this.unikName=="PUnikBase")this.unik = new PUnikBase(this);

	

	this.draw1 = function () {		
		this.dragRect()
		
		trace(this.rectBig)
		this.dragNaTriang()
		this.unik.draw1();
		
	}


	this.drag = function () {
		self.par.addObjFun(self);
	};


	this.dragPost=function(){
		this.draw1();
		
	}



	var rez,bp,bp1,res
	var arrayCol=[]
	this.rectBig={x:0,y:0,z:0,x1:0,y1:0,z1:0,w:0,h:0,d:0,o:null}

	this.dragRect=function(){
		this.rectBig.x=99999999999;
        this.rectBig.y=99999999999;
        this.rectBig.x1=-29999999999;
        this.rectBig.y1=-29999999999;
        for (var i = 0; i < this.array.length; i++) {
        	if(this.rectBig.x>this.array[i].position.x)this.rectBig.x=this.array[i].position.x;
        	if(this.rectBig.x1<this.array[i].position.x)this.rectBig.x1=this.array[i].position.x;
        	if(this.rectBig.y>this.array[i].position.y)this.rectBig.y=this.array[i].position.y;
        	if(this.rectBig.y1<this.array[i].position.y)this.rectBig.y1=this.array[i].position.y;

        	if(this.rectBig.z>this.array[i].position.z)this.rectBig.z=this.array[i].position.z;
        	if(this.rectBig.z1<this.array[i].position.z)this.rectBig.z1=this.array[i].position.z;	
        }
    	this.rectBig.w=this.rectBig.x1-this.rectBig.x;
        this.rectBig.h=this.rectBig.y1-this.rectBig.y;
        this.rectBig.d=this.rectBig.z1-this.rectBig.z;
        //this.rectBig.y-=this.rectBig.h;
	}



	this.arrPosition=[]
	this.arrTiang=[]
	var shTr
	this.shTr
	this.dragNaTriang=function(){
		this.arrPosition.length = 0;	
		for (var i = 0; i < this.array.length; i++) {			
			this.arrPosition.push(this.array[i].position);
		}
		this.triangulateShape.segment.x = 0.5;
		this.triangulateShape.segment.y = 0.5;
		this.triangulateShape.segment.width = this.rectBig.w;
		this.triangulateShape.segment.height = this.rectBig.h;
		this.triangulateShape.segment.rotation = 0;
		this.triangulateShape.start(this.arrPosition);// триангулируем
		//self.arrTriangleBig = self.triangulate(self.arrPoint);
		
		var ar=this.triangulateShape.arrTriangleBig
		shTr=0	
		for (var i = 0; i < ar.length; i++) {

			if(this.arrTiang[shTr]==undefined){
				this.arrTiang[shTr]=[new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3()]
			}
			this.arrTiang[shTr][0].set(ar[i][0].x,ar[i][0].y,-ar[i][0].z);
			this.arrTiang[shTr][1].set(ar[i][1].x,ar[i][1].y,-ar[i][1].z);
			this.arrTiang[shTr][2].set(ar[i][2].x,ar[i][2].y,-ar[i][2].z);

			/*this.arrTiang[shTr][0].set(ar[i][0].x,ar[i][0].y,ar[i][0].z);
			this.arrTiang[shTr][1].set(ar[i][1].x,ar[i][1].y,ar[i][0].z);
			this.arrTiang[shTr][2].set(ar[i][2].x,ar[i][2].y,ar[i][0].z);*/

			
			this.ssP3d.planeXZ.addLine(this.arrTiang[shTr][0],this.arrTiang[shTr][1])
			this.ssP3d.planeXZ.addLine(this.arrTiang[shTr][1],this.arrTiang[shTr][2])
			this.ssP3d.planeXZ.addLine(this.arrTiang[shTr][2],this.arrTiang[shTr][0])
			
			shTr++;	
			this.shTr=shTr		
		}


		this.ssP3d.planeXZ.upDate()
		/*this.par.ssP3d.planeXZ.addLine(this.arrPoint[i],this.arrPoint[0]);
                    }
                }
                */
	}



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
	
	return o;
};
SpPolygon.prototype.setObj = function (o) {
	SpPol.prototype.setObj.call(this, o);
	
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



