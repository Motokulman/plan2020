






import { SobIndex } from './SobIndex.js';
import { Position } from './Calc.js';


export class SobIndex4  extends SobIndex {
    constructor(par,fun) {
        super(par,fun);            
        this.type="SobIndex4";
        var self=this;
        this.par=par;
        this.fun=fun;
        this.aTool=["Sten","Pol"]
        this._tool="Pol";
        this._unikName="PubRoof";

        var pos={x:0,y:0,o:null}
        var sp={x:0,y:0,x1:0,y1:0,s:0,o:null,oy:null,ox:null}
        var point,point1,activObject;


      

        this.mouseup=function(e){

            if(sp.o==undefined){               
                return
            }
            if( e.button==2){ 
                self.stopUp()  
                return
            }
       
            if(self._tool=="vp"){//стена 
                self.stopUp(); 
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
            dcmParam.addFunMove(self.mouseMoveAll);
            console.warn(">>>>>>>>>>>>startUp********>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
            document.addEventListener("mouseup", self.mouseup);
        }
        this.stopUp=function(){
            if(self.boolUp==false)return
            self.boolUp=false; 

            if(self._tool=="Pol"){

                activObject.removePoint(point)               
                for (var i = 0; i < activObject.array.length; i++) {
                    
                    activObject.array[i].activMouse=true
                }
               
                if(activObject.array.length<=2){
                    activObject.clear();
                }
                point.clear();
                
            }
            sp.o.activMouse=true;
            dcmParam.removeFunMove(self.mouseMoveAll);
            sp.o=undefined;
            
            console.warn("<<<<<<<<<<<<<<stopUp********<<<<<<<<<<<<<<<<<")
            document.addEventListener("mouseup", self.mouseup);
        }


        this.dragVP=function(p){
            self._tool="vp";
            sp.o=p;
            p.activMouse=false;
            self.par.par.mObject.setObject(p); 
            sp.o.active=true
            self.startUp();            
        }


        this.sobSP=function(s,p,e){
            if( e.data.originalEvent.button==1){ 
                self.downFont(e); 
                return;
            }         
                   
            if( e.data.originalEvent.button==2){                    
                self.stopUp();
                return;
            }         
            
            self._tool="Pol";
            if(self.boolUp==false){
                
                point=self.p20.sp.craetVP();
                point1=self.p20.sp.craetVP();

                self.korekt2222();                
                point.position.set(positDin.x,positDin.y);               
                point1.position.set(positDin.x,positDin.y);

                sp.o=point;
                if(positDin.ePL!=null){ 
                    positDin.ePL.targetGron.add(point).pros=positDin.ePL.pros;
                    positDin.ePL.targetGron.add(point1).pros=positDin.ePL.pros;
                }
               
                
                activObject=self.p20.sp.craetPol(self._unikName);
                activObject.activMouse=false; 
                activObject.activMouse=false;  
                activObject.addPoint(point1);
                activObject.addPoint(point);
                point.activMouse=false;
                point.position.setPoint(positDin);               
                self.startUp();
            }
            else{
                point.activMouse=true
                self.korekt2222(); 
                point=self.p20.sp.craetVP();
                point.activMouse=false
                sp.o=point;
                if(positDin.ePL!=null){ 
                    positDin.ePL.targetGron.add(point).pros=positDin.ePL.pros;
                }
                activObject.addPoint(point);
                point.position.setPoint(positDin);  
            }                                       
        }


        this.korekt2222=function(){
            self.par.par.mGridDrag.getPositPlan(positDin);
            positDin.ePL=null
            ePL=self.p20.sp.metod.getPL(positDin,50)
            if(ePL!=null){
                positDin.x=ePL.x;
                positDin.y=ePL.y;
                positDin.ePL=ePL;
            }else{
                self.korektAP(positDin,null,true)
            }
        }


        var colorActiv=0xf28044
        var swh=1
        var swh1=5        
        var wwwh,wwwh1
        var positDin={x:0,y:0,x1:0,y1:0,s:0,o:null,oy:null,ox:null}
        var ePL=null;

        this.mouseMoveAll=function(e){           
            if(sp.o!=undefined){                
                self.korekt2222();
                
             
               
                if(sp.o.gronVL!=undefined){
                    sp.o.gronVL.par.remove(sp.o)                    
                }
                if(positDin.ePL!=null){ 
                    positDin.ePL.targetGron.add(sp.o).pros=positDin.ePL.pros;
                }

                sp.o.position.setPoint(positDin);              
            }            
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











