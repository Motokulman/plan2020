

import { Position } from '../Calc.js';//сетка

export class MKrai  {
  	constructor(par,fun) {  		
  		this.type="MKrai";
  		var self=this;
        this.par=par
        this.fun=fun

        this.otstup=par.otstup;
        this.otstup1=par.otstup1;
        this.wh=par.wh;

        this.sizeMax=400;//par.sizeMax

        this.otMax=100
        this._bool=true;
        this._mashtab=1;
        this.otMas=this.otMax/this._mashtab
        this._menuIndex=-1;
        this._activeMove="null"
        this.sp=undefined

        this.dCont = new DCont(this.par.par.dCont); 
        this.dCont.x=this.otstup;
        this.dCont.y=this.otstup*4+this.wh


        this.init=function(){
            this.panVisiW = new MKPanelVisiW(this.dCont,0,0, this, this.sob);
            this.panVisiW.height=this.wh/2+this.otstup*2;

            this.panVisiH = new MKPanelVisiH(this.dCont,0,0, this, this.sob);
            this.panVisiH.width=this.wh/2+this.otstup*2;

            this.batton=new DButton(this.dCont,0,0,"",function(){
                self.bool=!self.bool
            })
            this.batton.width=this.batton.height=this.wh/2
        }       



        var unSkrol=false;
        dcmParam.addFunMove(function(e){
            if(self._activeMove=="null")return;           
            
            if(self._activeMove=="lines"){//показываем линии, активно шаг2               
                self.sp.lineWord.visiLine.visiPoint(self.par.getPositPlan(),unSkrol==true ?-Math.PI/2 : -Math.PI, self.par.rectScane)
            }

            if(self._activeMove=="linesOtstup"){//смещаем отступ, активно шаг2
                self.sp.lineWord.visiLine.visiOtstup(self.par.getPositPlan(),unSkrol==true ?-Math.PI/2 : -Math.PI)
            }
        })


        this.mouseup = function(e){
            if(self._activeMove=="linesOtstup"){
                self.sp.lineWord.visiLine.creatReal() 
            }
            self.activeMove = "null"
            document.body.style.pointerEvents='auto'        
            if(dcmParam.mobile==false){                 
                document.removeEventListener("mouseup", self.mouseup);
            }else{                  
                document.removeEventListener("touchend", self.mouseup); 
            }   
        }



        this.sob=function(s,p,p1){
            if(s=="mousewheel"){
                self.par.mousewheel(p);
                return
            }


            unSkrol=false;
            if(this.type=="MKPanelVisiW"){
                unSkrol=true;               
            }
            if(this.type=="MKPanelVisiH"){
                               
            }

            if(self._menuIndex==0){
                
                if(s=="mouseover"){
                    this.startActive()
                }
                if(s=="mouseout"){
                    this.finalActive(); 
                }
            }

            if(self._menuIndex==2){
                if(s=="mouseover"){
                    self.activeMove="lines";
                }
                if(s=="mouseout"){
                    if(self.activeMove!="linesOtstup")self.activeMove = "null"
                } 
                if(s=="mousedown"){
                    self.sp.lineWord.visiLine.visiPoint(self.par.getPositPlan(),unSkrol==true ?-Math.PI/2 : -Math.PI, self.par.rectScane)
                    self.activeMove="linesOtstup";
                    document.body.style.pointerEvents="none";   
                    if(dcmParam.mobile==false){                 
                        document.addEventListener("mouseup", self.mouseup);
                    }else{                  
                        document.addEventListener("mouseup", self.mouseup);                 
                    } 
                }                              
            } 
        }
        this.init()



        this.set= function(p,p1){     
            this.panVisiW.setPosition(p,p1)
            this.panVisiH.setPosition(p,p1)
        }

        this.helpDP=undefined;
        this.sp=undefined;
        this.setSP=function(sp){            
            this.sp=sp;
            self.helpDP=self.par.par.mCont2dHelp.helpDP;  
            this.panVisiW.setSP(sp,self.helpDP)
            this.panVisiH.setSP(sp,self.helpDP)          
        }



        this.sizeWindow = function(w,h,s){ 
            this.panVisiW.width=w
            this.panVisiW.y=h;
            this.panVisiH.height=h
            this.panVisiH.x=w;

            this.batton.y=h+this.otstup;
            this.batton.x=w+this.otstup;
        }
    }

    set activeMove(value) {
        if(this._activeMove!=value){

            if(this._activeMove=="lines"){
                this.sp.lineWord.visiLine.clear()
            }
            this._activeMove = value;
        }       
    }   
    get activeMove() { return  this._activeMove;}


    set menuIndex(value) {      
        if(this._menuIndex!=value){
            this._menuIndex= value;
           
        }
    }    
    get menuIndex() { return  this._menuIndex;}

    set mashtab(value) {      
        if(this._mashtab!=value){
            this._mashtab= value;
            this.otMas=this.otMax/this._mashtab
        }
    }    
    get mashtab() { return  this._mashtab;}

    set bool(value) {      
        if(this._bool!=value){
            this._bool= value; 
            this.panVisiW.bool= value;
            this.panVisiH.bool= value;
            if(value)this.batton.borderRadius=0
            else this.batton.borderRadius=100          
        }
    }    
    get bool() { return  this._bool;}
}






export class MKBlok  {
    constructor(dc) {          
        this.type="MKBlok";
        var self=this;

        this.dc
        this.idArr=-1;
        this._active=true; 
        this.param="x";
        this.posit=0;
        this.posit1=0;
        this.array=[];

      
        this.zdwih=function(p,p1){
            for (var i = 0; i < this.array.length; i++) {
                this.array[i].position[p]+=p1;
            }
        }

   
        this.clear=function(){
            this.array.length=0;
            this.active=false;

        }

        this.add=function(p){
            this.array.push(p);
        }
    }



}

export class MPanel extends DPanel {
    constructor(dCont, _x, _y,_fun) {
        super(dCont, _x, _y);           
        this.type="MPanel";
        var self=this; 
        this.fun=_fun;
        this._active=false

        this.dL=new DCont(this) 
        this.dL1=new DCont(this.dL)  
        this.label=new DLabel(this.dL1,0,0,"")


        //setColor("#aaaaaa","#444444",dcmParam.color,dcmParam.colorText,0.35,1)

        this.c="#aaaaaa";
        this.c1="#444444";
        this.c2="#ff0000";
        this.c3="#00ff00";
        this.a=0.5;
        this.a1=1;


        this.setColor=function(c,c1,c2,c3,a,a1){
            this.c=c;
            this.c1=c1
            this.c2=c2
            this.c3=c3
            this.a=a
            this.a1=a1

            this.alpha=a
            this.color=c
            this.label.color=c1
        }

        this.bool
        this.pp
        this.t1
        this.setParam=function(w,h,t,b,t1){
            this.t1=t1
            this.pp=t
            this.width=w;
            this.height=h;            
            this.bool= b
            this.korectParam()           
        }
        var wt=0
        this.korectParam=function(){
            this.label.text=this.pp+''
            wt = this.label._text.length*10;            
            this.label.y=(this._height-18)/2

            if(this.bool)this.label.x=(this._width-wt)/2
            else this.label.x=this._width-wt 

            if(this._width < wt){
               this.label.visible=false;
            } else{
                this.label.visible=true;
            }            
        } 



    }
    set active(value) {      
        if(this._active!=value){
            this._active= value;
            if(value){
                this.alpha=this.a1
                this.color=this.c2
                this.label.color=this.c3                
            } else{
                this.alpha=this.a
                this.color=this.c
                this.label.color=this.c1
                
            }          
        }
    }    
    get active() { return  this._active;}
}


export class MKPV extends DCont {
    constructor(dCont, _x, _y, _par, _fun) {
        super();           
        this.type="MKPanelVisiW";
        var self=this;
        if(dCont!=undefined)if(dCont.add!=undefined)dCont.add(this);  
        this.x=_x||0;   
        this.y=_y||0;
        this.uuid=Math.random()
        this.fun=_fun;
        this._drag=false;
        this._width=100;
        this._height=100;
        this.par=_par;
        this._bool= _par._bool;

        this.otstup=this.par.otstup
        this.rectScane=this.par.par.rectScane

        

        this.panel = new DPanel(this,0,this.otstup);
        this.panel.height=this._height-this.otstup*2;


        this.pan = new DPanel(this,0,this.otstup);
        this.pan.height=this._height-this.otstup*2; 
        this.pan.width=this._width/2;        
        this.pan.color='#dddddd'; 
        this.pan.alpha=0.35;

        this.dCont=new DCont(this);
        this.dCont.visible=false

        this.panEvent= new DPanel(this,0,0);      
        this.panEvent.alpha=0.1;
        this.panEvent.dCont.div.uuid=this.uuid
        
        this.panEvent.dCont.div.tttt="panel"



        this.pInfo = new DPanel(this,0,0);
        this.input = new DInput(this.pInfo,this.otstup,this.otstup,"",);
        this.input.width=50;
        this.pInfo.width=this.input.width+this.otstup*2+2;
        this.pInfo.height=this.input.height+this.otstup*2;
        this.pInfo.visible=false;
        this.pInfo.alpha=0.5;
        //this.pInfo.y=-this.pInfo.height;

        this.input.object.uuid=this.uuid
        this.input.object.tttt="input";

        this.input.funEnter=function(){
            var p=this.text*1;
            if(isNaN(p)==false){
                if(typeof p =="number"){
                    self.setPNew(p)
                }
            }
        }


        // Срабатывает от пользовательского ввода с клавиатуры в поле нижней линейки 
        this.setPNew=function(p){            
            self.helpDP.clear();
            if (p < 0) p = 10
            if(self.bool==true){
                if(self.inArXY!=-1){ 
                    let sd = p-self.arrPanel[self.inArXY].pp;
                    
                    if(sd<=-(self.arrPanel[self.inArXY].pp-1)){
                        sd=-(self.arrPanel[self.inArXY].pp-1)
                    }
                    let sd2=-(sd/2)

                    for (var i = 0; i < self.arrX.length; i++) {
                        if(i <= self.inArXY){
                            self.arrX[i].zdwih("x",sd2)
                        }else{
                            self.arrX[i].zdwih("x",sd2+sd)
                        }
                    }
                    self.sp.bigDrag();
                    self.testPosit();
                    self.moveIn(); 
                    self.moveIn1();                   
                }
            }else{
                if(self.inArXY!=-1){ 
                    let sd = p-self.arrPanel[self.inArXY].pp;

                    if(sd<=-(self.arrPanel[self.inArXY].pp-1)){
                        sd=-(self.arrPanel[self.inArXY].pp-1)
                    }
                    let sd2=-(sd/2)  

                    if (self.arrPanel[self.inArXY-1]) if (self.arrPanel[self.inArXY-1].pp >= self.arrPanel[self.inArXY].pp+sd) return

                    for (var i = 0; i < self.arrX.length; i++) {
                        if(i <= self.inArXY){
                            self.arrX[i].zdwih("x",-sd)
                        }else{
                            // self.arrX[i].zdwih("x",sd)
                        }                        
                    }
                    self.sp.bigDrag();
                    self.testPosit();
                    self.moveIn(); 
                    self.moveIn1();                   
                }
            }
        }


        

        this.panEvent.div.addEventListener('mousewheel', function(e){            
            self.fun("mousewheel",e);
            if(self.boolStart==true ){
                self.testPosit();
                self.move();
            } 
        })
        this.panEvent.div.addEventListener("DOMMouseScroll", function(e){self.fun("mousewheel",e)})
        this.panEvent.div.addEventListener("mousedown", function(e){
            
            if(self.inArXY!=-1){
                self.drag = true;
                self.startDragMove();
                return
            }
            self.fun("mousedown",e);
        })

        this.panEvent.div.addEventListener("mouseover", function(e){
            // 
            if(self.drag==true)return
            // self.corektBattonX(-1,-1)
            self.fun("mouseover",e);

        })
        this.panEvent.div.addEventListener("mouseout", function(e){
            // 
            if(self.drag==true)return
            self.fun("mouseout",e);
        })

        this.panEvent.div.addEventListener("mouseup", function(e){
            if(self.drag==true){
                self.aaaa()
            }
        })    


        this.pos=undefined
        this.pos1=undefined
        this.s
        this.xx
        this.ww
        this.pr;
        this.setPosition=function(p,p1,b){
            if(b==undefined){
                this.pos=p;
                this.pos1=p1;
            }
            this.setPosition1();    
        }

        this.setPosition1=function(){
            this.s=this.pos.w/this.pos1.w
            this.xx=this.pos.x-this.pos1.x
            this.ww=this.pos.w-this.pos1.w
            this.pr=1;
            if(this.ww!=0)this.pr=-this.xx/this.ww;    

            this.pan.width=Math.round(this.s*this._width);
            this.pan.x=(this._width-this.pan._width)*this.pr;
        }


        this.dragWH=function(){
            this.panEvent.height= this._height;
            this.panEvent.width= this._width;

            this.panel.height=this._height-this.otstup*2;
            this.panel.width=this._width;            
            this.pan.height=this._height-this.otstup*2;

            this.dCont.div.style.clip = "rect(0px "+this._width+"px "+this._height+"px 0px)";
        }


        ///////////////////////////////////////////////////////////////////////
        this.otMas=this.par.otMas



        this.color=0x008cba;
        this.color1=0x008cba;
        this.color2=0x117a9c;
        this.color3=0xf28044;
        this.ooo=50;
        var ddd,ddd1,point,point1,bb,col,ppp;



        
        this.move = function(e){           
            self.helpDP.alpha=1  
            self.helpDP.clear();
            if(self.arrX.length==0)return
            if(self.dragB1==true )return
            bb=true;
            self.ooo=1/self.par._mashtab
            
            self.moveIn(); 
            self.moveIn1();          
            
            //рисуем базовую точку
            let dre=self.ooo*20
            self.helpDP.dPoint(positStart,self.ooo*0.1,self.color3)
            self.helpDP.dLineParam(positStart.x-dre,positStart.y,positStart.x+dre,positStart.y,self.color3,2);
            self.helpDP.dLineParam(positStart.x,positStart.y-dre,positStart.x,positStart.y+dre,self.color3,2); 
            self.sp.render();
        }


        this.smd={x:0,y:0,inArXY:-1,param:0}
        this.dragB1=false

        this.startDragMove=function(){
            
            if(self.arrX.length==0)return
            self.testPosit();
            self.moveIn(); 

            this.par.par.getPositPlan(this.smd);
            this.smd.inArXY=self.inArXY;
            this.smd.pp=self.arrPanel[self.inArXY].pp
           
            self.dragB1=true

            dcmParam.addFunMove(this.move1);
            document.body.addEventListener("mouseup", this.funUp)
        }


        this.moveZdvig = function(a,_id,_p,_p1){  
            for (var i = 0; i < a.length; i++) {

                if(i <= _id){
                    a[i].zdwih(a[i].param,_p)
                }else{
                    a[i].zdwih(a[i].param,_p+_p1)
                }                   
            }
            self.sp.bigDrag();
            self.testPosit();
            self.moveIn(); 
            self.moveIn1(); 
        }
        
            
        var raz=2
        var pointDin=new Position()
        var p,p1
        var valid = true
        this.move1 = function(e){ 
            
            self.helpDP.alpha=1  
            self.helpDP.clear();

            if(self.arrX.length==0)return    

            var r=0;
            self.par.par.getPositPlan(pointDin);            
            p=pointDin.x-self.smd.x;
            p1=Math.floor(p*raz);
            if(p1!=0){                
                var zdvig=p1
                if(p1<0){
                    zdvig=p1
                }
                var zdvig1=self.smd.pp+zdvig;
                valid = true;
                if (zdvig1 <= 1) valid = false;
                if(self.bool!=true) if (self.arrPanel[self.smd.inArXY-1]) if (self.arrPanel[self.smd.inArXY-1].pp >= self.arrPanel[self.smd.inArXY].pp+zdvig) valid = false;
                
                if (valid == true) {   
                    self.moveZdvig(self.arrX, self.smd.inArXY, -zdvig/2, zdvig)
                    self.smd.pp=zdvig1;
                    self.par.par.getPositPlan(self.smd);
                    self.input.text=self.arrPanel[self.smd.inArXY].pp;
                } else {                     
                    self.sp.bigDrag();
                    self.testPosit();
                    self.moveIn(); 
                    self.moveIn1(); 
                }
            }
        }


        this.funUp = function(e){   
            
            self.dragB1=false
            dcmParam.removeFunMove(self.move1);
            document.body.removeEventListener("mouseup", self.funUp)
        }

        this.moveIn=function(){
            if(self.arrX.length==0)return
            self.poiskXY(arrX,"x");          

            // positStart.x,positStart.y-dre,positStart.x,positStart.y+dre,self.color3,3); 
                
            for (var i = 0; i < arrX.length; i++) {
                self.helpDP.dLineParam(arrX[i].array[0].position.x,arrX[i].array[0].position.y,arrX[i].array[0].position.x,self.rectScane.y1, self.color1, self.ooo*2);
                self.helpDP.dPoint(arrX[i].array[0].position,self.ooo,self.color1,self.ooo)   
            }

            if(self.inArXY!=-1){//выделяем левые
                if(self.bool)self.drawArrPoint(arrX[self.inArXY].array,arrX[self.inArXY].array[0].position.x,self.rectScane.y1,self.color1,self.color3,self.ooo*2)
                self.drawArrPoint(arrX[self.inArXY+1].array,arrX[self.inArXY+1].array[0].position.x,self.rectScane.y1,self.color1,self.color3,self.ooo*2)
            }
        }

        this.arrPanel=[];
        this.creatPan=function(i,tip){
            if(this.arrPanel[i]==undefined){
                if(tip==undefined)this.arrPanel[i]=new MPanel(this.dCont)
                else this.arrPanel[i]=new MPanelH(this.dCont)               
                if(i%2==0)this.arrPanel[i].setColor("#dddddd","#444444",dcmParam.color,dcmParam.colorText,0.35,1)
                else this.arrPanel[i].setColor("#444444","#dddddd",dcmParam.color,dcmParam.colorText,0.35,1)                
            }
        }



        //Пересчитываем позиции относительно масив/полоса
        this.moveIn1=function(){            
            for (var i = 0; i < arrX.length; i++) {
                arrX[i].posit1=Math.round(arrX[i].posit*self.par._mashtab-self.rectScane.x*self.par._mashtab)                
            }

            var www,www1,www2;
            www2=0;
            for (var i = 0; i < arrX.length-1; i++) {
                this.creatPan(i)
                this.arrPanel[i].x=arrX[i].posit1;
                this.arrPanel[i].y=this.otstup; 
                www=arrX[i+1].posit1-arrX[i].posit1;

                www1=Math.round(arrX[i+1].posit-arrX[i].posit);
                www2+=www1;
                this.arrPanel[i].setParam(www,this._height-this.otstup*2,self._bool?www1:www2,self._bool);
                this.arrPanel[i].visible=true;                             
            }  
            for (var i = arrX.length-1; i < this.arrPanel.length; i++) {
                this.arrPanel[i].visible=false;
            }

            if(this.arrPanel[self.inArXY]!=undefined)  {
                this.arrPanel[self.inArXY].active=true
                this.pInfo.visible = true  
                if(self._bool){
                    this.pInfo.x=this.arrPanel[self.inArXY].x+(this.arrPanel[self.inArXY].width-this.pInfo.width)/2; 

                }else{
                    this.pInfo.x=this.arrPanel[self.inArXY].x+this.arrPanel[self.inArXY].width-this.pInfo.width/2;

                }
                if(this.drag!=true){
                    this.input.text=this.arrPanel[self.inArXY].pp;
                } 

                this.pInfo.y=-this.pInfo.height;               
            } else{
                this.pInfo.visible=false                
            }
        }






        this.drawArrPoint = function(a,x,y,c,c1,wh){ 
            if(x){
                for (var i = 0; i < a.length; i++) {

                    self.helpDP.dLineParam(
                        a[i].position.x,a[i].position.y,
                        x,y,
                        c,wh*2
                    );
                    self.helpDP.dLineParam(
                        a[i].position.x,a[i].position.y,
                        x,y,
                        c1,wh
                    );
                }
            }
            for (var i = 0; i < a.length; i++) {
                point= a[i].position;
                self.helpDP.dPoint(a[i].position,wh*1.5,c,wh*1.5);   
                self.helpDP.dPoint(a[i].position,wh,c1,wh);   
            }
        }



        self.inArXY=-1;
        self.inPoXY=-1;
        this.corektBattonX = function(_inAr,_inPo){
            
            if(self.inArXY!=_inAr){
                if(self.arrPanel[self.inArXY]!=undefined)  self.arrPanel[self.inArXY].active=false;                 
            }            
            self.inArXY=_inAr;
            self.inPoXY=_inPo;        
        }


        var poi=new Position()
        var ii,ii1,max;
        this.poiskXY = function(a,p){ 
            
            if(this.drag==true)return
            this.par.par.getPositPlan(poi)
            ii=-1;
            ii1=-1;
            max=9999999999999999;
            for (var i = 0; i < a.length-1; i++) {   
                if(poi[p]>=a[i].posit&&poi[p]<=a[i+1].posit){             
                    ii=i;
                    break
                }
            }

            for (var i = 0; i < a.length-1; i++) {
                if(max>Math.abs(poi[p]-a[i].posit)){
                    max=Math.abs(poi[p]-a[i].posit);
                    ii1=i; 
                }
            } 
            this.corektBattonX(ii,ii1)
        }

        this.man="null";
        this.boolStart=false
        this.finalActive = function(){
            self.boolStart=false      
            self.pInfo.visible=false
            self.drag=false
            self.helpDP.clear();
            self.sp.render();
            dcmParam.removeFunMove(self.move)
            self.dCont.visible=false
            self.pan.visible=!self.dCont.visible
        }


        this.startActive= function(name){  
            self.boolStart=true;                
            self.testPosit();
            dcmParam.addFunMove(self.move);
            self.dCont.visible=true;
            self.pan.visible=!self.dCont.visible;

            if(arrX.length==0)self.finalActive();
        }




        this.getBlok= function(){ 
            for (var i = 0; i < arrYXCesh.length; i++) {
                if(arrYXCesh[i].active==false){
                    arrYXCesh[i].active=true
                    return arrYXCesh[i];
                }
            }
            arrYXCesh.push(new MKBlok(this.dCont));         
            return arrYXCesh[arrYXCesh.length-1]
        }

        this.param=null
        this.param1=null
        this.sortBla= function(a,b){ 
            if(self.param==null)return a[self.param1] - b[self.param1]
            return a[self.param][self.param1] - b[self.param][self.param1]    
        }


        var arrX=[]
        var arrY=[]
        this.arrX=arrX
        this.arrY=arrY
        var arrYXCesh=[]
        var positStart=new Position();
        var positFinal=new Position();
        var maxY,maxX;
        this.testPosit= function(){ 
            this.clear();
            for (var i = 0; i < this.sp.arrPoint.length; i++) {            
                if (this.sp.arrPoint[i].life==false) continue;                 
                this.testPosit1(this.sp.arrPoint[i],"x",arrX)
                this.testPosit1(this.sp.arrPoint[i],"y",arrY) 
            }

            for (var i = 0; i < this.sp.avp.length; i++) {            
                if (this.sp.avp[i].life==false) continue;
                if (this.sp.avp[i].gronVL!=undefined) continue;
                this.testPosit1(this.sp.avp[i],"x",arrX)
                this.testPosit1(this.sp.avp[i],"y",arrY) 
            }
            
            this.param=null;
            this.param1=null;

            arrX.sort(function(a, b){                    
                return a.posit - b.posit
            })
            for (var i = 0; i < arrX.length; i++) {
                arrX[i].array.sort(function(a, b){                    
                    return b.position.y - a.position.y
                })
            }



            arrY.sort(function(a, b){                    
                return a.posit - b.posit
            })

            for (var i = 0; i < arrY.length; i++) {
                arrY[i].array.sort(function(a, b){                    
                    return b.position.x - a.position.x
                })
            }

            if(arrX.length==0)return

            positStart.x=arrX[0].array[0].position.x
            positStart.y=arrY[arrY.length-1].array[0].position.y


            //узнаюм грани
            maxY=1 
        }



        var ii,blok
        this.testPosit1= function(aPoint,_p,arr){ 
            ii=-1
            for (var i = 0; i < arr.length; i++) {
                if(Math.round(arr[i].posit)==Math.round(aPoint.position[_p])){
                    ii=i
                    break;
                }
            }
            if(ii!=-1){//уже есть такая позиция
                arr[i].add(aPoint)
            }else{
                blok=this.getBlok();
                blok.posit=aPoint.position[_p];
                blok.param=_p;
                blok.add(aPoint);
                arr.push(blok);
            }
        }

        this.clear= function(){ 
            arrX.length=0;
            arrY.length=0;
            for (var i = 0; i < arrYXCesh.length; i++) {
                arrYXCesh[i].clear();
            }
        }    


        ////////////////////////////////////////////////////////////
        this.helpDP=undefined;
        this.sp=undefined;
        this.setSP=function(sp,helpDP){            
            this.sp=sp;
            self.helpDP=helpDP;   
            this.rectScane=this.par.par.rectScane         
        }

        this.bbbE=false
        this.aaaa=function(){ 
            
            self.input.object.focus(); 
            self.input.object.select(); 
            setTimeout(function() {
                self.input.object.focus(); 
                self.input.object.select(); 
                
                if(self.bbbE==false){
                    document.body.addEventListener("mousedown", self.moused)
                    self.bbbE=true
                }
            }, 10);
        }

        this.moused=function(e){
            
            let sDown="null";
            if(e && e.target&& e.target.uuid && e.target.uuid==self.uuid){
                sDown=e.target.tttt;     
            

            }
         

            if(sDown=="null"){
            
                self.finalActive()
                return
            }
            if(sDown=="panel"){
            
                self.drag=false; 

            }
        }

    }
     set height(value) {      
        if(this._height!=value){
            this._height= value;            
            this.dragWH()       
        }
    }    
    get height() { return  this._height;}


    set width(value) {      
        if(this._width!=value){
            this._width= value;            
            this.dragWH() 
        }
    }    
    get width() { return  this._width;}

    set bool(value) {      
        if(this._bool!=value){
            this._bool= value;                      
        }
    }    
    get bool() { return  this._bool;}

    set drag(value) {      
        if(this._drag!=value){
            this._drag=value;
            if(value==true){
                this.pInfo.alpha=1;
                this.aaaa()
             
            }else{
                this.pInfo.alpha=0.5;
                if(this.bbbE==true){
                    document.body.removeEventListener("mousedown", this.moused)
                    this.bbbE=false
                }
                
            }
                                
        }
    }    
    get drag() { return  this._drag;}
   
}


export class MKPanelVisiH extends MKPV {
    constructor(dCont, _x, _y, _otstup, _fun) {
        super(dCont, _x, _y, _otstup, _fun);           
        this.type="MKPanelVisiH";
        var self=this; 
        this.panel.y = 0; 
        this.panel.x = this.otstup; 
        this.pan.x = this.otstup; 

        this.setPosition1=function(){
            this.s=this.pos.h/this.pos1.h
            this.xx=this.pos.y-this.pos1.y
            this.ww=this.pos.h-this.pos1.h
            this.pr=1;
            if(this.ww!=0)this.pr=-this.xx/this.ww;    

            this.pan.height=Math.round(this.s*this._height);
            this.pan.y=(this._height-this.pan._height)*this.pr;
        } 

        // s=p.h/p1.h
        //     xx=p.y-p1.y
        //     ww=p.h-p1.h
        //     pr=1//-xx/ww
        //     if(ww!=0)pr=-xx/ww;         

        //     this.pan1.height=Math.round(s*this.panel1._height);
        //     this.pan1.y=(this.panel1._height-this.pan1._height)*pr; 



        var raz=2
        var pointDin=new Position()
        var p,p1
        var valid = true
        this.move1 = function(e){     
            self.helpDP.alpha=1  
            self.helpDP.clear();
            var r=0;
            self.par.par.getPositPlan(pointDin);            
            p=pointDin.y-self.smd.y;
            p1=Math.floor(p*raz);
            if(p1!=0){                
                var zdvig=p1        
                if(p1<0){
                    zdvig=p1
                }
                var zdvig1=self.smd.pp+zdvig;

                valid = true
                if (zdvig1 <= 1) valid = false
                if(self.bool!=true) if (self.arrPanel[self.smd.inArXY-1]) if (self.arrPanel[self.smd.inArXY-1].pp+(-zdvig/2) <= self.arrPanel[self.smd.inArXY].pp+zdvig) valid = false
                if(self.bool!=true) if (self.arrPanel[self.smd.inArXY+1]) if (self.arrPanel[self.smd.inArXY+1].pp+(-zdvig/2) >= self.arrPanel[self.smd.inArXY].pp+zdvig) valid = false
                
                if (valid == true) {   
                    self.moveZdvig(self.arrY,self.smd.inArXY,-zdvig/2,zdvig)
                    self.smd.pp=zdvig1;
                    self.par.par.getPositPlan(self.smd);
                    self.input.text=self.arrPanel[self.smd.inArXY].pp;
                } else {                     
                    self.sp.bigDrag();
                    self.testPosit();
                    self.moveIn(); 
                    self.moveIn1(); 
                }

            }
        }










        this.moveIn=function(){
            if(self.arrY.length==0)return
            self.poiskXY(self.arrY,"y"); 
            
                
            for (var i = 0; i < self.arrY.length; i++) {
                self.helpDP.dLineParam(self.arrY[i].array[0].position.x,self.arrY[i].array[0].position.y,self.rectScane.x1,self.arrY[i].array[0].position.y, self.color1, self.ooo*2);
                self.helpDP.dPoint(self.arrY[i].array[0].position,self.ooo,self.color1,self.ooo)                   
            }

            if(self.inArXY!=-1){//выделяем левые
                self.drawArrPoint(self.arrY[self.inArXY].array, self.rectScane.x1, self.arrY[self.inArXY].array[0].position.y, self.color1,self.color3,self.ooo*2)
                if(self.bool)self.drawArrPoint(self.arrY[self.inArXY+1].array, self.rectScane.x1, self.arrY[self.inArXY+1].array[0].position.y, self.color1,self.color3,self.ooo*2)
            }
        }


        
        // Срабатывает от пользовательского ввода с клавиатуры в поле левой линейки 
        var valid = true;
        this.setPNew=function(p){       
            self.helpDP.clear();
            if (p < 0) p = 10
            if(self.bool==true){
                if(self.inArXY!=-1){ 
                    let sd = p-self.arrPanel[self.inArXY].pp;

                    if(sd<=-(self.arrPanel[self.inArXY].pp-1)){
                        sd=-(self.arrPanel[self.inArXY].pp-1)
                    }
                    let sd2=-(sd/2)

                    for (var i = 0; i < self.arrY.length; i++) {
                        if(i <= self.inArXY){
                            self.arrY[i].zdwih("y",sd2)
                        }else{
                            self.arrY[i].zdwih("y",sd2+sd)
                        }
                        
                    }
                    self.sp.bigDrag();
                    self.testPosit();
                    self.moveIn(); 
                    self.moveIn1();                   
                }
            }else{
                if(self.inArXY!=-1){ 
                    let sd = p-self.arrPanel[self.inArXY].pp;

                    if(sd<=-(self.arrPanel[self.inArXY].pp-1)){
                        sd=-(self.arrPanel[self.inArXY].pp-1)
                    }
                    let sd2=-(sd/2)  
                    
                    valid = true;
                    if (self.arrPanel[self.inArXY-1]) if (self.arrPanel[self.inArXY-1].pp >= self.arrPanel[self.inArXY].pp+sd) valid = false;

                    if (valid == true){
                        for (var i = 0; i < self.arrY.length; i++) {
                            if(i <= self.inArXY){
                                self.arrY[i].zdwih("y",-sd)                    

                            }                        
                        }
                    }

                    self.input.text=self.arrPanel[self.smd.inArXY].pp;
                    self.sp.bigDrag();
                    self.testPosit();
                    self.moveIn(); 
                    self.moveIn1();                   
                }
            }
        }



        //Пересчитываем позиции относительно масив/полоса
        this.moveIn1=function(){                        
            for (var i = 0; i < self.arrY.length; i++) {
                self.arrY[i].posit1=Math.round(self.arrY[i].posit*self.par._mashtab-self.rectScane.y*self.par._mashtab)                
            }

            

            var www,www1,www2,ww3,ww4;
            www2=0;
            if(self._bool==true){
                for (var i = 0; i < self.arrY.length-1; i++) {
                    this.creatPan(i,true)
                    this.arrPanel[i].y=self.arrY[i].posit1;
                    this.arrPanel[i].x=this.otstup;

                    www=self.arrY[i+1].posit1-self.arrY[i].posit1;

                    www1=Math.round(self.arrY[i+1].posit-self.arrY[i].posit);

                    www2+=www1; 

                    if(self._bool==true){
                        ww3=www1
                        ww4=www1
                    }else{
                        ww3=www2
                        ww4=hh-ww3

                        // 
                    }
                    this.arrPanel[i].setParam(this._width-this.otstup*2,www,www1,self._bool,www1);
                    this.arrPanel[i].visible=true;                             
                }  
                


            }else{
                var hh=self.arrY[self.arrY.length-1].posit-self.arrY[0].posit
                
                for (var i = self.arrY.length-2; i >= 0; i--) {
                    this.creatPan(i,true)
                    this.arrPanel[i].y=self.arrY[i].posit1;
                    this.arrPanel[i].x=this.otstup;

                    www=self.arrY[i+1].posit1-self.arrY[i].posit1;

                    www1=Math.round(self.arrY[i+1].posit-self.arrY[i].posit);
                    www2+=www1; 

                    this.arrPanel[i].setParam(this._width-this.otstup*2,www,www2,self._bool,www2);
                    this.arrPanel[i].visible=true; 
                }
            }


            


            for (var i = self.arrY.length-1; i < this.arrPanel.length; i++) {
                this.arrPanel[i].visible=false;
            }

            if(this.arrPanel[self.inArXY]!=undefined)  {
                this.arrPanel[self.inArXY].active=true
                this.pInfo.visible = true  
                if(self._bool){
                    this.pInfo.y=this.arrPanel[self.inArXY].y+(this.arrPanel[self.inArXY].height-this.pInfo.height)/2;
                }else{
                    this.pInfo.y=this.arrPanel[self.inArXY].y-this.pInfo.height/2;
                }
                if(this.drag!=true){
                    this.input.text=this.arrPanel[self.inArXY].pp;
                } 
                this.pInfo.x=-this.pInfo.width;               
            } else{
                this.pInfo.visible=false                
            }
        }



        this.dragWH=function(){
            this.panEvent.height= this._height;
            this.panEvent.width= this._width;

            this.panel.width=this._width-this.otstup*2;
            this.panel.height=this._height;            
            this.pan.width=this._width-this.otstup*2;

            this.dCont.div.style.clip = "rect(0px "+this._width+"px "+this._height+"px 0px)";

        }
    } 
}

export class MPanelH extends MPanel {
    constructor(dCont, _x, _y,_fun) {
        super(dCont, _x, _y,_fun);           
        this.type="MPanelH";
        var self=this; 
        this.fun=_fun;


        this.label.div

        var deg=-90





        var wt=0
        this.korectParam=function(){
            
            let b=true
            if(this.label.text!=this.t1+''){
                this.label.text=this.t1+''
                b=true       
            }
            wt = this.label._text.length*10;



            this.dL.x=-38
            this.dL.y=-32
            if(this.label._text.length>=4)this.dL.y+=(this.label._text.length-3)*8
            
            if(this.bool){
                this.dL.y+=(this._height-wt)/2
            }else{
                this.dL.y+=7
                //this.dL.y+=(this._height-wt)
            }


            if(this._height < wt){
               this.label.visible=false;
            } else{
           
                this.label.dCT.div.style.webkitTransform = 'rotate('+deg+'deg)'; 
                this.label.dCT.div.style.mozTransform    = 'rotate('+deg+'deg)'; 
                this.label.dCT.div.style.msTransform     = 'rotate('+deg+'deg)'; 
                this.label.dCT.div.style.oTransform      = 'rotate('+deg+'deg)'; 
                this.label.dCT.div.style.transform       = 'rotate('+deg+'deg)'; 

                this.label.visible=true;
            }          
        } 
    }
}






export class MKPanelVisiW extends MKPV {
    constructor(dCont, _x, _y, _otstup, _fun) {
        super(dCont, _x, _y, _otstup, _fun);           
        this.type="MKPanelVisiW";
        var self=this;    


    }
 
}


