

import { P20 } from './p20/P20.js';
import { Menu} from './p20/menu/Menu.js';
    
import { VisiPixi } from './libMy/VisiPixi.js';

export class Glaf  {
  	constructor(par) {  		
  		this.type="Glaf";
  		var self=this;
        this.par=par;

        this.dCont=new DCont(document.body);

        this.visiPixi=new VisiPixi();             
        this.cont2d = new PIXI.Container();
        this.content2d = new PIXI.Container();
        
        this.visiPixi.content2d.addChild(this.cont2d); 
        this.cont2d.addChild(this.content2d); 


        this.c2dSloi = new PIXI.Container();
        this.c2dSloi1 = new PIXI.Container();
        this.c2dSloi2 = new PIXI.Container();
        this.c2dSloi3 = new PIXI.Container();
        
        this.content2d.addChild(this.c2dSloi);
        this.content2d.addChild(this.c2dSloi1);
        this.content2d.addChild(this.c2dSloi2);
        this.content2d.addChild(this.c2dSloi3);


        this.intRend=0;
        this.render = function () {
            this.intRend=1;
        }

        this.p20=new P20(this,function(s,p,p1){                  
            if(s=="render"){ 
                self.intRend=p ? p: 1          
                return;
            }

            if(s=="complit"){           
                return;
            }
            if(s=="indexSP"){ 
                self.menu.setSP(p);
            }

            if(s=="addChild")self[p].addChild(p1);
            self.render()
        });
        //document.body.appendChild(this.p20.div); //приатачиваем див там 3д и соты

        this.menu=new Menu(this,function(s,p,p1){           
            if(s=="mashtab")self.p20.mashtab=p;
            if(s=="render"){}
            if(s=="setObjSP"){
                self.p20.setObj(p)
            }  
            if(s=="dragStyleObj") self.p20.dragStyleObj(p) 
            
            self.render()
        });
        this.menu.setP20(this.p20);
        this.p20.index=1;       



        //ап дете сцена деленая на 2 в мейне
        this.update = function () {
            if(this.p20.upDate()==true)this.intRend=1;

            if(this.intRend<=1 || this.intRend==100){
                this.visiPixi.render();
                this.intRend=2
            }
            this.intRend++;
            //trace(this.intRend)
        }

        //расчет окна
        this.sizeWindow = function(w,h,s){              
            this.scale=s;
            this.dCont.scale=s;
            this.menu.sizeWindow(w,h,s);
                  
        }

  
  	}
}






