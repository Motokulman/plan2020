
//import { TriangulateShape } from './TriangulateShape.js';

import { SPLine } from './SPLine.js';

export class VisiLine  {
  	constructor(par,fun) {  		
  		this.type="SPLine";
  		var self=this;
        this.par=par;
        this.fun=fun;
        this.sp=par.par
        this._activeMouse=true;

        this.array=[];
        this.arrayPosit = [];
        this.arrayPosit1 = [];
        this.kol=0
        this.content2d = new PIXI.Container();

        this.clear=function(){
          
            self.sp.render();
            for (var i = 0; i <  this.array.length; i++) {
                this.array[i].visible=false;
            }            
        }


        this.craetLine=function() {            
            let l=new SPLine(this);
            l.life=false;
            this.content2d.addChild(l.content2d)
            l.content2d.alpha=0.5
            l.render = self.sp.render();
            return l;
        }




        this.visiOtstup=function(p, angel){  
            let x=this.pointOld.x-p.x;
            let y=this.pointOld.y-p.y;
            
            let otstup;
            if(Math.round(angel)==-Math.round(Math.PI/2)){
                otstup=-x 
            }
            if(Math.round(angel)==-Math.round(Math.PI)){
                otstup=y 
            }

            for (var i = 0; i < this.arrayPosit1.length-1; i++) {                   
                this.array[i].visible = true
                this.array[i].otstup=otstup; 
            }
            self.sp.render();

        }

        this.creatReal=function(){ 
            var o={} 
            o.array=[]
            for (var i = 0; i < this.arrayPosit1.length-1; i++) {  
                o.array.push(this.array[i].getObj())
            }
            self.par.setObj(o)
            self.sp.render();
        }




        var pointNull=new Position()
        var point1=new Position()
        var po
        this.pointOld=new THREE.Vector3()
        this.visiPoint=function(p, angel,rectIn){            
            this.clear();

            this.pointOld.x=p.x;
            this.pointOld.y=p.y;

            calc.getVector(9999999, angel, point1);
            point1.x+=p.x;
            point1.y+=p.y;




            this.kol=0
            for (var i = 0; i < this.sp.arrSplice.length; i++) {
                if (!this.sp.arrSplice[i].life) continue;
                    for (var j = 0; j < self.sp.arrSplice[i].arrGran.length; j+=2) {
                    po=calc.getPointOfIntersection(
                        self.sp.arrSplice[i].arrGran[j],
                        self.sp.arrSplice[i].arrGran[j+1],
                        p,
                        point1)

                    if(po){
                        if(this.arrayPosit[this.kol]==undefined){
                            this.arrayPosit[this.kol]=new THREE.Vector3()
                        }
                        this.arrayPosit[this.kol].x=po.x;
                        this.arrayPosit[this.kol].y=po.y;
                        this.arrayPosit[this.kol].z=calc.getDistance(this.arrayPosit[this.kol], p);
                        this.kol++;
                    }
                }                
            }




            //self.par.debugPixi.clear();
            if(this.kol<2)return;
            
            this.arrayPosit1.length=0
            for (var i = 0; i < this.kol; i++) {
                if(rectIn==undefined)this.arrayPosit1.push(this.arrayPosit[i]);
                else{
                    if(this.arrayPosit[i].x>=rectIn.x&&this.arrayPosit[i].x<=rectIn.x1){
                        if(this.arrayPosit[i].y>=rectIn.y&&this.arrayPosit[i].y<=rectIn.y1){
                            this.arrayPosit1.push(this.arrayPosit[i]);
                        }
                    }
                }
            }
            if(this.arrayPosit1.length<2)return; 


            this.arrayPosit1.sort(function(a, b) {
              return a.z - b.z;
            });
          


           // self.par.debugPixi.dLine(p,point1);
            for (var i = 0; i < this.arrayPosit1.length-1; i++) {
                if(this.array[i]==undefined)this.array[i]=this.craetLine();
                this.array[i].position.set(this.arrayPosit1[i].x,this.arrayPosit1[i].y)  
                this.array[i].position1.set(this.arrayPosit1[i+1].x,this.arrayPosit1[i+1].y) 
                this.array[i].visible = true
                this.array[i].otstup=0;                
            }
            self.sp.render();         
        }



    }
    set activeMouse(value) {      
        if(this._activeMouse!=value){
            this._activeMouse= value;
            
        }
    }    
    get activeMouse() { return  this._activeMouse;}
}