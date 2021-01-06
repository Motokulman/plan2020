



export class MenuLeft  {
  	constructor(par,fun) {  		
  		this.type="MenuLeft";
  		this.fun=fun
  		this.par=par
  		var self=this;
	


        this.param=par.param;


        this.dCont=new DCont(par.dCont);

		

        this.init=function(){
            this.panel=new DPanel(this.dCont,0,0)
        }



        this.setParam=function(){ 
            this.panel.width= this.param.wb;
            this.panel.x=this.param.otstup
            this.panel.y=this.param.otstup*4+this.param.wh

            this.sizeWindow()
        }

        this.init()




		var w,h,s
  		this.sizeWindow = function(_w,_h,_s){
  			if(_w){
  				w=_w;
  				h=_h;
  				s=_s;
  			}

            this.panel.height=h/s-(this.param.otstup*5+this.param.wh)

           
  		}
  	}
}





