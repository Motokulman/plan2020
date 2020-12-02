

export class MOWUnik{
    constructor(par,fun) {
        var self=this;
        this.type="MOWUnik";
        this.par=par;
        this._active=false;
        this.fun=fun;
        this.otstup = this.par.otstup
        this.dCont=new DCont(this.par.window.content); 

        this.pObject=new DParamObject(this.dCont,2,2,function(){
        },false);


        this.drag=function(){
        }

        
        this.postSO=function(){ 
            if(this.par.object==undefined){
                this.dCont.visible = false 
                this.active=false
                return
            }
            if(this.par.object.unik==undefined){
                this.dCont.visible = false         
                this.active=false        
            }else{
                trace("this.pObject.usingShablon",this.pObject.usingShablon)
                this.pObject.usingShablon=this.par.object.unik.arrayInfo;
                this.pObject.addObject(this.par.object.unik);
                this.dCont.visible = true
                this.active=true
            }

        this.height = this.pObject.height
        }

    }

    set active(value) {
        if(this._active!=value){
            this._active= value;            
            
        }
    }    
    get active() { return  this._active;} 
}