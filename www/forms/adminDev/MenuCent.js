



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

            this.mcGal = new MCGal(this, function(s,p){

            })

            this.mcLoad = new MCLoad(this, function(s,p,p1){
                self.mcGal.setSob(s,p,p1)
            })
        }



        this.setParam=function(){ 
            /*this.panel.height= this.param.otstup*2+this.param.wh;

            this.panel.x=this.param.otstup;
            this.panel.y=this.param.otstup;*/

            this.panel.x=this.param.wb+this.param.otstup*2
            this.panel.y=this.param.wh+this.param.otstup*4
            this.panel.height= this.param.otstup*2+this.param.wh;

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

            this.panel.width=w/s-(this.param.otstup+this.panel.x);
            this.panel.height=h/s-(this.param.otstup+this.panel.y)

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





export class MCGal  {
    constructor(par,fun) {          
        this.type="MCGal";
        this.fun=fun
        this.par=par
        var self=this;   


        this.param=par.param;
        this.name="null"

        this.dCont=new DCont(par.panel);


        this._activeGaleri=false

        this.down=function(o){

            let link='http://plan2020/admin.html?'+self.name+"="+this.array[this.index].object.id;

            window.open(link);


            trace("FIXE подменить линк на локальный не локальный для сайта заказчика")

        }


        this.gallary = new DGallary1(this.dCont,0,0,this.down,this);      
        this.gallary.kolII=1;
        this.gallary.widthPic=500//this.widthMenu/this.gallary.kolII-4;
        this.gallary.heightPic=64//130*sxz;
        this.gallary.width=525;
        this.gallary.otstup=5; 
        this.gallary.height=200;
        this.gallary.visible=this._activeGaleri;

        
        //this.dContCreat=new DCont(this.dCont);




        this.setSob=function(s,p,p1){ 
            trace(s,p,p1)
            if(s=="List"){                
                this.activeGaleri=true;
                this.gallary.start(p);
                this.name= p1
                return
            }
           


            

        }




    }

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
        
 
        let hh=this._height//-30
        ss = (this._width) / this.image.picWidth;
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







