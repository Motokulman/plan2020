
export class MenuV3D  {
    constructor(par, fun) {
    	this.type="MenuV3D";
		var self=this;
		this.par=par
		this.fun=fun
		this._activeSah = 0;

        this.otstup=this.par.otstup
        this.wh=this.par.wh

        this.whMin=200


		this.dCont=new DCont(par.dCont);


 




        this.panel
		this.init=function(){
            if(this.panel!=undefined)return;                   
            this.button=new DButton(this.dCont,this.otstup*2,0,"",function(){
                self.activeSah = 1
            },"resources/image/not3d.png")
            this.button.width=this.button.height=this.wh

            this.panel=new DPanel(this.dCont);
            this.panel.visible=false

            this.button1=new DButton(this.panel,0,this.otstup,"",function(){
                self.activeSah = 2

            },"resources/image/not3d.png")
            this.button1.width=this.button1.height=this.wh

            this.button2=new DButton(this.panel,0,this.otstup,"",function(){
                self.activeSah = self.activeSah-1;
            },"resources/image/not3d2.png")
            this.button2.width=this.button2.height=this.wh


                     
        }

        this.visi3D
        this.setVisi3D= function(visi3D){ 
            this.visi3D=visi3D;
          
            this.visi3D.contentHTML.style.position = 'fixed';
            this.visi3D.contentHTML.style.top = '0px';
            this.visi3D.contentHTML.style.left = '0px';
            this.panel.content.div.appendChild(this.visi3D.contentHTML);

            this.sizeWindow();
            self.activeSah = 1;
      
        }

       
        


        var w,h,s
        this.sizeWindow = function(_w,_h,_s){  
            if(_w!=undefined){
                w=_w
                h=_h
                s=_s
            }         
            this.button.y=h/s-this.otstup *3- this.wh/2-this.wh;

            if(this._activeSah==1){
                this.panel.x=this.otstup * 2;
                this.panel.y=h/s-this.otstup *3- this.wh/2-this.whMin;
                
                var b=false;
                if(this.panel.width!=this.whMin)b=true
                if(this.panel.height!=this.whMin)b=true    
                this.panel.width=this.whMin
                this.panel.height=this.whMin

                this.button1.x=this.panel.width-this.wh-this.otstup
                this.button2.x=this.panel.width-this.wh*2-this.otstup*2
        

                if(this.visi3D&&b==true)this.visi3D.sizeWindow(0,0,this.panel.width,this.panel.height);
            }
            if(this._activeSah==2){
                this.panel.x=this.otstup;
                this.panel.y=this.otstup*4+this.wh;
                this.panel.height=h/s-this.panel.y-this.otstup
                this.panel.width=w/s-this.otstup*2

                this.button2.x=this.panel.width-this.wh-this.otstup
                if(this.visi3D)this.visi3D.sizeWindow(0,0,this.panel.width,this.panel.height);
            }

            
        }

        this.init();    
    }

    set activeSah(value) {
        if(this._activeSah!=value){
            this._activeSah= value;          
            this.button.visible=value==0?true:false;

            this.panel.visible=value!=0?true:false;

            this.button1.visible=value==1?true:false;


            this.sizeWindow()


        }
    }    
    get activeSah() { return  this._activeSah;}
}
