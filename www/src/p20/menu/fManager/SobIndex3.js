
import { SobIndex } from './SobIndex.js';


export class SobIndex3  extends SobIndex {
    constructor(par,fun) {
        super();            
        this.type="SobIndex3";
  		var self=this;
        this.par=par;
        this.fun=fun;


        var pos={x:0,y:0,o:null,dist:0};
        var sp={x:0,y:0,x1:0,y1:0,s:0,o:null};
        var blok=undefined;







        this.mousemove=function(e){   
            self.getPositPlan(pos);
            self.korektAP(pos);

            if(blok!=undefined){

                if(blok.parent==undefined){
                    if(pos.o && pos.o.type&&pos.o.type=="SpliceSten"){
                        if(pos.o.windows.isBlokPlace(blok)==true){                            
                            pos.o.addBlok(blok);
                            global.dragPic.stop()  
                        }                                              
                    }
                }else{
                    if(pos.o==undefined){
                        global.dragPic.start(48,blok.icon,blok,this.upDrag,1);
                        blok.parent.removeBlok(blok);
                    }else{
                        
                        if(blok.parent.uuid!=pos.o.windows.uuid){
                            pos.o.addBlok(blok);
                        }
                    }
                }
                if(blok.parent!=undefined){
                    blok.setPosition(pos.x, pos.y, 0);
                }
            }
        }
   


        this.mouseup=function(e){
            if(blok && blok.parent==undefined)blok.life=false;
            document.removeEventListener("mouseup", self.mouseup);
            document.removeEventListener("mousemove", self.mousemove); 
        }


        let num,dist,r,po,xx,yy
        this.korektAP=function(_p){           
            _p.o=null;

            num=-1;
            dist=99999999
            for (var i = 0; i < self.p20.sp.arrSplice.length; i++) {
                if (!self.sp.arrSplice[i].life) continue;
                //r=this.getDistSten(self.sp.arrSplice[i],_p)
                r=calc.isPointInLin(self.sp.arrSplice[i].position,self.sp.arrSplice[i].position1,_p,11111,0);    
                if(r){
                    //
                    if(Math.abs(r.z)<self.sp.arrSplice[i].delph+200 && Math.abs(r.z)<Math.abs(dist)){
                        dist=r.z
                        num=i;
                        xx=r.x;
                        yy=r.y;                        
                    }
                }
            }

            if(num!=-1){
                _p.o = self.sp.arrSplice[num];
                _p.dist=dist
                _p.x=xx;
                _p.y=yy;

            }


        }






        this.sobMenu=function(s,p,p1){
            
            if(s=="gIndex"){
                self.sobSP("creatObjDin", p.obj);
            }
        }


        this.upDrag=function(){

        }

        this.sobSP=function(s,p,e){
            if(p)self.par.par.mObject.setObject(p)    
            
            if(s=="downBlok"){
                blok=p
                document.addEventListener("mouseup", self.mouseup);
                document.addEventListener("mousemove", self.mousemove);
                return
            }

            if(s=="creatObjDin"){               

                blok=self.sp.worldBlok.getBlok(p.id);
                global.dragPic.start(48,blok.icon,blok,this.upDrag,1)

                
               
                document.addEventListener("mouseup", self.mouseup);
                document.addEventListener("mousemove", self.mousemove);
                return
            }

            if(e)self.downFont(e);            
        }
        
    }
}
