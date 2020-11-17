export class DWStenColiz extends DCont{
    constructor(dC) {
        super()
        var self=this;
        this.type="DWStenColiz";

        this.dC=dC;
        this._active = false;
        this._otstup = 5;
        this._width=150;
        this._height=300;
        this._panel2W = 350;
        this._panel2H = 350;

        this.panel = new DPanel (this.dC);
        this.panel.width = this._width;
        this.panel.height = this._height;
        this.panel.visible = this.active;

        this.panel1 = new DPanel (this.dC, 0 , this._height);
        this.panel1.width = this._width;
        this.panel1.height = this._height;
        this.panel1.visible = this.active;

        this.panel2 = new DPanel (this.dC, this._width + 50, 50);
        this.panel2.width = this._panel2W;
        this.panel2.height = this._panel2H;
        this.panel2.visible = this.active;

        this.slider = new DSliderBig (this.panel, this._otstup, this._otstup, function(){self.panel2W=this.value;}, 'width', 200, 800)
        this.slider.value = this._width;
        this.slider1 = new DSliderBig (this.panel, this._otstup, this.slider.height + this._otstup * 2, function(){self.panel2H=this.value;}, 'height', 150, 800)
        this.slider1.value = this._height;

        this.array = []

        this.mouseDown = function(e){
            trace('1234')
            self.array[self.array.length] = new M20Gron(self, self.panel2, Math.random(), Math.random(), Math.random(), Math.random(), self.array.length)
            trace(self.array.length)
            // self.drag()
        }

        // this.drag = function(e){
        //     for (var i = 0; i < self.array.length; i++) {
        //         self.array[i].active = true
        //     }
        // }

        this.sob = function(idArr){
                var yy = this._otstup
                this.sliderX=new DSliderBig(this.panel1, this._otstup , yy) //, function(){self.glowSah=this.value;},"glowSah",1,50);
                this.sliderX.value = this._x;

                yy += this.sliderX.height+this._otstup
                this.sliderY=new DSliderBig(this.panel1, this._otstup , yy) //, function(){self.glowSah=this.value;},"glowSah",1,50);
                this.sliderY.value = this._y;

                yy += this.sliderY.height+this._otstup
                this.sliderW=new DSliderBig(this.panel1, this._otstup , yy) //, function(){self.glowSah=this.value;},"glowSah",1,50);
                this.sliderW.value = this._w;

                yy += this.sliderW.height+this._otstup
                this.sliderH=new DSliderBig(this.panel1, this._otstup , yy) //, function(){self.glowSah=this.value;},"glowSah",1,50);
                this.sliderH.value = this._h;
        }

        this.panel2.div.addEventListener('mousedown', this.mouseDown);
    }

    set active(value) {
        if(this._active!=value){
            this._active = value;
            this.panel.visible = this.active;
            this.panel1.visible = this.active;
            this.panel2.visible = this.active;
        }       
    }   
    get active() { return  this._active;} 

    set panel2W(value) { 
        if(this._panel2W!=value){
            this._panel2W=value;
            this.panel2.width=value;
            this.slider.value = value;
        }
    }   
    get panel2W() { return  this._panel2W}

    set panel2H(value) { 
        if(this._panel2H!=value){
            this._panel2H=value;
            this.panel2.height=value
            this.slider1.value = value;
        }
    }   
    get panel2H() { return  this._panel2H}
}




export class M20Gron  {
    constructor(par, dCont, x, y, w, h, idArr) {  
        this.type="M20Gron";
        var self=this;
        this.par = par;
        this.dCont = dCont;
        this.mn = 300;
        this._x = x*this.mn;
        this._y = y*this.mn;
        this._w = w*this.mn;
        this._h = h*this.mn;
        this.idArr = idArr;
        trace('354165',idArr)
        this._active = true;

        this.button = new DButton(this.dCont, this._x, this._y, );
        this.button.width = this._w;
        this.button.height = this._h;
        this.button.visible = this._active;




    }

    set active(value) {
        if(this._active!=value){
            this._active= value;
            this.button.visible = value;
        }
    }    
    get active() { return  this._active;}

    set x(value) { 
        if(this._x!=value){
            this._x=value;
            this.button.x = value
        }
    }   
    get x() { return  this._x}

    set y(value) { 
        if(this._y!=value){
            this._y=value;
            this.button.y = value
        }
    }   
    get y() { return  this._y}

    set w(value) { 
        if(this._w!=value){
            this._w=value;
            this.button.width = value
        }
    }   
    get w() { return  this._w}

    set h(value) { 
        if(this._h!=value){
            this._h=value;
            this.button.height = value
        }
    }   
    get h() { return  this._h}
}

