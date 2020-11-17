






import { SobIndex } from './SobIndex.js';
import { Position } from './Calc.js';


export class SobIndex1  extends SobIndex {
    constructor(par,fun) {
        super(par,fun);            
        this.type="SobIndex1";
        var self=this;
        this.par=par;
        this.fun=fun;
        this.aTool=["Sten","Pol"]
        this._tool="Sten";

        var pos={x:0,y:0,o:null}
        var sp={x:0,y:0,x1:0,y1:0,s:0,o:null,oy:null,ox:null}
        var point,point1,activObject;


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

            if(sp.o==undefined){
               
                return

            }

            pos.x=sp.o.position.x;
            pos.y=sp.o.position.y;
            self.korektAP(pos,sp.o);

            if(self._tool=="Sten"){//стена            
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
                self.stopUp()
            }

            if(self._tool=="Pol"){//стена 

                var b=false
                if(pos.o!=null&&pos.o.type!=undefined){
                    if(pos.o.type=="SpPointSten"){
                       /* sp.o.slitie(pos.o)
                        sp.o.dragVokrug();*/
                        point1=pos.o;

                        if(activObject.array.length>3 && activObject.array[0].idArr==point1.idArr){
                            self.stopUp()
                            return
                        }


                        if(activObject.array[activObject.array.length-1].idArr!=point1.idArr){
                            activObject.addPoint(point1, activObject.array.length-1);
                        }                       


                        b=true;
                    }                   
                    if(pos.o.type=="SpliceSten"){
                        point1=self.p20.sp.craetPoint();
                        point1.position.setPoint(pos);
                        activObject.addPoint(point1, activObject.array.length-1);
                        b=true;                      
                    }
                }

                if(b==false){
                    
                    point1=self.p20.sp.craetPoint();
                    point1.position.setPoint(positDin);                   
                    activObject.addPoint(point1, activObject.array.length-1);
                }
                for (var i = activObject.array.length-1; i >=1; i--) {
                    if(activObject.array[i].idArr==activObject.array[i-1].idArr){
                        activObject.array.splice(i,1)
                        activObject.drag();
                    }
                }
                
                
             /*  trace(">>>>>",activObject,point1)
                for (var i = 0; i < activObject.array.length; i++) {
                    trace(i+"@@"+activObject.array[i].idArr)
                }*/

            }
           
        }


        this.sobMenu=function(s,p,e){      
        
            if(s=="gIndex"){//переключаем инструмент
                self.tool=self.aTool[p.index]               
                return;
            }
            
        }


        this.boolUp=false;
        this.startUp=function(){
            if(self.boolUp==true)return
            self.boolUp=true; 
            console.warn(">>>>>>>>>>>>startUp********>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
            document.addEventListener("mouseup", self.mouseup);
        }
        this.stopUp=function(){
            if(self.boolUp==false)return
            self.boolUp=false; 

            if(self._tool=="Pol"){
                activObject.removePoint(point)
                trace(point.idArr)
                trace(activObject)
                for (var i = 0; i < activObject.array.length; i++) {
                    trace(i+"  "+activObject.array[i].idArr)
                }
               
                if(activObject.array.length<=2)activObject.clear();


                point.clear();
                sp.o=undefined
            }
            console.warn("<<<<<<<<<<<<<<stopUp********<<<<<<<<<<<<<<<<<")
            document.addEventListener("mouseup", self.mouseup);
        }

        this.sobSP=function(s,p,e){
           
            
            if( e.data.originalEvent.button==1){ 
                self.downFont(e); 
                return;
            }
            

            if(self.boolUp==true && self._tool=="Pol"){                
                if( e.data.originalEvent.button==2){                    
                    self.stopUp();
                }
                return;
            }


            trace("@@@@@@@@@@@@@@@@@@",s,p,e)
            


            if(s=="downFont"){




                point=self.p20.sp.craetPoint();
                point1=self.p20.sp.craetPoint();                
                

                if(self._tool=="Sten"){//стена
                    activObject=self.p20.sp.craetSplice1();                    
                    point.addSplice(activObject, true);
                    point1.addSplice(activObject, false);
                }
                
                
                if(self._tool=="Pol"){//полигон
                    activObject=self.p20.sp.craetPol();
                    activObject.activMouse=false; 
                    activObject.activMouse=false;  
                    activObject.addPoint(point1);
                    activObject.addPoint(point);
                    point.activMouse=false;
                    trace("%%%%%%%%%%%%%%%%%%%",activObject.idArr)
                    for (var i = 0; i < activObject.array.length; i++) {
                        trace(i+"@@"+activObject.array[i].idArr)
                    }
                }


                
                point.position.set(positDin.x,positDin.y);
                point1.position.set(positDin.x,positDin.y);
                point1.dragPost()
                self.par.par.mObject.setObject(activObject); 

                
                sp.x=positDin.x;
                sp.y=positDin.y;

                sp.x1 = e.data.originalEvent.clientX//+self.cont.x;
                sp.y1 = e.data.originalEvent.clientY; 
                sp.s = self.sp._mashtab;
                
                sp.o = point;

                self.pointOld={x:positDin.x,y:positDin.y,uuidArr:[point.uuid,point1.uuid]}
                
                self.startUp()
            }

            if(s=="downSten"){ 

                let po1=this.getPositPlan();       
                let pppo=calc.isPointInLin( p.position, p.position1, po1, 11111,0);  
                if(pppo==null)return           

                
                point=self.p20.sp.craetPoint();
                point1=self.p20.sp.craetPoint();
                point1.position.set(pppo.x,pppo.y);



                //p.dividedSten(point1)
                           
                

           


                if(self._tool=="Sten"){//стена
                    activObject=self.p20.sp.craetSplice1();                    
                    point.addSplice(activObject, true);
                    point1.addSplice(activObject, false);
                }
                
                
                if(self._tool=="Pol"){//полигон
                    activObject=self.p20.sp.craetPol();
                    activObject.activMouse=false; 
                    activObject.activMouse=false;  
                    activObject.addPoint(point1);
                    activObject.addPoint(point);
                    point.activMouse=false;
                }





                
                point.position.set(pppo.x,pppo.y);
                point1.position.set(pppo.x,pppo.y);
                point1.dragPost()



                self.par.par.mObject.setObject(activObject)      
                
                sp.x=pppo.x;
                sp.y=pppo.y;

                sp.x1 = e.data.originalEvent.clientX//+self.cont.x;
                sp.y1 = e.data.originalEvent.clientY; 
                sp.s = self.sp._mashtab;
                
                sp.o = point;

                self.pointOld={x:pppo.x,y:pppo.y,uuidArr:[point.uuid,point1.uuid]}
                self.startUp()
              

            }

            if(s=="downPoint"){
                point=self.p20.sp.craetPoint();
                point.position.setPoint(p.position);
                





                if(self._tool=="Sten"){//стена
                    activObject=self.p20.sp.craetSplice1();                    
                    point.addSplice(activObject, true);
                    p.addSplice(activObject, false);
                }
                
                
                if(self._tool=="Pol"){//полигон
                    activObject=self.p20.sp.craetPol();
                    activObject.activMouse=false; 
                    activObject.activMouse=false;  
                    activObject.addPoint(p);
                    activObject.addPoint(point);
                    point.activMouse=false;
                }


   

                self.par.par.mObject.setObject(activObject)      
                
                sp.x=p.position.x;
                sp.y=p.position.y;

                sp.x1 = e.data.originalEvent.clientX//+self.cont.x;
                sp.y1 = e.data.originalEvent.clientY; 
                sp.s = self.sp._mashtab;
                sp.o = point;
                var a=[]
                if(self._tool=="Sten")a=[activObject._addPoint.uuid,activObject._addPoint.uuid]
                self.pointOld={x:p.position.x,y:p.position.y,uuidArr:a}
                self.startUp()
                              
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
            
  

            self.sp.render()


            if(sp.o!=undefined){
                if(sp.o.type=="SpPointSten"){
                    sp.o.position.x=positDin.x;
                    sp.o.position.y=positDin.y;           
                    self.p20.sp.addObjFun(sp.o);
                }
            }
        }

        this.funActive=function(){
            if(this._active==true){
                dcmParam.addFunMove(self.mouseMoveAll);
            }else{
                dcmParam.removeFunMove(self.mouseMoveAll);
            }
            this.stopUp()
        }

    }

    set tool(v) {
        if(this._tool!=v){
            this._tool = v; 
            this.stopUp()
        }       
    }   
    get tool() { return  this._tool;}  


}











