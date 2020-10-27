
import { Blok } from './Blok.js';
import { BInSten } from './BInSten.js';

 

export class WorldBlok  {
  	constructor(par,fun) {  		
  		this.type="WorldBlok";
  		var self=this;
        this.par=par;
        this.fun=fun;
        this.uuid=calc.generateRendom(2);
      

        this.array=[];
        this.content2d = new PIXI.Container();
        this.par.cont2dBlok.addChild(this.content2d);


        this.arrBD=[];
        this.arrObj={};
        this.arrBD.push({id:0,icon:"resources/image/w0.png",rect:[-300,-300,-20,600,600,40], str:["BInSten",'Window','','','','']})
        this.arrBD.push({id:1,icon:"resources/image/w0.png",rect:[-300,-300,-20,600,600,40], str:["BInSten",'Door','','','','']})
        this.arrBD.push({id:2,icon:"resources/image/w0.png",rect:[-300,-300,-20,600,600,40], str:["BInSten",'xz','','','','']})

        for (var i = 0; i < this.arrBD.length; i++) {
            this.arrObj[this.arrBD[i].id]=this.arrBD[i]
        }

       
        this.sobBlok=function(s,p,p1){

        }


        this.getBlok=function(id){  
            let o=   this.arrObj[id]             
            for (var i = 0; i < this.array.length; i++) {
                if(this.array[i].life==true)continue;
                if(this.array[i].id==id){

                    return this.array[i];
                }
            } 

            let blok=undefined
            trace(">>>>>>>>>>>>>>>>",o)
            if(o.str[0]=="BInSten")blok= new BInSten(this,o,this.sobBlok);

            if(blok==undefined)blok= new Blok(this,o,this.sobBlok);

           
            blok.idArr=this.array.length;
            this.array.push(blok);

            return blok;
        }


        
        this.render=function(){  
            this.par.render()
        }


        this.setObj=function(o){           
            for (var i = 0; i < o.array.length; i++) {
                //let line=this.craetLine();
                //line.setObj(o.array[i])
            }
        }
        this.getObj=function(){
            /*var o={}
            o.array=[];
            for (var i = 0; i < this.array.length; i++) {
                if (this.array[i].life==false) continue;
                o.array.push(this.array[i].getObj())
            }*/
            
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