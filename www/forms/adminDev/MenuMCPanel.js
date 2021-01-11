
export class MCPanel  {
    constructor(par,fun,_x,_y) {          
        this.type="MCPanel";
        this.fun=fun
        this.par=par
        var self=this;   

        this._x = 0 || _x
        this._y = 0 || _y

        this._width = 525
        this._height = 50
        this.otstup = 5
        this._activePanel=false


        this.array = []
        this.arrayCesh = []

        this.dCont=new DCont(par.panel);
        this.dCont.x = this.x
        this.dCont.y = this.y
        this.dCont.visible=this._activePanel;


        this.panel = new DPanel(this.dCont, 0, 0)
        this.panel.color1 = '#008cba'

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


       



        this.getXZP=function(typeComp){
            for (var i = 0; i <  this.arrayCesh.length; i++) {
                if(this.arrayCesh[i].active!=true){
                    if(this.arrayCesh[i].typeComp==typeComp){
                        this.arrayCesh[i].active=true;
                        return this.arrayCesh[i]
                    }
                }
            }
            this.arrayCesh.push(new XZParam(this, typeComp));
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
            var positionX = this.otstup
            for (var i = 0; i < p.length; i++) {
                let o=this.getXZP(p[i].cmena)
                o.x = positionX;
                /*p[i].x = positionX;
                p[i].idArr = i*/


                o.setObj(p[i]);
                positionX += p[i].width+this.otstup
            }
            trace("sdgfsdgsdfg!!!!!!!!!!!!!!!!")
            trace(this.arrayCesh)
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




export class XZParam  {
    constructor(par, _typeComp, _fun) {  
        this.type="param";
        this.par=par
        var self=this;
        this.fun=_fun;

        this._active=true
        this.typeComp=_typeComp

        this.fontSize = 16;
        this._x = 0
        this._y = 0
        this.otstup=this.par.otstup
                        
        this.param=undefined
        this.width=undefined
        this.title=undefined
        this.cmena=undefined
        this.cmenaGal=undefined
        this.value=undefined
        this.idArr=0

        this.dCont=new DCont(this.par.panel.content);





        this.init=function(){
            
            this.label=new DLabel(this.dCont, 0, 0, "null");
            this.comp =  this.addComponent(this.typeComp, this.title) 
            
             /*if (this.cmena != undefined) this.XZComponent = this.addComponent(this.typeComp, this.title)
           this.panel = new DPanel (this.dCont, this.x, 0)
            this.panel.width=this.width
            this.panel.alpha=0.3
            this.panel.div.addEventListener('mousedown', self.mousedown);
            */
        }


        this.down=function(o){
            trace(o)
        }

        this.addComponent = function (_type) {
        //DComboBox //DButton //DImage //DInput //DCheckBox //undefined
            var component = null;

            if (_type == 'DComboBox') {
                component = new DComboBox(this.dCont, 0, 0, ["nullxz"], this.down);
                component.width = this.width - this.otstup * 2;
            }   

            if (_type == 'DButton') {
                component = new DButton(this.dCont, 0, 0, '', this.down);
                component.width = this.width - this.otstup * 2;
            }

            if (_type == 'DImage') {
                component = new DImage(this.dCont, 0, 0, null, this.down);
            }

            if (_type == 'DInput') {
                component = new DInput(this.dCont, 0, 0, "null"), this.down;
                component.fontSize = this.fontSize;
                component.width = this.width - this.otstup * 2;
                component.height = this.fontSize;
            }

            if (_type == 'DCheckBox') {
                component = new DCheckBox(this.dCont, 0, 0, "null", this.down);
                component.fontSize = this.fontSize;
                component.width = this.width - this.otstup * 2;
                component.height = this.fontSize;
            }

          
         
         
            return component;
        };

      


        this.mousedown = function (e) {
            trace(e.target)
            trace(e)
        };
        


        this.setObj=function(o){
            this.param = o.param
            this.width = o.width
            this.title = o.title
            this.cmena = o.cmena
            this.cmenaGal = o.cmenaGal
            this.value = o.value
           
          

                   
        }
        
        this.clear=function(){
            this.active=false;

        }
        this.init() 
    }

    set active(value) {
        if(this._active!=value){
            this._active=value
            this.dCont.visible=value
            /*this.label.activeble = value
            this.XZComponent.activeble = value == true ? false : true*/
        }
    }    
    get active() { return  this._active;}

    set x(value) {
        if(this._x!=value){
            this._x=value
            trace(value)
            this.dCont.x=value            
        }
    }    
    get x() { return  this._x;}

    // set y(value) {
    //     if(this._y!=value){
    //         this._y=value
    //         this.dCont.y=value;
    //     }
    // }    
    // get y() { return  this._y;}
}
