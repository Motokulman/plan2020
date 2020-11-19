


//отрисовка стен

export class SSP3D  {
  	constructor(par,fun) {  		
  		this.type="SSP3D";
        var self=this;
        this.par=par;
        this._active = false;
        








    	





		this.draw1 = function () {

			
		}	
    }

	set active(value) {
        if(this._active!=value){
            this._active= value;            

        }
    }    
    get active() { return  this._active;}
}


