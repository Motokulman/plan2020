
export class MenuMCGal  {
    constructor(par,fun,_x,_y) {          
        this.type="MenuMCGal";
        this.fun=fun
        this.par=par
        var self=this;   

        this.param=par.param;
        this.otstup=this.param.otstup

        this.x = 0 || _x
        this.y = 0 || _y

        this._width = 525
        this._height = 200

        this.dCont=new DCont(par.panel);
        this.dCont.x = this.x
        this.dCont.y = this.y

        this._activeGaleri=false

        this.down=function(o){

            let link='http://plan2020/admin.html?'+self.name+"="+this.array[this.index].object.id;

            window.open(link);

            trace("FIXE подменить линк на локальный не локальный для сайта заказчика")
        }
        this.gallary = new DGallary1(this.dCont,0,0,this.down,this);      
        this.gallary.kolII=1;
        this.gallary.widthPic=this.width//this.widthMenu/this.gallary.kolII-4;
        this.gallary.heightPic=64//130*sxz;
        this.gallary.width=this.width - this.otstup*2;
        this.gallary.otstup=this.otstup; 
        this.gallary.height=this.height;
        this.gallary.visible=this._activeGaleri;

        
        //this.dContCreat=new DCont(this.dCont);


        this.setSob=function(s,p,p1){ 
            trace('setSob', s,p,p1)
            if(s=="List"){                
                this.activeGaleri=true;
                this.gallary.start(p);
                this.name= p1
                return
            }
        }

        this.setParam=function(){ 
            this.y = this.param.wh + this.otstup
            this.sizeWindow()
        }

        var w,h,s
        this.sizeWindow = function(_w,_h,_s){
            if(_w){
                w=_w;
                h=_h;
                s=_s;
            }
            this.width=w/s-(this.param.otstup);
            this.height=h/s-(this.param.otstup*2+this.param.wh)   
        }
    }
    
    set x(value) {
        if (this._x != value) {
            this._x = value;            
            this.gallary.x=this._x;
        }             
    }
    get x() { return this._x; }

    set y(value) {
        if (this._y != value) {
            this._y = value;            
            this.gallary.y=this._y;
        }             
    }
    get y() { return this._y; }

    set width(value) {
        if (this._width != value) {
            this._width = value;            
            this.gallary.width = value;
            this.gallary.widthPic = value - this.otstup*2;
        }             
    }
    get width() { return this._width; }

    set height(value) {
        if (this._height != value) {
            this._height = value;            
            this.gallary.height = value;                            
        }             
    }
    get height() { return this._height; }


    set activeGaleri(value) {
        if (this._activeGaleri != value) {
            this._activeGaleri = value;            
            this.gallary.visible=this._activeGaleri                               
        }             
    }
    get activeGaleri() { return this._activeGaleri; }
}




function DGallary1(dCont, _x, _y, _fun,par) {
    DGallery.call(this, dCont, _x, _y, _fun);    
    this.par=par        
    this.type="DGallary1";
    this.bRadius=par.bRadius
    this.createZamen=function(){            
        var r=new BXZ1(this.content, 0, 0, this.downBtn, this);            
        return r;
    }    
}

DGallary1.prototype = Object.create(DGallery.prototype);
DGallary1.prototype.constructor = DGallary1;
Object.defineProperties(DGallary1.prototype, {
    index: { // активный элемент
        set: function (value) {
            if (this._index == value) return;
            this._index = value;
      
        },
        get: function () {
            return this._index;
        }
    },
})

function BXZ1(dCont, _x, _y, _fun, par) {
    DBox.call(this, dCont, _x, _y, _fun);
    this.type = 'BXZ1';
    var self=this;
    this.par=par;


    this.label1=new DLabel(this) 
    this.label2=new DLabel(this)  
    this.label3=new DLabel(this)   

   /* this.label.bold = true;
    this.label.fontSize=12;*/

    this.arLabel=[this.label,this.label1,this.label2,this.label3]
    
    for (var i = 0; i < this.arLabel.length; i++) {
        this.arLabel[i].fontSize=12;
        this.arLabel[i].activMouse=false
    }


    this.startLoad = function (_obj) {        
        this.object = _obj;
        
        this.image.link = this.object.icon;

        this.label.text= this.object.id;
        this.label1.text= this.object.name;
        this.label2.text= "null";
        this.label3.text= "null";

        self.funLoad();
        this.draw();
        self.funLoad();

    };

    var bb=true
    var ss
    this.draw = function () {
        this.image.visible=false;
        this.label.x=100;
        this.label.y=10;
 
        let hh=this.height//-30
        ss = (this.width) / this.image.picWidth;
        if (ss > (hh - this._otstup * 2) / this.image.picHeight)ss = (hh - this._otstup * 2) / this.image.picHeight;
       
        this.image.width=this.image.picWidth*ss;
        this.image.height=this.image.picHeight*ss;

        
        this.image.x = 0;
        this.image.y = 0;

        for (var i = 0; i < this.arLabel.length; i++) {
            if(i==0){
                this.arLabel[i].y = this.otstup;
            }else{
                this.arLabel[i].y = this.arLabel[i-1].fontSize+this.arLabel[i-1].y;
            }            

            this.arLabel[i].x = this.image.width+this.otstup
            this.arLabel[i].width=this.panel.width-this.arLabel[i].x
            this.arLabel[i].visible=true;
        }

        this.image.visible = true; 
        if (this.postDraw) this.postDraw();
    };
}
BXZ1.prototype = Object.create(DBox.prototype);
BXZ1.prototype.constructor = BXZ1;

Object.defineProperties(BXZ1.prototype, {
    activ: { // активный элемент
        set: function (value) {
            if (this._activ == value) return;
            this._activ = value;
            if(this._activ){
                this.label.color="#93c32f"
            }else{
                this.label.color="#000000"
            }
            if(this._activ==false)this.panel.color1=this._color1;
            else this.panel.color1=this._color;
        },
        get: function () {
            return this._activ;
        }
    },
})







