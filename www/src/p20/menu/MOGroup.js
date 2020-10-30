

import { MOBaza } from './MOBaza.js';

export class MOGroup extends MOBaza {
  	constructor(par,fun) {  
        super(par,fun);
  		this.type="MOGroup";
        this.typeNa="SPGroup";
  		var self=this;
        this.whSize=5555555;
        this.dCont=new DCont(par.dCont);        
        this.button=undefined;
        this.slid
        this.slid1
        this.bool=true
        this.postIn=function(){           
            this.window.title="GROUP";
            var yy=this.otstup1;
            
            this.button=new DButton(this.window.content,this.otstup1,this.otstup1,"",function(){
                self.bool=false
                self.object.clear(); 
                self.active=false              
            },"resources/image/p0.png");
            this.button.width=this.button.height=this.wh;
            this.window.height=210;


            this.mogObj=new MOGObj(this,function(s,p){

            })
        }

        
        
        this.drag=function(){
            if(self.bool!=false){

                self.mogObj.drag()
                self.window.height=self.mogObj.height+32+self.otstup1*2+self.wh;
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
            this.object.funDragMenu=this.drag       
            this.drag()
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


export class MOGObj{
    constructor(par,fun) {  
        var self=this;
        this.par=par;
        this.fun=fun;
        this.height=0;
        this.otstup=this.par.otstup1  
        this.otstup1=this.par.otstup1  
        this.width=this.par.window.width-this.otstup*2;
             
        this.wh=(this.width-this.otstup)/4-this.otstup;

        this.arrSt=[]        



        this.dCont=new DCont(this.par.window.content); 
        this.dCont.y=this.otstup*2+this.par.wh;



        //стены
        this.panelSt=new DPanel(this.dCont,this.otstup,0);
        this.panelSt.width=this.par.window.width-this.otstup*2;

        this.panelSt.height=this.wh+this.otstup+20

        this.labelSt = new DLabel(this.panelSt,this.otstup,this.otstup,"")
        this.labelSt.fontSize=12;
        this.labelSt.width=this.width;


        var yy=this.otstup1;

        var xx=this.otstup1;
        var aButton=["carrier","out","adjacent"]

        var oM={}
        for (var i = 0; i < aButton.length; i++) {                
            oM[aButton[i]]={}
            oM[aButton[i]][0]=new DButton(this.panelSt,xx,20,"",function(){
              /*  self.object[this.name]=this.param  
                self.object._addPoint.dragGG(); 
                self.object._addPoint1.dragGG();                  
                self.drag();
                self.object.par[this.name]=this.param; 
*/
            },"resources/image/sten_"+aButton[i]+"0.png"); 
            oM[aButton[i]][0].width=oM[aButton[i]][0].height=this.wh;
            oM[aButton[i]][0].name=aButton[i];
            oM[aButton[i]][0].param=false;

           
            oM[aButton[i]][1]=new DButton(this.panelSt,xx,20,"",function(){
              /*self.object[this.name]=this.param;
                self.object._addPoint.dragGG(); 
                self.object._addPoint1.dragGG(); 
                self.drag();
                self.object.par[this.name]=this.param;
*/
            },"resources/image/sten_"+aButton[i]+"1.png"); 
            oM[aButton[i]][1].width=oM[aButton[i]][1].height=this.wh;              
            oM[aButton[i]][1].name=aButton[i]
            oM[aButton[i]][1].param=true    
            xx+=this.otstup1+this.wh
        }

        this.butClearSt=new DButton(this.window.content,this.otstup1,this.otstup1,"",function(){
           /* self.bool=false
            self.object.clear(); 
            self.active=false  */            
        },"resources/image/p0.png");
        this.butClearSt.width=this.button.height=this.wh;
        this.butClearSt.height=210;


        //////////////////////////////////


        




        this.drag=function(){
            var yy=0
            
            this.arrSt.length=0;
            for (var i = 0; i < this.par.object.array.length; i++) {
                if(this.par.object.array[i].type=="SpliceSten"){
                    trace(i+"###",this.par.object.array[i].type);
                    this.arrSt.push(this.par.object.array[i]);
                }
            }

            if(this.arrSt.length == 0){
                this.panelSt.visible=false;
            }else{
                this.panelSt.visible=true;
                this.labelSt.text="Sten: "+this.arrSt.length;
                
                yy+=this.panelSt.height+this.otstup
                trace(this.panelSt.height,this.otstup,yy)

            }

            this.height=yy;

        }





    }
}