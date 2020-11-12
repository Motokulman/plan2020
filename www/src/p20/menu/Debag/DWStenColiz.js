export class DWStenColiz extends DCont{
    constructor(dC) {
        super()
        var self=this;
        this.type="DWStenColiz"

        this.dC=dC
        this._active = false 
        this._otstup = 5
        this._width=600
        this._height=600

        this.pan = new DPanel (this.dC)
        this.pan.width = this._width
        this.pan.height = this._height
        this.pan.visible = this.active

        this.slider = new DSliderBig (this.pan, this._otstup, this._otstup, function(){self.width=this.value;}, 'width', 200, 800)
        this.slider.value = this._width
        this.slider1 = new DSliderBig (this.pan, this._otstup, this.slider.height + this._otstup * 2, function(){self.height=this.value;}, 'height', 150, 800)
        this.slider1.value = this._height

        this.funDrwgWG=null
        this.funxz=function(){
            if(this.funDrwgWG!=undefined)this.funDrwgWG(this._width,this._height)
        }

    }

    set active(value) {
        if(this._active!=value){
            this._active = value;
            this.pan.visible = this.active
        }       
    }   
    get active() { return  this._active;} 

    set width(value) { 
        if(this._width!=value){
            this._width=value;
            this.pan.width=value
            this.slider.value = value;
           this.funxz();
        }
    }   
    get width() { return  this._width}

    set height(value) { 
        if(this._height!=value){
            this._height=value;
            this.pan.height=value
            this.slider1.value = value;
            this.funxz();
        }
    }   
    get height() { return  this._height}
}