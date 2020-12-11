
export class SPGroup  {
  	constructor(par,fun) {  		
  		this.type="SPGroup";
  		var self=this;
        this.par=par;
        this.fun=fun;
        this.uuid=calc.generateRendom(2);

        this.funDragMenu= undefined       

        this._colorUI=this.par._colorUI;
      
        this._active=false;
        this.array=[];
        this.content2d = new PIXI.Container();
        this.par.cont2dGroup.addChild(this.content2d);


        this.graphics = new PIXI.Graphics();
        this.content2d.addChild(this.graphics);

        this.graphicsBig = new PIXI.Graphics();
        this.content2d.addChild(this.graphicsBig);


        this.graphicsEvent = new PIXI.Graphics();
        this.par.contNiz.addChild(this.graphicsEvent);

        this.onDragStart=function(e){
            if(self.par.par.sobSP!=undefined)self.par.par.sobSP("downGroup",self,e)
        }

        this.graphicsEvent.interactive = true;            
        this.graphicsEvent.on('mousedown', this.onDragStart);


        var r,r1;
        this.rectBig={x:0,y:0,x1:0,y1:0,w:0,h:0,o:null}

        this.addObj=function(o){
            for (var i = 0; i < this.array.length; i++) {
                if(this.array[i].uuid==o.uuid){
                    return false
                }
            }
            trace("####",o)
            this.array.push(o);
            this.korektRect()
            this.drawRect()
            if(this.funDragMenu!=undefined)this.funDragMenu()

            return true
           
        }

        this.removeObj=function(o){
            var r=false
            for (var i = this.array.length-1; i >=0; i--) {
                if(this.array[i].uuid==o.uuid){
                    this.array.splice(i,1)
                    r=true
                }
            }
            if(r==true){
                this.korektRect()
                this.drawRect()  
            }
            if(this.funDragMenu!=undefined)this.funDragMenu()
            return r;
        } 

        var rr
        this.korektRect= function(b){  
             
            this.rectBig.x=99999999999
            this.rectBig.y=99999999999
            this.rectBig.x1=-29999999999
            this.rectBig.y1=-29999999999
            for (var i = 0; i < this.array.length; i++) {
                if(this.array[i].type=="SpliceSten"){
                    if(b==true)this.array[i].korectOffset()
                    rr=this.array[i].rectBig
                    if(this.rectBig.x>rr.x)this.rectBig.x=rr.x
                    if(this.rectBig.x1<rr.x+rr.w)this.rectBig.x1=rr.x+rr.w
                    if(this.rectBig.y>rr.y)this.rectBig.y=rr.y
                    if(this.rectBig.y1<rr.y+rr.h)this.rectBig.y1=rr.y+rr.h
                }
            }

            for (var i = 0; i < this.array.length; i++) {

                if(this.array[i].type=="SpPointSten"||this.array[i].tipe=="SpVP"){                    
                    rr=this.array[i].position
                    if(this.rectBig.x>rr.x)this.rectBig.x=rr.x
                    if(this.rectBig.x1<rr.x)this.rectBig.x1=rr.x
                    if(this.rectBig.y>rr.y)this.rectBig.y=rr.y
                    if(this.rectBig.y1<rr.y)this.rectBig.y1=rr.y
                }
            }


            this.rectBig.w=this.rectBig.x1-this.rectBig.x;
            this.rectBig.h=this.rectBig.y1-this.rectBig.y;
            if(this.rectBig.x==99999999999){
                this.rectBig.x=this.rectBig.y=this.rectBig.w=this.rectBig.h=0;
            }
            if(b==true)this.drawRect()
        }

        this.drawRect= function(){            
            this.graphicsBig.clear()    
            this.graphicsBig.lineStyle(1, this._colorUI, 0.75);
            this.graphicsBig.beginFill(this._colorUI, 0.1);
            this.graphicsBig.drawRect(this.rectBig.x,this.rectBig.y,this.rectBig.w,this.rectBig.h)

            this.graphicsEvent.clear();

            this.graphicsEvent.beginFill(0xffffff, 0.1);
            this.graphicsEvent.drawRect(this.rectBig.x,this.rectBig.y,this.rectBig.w,this.rectBig.h)

            this.par.render() 
        }

        this.clear= function(){ 
            for (var i = 0; i < this.array.length; i++) {
                this.array[i].clear();
            }
            this.array.length=0;
            this.par.render() 
            this.active=false;
        }


        this.setPosOffset= function(x,y){ 
            for (var i = 0; i < this.array.length; i++) {
                if(this.array[i].type=="SpPointSten"||this.array[i].tipe=="SpVP"){                    
                    rr=this.array[i].position
                    rr.set(rr.x+x,rr.y+y)
                    this.array[i].doFunRend()
                }
            }
            this.korektRect(true)
        }





        this.addRect = function(rect){ 
            r=this.par.getRect();
            if(calc.isRectS(r,rect)==true){//попали в глявный рект               
                for (var i = 0; i < this.par.arrSplice.length; i++) {
                    if (this.par.arrSplice[i].life == false) continue;                   
                    r1=this.par.arrSplice[i].isRect(rect, false)//Вернет все обьекты поподания  
                    if(r1!=null){                                               
                        for (var j = 0; j < r1.length; j++) {
                            this.addObj(r1[j]);
                        }                        
                    }                    
                }

                for (var i = 0; i < this.par.avp.length; i++) {
                    if (this.par.avp[i].life == false) continue;                 

                    if(this.par.avp[i].position.x>=rect.x && this.par.avp[i].position.x<=rect.x+rect.w){
                        if(this.par.avp[i].position.y>=rect.y && this.par.avp[i].position.y<=rect.y+rect.h){
                            this.addObj(this.par.avp[i]);
                        }                        
                    }                    
                }

                for (var i = 0; i < this.par.arrPoint.length; i++) {
                    if (this.par.arrPoint[i].life == false) continue;                

                    if(this.par.arrPoint[i].position.x>=rect.x && this.par.arrPoint[i].position.x<=rect.x+rect.w){
                        if(this.par.arrPoint[i].position.y>=rect.y && this.par.arrPoint[i].position.y<=rect.y+rect.h){
                            this.addObj(this.par.arrPoint[i]);
                        }                        
                    }                    
                }
            }


        }


        this.setRect = function(rect){        
            this.graphics.clear()  
            if(rect!=undefined){
                this.graphics.lineStyle(1, this._colorUI, 0.3);
                this.graphics.beginFill(this._colorUI, 0.01);
                this.graphics.drawRect(rect.x,rect.y,rect.w,rect.h)
            } 
            this.par.render()  
        }

    }
    set active(value) {      
        if(this._active!=value){
            this._active= value;
            this.array.length=0
            this.graphicsBig.clear();
            this.graphicsEvent.clear();
            this.setRect();
            this.graphicsEvent.visible=value;
            this.content2d.visible=value;
            this.par.render() 
        }
    }    
    get active() { return  this._active;}
}