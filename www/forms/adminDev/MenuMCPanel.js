import { MenuMCParam } from './MenuMCParam.js';


export class MenuMCPanel  {
    constructor(par,fun,_x,_y) {          
        this.type="MenuMCPanel";
        this.fun=fun
        this.par=par
        var self=this;   

        this.param=par.param;

        this._x = 0 || _x
        this._y = 0 || _y

        this._width = 5
        this._height = this.param.wh
        this.otstup = this.param.otstup
        this._activePanel=false


        this.array = []
        this.arrayCesh = []

        this.dCont=new DCont(par.panel);
        this.dCont.x = this.x
        this.dCont.y = this.y
        this.dCont.visible=this._activePanel;


        this.panel = new DPanel(this.dCont, 0, 0)
        this.panel.color1 = '#008cba'
        this.panel.height = this._height


        this.setSob=function(s,p,p1){ 
            //trace('setSob', 's', s, 'p', p, 'p1', p1)
            if(s=="List"){                
                this.activePanel=true;
                return
            }

            if(s=="Drag"){   
                self.setVisi(p)      
                return
            }
        }

        this.sobxzP=function(s,p,p1){
            if(s=="mdBool"){
                let b=true
                // trace(p.uuid,self.array)
                for (var i = 0; i < self.array.length; i++) {
                    b=false
                    
                    if(p)if(p.uuid==self.array[i].uuid){
                        b=true
                    }
                    // trace(i+"  "+b+"  "+self.array[i].uuid)
                    self.array[i].bool=b;
                }
            }

            if(s=="sobCmena"){   
                self.fun("sobCmena", p, p1)
            }
        }
       

        this.getXZP=function(typeComp){
            for (var i = 0; i <  this.arrayCesh.length; i++) {
                if(this.arrayCesh[i].active!=true){
                    if(this.arrayCesh[i].typeComp==typeComp){
                        this.arrayCesh[i].active=true;
                        return this.arrayCesh[i]
                    }
                }
            }
            this.arrayCesh.push(new MenuMCParam(this, typeComp,this.sobxzP));
            this.arrayCesh[this.arrayCesh.length-1].idArr=this.arrayCesh.length-1
            return this.arrayCesh[this.arrayCesh.length-1];
        }


        this.clear=function(p){
            self.array.length=0;
            for (var i = 0; i <  this.arrayCesh.length; i++) {
                this.arrayCesh[i].clear()
            }
        }


        
        this.setVisi=function(p){
            this.clear()
            var positionX = this.otstup
            for (var i = 0; i < p.length; i++) {
                let o=this.getXZP(p[i].cmena)
                o.x = positionX;
                o.y = this.otstup
                o.setObj(p[i]);

                self.array.push(o)
                positionX += p[i].width+this.otstup
            }
            // trace(this.arrayCesh)
        }


        this.setParam=function(){ 
            this.x = this.otstup
            this.sizeWindow()
        }

        var w,h,s
        this.sizeWindow = function(_w,_h,_s){
            if(_w){
                w=_w;
                h=_h;
                s=_s;
            }
            this.width=w/s-(this.otstup);
            this.height=this.param.wh;
            this.array[this.array.length-1].width = this.width-this.array[this.array.length-1].x-this.otstup
        }

    }

    set x(value) {
        if (this._x != value) {
            this._x = value;            
            this.dCont.x=this._x                               
        }             
    }
    get x() { return this._x; }

    set y(value) {
        if (this._y != value) {
            this._y = value;                                          
            this.dCont.y=this._y 
        }             
    }
    get y() { return this._y; }

    set width(value) {
        if (this._width != value) {
            this._width = value;            
            this.panel.width=this._width                               
        }             
    }
    get width() { return this._width; }

    set height(value) {
        if (this._height != value) {
            this._height = value;            
            this.panel.height=this._height                               
        }             
    }
    get height() { return this._height; }

    set activePanel(value) {
        if (this._activePanel != value) {
            this._activePanel = value;            
            this.dCont.visible=this._activePanel                               
        }             
    }
    get activePanel() { return this._activePanel; }
}
