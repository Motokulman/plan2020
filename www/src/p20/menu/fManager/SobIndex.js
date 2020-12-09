

import { Calc } from './Calc.js';


export class SobIndex  {
  	constructor(par,fun) {  		
  		this.type="SobIndex";
  		var self=this;
        this.par=par;
        this.fun=fun;

        this._active=false;
        this.funActive=undefined;
        this._mashtab=1;
        this._otstup=25;
        this._sah=0
        this.color=0xff0000
        this.activColor=0x00ff00

        var calc = new Calc()

        this.setActive = function () { 
            this.par.floor.sp.activMouse=true;
            this.par.floor.visiPoint= true; 
            this.par.floor.bazaMod.activMouse= false;
            this.par.floor.bazaMod.activeRadius= false;
            
        }


        this.move = function (e) { 

        }

        this.out = function (e) {   
            
        }

        this.over = function (e) {   
            
        }

        this.down = function (e) {            
           
        }

        this.clear=function(){
            this._sah=0
        }

        var arrPoint,arrSplice
        var bool
        this.clearActive=function(){
            //this.floor.sp.activMouse
            bool=false 
              
            arrPoint=this.par.floor.sp.arrPoint
            arrSplice=this.par.floor.sp.arrSplice
            for (var i = 0; i < arrPoint.length; i++) {                
                if (!arrPoint[i].life) continue;
                if (arrPoint[i].active !== bool){
                    arrPoint[i].active =bool
                }
            } 

            for (var i = 0; i < arrSplice.length; i++) {
                if (!arrSplice[i].life) continue;
                if (arrSplice[i].active !== bool){
                    arrSplice[i].active =bool
                }                
            }           
        }


        this.distSten=20;

        this.getPosEv3D = function(e){
            var rezult=new THREE.Vector3()
            rezult.set(-this.par.whSize/2+this.par.whSize*e.uv.x,-(-this.par.whSize/2+this.par.whSize*e.uv.y),0)  
            return rezult
        }

        var po=new THREE.Vector2()
        var po1=new THREE.Vector2()
        var sten

        this.getSten=function(c3d){
           // if(c3d.sten!=undefined)return c3d.sten;
            //if(c3d.parent!=undefined)return this.getSten(c3d.parent);

            return this.getParName(c3d,"sten")
            //return null
        }

        this.getParName=function(c3d,name){
            
            if(c3d[name]!=undefined)return c3d[name];
            if(c3d.parent!=undefined)return this.getParName(c3d.parent,name);
            return null
        }


        this.getPosEv3DSten=function(e){
            var rezult=new THREE.Vector3()            
            sten=this.getSten(e.target)
            
            if(sten==null)return null

            
            rezult.z=2
            po1.x=e.point.x;
            po1.y=e.point.z;

            if(calc.getDistance(po1,sten.position)<25){
                rezult.z=0;
                rezult.x=sten.position.x;
                rezult.y=sten.position.y;
                return rezult
            }

            if(calc.getDistance(po1,sten.position1)<25){
                rezult.z=1;
                rezult.x=sten.position1.x;
                rezult.y=sten.position1.y;
                return rezult
            }

            

            
            po=calc.isPointInLin(sten.position,sten.position1,po1,10,10)

            rezult.z=2
            rezult.x=po.x;
            rezult.y=po.y;


            return rezult
        }




        ////////////////////////////////////
        var aStPo=[]
        var positionOld=new THREE.Vector3() 
        var aPointOld
        var arrPPos=[]
        var arrPSt=[]
        this.startAP=function(aPoint,aPoint1){
            aPointOld=aPoint
            if(aPoint){
                positionOld.x=aPoint.position.x;
                positionOld.y=aPoint.position.y;   
            }else{
                positionOld.x=9999999999;
                positionOld.y=9999999999;   
            }
            
            
            arrPPos.length=0
            for (var i = 0; i < this.par.floor.sp.arrPoint.length; i++) {
                if (!this.par.floor.sp.arrPoint[i].life) continue;
                if (aPoint && this.par.floor.sp.arrPoint[i]._uuid==aPoint._uuid) {                    
                    continue;
                }
                if(aPoint1){
                    if (this.par.floor.sp.arrPoint[i]._uuid==aPoint1._uuid) {                    
                        continue;
                    } 
                }
                arrPPos.push(this.par.floor.sp.arrPoint[i])
            }
            


            arrPSt.length=0
            var b;
            for (var i = 0; i < this.par.floor.sp.arrSplice.length; i++) {
                if (!this.par.floor.sp.arrSplice[i].life) continue;
                b=true
                for (var j = 0; j < aPoint.arrSHron.length; j++) {                    
                    if (aPoint.arrSHron[j].sten._uuid==this.par.floor.sp.arrSplice[i]._uuid) { 
                        b=false
                        
                    } 
                }                
                if(b==true)arrPSt.push(this.par.floor.sp.arrSplice[i])
            }
        }
        var ot=10;




        var po1={x:0,y:0,o:null}
        var po,rezult
        this.getDistSten=function(_sten, _point){
            var rezult=-1;
            po1.x=_point.x;
            po1.y=_point.y;            
            po=calc.isPointInLin(_sten.position,_sten.position1,po1,11111,0);        
            rezult=calc.getDistance(po1,po);
            return rezult;
        }

        this.pointOld=undefined

        var pos={x:0,y:0,o:null}
        var r
        var mX,mXI,mY,mYI,b,pp,mXY,mYX;
        this.korektAP=function(_p,_o){
            _p.x=Math.round(_p.x/10)*10;
            _p.y=Math.round(_p.y/10)*10;
            _p.o=null;
            _p.oy=null;
            _p.ox=null;

            this._otstup=25;
            if(self.pointOld!=undefined){
                if(Math.abs(_p.x-this.pointOld.x)<this._otstup/this._mashtab)_p.x=this.pointOld.x
                if(Math.abs(_p.y-this.pointOld.y)<this._otstup/this._mashtab)_p.y=this.pointOld.y
            }

            mX=this._otstup/this._mashtab;
            mXI=null;
            mY=this._otstup/this._mashtab;
            mYI=null;

            for (var i = 0; i < self.p20.sp.arrPoint.length; i++) {
                if (!self.p20.sp.arrPoint[i].life) continue;
                if (_o && self.p20.sp.arrPoint[i]._uuid==_o._uuid)continue;
                if (this.pointOld){
                    if (this.pointOld.uuidArr!=undefined){
                        b=true;
                        for (var j = 0; j < this.pointOld.uuidArr.length; j++) {
                            if(this.pointOld.uuidArr[j]==self.p20.sp.arrPoint[i]._uuid)b=false;
                        }
                        if(!b)continue;
                    }
                }
                

                pp=Math.abs(_p.x-self.p20.sp.arrPoint[i].position.x)
                
                if(pp<mX){

                    mX=pp;
                    mXI=self.p20.sp.arrPoint[i].position.x
                    mXY=self.p20.sp.arrPoint[i].position.y
                }

                pp=Math.abs(_p.y-self.p20.sp.arrPoint[i].position.y)
                if(pp<mY){
                    mY=pp;
                    mYI=self.p20.sp.arrPoint[i].position.y
                    mYX=self.p20.sp.arrPoint[i].position.x
                }
                
            } 

            
            if(mXI!=null){
                _p.x=mXI;
                _p.oy=mXY
            }
            if(mYI!=null){
                _p.y=mYI;
                _p.ox=mYX;
            }
                
            
            
           /* for (var i = 0; i < self.p20.sp.arrSplice.length; i++) {
                if (!self.p20.sp.arrSplice[i].life) continue;
                r=this.getDistSten(self.p20.sp.arrSplice[i],_p)
               
            }*/


            for (var i = 0; i < self.p20.sp.arrPoint.length; i++) {
                if (!self.p20.sp.arrPoint[i].life) continue;
                if (_o && self.p20.sp.arrPoint[i]._uuid==_o._uuid)continue;
                let d=calc.getDistance(self.p20.sp.arrPoint[i].position,_p)
                if(d<30){
                    _p.x=self.p20.sp.arrPoint[i].position.x;
                    _p.y=self.p20.sp.arrPoint[i].position.y;
                    _p.o=self.p20.sp.arrPoint[i];
                    return
                }
            }
         
            
            for (var i = 0; i < self.p20.sp.arrSplice.length; i++) {
                if (!self.p20.sp.arrSplice[i].life) continue;
                if(_o!=undefined)if(
                    self.p20.sp.arrSplice[i].addPoint._uuid==_o._uuid||
                    self.p20.sp.arrSplice[i].addPoint1._uuid==_o._uuid
                )continue;
                
                r=this.getDistSten(self.p20.sp.arrSplice[i], _p)
                
                if(po&&r!=-1&&r<60){
                    
                    _p.x=po.x;
                    _p.y=po.y;
                    _p.o=self.p20.sp.arrSplice[i];
                    return                    
                }
            }

        }


        this.getPositPlan=function(pos){
            return self.par.par.mGridDrag.getPositPlan(pos)
        }



        this.downFont=function(e){
            self.par.par.mGridDrag.downFont(e);
        }
        this.helpDP=undefined
        this.setP20=function(p20){
            self.cont=p20.cont2d
            self.p20=p20
            self.helpDP=self.par.par.mCont2dHelp.helpDP

        }

        this.sp=undefined
        this.setSP=function(sp){
            this.sp=sp
            this.color=this.sp.convertC(dcmParam.color)
            this.activColor=this.sp.convertC(dcmParam.activButton)               
        } 




        this.render=function(){            
            self.par.par.fun("render")
        }

        this.sobSP=function(s,p,e){ 
            trace(this.type+" sobSP >>",s,p,e)    
        }
        
        this.sobMenu=function(s,p,e){
            trace(this.type+" sobMenu >>",s,p,e)    
        }



        this.boolCTRL=false
        this.keydown=function(e){
            if(event.keyCode==17)self.boolCTRL=true
            /*if(event.keyCode==81&&self.boolCTRL)  {
                
            }*/
            
        }

        this.keyup=function(e){
            if(event.keyCode==17)self.boolCTRL=false
        }
                
    }

    set active(v) {
        if(this._active!=v){
            this._active = v;                        
            if(this.funActive!=undefined)this.funActive();
            if(this.helpDP)this.helpDP.clear()
            
        }       
    }   
    get active() { return  this._active;}  

    set mashtab(value) {  
        if(this._mashtab!= value) {
            this._mashtab= value;
            
        }    
              
    }    
    get mashtab() { return  this._mashtab;}
}



