



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
        this._menuIndex=-1;
        this._activeMove="null"
        this.sp=undefined

        this.dCont = new DCont(this.par.dCont); 
        this.dCont.x=this.otstup;
        this.dCont.y=this.otstup*4+this.wh

        this.panel = new DPanel(this.dCont,0,0);
        this.panel.height=this.wh/2;

        this.panel1 = new DPanel(this.dCont,0,0);
        this.panel1.width=this.wh/2;


        this.pan = new DPanel(this.dCont,0,0);
        this.pan.height=this.wh/2;
        this.pan.color='#dddddd' 
        this.pan.alpha=0.35

        this.pan1 = new DPanel(this.dCont,0,0);
        this.pan1.width=this.wh/2;
        this.pan1.color='#dddddd'
        this.pan1.alpha=0.35





        this.panEvent= new DPanel(this.dCont,0,0);
        this.panEvent.height=this.wh/2+this.otstup*2;
        this.panEvent.color='#ffffff';
        this.panEvent.alpha=0.05;
        this.panEvent.dCont.div.name="panEvent"
        

        this.panEvent1 = new DPanel(this.dCont,0,0);
        this.panEvent1.width=this.wh/2+this.otstup*2;
        this.panEvent1.color='#ffffff';
        this.panEvent1.alpha=0.05;
        this.panEvent1.dCont.div.name="panEvent1"


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

        this.mousedown=function(e){ 

            unSkrol=false;
            if(e.target.name=="panEvent")unSkrol=true;

            if(self._menuIndex==2){
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

        this.mouseover=function(e){ 
            unSkrol=false;
            if(e.target.name=="panEvent")unSkrol=true;           
            
            if(self._menuIndex==2){
                self.activeMove="lines";

            }

            

        }
        this.mouseout=function(e){ 
            unSkrol=false;
            if(e.target.name=="panEvent")unSkrol=true;

            if(self._menuIndex==2){
                if(self.activeMove!="linesOtstup")self.activeMove = "null"
            }

        }


        if(dcmParam.mobile==false){
            this.panEvent.dCont.div.addEventListener("mousedown", self.mousedown)
            this.panEvent.dCont.div.addEventListener("mouseover", self.mouseover)
            this.panEvent.dCont.div.addEventListener("mouseout", self.mouseout)

            this.panEvent1.dCont.div.addEventListener("mousedown", self.mousedown)
            this.panEvent1.dCont.div.addEventListener("mouseover", self.mouseover)
            this.panEvent1.dCont.div.addEventListener("mouseout", self.mouseout)

        }else{
            this.panEvent.dCont.div.addEventListener("touchstart", self.mousedown)
            this.panEvent1.dCont.div.addEventListener("touchstart", self.mousedown)
        }







        this.set= function(p,p1){     
          
            let s=p.w/p1.w
            let xx=p.x-p1.x
            let ww=p.w-p1.w
            let pr=1//-xx/ww
            if(ww!=0)pr=-xx/ww
    

            this.pan.width=Math.round(s*this.panel._width);
            this.pan.x=(this.panel._width-this.pan._width)*pr;

          
            s=p.h/p1.h
            xx=p.y-p1.y
            ww=p.h-p1.h
            pr=1//-xx/ww
            if(ww!=0)pr=-xx/ww;         

            this.pan1.height=Math.round(s*this.panel1._height);
            this.pan1.y=(this.panel1._height-this.pan1._height)*pr;
        }

        this.setSP=function(sp){            
            this.sp=sp
        }



        this.sizeWindow = function(w,h,s){ 
            this.pan.y=this.panel.y=h+this.otstup
            this.panel.width=w; 

            this.pan1.x=this.panel1.x=w+this.otstup
            this.panel1.height=h;


            this.panEvent.width=this.panel.width;
            this.panEvent.y=h;


            this.panEvent1.height=h;;
            this.panEvent1.x=w;
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
}
