

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
                self.object.par.setActive(self.object.array);
                self.window.height=self.mogObj.height+32+self.otstup1*2+self.wh;                 
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
        this.whSize=5555555
        this.width=this.par.window.width-this.otstup*2;
             
        this.wh=(this.width-this.otstup)/4-this.otstup;

        this.arrSt=[];  
        this.arrWin=[];
        this.arrPoint=[];       
        var oM={}
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

            //окна
            this.panelWin=new DPanel(this.dCont,this.otstup,0);
            this.panelWin.width=this.par.window.width-this.otstup*2;

            this.panelWin.height=this.wh+this.otstup+20

            this.labelWin = new DLabel(this.panelWin,this.otstup,this.otstup,"")
            this.labelWin.fontSize=12;
            this.labelWin.width=this.width;

            this.butClearWin=new DButton(this.panelWin,this.panelSt.width-this.otstup1-this.wh,20,"",function(){
                
                self.clearSim("BInSten")
            },"resources/image/p0.png");
            this.butClearWin.width=this.butClearWin.height=this.wh;
            //////////////////////////////////

            //точки

            this.panelPoint=new DPanel(this.dCont,this.otstup,0);
            this.panelPoint.width=this.par.window.width-this.otstup*2;

            this.panelPoint.height=this.wh+this.otstup+20

            this.labelPoint = new DLabel(this.panelPoint,this.otstup,this.otstup,"")
            this.labelPoint.fontSize=12;
            this.labelPoint.width=this.width;

            this.butClearPoint=new DButton(this.panelPoint,this.panelSt.width-this.otstup1-this.wh,20,"",function(){
                
                self.clearSim("SpPointSten")
            },"resources/image/p0.png");
            this.butClearPoint.width=this.butClearPoint.height=this.wh;



            this.slid=new DSliderBig(this.panelPoint, this.otstup1,20, function(s){ 
                self.par.bool=false              
                for (var i = 0; i < self.arrPoint.length; i++) {
                    self.arrPoint[i].position.x=this.value
                    self.arrPoint[i].doFunRend()
                }
                self.par.object.korektRect(true)
            }, "x",  -this.whSize/2, this.whSize/2)
            this.slid.width=this.width-this.otstup1*3-this.wh
            this.slid.okrug=1

            this.slid.funChange=function(){
                self.par.bool=true
                self.par.drag()
            }

            this.slid1=new DSliderBig(this.panelPoint, this.otstup1,70, function(s){ 
                /*self.par.bool=false
                self.object.position.y=self.slid1.value*/
                self.par.bool=false              
                for (var i = 0; i < self.arrPoint.length; i++) {
                    self.arrPoint[i].position.y=this.value
                    self.arrPoint[i].doFunRend()
                }
                self.par.object.korektRect(true)
            }, "y",  -this.whSize/2, this.whSize/2)
            this.slid1.width=this.width-this.otstup1*3-this.wh          
            this.slid1.okrug=1;

            this.slid1.funChange=function(){
                self.par.bool=true
                self.par.drag()
            }


            this.slid2=new DSliderBig(this.panelPoint, this.otstup1,70+50, function(s){ 
                /*self.par.bool=false
                self.object.position.y=self.slid1.value*/
                self.par.bool=false;              
                for (var i = 0; i < self.arrPoint.length; i++) {
                    self.arrPoint[i].position.z=this.value
                    self.arrPoint[i].doFunRend()
                }

                self.par.object.korektRect(true)
            }, "z",  -this.whSize/2, this.whSize/2)
            this.slid2.width=this.width-this.otstup1*3-this.wh          
            this.slid2.okrug=1;

            this.slid2.funChange=function(){
                self.par.bool=true
                self.par.drag()
            }


        }

        
        this.clearSim=function(s){
            for (var i = self.par.object.array.length-1; i >=0; i--) {
                if(self.par.object.array[i].type==s){//"SpliceSten"){
                    self.par.object.array[i].clear()
                    self.par.object.array.splice(i,1)
                }
            }
            self.par.drag(); 
            self.par.object.korektRect(true)
        }




        var bool,bool1,bool2, param,param1,param2
        this.drag=function(){
            var yy=0
            this.init();
            /////////////////////////////
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
                    
                    bool1=this.arrSt[0][aButton[i]]
                    bool=true;
                    for (var j= 0; j < this.arrSt.length; j++) {
                        if(this.arrSt[j][aButton[i]]!=bool1)bool=false;
                    }

                    if(bool==false){
                        oM[aButton[i]][0].alpha=0.5;
                        oM[aButton[i]][1].alpha=0.5;
                    }else{
                        oM[aButton[i]][0].alpha=1;
                        oM[aButton[i]][1].alpha=1;
                    }
                    oM[aButton[i]][0].visible=bool1
                    oM[aButton[i]][1].visible=!bool1 
                }
            }
            ////////////////////////////


            this.arrWin.length=0;

            for (var i = 0; i < this.par.object.array.length; i++) {
                if(this.par.object.array[i].type=="BInSten"){                    
                    this.arrWin.push(this.par.object.array[i]);
                }
            }

            if(this.arrWin.length == 0){
                this.panelWin.visible=false;
            }else{
                this.panelWin.visible=true;
                this.labelWin.text="Object: "+this.arrWin.length;
                this.panelWin.y=yy
                yy+=this.panelWin.height+this.otstup
            }






            ////////////////////////////


            this.arrPoint.length=0;

            for (var i = 0; i < this.par.object.array.length; i++) {
                if(this.par.object.array[i].type=="SpPointSten" ||this.par.object.array[i].type=="SpVPXz"){                    
                    this.arrPoint.push(this.par.object.array[i]);
                }
            }




            if(this.arrPoint.length == 0){
                this.panelPoint.visible=false;
            }else{
                this.panelPoint.visible=true;
                this.labelPoint.text="Point: "+this.arrPoint.length;
                this.panelPoint.y=yy

                param=Math.round(this.arrPoint[0].position.x);
                param1=Math.round(this.arrPoint[0].position.y); 
                param2=Math.round(this.arrPoint[0].position.z);               
                bool=true;
                bool1=true;
                bool2=true;
                for (var i = 1; i < this.arrPoint.length; i++) {
                    if(param!=Math.round(this.arrPoint[i].position.x))bool=false;
                    if(param1!=Math.round(this.arrPoint[i].position.y))bool1=false;
                    if(param2!=Math.round(this.arrPoint[i].position.z))bool2=false;
                }


                this.slid.alpha=bool==true?1:0.3
                this.slid1.alpha=bool1==true?1:0.3
                this.slid2.alpha=bool2==true?1:0.3

                // if(bool==false&&bool1==false&&bool2==false){
                //     //this.slid.visible=false;
                //     //this.slid1.visible=false;
                //     this.slid.alpha=0.3
                //     this.slid1.alpha=0.3
                //     this.slid2.alpha=0.3
                //   //  this.panelPoint.height=this.wh+this.otstup+20
                // }else{

                //    /* this.slid.visible=true;
                //     this.slid1.visible=true;*/
                //     this.slid.alpha=1
                //     this.slid1.alpha=1
                //     this.slid2.alpha=1

                //     /*this.slid.activMouse=bool;
                //     this.slid1.activMouse=bool1;
                //     this.slid2.activMouse=bool1;*/

                    self.slid.min=Math.round(param-100);
                    self.slid.max=Math.round(param+100);
                    self.slid.value=Math.round(param);

                    self.slid1.min=Math.round(param1-100);
                    self.slid1.max=Math.round(param1+100);
                    self.slid1.value=Math.round(param1); 

                    self.slid2.min=Math.round(param2-100);
                    self.slid2.max=Math.round(param2+100);
                    self.slid2.value=Math.round(param2); 

                //}                    
                this.panelPoint.height=this.slid2.y+50;    


                if(this.arrPoint.length==0&&this.arrWin.length==0&&this.arrSt.length==0)this.par.object.active=false
                yy+=this.panelPoint.height+this.otstup
            }
            this.height=yy;
        }
    }
}