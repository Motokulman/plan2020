

export class MOWUnik{
    constructor(par,fun) {
        var self=this;
        this.type="MOWUnik";
        this.par=par;
        this._active=false;
        this.fun=fun;
        this.otstup = this.par.otstup
        this.dCont=new DCont(this.par.window.content); 

        this.pObject=new DParamObject(this.dCont,10,2,function(){
        },false);


        this.drag=function(){
        }

        
        this.postSO=function(){ 
            if(this.par.object==undefined){
                this.dCont.visible = false 
                this.active=false
                return
            }
            if(this.par.object.unik==undefined && this.par.object.unik1==undefined){
                this.dCont.visible = false         
                this.active=false        
            }else{
                if (this.par.object.unik!=undefined){
                    this.pObject.usingShablon=this.par.object.unik.arrayInfo;
                    this.pObject.addObject(this.par.object.unik);
                }

                if (this.par.object.unik1!=undefined){
                    this.pObject.usingShablon=this.par.object.unik1.arrayInfo;
                    this.pObject.addObject(this.par.object.unik1);
                }

                this.dCont.visible = true
                this.active=true
            }

        this.height = this.pObject.height+4
        }

    }

    set active(value) {
        if(this._active!=value){
            this._active= value;            
            
        }
    }    
    get active() { return  this._active;} 
}