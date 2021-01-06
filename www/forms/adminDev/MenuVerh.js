



export class MenuVerh  {
  	constructor(par,fun) {  		
  		this.type="MenuVerh";
  		this.fun=fun
  		this.par=par
  		var self=this;
	


        this.param=par.param;


        this.dCont=new DCont(par.dCont);

		

        this.init=function(){
            this.panel=new DPanel(this.dCont,0,0)
        }



        this.setParam=function(){
            this.panel.x=this.param.wb+this.param.otstup*2
            this.panel.y=this.param.wh+this.param.otstup*4
            this.panel.height= this.param.otstup*2+this.param.wh;

          
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
            this.panel.width=w/s-(this.param.otstup+this.panel.x);
            this.panel.height=h/s-(this.param.otstup+this.panel.y)
  		}
  	}
}





