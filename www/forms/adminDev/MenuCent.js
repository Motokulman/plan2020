import { MCGal } from './MenuMCGal.js';
import { MCPanel } from './MenuMCPanel.js';


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
            console.warn("dfgdgfdf")

            this.mcPanel = new MCPanel(this, function(s,p){
            })


            this.mcGal = new MCGal(this, function(s,p){
            })

            this.mcLoad = new MCLoad(this, function(s,p,p1){
                self.mcPanel.setSob(s,p,p1)
                //self.mcGal.setSob(s,p,p1)
            })

            var panelParam = [
                {param: 'id', width: 200, title: 'ID', cmena: 'DInput', cmenaGal: 'DButton', value: null },
                {param: 'icon', width: 100, title: 'icon', cmena: 'DButton', cmenaGal: 'DButton', value: null },
                {param: 'name', width: 100, title: 'name', cmena: 'DComboBox', cmenaGal: 'DButton', value: null },
                {param: 'up', width: 100, title: null, cmena: 'DImage', cmenaGal: 'DButton', value: null }
            ]
            self.mcPanel.setSob("Drag", panelParam)
        }

        this.setParam=function(){ 
            /*this.panel.height= this.param.otstup*2+this.param.wh;

            this.panel.x=this.param.otstup;
            this.panel.y=this.param.otstup;*/

            this.panel.x=this.param.wb+this.param.otstup*2
            this.panel.y=this.param.wh+this.param.otstup*4

            // this.panel.height= this.param.otstup*2+this.param.wh;
            this.sizeWindow();
        }

        this.init();


        this.titleSob=""
        this.setSob=function(s){ 
            this.titleSob=s;
            this.mcLoad.setSob(s)
        }



		var w,h,s
  		this.sizeWindow = function(_w,_h,_s){
  			if(_w){
  				w=_w;
  				h=_h;
  				s=_s;
  			}
      // this.three.height=h/s-(this.param.otstup*5+this.param.wh)                 

            this.panel.width=w/s-(this.param.otstup+this.panel.x);
            this.panel.height=h/s-(this.param.otstup+this.panel.y)

            this.mcPanel.width=w/s-(this.param.otstup+this.panel.x);
            this.mcPanel.height=(h/s-(this.param.otstup+this.panel.y))*0.09

            this.mcGal.width=w/s-(this.param.otstup+this.panel.x);
            this.mcGal.height=h/s-(this.param.otstup+this.panel.y)
            this.mcGal.height=h/s-(this.param.otstup*5+this.param.wh)                 

            this.mcGal.y=this.mcPanel.height+this.param.otstup
  		}
  	}
}



export class MCLoad  {
    constructor(par,fun) {          
        this.type="MCLoad";
        this.fun=fun
        this.par=par
        var self=this;   


        this.param=par.param;
        this.name="";

        this.dCont=new DCont(par.dCont);

        this.setSob=function(s){            
            if(s.indexOf("List")!=-1){                
                var a=s.split("List");
                this.name=a[0];
                this.openList(this.name)
                //http://192.168.1.116:8000/api/v1/textures/

            }

            if(s.indexOf("Creat")!=-1){  
                var a=s.split("Creat");
                this.name=a[0];
                var o={}
                o.url= this.param.server+ this.name+"/"
                o.type="POST";
                o.data={}
                o.data.file=[1,2]

                o.success = function (response) { 
                    trace(response) 
                    self.openList(self.name)         
                };
                
                $.ajax(o);

            }


        }


        this.openList=function(s){ 
            setTimeout(function() {
                var s='[{"id":3,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":4,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":5,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":6,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":7,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":8,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":9,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":10,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":11,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":12,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":13,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":14,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":15,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":16,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":17,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":18,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":19,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":20,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":21,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":22,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":23,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":24,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":25,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":26,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":27,"files":[],"name":"","json":null,"user":null,"texture_type":null}]'
                self.fun("List",JSON.parse(s),self.name)
            }, 100);
            return

            var o={}
            o.url= this.param.server+ this.name+"/"
            o.type="GET"

            o.success = function (response) { 
                trace(response)
                trace(JSON.stringify(response))


                self.fun("List",response,self.name);           
            };
            $.ajax(o);
        }

    }
}


