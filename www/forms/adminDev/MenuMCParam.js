export class MenuMCParam  {
    constructor(par, _typeComp, _fun) {  
        this.type="MenuMCParam";
        this.par=par
        var self=this;
        this.fun=_fun;


        this._active=true
        this._bool=false
        this.typeComp=_typeComp

        this.fontSize = 16;
        this._x = 0
        this._y = 0
        this.otstup=this.par.otstup
        this.height=this.par.height

                        
        this.param=undefined
        this.width=undefined
        this.title=undefined
        this.cmena=undefined
        this.cmenaGal=undefined
        this.value=undefined
        this.idArr=-1
        this.uuid=Math.random()

        this.panel=undefined
        this.dCont=new DCont(this.par.panel.content);

        this.init=function(){
            this.label=new DLabel(this.dCont, 0, 0, "null");
            this.label.bold = true;
            this.label.color = dcmParam._colorText;

            this.panel = new DPanel (this.dCont, this.x, 0)
            this.panel.width=this.width- this.otstup * 2;
            this.panel.height=this.height-(this.otstup*2)
            this.panel.alpha=0
            this.panel.div.addEventListener('mousedown', self.mousedown);

            this.comp =  this.addComponent(this.typeComp) 
        }


        this.down=function(o){
           trace(this.value)
        }
        

        this.setObj=function(o){
            this.param = o.param
            this.width = o.width
            this.title = o.title!=undefined?o.title:undefined
            this.cmena = o.cmena!=undefined?o.cmena:undefined
            this.value = o.value

            this.applyObj()
            this.sobCmena(o)
        }
        
        this.applyObj=function(o){
            this.label.value = this.title

            var valid=true
            if (this.cmena == undefined || this.cmena == null || this.cmena == 'null') {
                valid=false
                if (this.label) this.label.visible = true
                if (this.comp) this.comp.visible = false
            }
            if (this.title == undefined || this.title == null || this.title == 'null') {
                valid=false
                if (this.label) this.label.visible = false
                if (this.comp) this.comp.visible = true
            }
            if (valid==false){
                this.dCont.remove(this.panel)
                this.panel.div.removeEventListener('mousedown', self.mousedown);
                
            }else{
                this.dCont.add(this.panel)
                this.panel.div.addEventListener('mousedown', self.mousedown);
            }

            if (this.value && this.cmena){
                if (this.cmena == 'DComboBox') this.comp.array = this.value
                if (this.cmena == 'DButton')  this.comp.text = this.value
                if (this.cmena == 'DImage')  {
                    this.comp.link = this.value

                    var s;
                    s = (this.height- this.otstup * 2) / this.comp.picHeight;
                    if (this.width / this.comp.picWidth < s)
                        s = (this.width- this.otstup * 2) / this.comp.picWidth;
                    this.comp.height = this.comp.picHeight * s;
                    this.comp.width = this.comp.picWidth * s;
                }

                if (this.cmena == 'DInput')  this.comp.text = this.value
                // if (this.cmena == 'DCheckBox')  this.comp
            }

        }

        this.addComponent = function (_type) {
            //DComboBox //DButton //DImage //DInput //DCheckBox //undefined
            var component = null;
            trace('this.value', this.value)
            if (_type == 'DComboBox') component = new DComboBox(this.dCont, 0, 0, [], this.down);
            if (_type == 'DButton') component = new DButton(this.dCont, 0, 0, '', this.down);
            if (_type == 'DImage') component = new DImage(this.dCont, 0, 0, null, this.down);
            if (_type == 'DInput') component = new DInput(this.dCont, 0, 0, "", this.down);
            if (_type == 'DCheckBox') component = new DCheckBox(this.dCont, 0, 0, "", this.down);

            if (component) component.visible = false
            if (component) if (component.height ) component.height = this.height - this.otstup * 2;
            if (component) if (component.width ) component.width = this.width - this.otstup * 2;
            if (component) if (component.fontSize) component.fontSize = this.fontSize;

            return component;
        };
        this.sobCmena=function(o){
            self.fun("sobCmena", o, self)
        }
      
        this.mousedown = function (e) {
            self.bool=true
            self.fun("mdBool",self)
        };

        this.clear=function(){
            this.active=false;
            this.bool=false;
        }

        this.init() 
    }

    
    set bool(value) {
        if(this._bool!=value){
            this._bool=value
            if (this.title && this.cmena){
                if(this._bool==true){
                    if(this.label)this.label.visible = false
                    if(this.comp) this.comp.visible =  true

                    this.dCont.remove(this.panel)
                    this.panel.div.removeEventListener('mousedown', self.mousedown);
                }else{
                    if(this.label)this.label.visible = true
                    if(this.comp)this.comp.visible =  false

                    this.dCont.add(this.panel)
                    this.panel.div.addEventListener('mousedown', self.mousedown);
                }
            }
        }
    }    
    get bool() { return  this._bool;}

    set active(value) {
        if(this._active!=value){
            this._active=value
            this.dCont.visible=value
        }
    }    
    get active() { return  this._active;}

    set width(value) {
        if(this._width!=value){
            this._width=value;
            if(this.label)this.label.width=this.width
            if(this.panel)this.panel.width=this.width
            if(this.comp)this.comp.width=this.width
        }
    }    
    get width() { return  this._width;}


    set x(value) {
        if(this._x!=value){
            this._x=value
            this.dCont.x=value                 
        }
    }    
    get x() { return  this._x;}

    set y(value) {
        if(this._y!=value){
            this._y=value
            this.dCont.y=value;
        }
    }    
    get y() { return  this._y;}
}
