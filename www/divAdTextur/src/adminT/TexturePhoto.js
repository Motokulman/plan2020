
export class TexturePhoto {
    constructor(_dCont, _visi3D, _x, _y) {
        var self = this;
        this.type = 'TexturePhoto';
        this._dCont = _dCont;
        this._x = _x || 100;
        this._y = _y || 100;
        this._height = 100;
        this._width = 50;

        this.otstup = 2;

        this.visi3D = _visi3D;
        this.dCont = new DCont(this._dCont);
        this.panel = new DPanel(this.dCont, this._x, this._y);
        this.panel.height = this.height
        this.panel.width = this.width

        this.fotoDrag=new FotoDrag(function(){
            // self.narezka();
        })

        var xx = this.otstup
        this.panel1 = new DPanel(this.panel, xx, this.otstup);
        this.panel1.height = this.height
        this.panel1.width = this.width
        this.panel1.color1 = "#777777"

        this.image = new DImage(this.panel1, 0, 0, null)
        this.panel1.width=this.panel1.height=this.image.width = this.image.height = this.panel.height - (this.otstup*3)


        xx+= this.image.width + this.otstup
        this.butPic=new DButton(this.panel.content, xx, this.otstup, " ",function(base64){        
            var d=self.visi3D.utility.debug;
            self.visi3D.utility.debug=false
            var sk=self.visi3D.utility.sky.active
            self.visi3D.utility.sky.active=false


            var alpha=true;
            var color=0xffffff;

            if(self.visi3D.alpha==false){
                alpha=false;            
                self.visi3D.renderer.setClearColor(color, 1);
            }

            var ww=self.visi3D._width
            var hh=self.visi3D._height
            
            self.visi3D.sizeWindow(0,0,256,256)
            self.visi3D.render();

            var base64 = self.visi3D.renderer.domElement.toDataURL("image/png");
            self.fotoDrag.setLink(base64);


            
            self.visi3D.sizeWindow(0,0,ww,hh)
            self.visi3D.utility.debug=d
            if(alpha==false){
                self.visi3D.renderer.setClearColor(self.visi3D.color, 1);
                
            }
            self.image.link = base64
            trace(base64)
        })
        this.butPic.loadImeg("src/admin/icon/i2.png")
        this.butPic.width=this.butPic.height=25
        xx+= this.butPic.width + this.otstup

        this.panel.width = xx+this.otstup
    }

    set height(v) {
        if (this._height == v) return;
        this._height = v;
    }
    get height() { return this._height; }

    set width(v) {
        if (this._width == v) return;
        this._width = v;
    }
    get width() { return this._width; }
}

function FotoDrag(fun) {  
    var self=this   
    this.type="FotoDrag";
    this.fun=fun;
    this.width=256;             
    this.height=256;
    
    var canvas = document.createElement('canvas');
    var ctx = canvas.getContext('2d');
    var image = new Image();
    var image1 = new Image();

    var bbb
    image.onload = function() {         
        canvas.width = image.width;
        canvas.height = image.height;
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        ctx.drawImage(image, 0, 0);
        ctx.filter = null;
        var imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
        var pixels = imageData.data;
        var n=1
        for (var i = 0; i < pixels.length; i += 4) {
            pixels[i]     = n; 
            pixels[i + 1] = n; 
            pixels[i + 2] = n; 
        }   
        ctx.filter = 'blur(5px)';     
        ctx.putImageData(imageData, 0, 0);
        bbb=true
        image1.src=canvas.toDataURL('image/png');
    }

    image1.onload = function() {        
        if(bbb==true){          
            ctx.clearRect(0, 0, image1.width, image1.height);
            ctx.filter = 'blur(5px)'; 
            ctx.drawImage(image1, 0, 0, image1.width, image1.height); 
            bbb=false;
            image1.src=canvas.toDataURL('image/png');
        }
        self.fun()
    }

    this.bool=false    
    this.setLink=function(base64,bool){
        this.bool=false
        if(bool)this.bool=bool;        
        image.src = base64;
    }

    this.na=function( num, tip){   
        canvas.width = num;
        canvas.height = num;
        ctx.clearRect(0, 0, num, num);
        if(self.bool)ctx.drawImage(image1, 0, 0, num, num);
        ctx.drawImage(image, 0, 0, num, num);
        return canvas.toDataURL('image/png');
    }
}

