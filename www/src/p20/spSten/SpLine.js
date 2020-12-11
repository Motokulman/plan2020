



export class SPLine  {
  	constructor(par,fun) {  		
  		this.type="SPLine";
  		var self=this;
        this.par=par;
        this.fun=fun;
        this._life=true;
        this._visible=true;

        this._otstup=0;
        this.sah=10;
        this.colol=0x3e575e
        this.colol_="#3e575e"
        this.array=[];
        this.uuid = calc.generateUUID();

        this._activeMouse=!this.par.activeMouse;
        
        this._mashtabText=1;
        this.content2d = new PIXI.Container();
        par.content2d.addChild(this.content2d);

        this.graphics = new PIXI.Graphics();
        this.content2d.addChild(this.graphics);

        this._addPoint=undefined;
        this._addPoint1=undefined;


 

        this.text = new PIXI.Text('345634634',{ fontFamily : 'Arial' })//,{ font: 'bold 200px Arial', fontFamily : 'Arial', fontSize: 24, fill : 0xff1010 }); 
        this.content2d.addChild(this.text);
        this.text.scale.x=this.text.scale.y=this._mashtabText



        this.onDragStart=function(e){            
            if(self.par.sobSP!=undefined)self.par.sobSP("downLine",self,e)
        }
        this.onDragStart1=function(e){            
            if(self.par.sobSP!=undefined)self.par.sobSP("downLine1",self,e)
        }
        this.onDragStart2=function(e){            
            if(self.par.sobSP!=undefined)self.par.sobSP("downLine2",self,e)
        }
            



        //this.graphics.interactive = true;            
        //this.graphics.on('mousedown', this.onDragStart);


        this.g = new PIXI.Graphics();
        this.g.name="0"
        this.g.beginFill(0xffffff, 0.01);
        this.g.drawCircle(0,0,5)
        //this.content2d.addChild(this.g);

        this.g1 = new PIXI.Graphics();
        this.g1.beginFill(0xffffff, 0.01);
        this.g1.drawCircle(0,0,5)
        this.g1.name="1";

        this.g2 = new PIXI.Graphics();    
        this.g2.name="1";



        this.render=this.par.render;
        

        this.activeMouse = this.par.activeMouse

        this.clear = function () {            
            this.life = false
            this._otstup=0;
            if(this.render)this.render()
        }


        this.drawposit = function () {
            self.drag();
        };

        this.position = new PositionFun(0, 0, this.drawposit);
        this.position1 = new PositionFun(0, 0, this.drawposit);
        
        this.p=new Position()
        this.p1=new Position()
        this.pNull=new Position(0,0)

        var a,d
        this.drag = function () {

            a=calc.getAngle(this.position, this.position1);
            d=calc.getDistance(this.position, this.position1);

            calc.getVector(this._otstup, a+Math.PI/2,this.p);
            this.p.x+=this.position.x;
            this.p.y+=this.position.y;

            calc.getVector(this._otstup, a+Math.PI/2,this.p1);
            this.p1.x+=this.position1.x;
            this.p1.y+=this.position1.y;




            this.content2d.x=this.position.x;
            this.content2d.y=this.position.y;
            this.content2d.rotation=a;            
            

            this.graphics.clear()

            this.graphics.lineStyle(1, this.colol, 1);

            this.graphics.moveTo(0,0); 
                  
            this.graphics.lineTo(0,this._otstup+(this._otstup>0 ? this.sah : -this.sah));
            this.graphics.moveTo(0,this._otstup);
            this.graphics.lineTo(d,this._otstup);

            this.graphics.moveTo(d,0);
            this.graphics.lineTo(d,this._otstup+(this._otstup>0 ? this.sah : -this.sah));

            this.graphics.lineStyle(1.5, this.colol, 1);


            this.graphics.moveTo(-this.sah/2,this._otstup+(this._otstup>0 ? this.sah*0.5 : -this.sah*0.5));
            this.graphics.lineTo(this.sah/2,this._otstup+(this._otstup>0 ? -this.sah*0.5 : this.sah*0.5));

            this.graphics.moveTo(d-this.sah/2,this._otstup+(this._otstup>0 ? this.sah*0.5 : -this.sah*0.5));
            this.graphics.lineTo(d+this.sah/2,this._otstup+(this._otstup>0 ? -this.sah*0.5 : this.sah*0.5));




  
            this.g2.clear()
            this.g2.beginFill(0xffffff, 0.01);
            this.g2.drawRect(0,0,d,32*this._mashtabText)
            this.g2.y=this._otstup
            this.g1.x=d;


            if(a>-Math.PI/2&&a<Math.PI/2){
                this.text.text=""+Math.round(d);
                this.text.x=d/2-this.text.width/2//*this._mashtabText;
                this.text.y=this._otstup;
                this.text.rotation=0
            }else{
                this.text.text=""+Math.round(d);
                this.text.x=d/2+this.text.width/2//*this._mashtabText;
                this.text.y=this._otstup+32*this._mashtabText;
                this.text.rotation=Math.PI
            }            
            
            if(this.render)this.render();

        };

        this.dragPost=function(){
            self.draw()
        }

        this.draw=function(){
            this.graphics.clear()
            if(this._addPoint==undefined || this._addPoint==undefined){
                return
            }
            this.position._x=this._addPoint.position.x;
            this.position._y=this._addPoint.position.y;

            this.position1._x=this._addPoint1.position.x;
            this.position1._y=this._addPoint1.position.y;

            this.drag();
           
        }


        var po
        this.poiskOt=function(o){
            po=calc.isPointInLin(this.position1,this.position,o,111111111,111111111);
            if(po)this.otstup=po.z;
        }






        this.setObj=function(o){
            this.position.set(o.position.x,o.position.y)
            this.position1.set(o.position1.x,o.position1.y)
            this.otstup=o.otstup

            if(o.apUUID){
                trace("###apUUID##",o);
            }


        }
        this.getObj=function(){
            var o={}
            o.position={x:this.position.x,y:this.position.y}
            o.position1={x:this.position1.x,y:this.position1.y}
            o.otstup=this.otstup
            if(this._addPoint!=undefined){
                trace(this._addPoint)
                o.apUUID=this._addPoint.uuid;
            }
            if(this._addPoint1!=undefined)o.apUUID1=this._addPoint1.uuid;
            return  o
        }

    }
    set activeMouse(value) {      
        if(this._activeMouse!=value){
            this._activeMouse= value;
        
            if(value){
                this.content2d.addChild(this.g2);
                this.content2d.addChild(this.g);       
                this.content2d.addChild(this.g1);
                this.g.interactive = true;    
                this.g1.interactive = true; 
                this.g2.interactive = true;        
                this.g.on('mousedown', this.onDragStart); 
                this.g1.on('mousedown', this.onDragStart1); 
                this.g2.on('mousedown', this.onDragStart2); 

            }else{
                this.content2d.removeChild(this.g2);
                this.content2d.removeChild(this.g);       
                this.content2d.removeChild(this.g1); 
                this.g.interactive = false;    
                this.g1.interactive = false; 
                this.g2.interactive = false;        
                this.g.off('mousedown', this.onDragStart); 
                this.g1.off('mousedown', this.onDragStart1); 
                this.g2.off('mousedown', this.onDragStart2);  
            }
        }
    }    
    get activeMouse() { return  this._activeMouse;}



    set visible(value) {      
        if(this._visible!=value){
            this._visible= value;
            this.content2d.visible=value;
        }
    }    
    get visible() { return  this._visible;} 

    set otstup(value) {      
        if(this._otstup!=value){
            this._otstup= value;
            this.drag();
        }
    }    
    get otstup() { return  this._otstup;}


    set life(value) {      
        if(this._life!=value){
            this._life= value;
            if(this._life==true)this.par.content2d.addChild(this.content2d);
            else if(this.content2d.parent!=undefined)this.content2d.parent.removeChild(this.content2d); 
        }
    }    
    get life() { return  this._life;}

     set addPoint(value) {      
        if(this._addPoint!=value){

            this._addPoint= value;
            if(value!=undefined)value.addPol(this)
            this.draw()
        }
    }    
    get addPoint() { return  this._addPoint;}

     set addPoint1(value) {      
        if(this._addPoint1!=value){
            this._addPoint1= value;
            if(value!=undefined)value.addPol(this)
            this.draw()
            
        }
    }    
    get addPoint1() { return  this._addPoint1;}



    
}