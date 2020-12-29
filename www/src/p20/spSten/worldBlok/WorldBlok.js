
import { Blok } from './Blok.js';
import { BInSten } from './BInSten.js';

 

export class WorldBlok  {
    constructor(par,fun) {          
        this.type="WorldBlok";
        var self=this;
        this.par=par;
        this.fun=fun;

        this._sizeLine=this.par._sizeLine
        this._colorLine_=this.par._colorLine_

        this.objectBase=par.objectBase;


        this.uuid=calc.generateRendom(2);

        this.planeXZ=par.planeXZ;
        this.lineBasicMaterial2=par.lineBasicMaterial2;
        

        this.array = [];
        this.content2d = new PIXI.Container();
        this.par.cont2dBlok.addChild(this.content2d);

        /*
        1-колизии стен 0 -обьект не заброситься в колизии
        1-коллизии с другими обьектами
        1-зарезервированы под типы обьектов 
        1-зарезервированы под типы обьектов 
        1-зарезервированы под типы обьектов
        1-дырка в центре
        1-дырка на
        1-дырка от
        0-xz
        0-xz
        */


/*
        this.arrBD=[];
        this.arrObj={};
        this.arrBD.push({id:0,icon:"resources/image/w0.png",rect:[-501,-801,-100,1002,1602,200,"1110011100","100",200], str:["BInSten",'Window','','','','']})
        this.arrBD.push({id:1,icon:"resources/image/w1.png",rect:[-500,-1500,-100,1000,3000,200,"1110011100","100",200], rect1:[-1300,-1500,-100,2600,3000,200], str:["BInSten",'Door','','','','']})
        this.arrBD.push({id:2,icon:"resources/image/w1.png",rect:[-500,-1500,-100,1000,3000,200,"1010011100","000",0], rect1:[-2300,-1500,-100,4600,3000,200], str:["BInSten",'Door','','','','']})     
        this.arrBD.push({id:3,icon:"resources/image/w2.png",rect:[-1000,-1000,-100,2000,2000,200,"1110011100","111",0], str:["BInSten",'Not','','','','']})        
        this.arrBD.push({id:4,icon:"resources/image/w0.png",rect:[-3000,-3000,-200,6000,6000,400,"1110011100","111",0], str:["BWord",'xz','','','','']})
        this.arrBD.push({id:5,icon:"resources/image/w4.png",rect:[-200,-100,-100,400,200,200,"1110011100","001",0], str:["BInSten",'Unik_Steps','','','','']})
        this.arrBD.push({id:6,icon:"resources/image/w5.png",rect:[-60,-100,-100,120,200,200,"1110001100","101",100], str:["BInSten",'Unik_Vent','','','','']})



*/


        
        this.arrObj={};
        for (var i = 0; i < this.objectBase.bd.length; i++) {
            this.arrObj[this.objectBase.bd[i].id]=this.objectBase.bd[i]
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

     

            let blok=undefined;            
            if(o.obj.str[0]=="BInSten")blok= new BInSten(this,o,this.sobBlok);
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
            var o={}
            o.array=[];
            for (var i = 0; i < this.array.length; i++) {
                if (this.array[i].life==false) continue;
                if(this.array[i].parent.uuid!=this.uuid)continue;
                o.array.push(this.array[i].getObj());
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

    set colorLine(value) {      
        if(this._colorLine!=value){
            this._colorLine= value;
            for (var i = 0; i < this.array.length; i++) {
                this.array[i].dragWHD();
            }
        }
    }    
    get colorLine() { return  this._colorLine;}

    
    set sizeLine(value) {      
        if(this._sizeLine!=value){
            this._sizeLine= value;

            for (var i = 0; i < this.array.length; i++) {
                this.array[i].dragWHD();

            }
        }
    }    
    get sizeLine() { return  this._sizeLine;}
}