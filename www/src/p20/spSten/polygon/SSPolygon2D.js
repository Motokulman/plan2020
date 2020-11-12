


export class SSPolygon2D  {
  	constructor(par,fun) {  		
  		this.type="SSPolygon2D";
        this.typeNa="SSPolygon2D";
        var self=this;
        this.par=par;


        


        this.content2d = new PIXI.Container();
        this.par.content2d.addChild(this.content2d);

   

        this.graphics = new PIXI.Graphics();
    	this.content2d.addChild(this.graphics);

		this.stAct=new STAct1(this)

    	
	   	this.onDragStart=function(e){

			if(self.par.par.par.sobSP!=undefined)self.par.par.par.sobSP("downPol",self.par,e)
	    }

	    this.graphics.interactive = true;            
	    this.graphics.on('mousedown', this.onDragStart);


	    this.graphics.on('mouseover', function(e){    	
	    	self.stAct.sahPlus=10;    	
	    });
	    this.graphics.on('mouseout', function(e){    	
	    	self.stAct.sahPlus=0;    
	    });


	    this.color=Math.random()*0xffffff

		this.draw1 = function () {

			this.stAct.draw1()


			this.graphics.clear();
			this.graphics.beginFill(this.color, 1);
		
			this.graphics.lineStyle( this.par.par._sizeLine, this.par.par._colorLine_, 1);

			if(this.par.array.length!=0){
				this.graphics.moveTo(this.par.array[0].position.x,this.par.array[0].position.y);
				for (var i = 1; i < this.par.array.length; i++) {
					this.graphics.lineTo(this.par.array[i].position.x,this.par.array[i].position.y);
				}
				this.graphics.lineTo(this.par.array[0].position.x,this.par.array[0].position.y);
			}
		}	
    }
}



//отрисовывает активную хрень над
export function STAct1 (par) {
	var self = this;
	this.type = 'STAct';
	this.par = par;
	this._sahAct=0;

	this._sahPlus=0;

	this.arrVorur=this.par.arrVorur;	
	this.graphics = new PIXI.Graphics();
    this.par.content2d.addChild(this.graphics);
    this.graphics.alpha=this._sahAct/100;

    this.draw1=function(){
		this.graphics.clear();

		
		/*this.graphics.beginFill(par.par.colorUI);		
		this.graphics.moveTo(this.par.arrVorur[0].x,this.par.arrVorur[0].y);
		for (var i = 1; i < this.par.aVKol; i++) {
			this.graphics.lineTo(this.par.arrVorur[i].x,this.par.arrVorur[i].y);				
		}
		this.graphics.lineTo(this.par.arrVorur[0].x,this.par.arrVorur[0].y);*/

		this.graphics.beginFill(par.par.colorUI);	

		if(this.par.par.array.length!=0){
			this.graphics.moveTo(this.par.par.array[0].position.x,this.par.par.array[0].position.y);
			for (var i = 1; i < this.par.par.array.length; i++) {
				this.graphics.lineTo(this.par.par.array[i].position.x,this.par.par.array[i].position.y);
			}
			this.graphics.lineTo(this.par.par.array[0].position.x,this.par.par.array[0].position.y);
		}



    }

    this.corektSetGet=function(){
		this.graphics.alpha = (this._sahAct+this._sahPlus)/100;	
		this.par.par.par.render()
    }

}
STAct1.prototype = {


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
}