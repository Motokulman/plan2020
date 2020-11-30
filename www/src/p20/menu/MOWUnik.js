

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

        this.array=[ 
                {tipe:'DSliderBig', name: 'slider1', param: 'width', title: 'width', min: 1000, max: 3000, okrug: 10},  
                {tipe:'DSliderBig', name: 'slider2', param: 'height', title: 'height', min: 1000, max: 3000, okrug: 10},  
                {tipe:'DSliderBig', name: 'slider3', param: 'step', title: 'step', min: 1, max: 3, okrug: 10},  
 
                {tipe:'DCheckBox', name: 'check1', param: 'bool', title: 'bool'}, 
                {tipe:'DCheckBox', name: 'check2', param: 'bool1', title: 'bool1'}, 
                {tipe:'DCheckBox', name: 'check3', param: 'bool2', title: 'bool2'}, 
            ];


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
                this.pObject.usingShablon=this.par.object.unik.array;
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