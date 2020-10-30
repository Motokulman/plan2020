
import { SobIndex } from './SobIndex.js';


export class SobIndex0  extends SobIndex {
    constructor(par,fun) {
        super(par,fun);            
        this.type="SobIndex0";
  		var self=this;
        this.par=par;
        this.fun=fun;

        var pos={x:0,y:0,o:null}
        var pos1={x1:0,y1:0,o:null}
        var sp={x:0,y:0,x1:0,y1:0,s:0,o:null}
        this.mousemove=function(e){           
            pos.x=sp.x+(e.clientX-sp.x1)/sp.s
            pos.y=sp.y+(e.clientY-sp.y1)/sp.s            
            self.korektAP(pos,sp.o);
            sp.o.position.x=pos.x;
            sp.o.position.y=pos.y;
            self.p20.sp.addObjFun(sp.o);        
        } 


        this.mouseup=function(e){
            
            pos.x=sp.o.position.x;
            pos.y=sp.o.position.y;
            self.korektAP(pos,sp.o);
            
            if(pos.o!=null&&pos.o.type!=undefined){
                if(pos.o.type=="SpPointSten"){
                    sp.o.slitie(pos.o)
                    sp.o.dragVokrug();
                }                   
                if(pos.o.type=="SpliceSten"){
                    pos.o.dividedSten(sp.o,true)
                    sp.o.dragVokrug();                        
                }                     
            }            
            document.removeEventListener("mouseup", self.mouseup);
            document.removeEventListener("mousemove", self.mousemove); 
        }



        var rect={x:0,y:0,x1:0,y1:0,w:0,h:0,o:null}
        this.mousemove1=function(e){           
            self.getPositPlan(pos1); 
            if(pos.x<pos1.x){
                rect.x=pos.x
                rect.w=pos1.x-pos.x
            }else{
                rect.x=pos1.x
                rect.w=pos.x-pos1.x 
            } 

            if(pos.y<pos1.y){
                rect.y=pos.y
                rect.h=pos1.y-pos.y
            }else{
                rect.y=pos1.y
                rect.h=pos.y-pos1.y 
            } 
            self.sp.group.setRect(rect);
        } 


        this.mouseup1=function(e){
            self.mousemove1()
            self.sp.group.addRect(rect);
            self.sp.group.setRect(); 

                     
            document.removeEventListener("mouseup", self.mouseup1);
            document.removeEventListener("mousemove", self.mousemove1); 
        }





        this.sobSP=function(s,p,e){
            if(e.data.originalEvent.button==2){                 
                if(self.boolCTRL==false)self.sp.group.active=false;
                if(self.sp.group.active == false){
                    self.sp.group.active = true;
                    self.par.par.mObject.setObject(self.sp.group) 
                }
              
                self.getPositPlan(pos);  

                document.addEventListener("mouseup", self.mouseup1);
                document.addEventListener("mousemove", self.mousemove1); 
                return;
            }
           
            if(self.boolCTRL==true){
               
            
                if(s=="downPoint"||s=="downSten"){
                    if(self.sp.group.active == false){
                        self.sp.group.active = true;
                        self.par.par.mObject.setObject(self.sp.group) 
                    }
                    
                    var r = self.sp.group.addObj(p);
                    if(r==false)self.sp.group.removeObj(p);
                    return;
                }
            }
            self.sp.group.active = false

            if(p)self.par.par.mObject.setObject(p) 
            if(s=="downPoint"){
                self.sp.group.active=false;
                self.par.par.mObject.setObject(p) 
                if( e.data.originalEvent.button==0){ 
                    sp.x=p.position.x;
                    sp.y=p.position.y;
                    sp.x1 = e.data.originalEvent.clientX
                    sp.y1 = e.data.originalEvent.clientY; 
                    sp.s= self.sp._mashtab;
                    sp.o=p
                    document.addEventListener("mouseup", self.mouseup);
                    document.addEventListener("mousemove", self.mousemove); 
                    return;
                }
            }
            self.downFont(e);            
        }
    }
}
      