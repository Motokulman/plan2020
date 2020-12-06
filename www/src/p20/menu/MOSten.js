

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

        var oM
        this.msUi=undefined
        this.postIn=function(){           
            this.window.title="Sten";            
            var yy=this.otstup1;
            var xx=this.otstup1;
            var a=["carrier","out","adjacent"]

            oM={}
            for (var i = 0; i < a.length; i++) {                
                oM[a[i]]={}
                oM[a[i]][0]=new DButton(this.window.content,xx,yy,"",function(){
                    self.object[this.name]=this.param  
                    self.object._addPoint.dragGG(); 
                    self.object._addPoint1.dragGG();                  
                    self.drag();
                    self.object.par[this.name]=this.param; 

                },"resources/image/sten_"+a[i]+"0.png"); 
                oM[a[i]][0].width=oM[a[i]][0].height=this.wh;
                oM[a[i]][0].name=a[i];
                oM[a[i]][0].param=false;

               
                oM[a[i]][1]=new DButton(this.window.content,xx,yy,"",function(){
                    self.object[this.name]=this.param;
                    self.object._addPoint.dragGG(); 
                    self.object._addPoint1.dragGG(); 
                    self.drag();
                    self.object.par[this.name]=this.param;

                },"resources/image/sten_"+a[i]+"1.png"); 
                oM[a[i]][1].width=oM[a[i]][1].height=this.wh;              
                oM[a[i]][1].name=a[i]
                oM[a[i]][1].param=true    
                xx+=this.otstup1+this.wh
            }

            this.button=new DButton(this.window.content,xx,yy,"",function(){
                self.object.clear()
            },"resources/image/p0.png");
            this.button.width=this.button.height=this.wh;




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


            var sah=0
            /////////////////////////////////////////
            var a=this.par.par.objectBase.three
            for (var i = 0; i < a.length; i++) {                
                if(a[i].keyName=="test"){
                    var aa=a[i].array
                    for (var j = 0; j < aa.length; j++) {
                        var b=new DButton(this.window.content,2+34*j,yy,"",function(){
                            if(sah==0)self.object.color=this.obj.id;
                            else{
                                self.object["color"+sah]=this.obj.id;
                            }


                        },"resources/data/"+aa[j].id+"/128.png");
                        b.width=32
                        b.obj=aa[j];                        
                    }
                    yy+=36
                    for (var j = 0; j < 5; j++) {
                        var b=new DButton(this.window.content,2+34*j,yy,j+"",function(){
                            sah=this.idArr;
                        })
                        b.width=32
                        b.idArr=j;                        
                    }
                }
            }

            trace("@@",a)
            
            
            /////////////////////////////




            this.window.height=yy+32;
        }        
        
        this.drag=function(){
            self.slid.value=self.object.delph;

            self.msUi.drag(); 
            for (var s in oM) {
                oM[s][0].visible=self.object[s]
                oM[s][1].visible=!self.object[s]                
            }   

        }



       

        this.postSO=function(){ 
            this.object.funDragMenu=this.drag
            this.window.title="Sten "+this.object.idArr//+" : "+ this.object.uuid;
            this.object.par.setActive(this.object);
            //this.object.active=true

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


