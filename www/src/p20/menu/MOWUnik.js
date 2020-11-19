

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

        /*this.sliderUnik = new DSliderBig (this.dCont, this.otstup, this.otstup, function(){self.par.object.unik.width=this.value;}, 'width', 500, 5000)
        this.sliderUnik.value = self.par.object._widthUnik
        this.sliderUnik1 = new DSliderBig (this.dCont, this.otstup, this.sliderUnik.height + this.otstup, function(){self.par.object.heightUnik=this.value;}, 'height', 500, 5000)
        this.sliderUnik1.value = self.par.object._heightUnik*/


        
        this.drag=function(){
            /*if (this.par.object.typeStr1 != "Unik_Steps"){
                this.dCont.visible = false 
                return
            } else {this.dCont.visible = true}*/
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