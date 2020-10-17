
import { SobIndex } from './SobIndex.js';


export class SobIndex2  extends SobIndex {
    constructor(par,fun) {
        super(par,fun);            
        this.type="SobIndex2";
        var self=this;
        this.par=par;
        this.fun=fun;


        
        var pos={x:0,y:0,o:null}
        var sp={x:0,y:0,x1:0,y1:0,s:0,o:null}
        var speee={x:0,y:0,x1:0,y1:0,s:0,o:null}
        var or={x:0,y:0,d:0,o:null};
        var or1={x:0,y:0,d:0,o:null};
        var line,pp
        this.mousemove=function(e){   
            self.getPositPlan(pos);
           
                       
            if(arrDrah[0]=="downLine"){
                self.korektAP(pos) 
                sp.o.position.set(pos.x,pos.y);
            }
            if(arrDrah[0]=="downLine1"){ 
                self.korektAP(pos)                
                sp.o.position1.set(pos.x,pos.y);
            }

            if(arrDrah[0]=="downLine2"){
                sp.o.poiskOt(pos)

               /* pp=self.p20.sp.lineWord.getPoint(sp.o.p,sp.o)
                or.d=99999999
                if(pp){
                    self.objInObj(pp,or)                    
                }
                pp=self.p20.sp.lineWord.getPoint(sp.o.p1,sp.o)
                or1.d=99999999
                if(pp){
                    self.objInObj(pp,or1)   
                    if(or.d>or1.d)self.objInObj(or1,or) 
                } 
                if(or.d<222){                    
                    sp.o.poiskOt(or)
                }*/

            }          
        } 

        this.objInObj=function(o,o1){
            for (var s in o) {
                o1[s]=o[s]
            }
        }    

        this.clearSob=function(e){
            arrDrah.length=0
            document.removeEventListener("mouseup", self.mouseup);
            document.removeEventListener("mousemove", self.mousemove); 
        }


        this.mouseup=function(e){
            self.debug.clearD();
            if(arrDrah.length==1){
                self.clearSob();
            }

            arrDrah.splice(0,1)



            
        }
        var arrDrah=[];

        this.sobSP=function(s,p,e){ 
            if( e.data.originalEvent.button!=0){ 
                self.downFont(e); 
                return;
            }


            if(arrDrah.length!=0)return            
            speee=this.getPositPlan();
            self.korektAP(speee);
            arrDrah.length=0;
            if(s.indexOf("downLine")!=-1){
                arrDrah.push(s);
                sp.o = p;  
            }else{

                line=self.p20.sp.lineWord.craetLine();            
                line.position.set(speee.x,speee.y);
                line.position1.set(speee.x,speee.y);

                sp.o = line;
                arrDrah.push("downLine1");
                arrDrah.push("downLine2"); 
            }
            self.par.par.mObject.setObject(sp.o)
            document.addEventListener("mouseup", self.mouseup);
            document.addEventListener("mousemove", self.mousemove);
        }


        var pos={x:0,y:0,o:null}
        var r,d,dd,num,num1;
        var p={x:0,y:0,o:null}
        var p1={x:0,y:0,o:null}
        var po,po1
        var e,ee,ee1
        this.korektAP=function(_p,_o){           
            _p.o=null;

            this.debug.clearD();
            p.o=null
            p1.o=null
            dd=999999999999999999
            ee1=999999999999999999
            e=-1
            for (var i = 0; i < self.sp.arrSplice.length; i++) {
                if (!self.sp.arrSplice[i].life) continue;
                

                d=calc.getDistance(_p,self.sp.arrSplice[i].arrGran[0])
                if(dd>d){
                    dd=d;
                    num=i
                    num1=0;
                }


                d=calc.getDistance(_p,self.sp.arrSplice[i].arrGran[1])
                if(dd>d){
                    dd=d;
                    num=i
                    num1=1;
                }
                
                d=calc.getDistance(_p,self.sp.arrSplice[i].arrGran[2])
                if(dd>d){
                    dd=d;
                    num=i
                    num1=2;
                }

                d=calc.getDistance(_p,self.sp.arrSplice[i].arrGran[3])
                if(dd>d){
                    dd=d;
                    num=i
                    num1=3;
                } 

                po=calc.isPointInLin(self.sp.arrSplice[i].arrGran[0],self.sp.arrSplice[i].arrGran[1],_p,10000000,0)
                
                if(po&&ee1>Math.abs(po.z)){
                    ee1=Math.abs(po.z)
                    ee=i;
                    e=0
                }
                po=calc.isPointInLin(self.sp.arrSplice[i].arrGran[2],self.sp.arrSplice[i].arrGran[3],_p,10000000,0)
                if(po&&ee1>Math.abs(po.z)){
                    ee1=Math.abs(po.z)
                    ee=i;
                    e=1;
                }
            }

            let b=true

            if(e!=-1&&ee1<dd){
                b=false
            }
            if(dd<300)b=true


            

            if(b==true){
                _p.x=self.sp.arrSplice[num].arrGran[num1].x;
                _p.y=self.sp.arrSplice[num].arrGran[num1].y;
                self.debug.dPoint(self.sp.arrSplice[num].arrGran[num1],20,self.color,20); 
                _p.o=self.sp.arrSplice[num]
            }else{
                po=calc.isPointInLin(self.sp.arrSplice[ee].arrGran[e*2+0],self.sp.arrSplice[ee].arrGran[e*2+1],_p,10000000,0)
                if(po){
                    _p.x=po.x;
                    _p.y=po.y; 
                    _p.o=self.sp.arrSplice[ee]
                    self.debug.dLine(self.sp.arrSplice[ee].arrGran[e*2+0],self.sp.arrSplice[ee].arrGran[e*2+1],self.color,20); 
                }
            }            
        }

        this.korektAP2=function(_p,_o){

        }




        this.oP=undefined
        this.debug=undefined
        this.funActive=function(){
            
            if(this.active==true){
                self.sp.getRect();//не рект а драгим позиции стен

                //this.oP=self.p20.sp.lineWord.getPositionS();
                this.debug=self.sp.lineWord.debugPixi
                this.debug.clearD();

                
                for (var i = 0; i < self.sp.arrSplice.length; i++) {
                    if (!self.sp.arrSplice[i].life) continue;
                    self.debug.dLine(self.sp.arrSplice[i].arrGran[0],self.sp.arrSplice[i].arrGran[1],0xff0000,20);
                    self.debug.dPoint(self.sp.arrSplice[i].arrGran[2],33)
                    self.debug.dPoint(self.sp.arrSplice[i].arrGran[3],63)
                    self.debug.dLine(self.sp.arrSplice[i].arrGran[2],self.sp.arrSplice[i].arrGran[3],self.color,20); 
                }
                self.sp.render()
          
               /* for (var i = 0; i < this.oP.points.length; i++) {
                    this.debug.dPoint(this.oP.points[i],200)
                }

                for (var i = 0; i < this.oP.line.length; i++) {
                    this.debug.dLine(
                        this.oP.line[i].p,
                        this.oP.line[i].p1,
                        0x00FF00,
                        10
                    )
                }

                for (var i = 0; i < this.oP.line1.length; i++) {
                    this.debug.dPoint(this.oP.line1[i].p,20)
                    this.debug.dPoint(this.oP.line1[i].p1,30)
                    this.debug.dLine(
                        this.oP.line1[i].p,
                        this.oP.line1[i].p1,
                        0x0000FF,
                        10
                    )
                   
                }*/
            }else{
                this.clearSob()
            }
        }
    }
}