import { MenuMCGal } from './MenuMCGal.js';
import { MenuMCPanel } from './MenuMCPanel.js';


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

            this.mcPanel = new MenuMCPanel(this, function(s, p, p1){
                if(s=="sobCmena"){
                    trace(s,p, p1)
                    //p обьект
                    //р1 Компонент
                }
                
            })


            this.mcGal = new MenuMCGal(this, function(s,p){
            })

            this.mcLoad = new MCLoad(this, function(s,p,p1){
                self.mcPanel.setSob(s,p,p1)
                self.mcGal.setSob(s,p,p1)
            })

            /*var panelParam = [
                {param: 'id', width: 200, title: 'ID', cmena: 'DButton', cmenaGal: 'DButton', value: null },
                {param: 'icon', width: 100, title: 'icon', cmena: 'DInput', cmenaGal: 'DButton', value: null },
                {param: 'name', width: 100, title: 'name', cmena: 'DComboBox', cmenaGal: 'DButton', value: null },
                {param: 'up', width: 100, title: null, cmena: 'DButton', cmenaGal: 'DButton', value: null }
            ]*/

            var panelParam = [
                {param: 'id', width: 200, cmena: 'DButton', value: null },
                {param: 'icon', width: 100, title: 'icon', cmena: 'DImage',   value: "../../resources/image/pic.png" },
                {param: 'icon', width: 100, title: 'icon',   value: null },
                {param: 'name', width: 100, title: 'name', cmena: 'DComboBox',  value: null },
                {param: 'up', width: 100, title: null, cmena: 'DButton', value: null },
                {param: 'id', width: 200, title: 'ID', cmena: 'DInput', value: 2 },
            ]



            self.mcPanel.setSob("Drag", panelParam)
            //this.mcGal.setSob("Drag", panelParam)
        }

        this.setParam=function(){ 
            this.panel.x=this.param.wb+this.param.otstup*2
            this.panel.y=this.param.wh+this.param.otstup*4

            this.mcPanel.setParam()
            this.mcGal.setParam()
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

            this.mcPanel.sizeWindow(w-this.panel.x,h,s)    
            this.mcGal.sizeWindow(w-this.panel.x,h,s)    

            // this.mcGal.width=w/s-(this.param.otstup+this.panel.x);
            // this.mcGal.height=h/s-(this.param.otstup+this.panel.y)
            // this.mcGal.height=h/s-(this.param.otstup*5+this.param.wh)                 

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
                var s='[{"id":1,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":4,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":5,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":6,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":7,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":8,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":9,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":10,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":11,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":12,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":13,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":14,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":15,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":16,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":17,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":18,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":19,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":20,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":21,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":22,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":23,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":24,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":25,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":26,"files":[],"name":"","json":null,"user":null,"texture_type":null},{"id":27,"files":[],"name":"","json":null,"user":null,"texture_type":null}]'
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


