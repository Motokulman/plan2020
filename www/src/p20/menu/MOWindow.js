
import { MOWUnik } from './MOWUnik.js';
import { MOBaza } from './MOBaza.js';

export class MOWindow extends MOBaza {
  	constructor(par,fun) {  
        super(par,fun);
  		this.type="MOWindow";
        this.typeNa="BInSten";
  		var self=this;

        this.whSize=5555555;
    
        this.dCont=new DCont(par.dCont);


        this.mowUnik;
        
        this.button=undefined;
        this.slid
        this.slid1
        this.bool=true
        this.postIn=function(){           
            this.window.title="Blok";
            var yy=this.otstup1
            /*this.col=new DColor(this.window.content,this.otstup1,yy,"",function(){
                self.object.color=this.value;            
            })
            this.col.width=this.width-this.otstup1*2
            yy+=36

            this.slid=new DSliderBig(this.window.content, this.otstup1,yy, function(s){ 
                self.bool=false
                self.object.alpha=self.slid.value
            }, "alpha",  0, 1)
            this.slid.width=this.width-this.otstup1*2
            this.slid.okrug=100;
            yy+=(this.otstup1+this.wh)*/

            
            this.button=new DButton(this.window.content,this.otstup1,this.otstup1,"",function(){
                self.bool=false
                self.object.clear();                
            },"resources/image/p0.png");
            this.button.width=this.button.height=this.wh;

            this.mowUnik=new MOWUnik(this,function(s,p){})
            this.mowUnik.dCont.y=this.button.y+this.wh+this.otstup1

            this.yy = this.button.y+this.wh+this.otstup1*2 + 32
            this.window.height=this.yy;
        }

        
        this.drag=function(){
            if(self.bool!=false){


               /* self.col.value=self.object.color;
                self.slid.value=self.object.alpha;

                self.slid.min=self.object.position.x-500
                self.slid.max=self.object.position.x+500
                self.slid.value=Math.round(self.object.position.x)
                
                self.slid1.min=self.object.position.y-500
                self.slid1.max=self.object.position.y+500
                self.slid1.value=Math.round(self.object.position.y)*/
                
            }            
        }

       

        this.postSO=function(){ 
            this.bool=true;        
            this.drag()

            this.window.title="Blok: "+this.object.idArr;

            if(this.object._parent)this.object._parent.par.par.setActive(this.object);
            if(self.mowUnik.postSO != undefined)this.mowUnik.postSO();

            this.yy =this.button.y+this.wh+this.otstup1*2 + 32+ this.mowUnik.height
            this.window.height=this.yy;
            //this.object.par.par.setActive(this.object);
        }
        this.clear=function(){
            if(this.object!=undefined){
                this.bool=true;
                this.object.funDragMenu=undefined;
            }
            this.active=false;
        }


        this.sizeWindow = function(w,h,s){ 
            this.dCont.x=w/s-this.width       
        }
  	}

    set index(value) {
        if(this._index!=value){
            this._index= value;
                  
        }
    }  
}
