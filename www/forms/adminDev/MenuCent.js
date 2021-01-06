



export class MenuCent  {
  	constructor(par,fun) {  		
  		this.type="MenuCent";
  		this.fun=fun
  		this.par=par
  		var self=this;
	


        this.param=par.param;


        this.dCont=new DCont(par.dCont);

		

        this.init=function(){
            this.panel=new DPanel(this.dCont,0,0)
        }



        this.setParam=function(){   

            this.panel.height= this.param.otstup*2+this.param.wh;
            this.panel.x=this.param.otstup
            this.panel.y=this.param.otstup
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
            this.panel.width=w/s-this.param.otstup*2

           
  		}
  	}
}





