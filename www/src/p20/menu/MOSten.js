

import { MOBaza } from './MOBaza.js';

export class MOSten extends MOBaza {
  	constructor(par,fun) {  
        super(par,fun);
  		this.type="MOSten";
        this.typeNa="SpliceSten";
  		var self=this;

        this.par=par
       
  
        this.dCont=new DCont(par.dCont);        
        this.button=undefined;
        this.slid
        this.slid1


        this.msUi=undefined
        this.postIn=function(){
           
            this.window.title="Sten";
            
            var yy=this.otstup1;


            this.button=new DButton(this.window.content,this.otstup1,yy,"",function(){
                self.object.clear()
            },"resources/image/p0.png");
            this.button.width=this.button.height=this.wh;

            this.button1=new DButton(this.window.content,this.otstup1*2+this.wh,yy,"",function(){
                if(this.alpha==1){
                    self.object.stage.boolText=self.object.boolText=true; 
                    this.alpha=0.5
                    return
                }else{
                    self.object.stage.boolText=self.object.boolText=false; 
                    this.alpha=1
                    return
                }                
            },"resources/image/w6.png");
            this.button1.width=this.button1.height=this.wh;

            yy+=(this.otstup1+this.wh)






            this.slid=new DSliderBig(this.window.content, this.otstup1,yy, function(s){ 
                self.object.delph=self.slid.value 
                self.object._addPoint.dragGG(); 
                self.object._addPoint1.dragGG();
            }, "delph",  5, 1000);
            this.slid.width=this.width-this.otstup1*2;
            this.slid.okrug=1;

            yy+=(this.otstup1+70)

            this.msUi=new MsUi(this,this.dCont,this.otstup1,yy)

            yy+=(this.otstup1+this.msUi.height)


           
           /* new DLabel(this.window.content, 2,yy,"bChaz").fontSize=10
            new DLabel(this.window.content, 42,yy,"bChaz1").fontSize=10
            new DLabel(this.window.content, 92,yy,"idUi").fontSize=10
            new DLabel(this.window.content, 158,yy,"sUi").fontSize=10


            yy+=12
            this.input=new DInput(this.window.content, 92,yy,"" ,function(s){ 
                self.object.idUi=this.value*1
            })
            this.input.width=60;  

            this.input1=new DInput(this.window.content, 158,yy,"" ,function(s){ 
                self.object.sUi=this.value*1
                self.object._addPoint.dragVokrug(); 
                self.object._addPoint1.dragVokrug(); 
            })
            this.input1.width=60; 


            this.chek=new DCheckBox(this.window.content, 2,yy+5," " ,function(s){ 
                self.object.bChaz=this.value*1;
                self.object._addPoint.dragVokrug(); 
                self.object._addPoint1.dragVokrug(); 
            })
            this.chek1=new DCheckBox(this.window.content, 42,yy+5," " ,function(s){ 
                self.object.bChaz1=this.value*1;
                self.object._addPoint.dragVokrug(); 
                self.object._addPoint1.dragVokrug(); 
            }) 
            yy+=36;
         


            this.slid1=new DSliderBig(this.window.content, this.otstup1,yy, function(s){ 
                self.object.offset=self.slid1.value;  
                self.object._addPoint.dragVokrug(); 
                self.object._addPoint1.dragVokrug();              
                            
            }, "offset", -1000, 1000);
            this.slid1.width=this.width-this.otstup1*2;
            this.slid1.okrug=1;  */         
            trace(yy,this.msUi.height)
            this.window.height=yy+32;

        }        
        
        this.drag=function(){
            self.slid.value=self.object.delph;
            /* 
            self.input.value=self.object.idUi; 
            self.input1.value=self.object.sUi; 
            self.slid1.value=self.object._offset;
            self.chek.value=self.object.bChaz; 
            self.chek1.value=self.object.bChaz1;*/
          
            self.msUi.drag();    
            
            if(!self.object.boolText)self.button1.alpha=1;
            else self.button1.alpha=0.5;
        }



       

        this.postSO=function(){ 
            this.object.funDragMenu=this.drag
            this.window.title="Sten "+this.object.idArr+" : "+ this.object.uuid;

            this.drag();
        }
        this.clear=function(){
            if(this.object!=undefined){
                this.object.funDragMenu=undefined;
            }
            this.active=false
        }


        this.sizeWindow = function(w,h,s){ 
            this.dCont.x=w/s-this.width       
        }
  	}

  

}



export class MsUi  {
    constructor(par, dCont, _x, _y) {
        this.par=par
        var self=this 
        this.otstup1=this.par.otstup1
        this.wh=this.par.wh

        this.height=this.par.wh+this.par.otstup1*2+20;
        this.dCont=new DCont(par.dCont); 

        this.dCont.x=_x;
        this.dCont.y=_y;
        this.panel=new DPanel(this.dCont,0,0)
        this.panel.height=this.height
        this.panel.width=this.par.window.width-this.par.otstup1*2

        this.lebel=new DLabel(this.panel, this.otstup1,this.otstup1,"bChafghfghfhz")
        this.lebel.fontSize=10;
        this.lebel.width=this.panel.width



        this.aS

        this.down=function(){
            if(this.idArr==2||this.idArr==3){
                self.par.object.bChaz=!self.par.object.bChaz;
                self.par.object._addPoint.dragVokrug(); 
                self.par.object._addPoint1.dragVokrug();
                self.drag()
            }
            if(this.idArr==1){
                self.par.object.sUi=-1
                self.par.object.offset=0
                self.par.object._addPoint.dragVokrug(); 
                self.par.object._addPoint1.dragVokrug();
                self.drag() 
            }

            if(this.idArr==0){
                let a=[];
                let a1=[];
                for (var i = 0; i < self.par.object._addPoint.arrSHron.length; i++) {
                    trace(i+"  "+self.par.object._addPoint.arrSHron[i])
                    a.push(self.par.object._addPoint.arrSHron[i].sten)
                }
                for (var i = 0; i < self.par.object._addPoint1.arrSHron.length; i++) {
                    trace(i+"  : "+self.par.object._addPoint1.arrSHron[i])
                    a.push(self.par.object._addPoint1.arrSHron[i].sten)
                }
                for (var i = 0; i < a.length; i++) {
                    if(a[i].uuid==self.par.object.uuid)continue
                    if(a[i].sUi!=-1)continue    
                    let b=true;
                    for (var j = 0; j < a1.length; j++) {
                        if(a1[j].uuid==a[i].uuid)b=false;
                    } 
                    if(b)a1.push(a[i])   
                      
                }
                self.aS =  a1//стены вокруг

                if(a1.length==0){
                    global.mInfo.setFun("Отсутствуют стены.","Необходимо что бы стенка привязывалась к стене с какой либо стороны от себя. Так же не отработает со стенами уже имеющими привязки")
                }else{
                    for (var i = 0; i < a1.length; i++) {
                        a1[i].animat(1000)
                    }
                    self.help();
                    
                    self.par.par.perehvat=self.perehvat
                }
            }
        }
        this.lh
        this.th
        var kol=5;
        this.help=function(){
            if(this.lh==undefined){
                this.lh = new DLabel(this.panel, -100,30,"Нажмите по подсвеченым стенкам");
                this.th=new TWEEN.Tween(this.lh);
                this.lh.div.style.pointerEvents="none";    
            }
            if(kol>0){
                this.lh.alpha=1
                //this.lh.visible=1;
                this.th.to({alpha:0},3000).start(); 
                kol--
            }
        }


        this.perehvat=function(o){
            if(o && o.type&& o.type=="SpliceSten"){
                let b=false;
                for (var i = 0; i < self.aS.length; i++) {
                    if(self.aS[i].uuid==o.uuid)b=true
                }
                if(b){
                    self.par.object.sUi=o.uuid;
                    self.par.object._addPoint.dragVokrug(); 
                    self.par.object._addPoint1.dragVokrug();
                    self.drag()
                }else{
                    global.mInfo.setFun("Не та стена","нажать на стены прилегающие к выбранной")    
                }
            }else{
                global.mInfo.setFun("Небыла нажата стена","надо тыкнуть по стенам который были анимированы в прозрачный цвет")
            }
        }


        this.arrBut=[];
        for (var i = 0; i < 4; i++) {
            let x=this.otstup1
            if(i>=2)x=this.otstup1+this.otstup1+this.wh
            let b=new DButton(this.dCont,x,this.otstup1+20,"",this.down,"resources/image/sUi_"+i+".png");
            b.width=b.height=this.wh;
            b.idArr=i;
            this.arrBut[i]=b;
        }

        let xx=this.otstup1+this.otstup1+this.wh
        this.slid=new DSliderBig(this.dCont, xx,20+this.otstup1, function(s){ 
            self.par.object.offset=this.value;  
            self.par.object._addPoint.dragVokrug(); 
            self.par.object._addPoint1.dragVokrug();             
                        
        }, "offset", -1000, 1000);
        this.slid.width=this.panel.width-this.slid.x-this.otstup1;
        this.slid.okrug=1;
        
        xx=this.otstup1+(this.otstup1+this.wh)*2
        this.input=new DInput(this.dCont, xx,20+this.otstup1,"" ,function(s){ 
            self.par.object.sUi=this.value
            self.par.object._addPoint.dragVokrug(); 
            self.par.object._addPoint1.dragVokrug();
            self.drag() 
        })
        this.input.width=this.panel.width-xx-this.otstup1;


        this.drag=function(){
            this.lebel.text="uuid :"+this.par.object.uuid;            
            if(this.par.object.sUi==-1){
                this.slid.visible=true;
                this.arrBut[0].visible=true;
                this.arrBut[1].visible=this.arrBut[2].visible=this.arrBut[3].visible=false;
                this.input.visible=false;
            }else{
                this.slid.visible=false;
                this.input.visible=true;
                this.input.value=this.par.object.sUi;
                this.arrBut[0].visible=false;
                this.arrBut[1].visible=true; 
                this.arrBut[2].visible=this.par.object.bChaz;
                this.arrBut[3].visible=!this.par.object.bChaz;
            }
        }



    }

    set index(value) {   
        this._index = value;
        this.dragIndex()
    }    
    get index() { return  this._index;} 





    
}


