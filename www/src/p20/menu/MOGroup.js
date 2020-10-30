

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
            
            this.button=new DButton(this.window.content,this.window.width-this.otstup1-this.wh,this.otstup1,"",function(){
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

        var aButton

        this.dCont=new DCont(this.par.window.content); 
        this.dCont.y=this.otstup*2+this.par.wh;

        this.panelSt=undefined
        this.init=function(){
            if(this.panelSt!=undefined)return
            //стены            
            this.panelSt=new DPanel(this.dCont,this.otstup,0);
            this.panelSt.width=this.par.window.width-this.otstup*2;

            this.panelSt.height=this.wh+this.otstup+20

            this.labelSt = new DLabel(this.panelSt,this.otstup,this.otstup,"")
            this.labelSt.fontSize=12;
            this.labelSt.width=this.width;

            var ooo
            var yy=this.otstup1;

            var xx=this.otstup1;
            aButton=["carrier","out","adjacent"]

            var oM={}
            for (var i = 0; i < aButton.length; i++) {                
                oM[aButton[i]]={}
                oM[aButton[i]][0]=new DButton(this.panelSt,xx,20,"",function(){
                    trace(this.name,this.param,self.arrSt.length)
                    for (var i = 0; i < self.arrSt.length; i++) {
                        ooo=self.arrSt[i]
                        ooo[this.name]=this.param;
                        ooo._addPoint.dragGG(); 
                        ooo._addPoint1.dragGG(); 
                        self.drag();                        
                    }
                    ooo.par[this.name]=this.param;
                },"resources/image/sten_"+aButton[i]+"0.png"); 
                oM[aButton[i]][0].width=oM[aButton[i]][0].height=this.wh;
                oM[aButton[i]][0].name=aButton[i];
                oM[aButton[i]][0].param=false;

               
                oM[aButton[i]][1]=new DButton(this.panelSt,xx,20,"",function(){

                    for (var i = 0; i < self.arrSt.length; i++) {
                        ooo=self.arrSt[i]
                        ooo[this.name]=this.param;
                        ooo._addPoint.dragGG(); 
                        ooo._addPoint1.dragGG(); 
                        self.drag();                        
                    }
                    ooo.par[this.name]=this.param;        
                },"resources/image/sten_"+aButton[i]+"1.png"); 
                oM[aButton[i]][1].width=oM[aButton[i]][1].height=this.wh;              
                oM[aButton[i]][1].name=aButton[i]
                oM[aButton[i]][1].param=true    
                xx+=this.otstup1+this.wh
            }
            var sten
            this.butClearSt=new DButton(this.panelSt,this.panelSt.width-this.otstup1-this.wh,20,"",function(){
                
                self.clearSim("SpliceSten")
            },"resources/image/p0.png");
            this.butClearSt.width=this.butClearSt.height=this.wh;
            //////////////////////////////////
        }

        
        this.clearSim=function(s){
            for (var i = self.par.object.array.length-1; i >=0; i--) {
                if(self.par.object.array[i].type==s){//"SpliceSten"){
                    self.par.object.array[i].clear()
                    self.par.object.array.splice(i,1)
                }
            }
        }










        var bool,bool1
        this.drag=function(){
            var yy=0
            this.init()
            this.arrSt.length=0;
            for (var i = 0; i < this.par.object.array.length; i++) {
                if(this.par.object.array[i].type=="SpliceSten"){                    
                    this.arrSt.push(this.par.object.array[i]);
                }
            }

            if(this.arrSt.length == 0){
                this.panelSt.visible=false;
            }else{
                this.panelSt.visible=true;
                this.labelSt.text="Sten: "+this.arrSt.length;
                
                yy+=this.panelSt.height+this.otstup

                
                for (var i = 0; i < aButton.length; i++) {
                    bool1=this.arrSt[0][aButton[0]]
                    bool=true;
                    for (var j= 0; j < this.arrSt.length; j++) {
                        if(this.arrSt[j][aButton[0]]!=bool1)bool=false;

                    }

                    if(bool==true){
                        oM[aButton[i]][0].alpha=0.5;
                        oM[aButton[i]][1].alpha=0.5;
                    }


                }
                

               

            }

            this.height=yy;

        }





    }
}