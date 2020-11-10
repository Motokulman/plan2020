






import { SobIndex } from './SobIndex.js';
import { Position } from './Calc.js';


export class SobIndex1  extends SobIndex {
    constructor(par,fun) {
        super(par,fun);            
        this.type="SobIndex1";
        var self=this;
        this.par=par;
        this.fun=fun;

        var pos={x:0,y:0,o:null}
        var sp={x:0,y:0,x1:0,y1:0,s:0,o:null,oy:null,ox:null}
        var point,point1,activSten;
        this.mousemove=function(e){           
            pos.x=sp.x+(e.clientX-sp.x1)/sp.s;
            pos.y=sp.y+(e.clientY-sp.y1)/sp.s;            
            self.korektAP(pos,sp.o);
            sp.o.position.x=pos.x;
            sp.o.position.y=pos.y;           
            self.p20.sp.addObjFun(sp.o);


            self.helpDP.clear();
            if(pos.oy!=null)self.helpDP.dLineParam(sp.o.position.x,sp.o.position.y, sp.o.position.x, pos.oy)
            if(pos.ox!=null)self.helpDP.dLineParam(sp.o.position.x,sp.o.position.y, pos.ox, sp.o.position.y)
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
                    //pos.o.dividedSten(sp.o,true)
                    sp.o.dragVokrug();                        
                }                     
            }
            self.pointOld=undefined;
            self.helpDP.clear();
            sp.o=undefined

            document.removeEventListener("mouseup", self.mouseup);
            //document.removeEventListener("mousemove", self.mousemove); 
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
                
                point.position.set(positDin.x,positDin.y);
                point1.position.set(positDin.x,positDin.y);
                point1.dragPost()

                //activSten.delph=500; 

                self.par.par.mObject.setObject(activSten); 

                
                sp.x=positDin.x;
                sp.y=positDin.y;

                sp.x1 = e.data.originalEvent.clientX//+self.cont.x;
                sp.y1 = e.data.originalEvent.clientY; 
                sp.s = self.sp._mashtab;
                
                sp.o = point;

                self.pointOld={x:positDin.x,y:positDin.y,uuidArr:[point.uuid,point1.uuid]}
                document.addEventListener("mouseup", self.mouseup);
                //document.addEventListener("mousemove", self.mousemove); 
            }

            if(s=="downSten"){ 

                let po1=this.getPositPlan();
       
                let pppo=calc.isPointInLin( p.position, p.position1, po1, 11111,0);  
                if(pppo==null)return

            

                
                point=self.p20.sp.craetPoint();
                point1=self.p20.sp.craetPoint();
                point1.position.set(pppo.x,pppo.y);


                //p.dividedSten(point1)
                           
                

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
                //document.addEventListener("mousemove", self.mousemove);

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
                //document.addEventListener("mousemove", self.mousemove);                
            }                     
        }
        var colorActiv=0xf28044
        var swh=1
        var swh1=5        
        var wwwh,wwwh1
        var positDin={x:0,y:0,x1:0,y1:0,s:0,o:null,oy:null,ox:null}
        this.mouseMoveAll=function(e){ 
          

            self.par.par.mGridDrag.getPositPlan(positDin);
          

            self.korektAP(positDin);
            self.helpDP.clear();
            self.helpDP.alpha=1
            wwwh=swh/self._mashtab
            wwwh1=swh1/self._mashtab

            if(positDin.ox!=null){

                self.helpDP.dLineParam(positDin.x, positDin.y, positDin.ox, positDin.y,undefined,wwwh)

                self.helpDP.dPointParam(positDin.ox, positDin.y,(wwwh1),undefined,wwwh1) 
                self.helpDP.dPointParam(positDin.ox, positDin.y,(wwwh1)/2,colorActiv,wwwh1/2)
            }              
            if(positDin.oy!=null){

                self.helpDP.dLineParam(positDin.x, positDin.y, positDin.x, positDin.oy,undefined,wwwh)

                self.helpDP.dPointParam(positDin.x, positDin.oy,(wwwh1),undefined,wwwh1) 
                self.helpDP.dPointParam(positDin.x, positDin.oy,(wwwh1)/2,colorActiv,wwwh1/2)  
            }      
            
            //if(pos.oy!=null)self.helpDP.dLineParam(sp.o.position.x,sp.o.position.y, sp.o.position.x, pos.oy)
           /* if(posit.oy!=null){                
                self.helpDP.dLineParam(posit.x, posit.y, posit.x, pos.oy)
            }*/
            

            self.sp.render()


            if(sp.o!=undefined){
                if(sp.o.type=="SpPointSten"){
                    sp.o.position.x=positDin.x;
                    sp.o.position.y=positDin.y;           
                    self.p20.sp.addObjFun(sp.o);
                }
            }



                /*
            pos.x=sp.x+(e.clientX-sp.x1)/sp.s;
            pos.y=sp.y+(e.clientY-sp.y1)/sp.s;            
            self.korektAP(pos,sp.o);
            sp.o.position.x=pos.x;
            sp.o.position.y=pos.y;           
            self.p20.sp.addObjFun(sp.o);


           */

        }

        this.funActive=function(){
            if(this._active==true){
                dcmParam.addFunMove(self.mouseMoveAll);
            }else{
                dcmParam.removeFunMove(self.mouseMoveAll);
            }
        }

    }
}











