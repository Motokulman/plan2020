
import { SpStageSten } from './spSten/SpStageSten.js';



export class P20  {
    constructor(par,fun) {
    	this.type="P20";
    	var self=this;
        this.par=par;
        this.fun=fun;

        this.sobSP=undefined;

        this.startStyle='{"colorC0":"#ffe4d4","colorC1":"#f0f0f0","delphC0":200,"delphC1":500,"delphPlus":100}'
        
        this._activObject=undefined;
        this.div= document.createElement('div');
        this.div.style.position = 'fixed';
        this.div.style.top = '0px';
        this.div.style.left = '0px';


        this.sobSP=function(s,p,p1){
            self.fun(s,p,p1)
        }

        this._index=-1;
        this._mashtab=1;

        this.array=[];
        for (var i = 0; i < 4; i++) {
            this.array[i] = new SpStageSten(this,this.sobSP);
        }

   




        this.setArrObj=function(a){
            this.sp.clear();
            
            if(a[0]==undefined&&a.type!=undefined){
                this.setObj(a)
                return
            }
            
            

            var o={};
            o.type="SpStageSten";

            o.tipPoint="SpPointSten";
            o.arrPoint=[];
            o.arrSplice=[];
            var max={x:99999,y:99999,x1:-999999,y1:-99999}
            for (var i = 0; i < a.length; i++) {
                let oo={}
                oo.position=a[i].point0;
                oo.position1=a[i].point1;

                oo.delph=a[i].width;
                oo.idUi=a[i].id;
                if(a[i].alignmentId){
                    oo.bChaz=false;
                    if(a[i].alignmentOtherSide=="left") oo.bChaz=true;
                    oo.bChaz1=false;
                    if(a[i].alignmentThisSide=="left") oo.bChaz1=true;

                    oo.sUi=a[i].alignmentId;
                }
                else {
                    oo.sUi=-1
                }
                o.arrSplice.push(oo);

                

                if(max.x>a[i].point0.x)max.x=a[i].point0.x
                if(max.y>a[i].point0.y)max.y=a[i].point0.y
                
                if(max.x1<a[i].point0.x)max.x1=a[i].point0.x
                if(max.y1<a[i].point0.y)max.y1=a[i].point0.y                
            }


            

            this.setObj(o)          
        } 

        this.dragStyleObj=function(o){
            for (var i = 0; i < this.array.length; i++) {
                this.array[i].dragStyleObj(o);
            }
        }

        this.dragStyleObj(JSON.parse(this.startStyle))

        this.renderDebag=function(){
            this.fun("render",-1)
        }



            
        this.upDate=function(){
            if(this.sp!=undefined){
                let b=this.sp.doRender();                
                return b;
            }
            return false;
        }



        this.getObj=function(){
            var o=this.sp.getObj();            
            return o;
        }

        this.setObj=function(o){           
            this.sp.setObj(o);                                  
        }
        this.getRect=function(num){ 
            let s=this.sp
            if(num!=undefined){
                if(this.array[num]==undefined)return null
                s= this.array[num];   
            }
            return s.getRect()
        }


        this.fun("complit")
    }


    set index(value) {       
        this._index= value;
        for (var i = 0; i < this.array.length; i++) {
            let status=2 //не видем - не активный
            if(this.array[value-1] && i==value-1 )status=1;//видный-неактивный                
            if(this.array[i] && value==i ){
                status=0//видный-активный
                this.sp= this.array[i];
                this.fun("indexSP",this.sp)
            }
            this.array[i].status= status;
        }          
    }    
    get index() { return  this._index;}

    set mashtab(value) {  
        if(this._mashtab!= value) {
            this._mashtab= value;
            for (var i = 0; i < this.array.length; i++) {           
                this.array[i].mashtab= value;
            }
        }    
              
    }    
    get mashtab() { return  this._mashtab;}

}  

