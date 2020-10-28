
import { SobIndex } from './SobIndex.js';


export class SobIndex0  extends SobIndex {
    constructor(par,fun) {
        super(par,fun);            
        this.type="SobIndex0";
  		var self=this;
        this.par=par;
        this.fun=fun;

        var pos={x:0,y:0,o:null}
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


        this.sobSP=function(s,p,e){
            if(p)self.par.par.mObject.setObject(p)     

            if(s=="downPoint"){
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
      