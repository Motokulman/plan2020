






import { SobIndex } from './SobIndex.js';


export class SobIndex1  extends SobIndex {
    constructor(par,fun) {
        super(par,fun);            
        this.type="SobIndex1";
        var self=this;
        this.par=par;
        this.fun=fun;

        var pos={x:0,y:0,o:null}
        var sp={x:0,y:0,x1:0,y1:0,s:0,o:null}
        var point,point1,activSten;
        this.mousemove=function(e){           
            pos.x=sp.x+(e.clientX-sp.x1)/sp.s;
            pos.y=sp.y+(e.clientY-sp.y1)/sp.s;            
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
            self.pointOld=undefined
            document.removeEventListener("mouseup", self.mouseup);
            document.removeEventListener("mousemove", self.mousemove); 
        }


        this.sobSP=function(s,p,e){          
            if( e.data.originalEvent.button!=0){ 
                self.downFont(e); 
                return;
            }

            

            if(s=="downFont"){
                point=self.p20.sp.craetPoint();
                point1=self.p20.sp.craetPoint();                
                

                activSten=self.p20.sp.craetSplice1();                    
                point.addSplice(activSten, true);
                point1.addSplice(activSten, false);
                
                point.position.set(p.position.x,p.position.y);
                point1.position.set(p.position.x,p.position.y);
                point1.dragPost()

                //activSten.delph=500; 

                self.par.par.mObject.setObject(activSten); 

                
                sp.x=p.position.x;
                sp.y=p.position.y;

                sp.x1 = e.data.originalEvent.clientX//+self.cont.x;
                sp.y1 = e.data.originalEvent.clientY; 
                sp.s = self.sp._mashtab;
                
                sp.o = point;

                self.pointOld={x:p.position.x,y:p.position.y,uuidArr:[point.uuid,point1.uuid]}
                document.addEventListener("mouseup", self.mouseup);
                document.addEventListener("mousemove", self.mousemove); 
            }

            if(s=="downSten"){

                



                let po1=this.getPositPlan();
       
                let pppo=calc.isPointInLin( p.position, p.position1, po1, 11111,0);  
                if(pppo==null)return

            

                
                point=self.p20.sp.craetPoint();
                point1=self.p20.sp.craetPoint();
                point1.position.set(pppo.x,pppo.y);


                p.dividedSten(point1)
                           
                

                activSten=self.p20.sp.craetSplice1();                    
                point.addSplice(activSten, true);
                point1.addSplice(activSten, false);
                
                point.position.set(pppo.x,pppo.y);
                point1.position.set(pppo.x,pppo.y);
                point1.dragPost()



                self.par.par.mObject.setObject(activSten)      
                
                sp.x=pppo.x;
                sp.y=pppo.y;

                sp.x1 = e.data.originalEvent.clientX//+self.cont.x;
                sp.y1 = e.data.originalEvent.clientY; 
                sp.s = self.sp._mashtab;
                
                sp.o = point;

                self.pointOld={x:pppo.x,y:pppo.y,uuidArr:[point.uuid,point1.uuid]}
                document.addEventListener("mouseup", self.mouseup);
                document.addEventListener("mousemove", self.mousemove);

            }

            if(s=="downPoint"){

                point=self.p20.sp.craetPoint();
                point.position.setPoint(p.position);
                activSten=self.p20.sp.craetSplice1();                    
                point.addSplice(activSten, true);
                p.addSplice(activSten, false);
   

                self.par.par.mObject.setObject(activSten)      
                
                sp.x=p.position.x;
                sp.y=p.position.y;

                sp.x1 = e.data.originalEvent.clientX//+self.cont.x;
                sp.y1 = e.data.originalEvent.clientY; 
                sp.s = self.sp._mashtab;
                sp.o = point;
                self.pointOld={x:p.position.x,y:p.position.y,uuidArr:[activSten._addPoint.uuid,activSten._addPoint.uuid]}
                document.addEventListener("mouseup", self.mouseup);
                document.addEventListener("mousemove", self.mousemove);                    
                 
            }
                     
        }
    }
}











