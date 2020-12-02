
import { SpStageSten } from './spSten/SpStageSten.js';

import { PGrid,Grid } from './plus/PGrid.js';//сетка

import { KorektRect } from './spSten/colozi/korektRect/KorektRect.js';
export class P20  {
    constructor(par,fun) {
    	this.type="P20";
    	var self=this;
        this.par=par;
        this.fun=fun;
        this.sizeMax=this.par.sizeMax
        this.sobSP=undefined;



        this.startFund='{"colorC0":"#ffc0b0","colorC1":"#3a11b5","delphC0":262.33,"delphC1":744.91, "delphPlus":150, "sizeLine":10,"colorLine":"#000000"}'
        this.sOFund=JSON.parse(this.startFund);
        
        this.startStyle='{"colorC0":"#ffe4d4","colorC1":"#b0dfee","delphC0":200,"delphC1":500,"delphPlus":100,"sizeLine":10, "colorLine":"#000000"}'
        this.startObject=JSON.parse(this.startStyle)


        this._activObject=undefined;


  

        this.content3d= new THREE.Object3D();        
        this.content2d = new PIXI.Container();

        this.rulimActivSP=new RulimActivSP(this);
        this.korektRect = new KorektRect();


        this.sobSP=function(s,p,p1){
            self.fun(s,p,p1)
        }

        this._index=-1;
        this._mashtab=1;

        this.arrayChesh=[]
        this.array=[];
        for (var i = 0; i < 2; i++) {
            this.arrayChesh[i]= new SpStageSten(this, this.sobSP);
            
            //this.arrayChesh[i].dragStyleObj(this.startObject);
            this.arrayChesh[i].idArr=i;
           
            this.array[i] = this.arrayChesh[i];

        }
        this.arrayChesh[0].dragStyleObj(this.sOFund);
        this.arrayChesh[1].dragStyleObj(this.startObject);


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
            this.setObj(o);          
        } 


        this.dragStyleObj=function(o){
            if(o)this.startObject=o
            for (var i = 0; i < this.array.length; i++) {
                this.array[i].dragStyleObj(this.startObject);
            }
        }



        this.renderDebag=function(){
            this.fun("render",-1);
        }


        this.creatFloor=function(){
            if(this.arrayChesh[this.array.length]==undefined){
                this.arrayChesh[this.array.length] = new SpStageSten(this, this.sobSP);
                this.arrayChesh[this.arrayChesh.length-1].idArr=this.array.length;
                this.arrayChesh[this.arrayChesh.length-1].dragStyleObj(this.startObject);

            }   
            this.array[this.arrayChesh.length-1]=this.arrayChesh[this.arrayChesh.length-1];
            this.korektHeight()
        }

        this.clearFloor=function(p){
            p = p!= undefined ? p : this._index
            if(this.array[this._index]!=undefined){
                let aF=this.array.splice(p, 1);
                if(aF[0]!=undefined)aF[0].clear();
                let ii=this._index;
                if(this.array[ii]!=undefined){
                    this._index=-2;
                    this.index=ii
                }


            }else{
                console.error("FIXE Передан этаж которого несуществует")
            }
            this.korektHeight();

            /*this.arrayChesh.splice(p, 1);
            for (var i = 0; i < this.arrayChesh.length; i++) {
                this.arrayChesh[i].idArr = i;
            }
            this.array.length=this.arrayChesh.length;
            this.array=this.arrayChesh;*/
        }

            
        this.upDate=function(){
            if(this.sp!=undefined){
                let b=this.sp.doRender();                
                return b;
            }
            return false;
        }


        this.clearBig=function(){ 
            for (var i = 0; i < this.arrayChesh.length; i++) {
                this.arrayChesh[i].clear();
            }
            this.array=[];            
        }



        this.setObjOpen=function(o){             
            if(o.index==undefined){
                this.sp.setObj(o); 
            }else{
                this.clearBig();
                this.setObj(o);
                if(o.position!=undefined && this.sGposition!=undefined){
                    this.sGposition(o.position);
                }else{
                    setTimeout(function() {
                        self.fun("rectSP"); 
                    }, 1); 
                }                               
            } 
        }

        this.sGposition=undefined

        this.korektHeight=function(){
            var yy=0;
            for (var i = 0; i < this.array.length; i++) {                
                this.array[i].content3d.position.z=-(yy-this.array[0].height);
                yy+=this.array[i].height
            }
        }


        this.getObj=function(){
            var o={} 
            o.index=this._index;
            o.array=[]
            for (var i = 0; i < this.array.length; i++) {
                o.array[i]=this.array[i].getObj();
            } 
            if(this.sGposition!=undefined)o.position= this.sGposition()        
            return o;
        }

        this.setObj=function(o){
            if(o.index==undefined){
                self.fun("message","Error Старая модель файла","Старый не опдерживал этажность");
                return
            }           
            for (var i = 0; i < o.array.length; i++) {
                if(this.array[i]==undefined){
                    if(this.arrayChesh[i]==undefined){
                        this.arrayChesh[i]= new SpStageSten(this,this.sobSP);
                        this.arrayChesh[i].idArr=i;
                        this.arrayChesh[i].dragStyleObj(this.startObject);
                    }
                    this.array[i]=this.arrayChesh[i];
                }
                this.array[i].setObj(o.array[i]);
            }
            this._index=-1
            this.index=o.index;
        }

        this.getRect=function(num){           
            let s=this.sp
            if(num!=undefined){
                if(this.array[num]==undefined)return null;
                s= this.array[num];   
            }
            return s.getRect()
        }

        this.korektHeight()
        this.fun("complit")
    }


    set index(value) {       
        if(this._index!= value) {
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
            this.rulimActivSP.index=this._index

            this.korektHeight();
            this.content3d.position.z=-this.array[value].content3d.position.z
            
            
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


export class RulimActivSP  {
    constructor(par,fun) {
        this.type="RulimActivSP";
        var self=this;
        this.par=par;
        this.fun=fun;
        this._index=this.par._index;

        //2d-------------
        this.grid = new PGrid(null,this.par.sizeMax, 20);

        this.graphics = new PIXI.Graphics();      
        this.graphics.name="xz";
        var r=this.par.sizeMax;
        this.graphics.beginFill(0xdcf1fa, 1.1);
        this.graphics.drawRect(-r/2,-r/2,r,r);
        this.graphics.interactive = true;

        //3d-------------
        this.grid3d = new Grid(this.par.sizeMax,100,'resources/image/fill.png',0.9);
    }

    set index(value) {       
        if(this._index!= value) {
            this._index= value;           
            if(this.par.array[value]!=undefined){                
                this.par.array[value].content2d.addChildAt(this.grid.content2d,0);
                this.par.array[value].content2d.addChildAt(this.graphics,0);
                this.par.array[value].content3d.add(this.grid3d);
            }
        }          
    }    
    get index() { return  this._index;}
}

