


export class SS2D  {
  	constructor(par,fun) {  		
  		this.type="SS2D";
        this.typeNa="SS2D";
        var self=this;
        this.par=par;


        this._life= par._life;

        var sahh=0
        this.aVKol=0
        this._mashtabText=1;

        this._distans=0
        this._delph=0
		this._rotation=0

        this.content2d = new PIXI.Container();
        this.par.content2d.addChild(this.content2d);

   

        this.graphics = new PIXI.Graphics();
    	this.content2d.addChild(this.graphics);


    	this.graphics1 = new PIXI.Graphics();
    	this.par.content2d1.addChild(this.graphics1);

    	
	   	this.onDragStart=function(e){

			if(self.par.par.par.sobSP!=undefined)self.par.par.par.sobSP("downSten",self.par,e)
	    }

	    this.graphics.interactive = true;            
	    this.graphics.on('mousedown', this.onDragStart);


	    this.graphics.on('mouseover', function(e){    	
	    	self.stAct.sahPlus=10;    	
	    });
	    this.graphics.on('mouseout', function(e){    	
	    	self.stAct.sahPlus=0;    
	    });


 		this.stAct=new STAct(this);


		this.arrVorur=par.arrVorur;
		this.arrPosit=par.arrPosit;
		this.arrPosit1=par.arrPosit1;

		this.cont2dDeb =undefined//если не то покажем рект		
		/*this.cont2dDeb = new PIXI.Container();
		this.par.stage.content2d2.addChild(this.cont2dDeb);
		this.graphDeb = new PIXI.Graphics();
		this.cont2dDeb.addChild(this.graphDeb);*/





		this.cont2dOfset = new PIXI.Container();
		this.par.cont2dOfset.addChild(this.cont2dOfset)


	    this.c2dt= new PIXI.Container();
	    this.text = new PIXI.Text('345634634',{ fontFamily : 'Arial' })//,{ font: 'bold 200px Arial', fontFamily : 'Arial', fontSize: 24, fill : 0xff1010 }); 
	    this.c2dt.addChild(this.text);
	    this.text.scale.x=this.text.scale.y=this._mashtabText;
	    this.cont2dOfset.addChild(this.c2dt);
	    this.c2dt.visible=false;

	    this.c2dt1= new PIXI.Container();
	    this.text1 = new PIXI.Text('345634634',{ fontFamily : 'Arial' })//,{ font: 'bold 200px Arial', fontFamily : 'Arial', fontSize: 24, fill : 0xff1010 }); 
	    this.c2dt1.addChild(this.text1);
	    this.text1.scale.x=this.text1.scale.y=this._mashtabText;
	    this.cont2dOfset.addChild(this.c2dt1);
	    //this.c2dt1.visible=false;

	    var numBlok

		this.draw1 = function () {
			this._distans=this.par._distans
			this._delph=this.par._delph
			this._rotation=this.par._rotation
			sahh=0;
			this.plusVor(-this.arrPosit[2].x,this.arrPosit[2].y)
			this.plusVor(-this.arrPosit[1].x,this.arrPosit[1].y)
			this.plusVor(-this.arrPosit[0].x,this.arrPosit[0].y)

			this.plusVor(this.arrPosit1[5].x+this._distans,this.arrPosit1[5].y)
			this.plusVor(this.arrPosit1[4].x+this._distans,this.arrPosit1[4].y)
			this.plusVor(this.arrPosit1[3].x+this._distans,this.arrPosit1[3].y)

			this.plusVor(this.arrPosit1[2].x+this._distans,this.arrPosit1[2].y)		
			this.plusVor(this.arrPosit1[1].x+this._distans,this.arrPosit1[1].y)
			this.plusVor(this.arrPosit1[0].x+this._distans,this.arrPosit1[0].y)

			this.plusVor(-this.arrPosit[5].x,this.arrPosit[5].y)
			this.plusVor(-this.arrPosit[4].x,this.arrPosit[4].y)
			this.plusVor(-this.arrPosit[3].x,this.arrPosit[3].y)


			this.par.aVKol=this.aVKol




			if(this.graphDeb!=undefined){//Рект глобальный показываем
				this.graphDeb.clear();	
				this.graphDeb.lineStyle(5, 0xff0000, 1);
				this.graphDeb.drawRect(this.par.rectBig.x,this.par.rectBig.y,this.par.rectBig.w,this.par.rectBig.h)
			}
			


			numBlok=this.par.windows.getNumBlok();
	



			this.graphics.clear();
			this.graphics.beginFill(this._adjacent == false ? this.par.par._colorC0_ : this.par.par._colorC1_, 0.93);
			

			if(numBlok.length==0){

				this.graphics.moveTo(this.arrVorur[0].x,this.arrVorur[0].y);
				for (var i = 0; i < this.aVKol; i++) {
					this.graphics.lineTo(this.arrVorur[i].x,this.arrVorur[i].y);
				}
				this.graphics.lineTo(this.arrVorur[0].x,this.arrVorur[0].y);


			}else{
				this.graphics.moveTo(-this.arrPosit[2].x,this.arrPosit[2].y);
				this.graphics.lineTo(-this.arrPosit[1].x,this.arrPosit[1].y);
				this.graphics.lineTo(-this.arrPosit[0].x,this.arrPosit[0].y);
				

				this.graphics.lineTo(numBlok[0],this.arrPosit[0].y);
				this.graphics.lineTo(numBlok[0],this.arrPosit[5].y);

				this.graphics.lineTo(-this.arrPosit[5].x,this.arrPosit[5].y);
				this.graphics.lineTo(-this.arrPosit[4].x,this.arrPosit[4].y);
				this.graphics.lineTo(-this.arrPosit[3].x,this.arrPosit[3].y);

				for (var i = 0; i < numBlok.length; i+=2) {
					if(i!=numBlok.length-2){
						this.graphics.moveTo(numBlok[i+1],this.arrPosit[0].y);
						this.graphics.lineTo(numBlok[i+1],this.arrPosit[5].y);

						this.graphics.lineTo(numBlok[i+2],this.arrPosit[5].y);
						this.graphics.lineTo(numBlok[i+2],this.arrPosit[0].y);

						this.graphics.lineTo(numBlok[i+1],this.arrPosit[0].y);

					}else{
						this.graphics.moveTo(this.arrPosit1[5].x+this._distans,this.arrPosit1[5].y);
						this.graphics.lineTo(this.arrPosit1[4].x+this._distans,this.arrPosit1[4].y);
						this.graphics.lineTo(this.arrPosit1[3].x+this._distans,this.arrPosit1[3].y);

						this.graphics.lineTo(this.arrPosit1[2].x+this._distans,this.arrPosit1[2].y);
						this.graphics.lineTo(this.arrPosit1[1].x+this._distans,this.arrPosit1[1].y);
						this.graphics.lineTo(this.arrPosit1[0].x+this._distans,this.arrPosit1[0].y);

						this.graphics.lineTo(numBlok[i+1],this.arrPosit1[0].y);
						this.graphics.lineTo(numBlok[i+1],this.arrPosit1[5].y);					
					}
				}			
			}



			this.graphics.beginFill(0x0000ff, 0.1);
			this.graphics.drawCircle(20,0,5)









			this.graphics1.clear();	
			var sL=this.par.par._sizeLine*2///this.par.par._mashtab
			this.graphics1.lineStyle( sL, this.par.par._colorLine_, 1);
			
		
			if(numBlok==0){
				for (var i = 0; i < this.aVKol; i++) {			
					this.graphics1.moveTo(this.arrVorur[i].x,this.arrVorur[i].y);
					if(i!=this.aVKol-1)this.graphics1.lineTo(this.arrVorur[i+1].x,this.arrVorur[i+1].y);
					else this.graphics1.lineTo(this.arrVorur[0].x,this.arrVorur[0].y);
				}
			}else{

				this.drawGrah(this.graphics1,-this.arrPosit[2].x,this.arrPosit[2].y,true)
				this.drawGrah(this.graphics1,-this.arrPosit[1].x,this.arrPosit[1].y,false)
				this.drawGrah(this.graphics1,-this.arrPosit[0].x,this.arrPosit[0].y,false)

				this.drawGrah(this.graphics1,numBlok[0],this.arrPosit[0].y,false)
				this.drawGrah(this.graphics1,numBlok[0],this.arrPosit[5].y,false)

				this.drawGrah(this.graphics1,-this.arrPosit[5].x,this.arrPosit[5].y,false)
				this.drawGrah(this.graphics1,-this.arrPosit[4].x,this.arrPosit[4].y,false)
				this.drawGrah(this.graphics1,-this.arrPosit[3].x,this.arrPosit[3].y,false)
				this.drawGrah(this.graphics1,-this.arrPosit[2].x,this.arrPosit[2].y,false)


				for (var i = 0; i < numBlok.length; i+=2) {
					if(i!=numBlok.length-2){

						this.drawGrah(this.graphics1,numBlok[i+1],this.arrPosit[0].y,true)
						this.drawGrah(this.graphics1,numBlok[i+1],this.arrPosit[5].y,false)
						this.drawGrah(this.graphics1,numBlok[i+2],this.arrPosit[5].y,false)
						this.drawGrah(this.graphics1,numBlok[i+2],this.arrPosit[0].y,false)
						this.drawGrah(this.graphics1,numBlok[i+1],this.arrPosit[0].y,false)
			


					}else{



						this.drawGrah(this.graphics1,this.arrPosit1[5].x+this._distans,this.arrPosit1[5].y,true);
						this.drawGrah(this.graphics1,this.arrPosit1[4].x+this._distans,this.arrPosit1[4].y,false);
						this.drawGrah(this.graphics1,this.arrPosit1[3].x+this._distans,this.arrPosit1[3].y,false);

						this.drawGrah(this.graphics1,this.arrPosit1[2].x+this._distans,this.arrPosit1[2].y,false);
						this.drawGrah(this.graphics1,this.arrPosit1[1].x+this._distans,this.arrPosit1[1].y,false);
						this.drawGrah(this.graphics1,this.arrPosit1[0].x+this._distans,this.arrPosit1[0].y,false);

						this.drawGrah(this.graphics1,numBlok[i+1],this.arrPosit1[0].y,false);
						this.drawGrah(this.graphics1,numBlok[i+1],this.arrPosit1[5].y,false);
						this.drawGrah(this.graphics1,this.arrPosit1[5].x+this._distans,this.arrPosit1[5].y,false);					
					}
				}
			}



			





			this.stAct.draw1()





			////////////////////////////////////////////////////////////////////////
			////////////////////////////////////////////////////////////////////////

			var bb=true;
			if(this._rotation>-Math.PI/2&&this._rotation<Math.PI/2)bb=false;


			var xx=this._distans-this.arrPosit[0].x+this.arrPosit1[5].x
			if(xx<100){
				this.c2dt.visible=false				
			}else{
				this.c2dt.visible=true
				this.text.text=Math.round(xx)+"";				
				if(bb==false){
					this.c2dt.x=(xx-this.text.width)/2;
					this.c2dt.y=this._delph/2
					this.c2dt.rotation=0
				}else{
					this.c2dt.x=(xx)/2+this.text.width/2;
					this.c2dt.y=this._delph/2+32*this._mashtabText
					this.c2dt.rotation=Math.PI
				}				
			}
			xx=this._distans-this.arrPosit[5].x+this.arrPosit1[0].x;
			if(xx<100){
				this.c2dt1.visible=false;				
			}else{
				this.c2dt1.visible=true;
				this.text1.text=Math.round(xx)+"";
				if(bb==false){
					this.c2dt1.x=(xx-this.text1.width)/2;
					this.c2dt1.y=-this._delph/2-32*this._mashtabText;
					this.c2dt1.rotation=0;
				}else{
					this.c2dt1.x=(xx)/2+this.text1.width/2;
					this.c2dt1.y=-this._delph/2;//-32*this._mashtabText
					this.c2dt1.rotation=Math.PI;
				}
			}

		}

		var pOld={x:0,y:0}
		this.drawGrah = function (_g, _x,_y, _b) {
			if(_b){
				pOld.x=_x
				pOld.y=_y
				_g.moveTo(_x,_y)
			}else{
				if(_x!=pOld.x ||  _y!=pOld.y){
					pOld.x=_x
					pOld.y=_y
					_g.lineTo(_x,_y)
				}
				
			}

		}


		this.plusVor = function (_x,_y) {		
			if(sahh==0){
				this.arrVorur[sahh].set(_x,_y)			
				sahh++;
			}else{	
				if(this.arrVorur[sahh-1].x!=_x||this.arrVorur[sahh-1].y!=_y){			
					if(this.arrVorur[0].x!=_x||this.arrVorur[0].y!=_y)
					if(sahh<this.arrVorur.length){
						this.arrVorur[sahh].set(_x,_y)					
						sahh++;
						this.aVKol=sahh
					}
				}
			}
		}


		this.tween=undefined
		this.animat=function(time){

			if(this.tween==undefined){
				this.tween = new TWEEN.Tween(this.graphics);
				this.tween.onUpdate(function(){				
					self.par.par.render();
				})
			}
			this.graphics.alpha=0;
			this.tween.to({alpha:1},time).start();
		}



			
    }

    set active(value) {
        if(this._active!=value){
            this._active= value;
            this.stAct.sahAct=value ? 40: 0;           
        }
    }    
    get active() { return  this._active;}

    set life(value) {
        if(this._life!=value){
            this._life= value;
            if(this.cont2dDeb!=undefined){
				if(this._life==true)this.par.stage.content2d2.addChild(this.cont2dDeb);
				else if(this.cont2dDeb.parent!=undefined)this.cont2dDeb.parent.removeChild(this.cont2dDeb);
            }            
        }
    }    
    get life() { return  this._life;}

}



//отрисовывает активную хрень над
export function STAct (par) {
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
		
		this.graphics.beginFill(par.par.colorUI);		
		this.graphics.moveTo(this.par.arrVorur[0].x,this.par.arrVorur[0].y);
		for (var i = 1; i < this.par.aVKol; i++) {
			this.graphics.lineTo(this.par.arrVorur[i].x,this.par.arrVorur[i].y);				
		}
		this.graphics.lineTo(this.par.arrVorur[0].x,this.par.arrVorur[0].y);
    }

    this.corektSetGet=function(){
		this.graphics.alpha = (this._sahAct+this._sahPlus)/100;	
		this.par.par.par.render()
    }

}
STAct.prototype = {


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