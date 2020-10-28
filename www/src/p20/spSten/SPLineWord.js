
//import { TriangulateShape } from './TriangulateShape.js';

import { SpDebugPixi } from './SpDebugPixi.js';
import {  SPLine } from './SPLine.js';

import { VisiLine  } from './VisiLine.js';   

export class SPLineWord  {
  	constructor(par,fun) {  		
  		this.type="SPLine";
  		var self=this;
        this.par=par;
        this.fun=fun;

        this._activeMouse=true;

        this.array=[];
        this.content2d = new PIXI.Container();
        this.par.cont2dLine.addChild(this.content2d);

        this.debugPixi = new SpDebugPixi();
        this.content2d.addChild(this.debugPixi.content2d);


        this.visiLine=new VisiLine(this,function(s,p,p1){

        });
        this.par.cont2dLine.addChild(this.visiLine.content2d);

        this.sobSP=function(s,p,p1){            
            self.par.par.sobSP(s,p,p1);
        }

        this.craetLine=function() {
        	for (var i = 0; i < this.array.length; i++) {
        		if(this.array[i].life==false){
                    this.array[i].life=true;
                    return this.array[i]
        		}
        	}

        	this.array.push(new SPLine(this));
            this.array[this.array.length-1].idArr=this.array.length-1;
            return this.array[this.array.length-1];
        }


        var pNull={x:0,y:0}

        var or={x:0,y:0,d:0,o:null};
        var d,dd,num
         
        this.getPoint=function(p,sLine) {
            d=99999999999999;
            num=-1;

            for (var i = 0; i < this.array.length; i++) {
                if(this.array[i].life==false)continue
                if(sLine && this.array[i].idArr==sLine.idArr)continue 

                dd=calc.getDistance(p,this.array[i].p1)
                if(d>dd){
                    or.x=this.array[i].p.x;
                    or.y=this.array[i].p.y;
                    d=dd;
                    num=i
                }

                dd=calc.getDistance(p,this.array[i].p)
                if(d>dd){
                    or.x=this.array[i].p1.x;
                    or.y=this.array[i].p1.y;
                    d=dd;
                    num=i
                }

            }

            if(num!=-1) {
                or.d=d
                or.o=this.array[num]    
                return or
            }   
            return null
        }



        
        this.render=function(){  
            this.par.render()
        }


        this.setObj=function(o){           
            for (var i = 0; i < o.array.length; i++) {
                let line=this.craetLine();
                line.setObj(o.array[i])
            }
        }
        this.getObj=function(){
            var o={}
            o.array=[];
            for (var i = 0; i < this.array.length; i++) {
                if (this.array[i].life==false) continue;
                o.array.push(this.array[i].getObj())
            }
            
            return  o
        }

    }
    set activeMouse(value) {      
        if(this._activeMouse!=value){
            this._activeMouse= value;
            for (var i = 0; i < this.array.length; i++) {
                this.array[i].activeMouse= value;
            }
        }
    }    
    get activeMouse() { return  this._activeMouse;}
}