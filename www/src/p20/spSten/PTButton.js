

export function PTButton (par,color,color1,color2,radius) {
	var self = this;
	this.type = 'PTButton';
	this.par = par;

	this._active=par._active;
	this._activMouse=par._activMouse;
	this._activOver=false;


	this.graphics = new PIXI.Graphics();
	

	var r,r1,a
	this.draw=function(){
		this.graphics.clear()
		r=radius+3;
		if(this._activOver==true)r+=3;
		this.graphics.beginFill(color2,a);    
    	this.graphics.drawCircle(0,0,r);

    	if(this._active==true){
    		this.graphics.beginFill(color,a); 
    	}else{
    		this.graphics.beginFill(color1,a); 
    	}

    	this.graphics.drawCircle(0,0,r-3);    	
		this.par.par.render()
	}

	this.draw()
}

PTButton.prototype = {


	set activMouse (v) {
		if (this._activMouse === v) return;			
		this._activMouse = v;
		this.draw()
	},
	get activMouse () {
		return this._activMouse;
	},

	set active (v) {
		if (this._active === v) return;			
		this._active = v;
		this.draw()
	},
	get active () {
		return this._active;
	},

	set activOver (v) {
		if (this._activOver === v) return;			
		this._activOver = v;
		this.draw()
	},
	get activOver () {
		return this._activOver;
	},

}



/*
export function PTAct (par) {

	var self = this;
	this.type = 'PTAct';
	this.par = par;
	this._sahAct=0;

	this._sahPlus=0;

	this.arrVorur=this.par.arrVorur;	
	this.graphics = new PIXI.Graphics();
    this.par.content2d.addChild(this.graphics);
    this.graphics.alpha=this._sahAct/100;

    this.graphics.beginFill(par.par.colorUI);    
    this.graphics.drawCircle(0,0,15);
    

    this.corektSetGet=function(){
		this.graphics.alpha = (this._sahAct+this._sahPlus)/100;	
		this.par.par.render()
    }

}
PTAct.prototype = {


	set sahAct (v) {
		if (this._sahAct === v) return;			
		this._sahAct = v;
		this.corektSetGet()
	},
	get sahAct () {

		return this._sahAct;
	},

	set sahPlus (v) {
		if (this._sahPlus === v) return;		
		this._sahPlus = v;
		this.corektSetGet()
	},
	get sahPlus () {

		return this._sahPlus;
	},
}*/