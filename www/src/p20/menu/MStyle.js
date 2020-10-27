
export class MStyle  {
    constructor(par, idArr) {
    	this.type="MStyle";
		var self=this;
		this.par=par
		this.idArr=idArr
		this._active= false;   
		this.dCont=new DCont(par.dCont);	
		this.dCont.visible=	this._active;


		this.init=function(){
            if(this.window!=undefined)return          
            

            this.window=new DWindow(this.dCont,0,0,"xz");

        }
    }

    set active(value) {
        if(this._active!=value){
            this._active= value;
            this.init();
            this.dCont.visible= value;     
        }
    }    
    get active() { return  this._active;}
}
