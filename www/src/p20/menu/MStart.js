import { MStyle} from './MStyle.js';
//import { DWStenColiz} from './Debag/DWStenColiz.js';

import { DebKR} from '../../p20/spSten/colozi/src/src/menu/DebKR.js';

export class MStart  {
    constructor(par, fun) {
    	this.type="MStart";
		var self=this;
		this.par=par
		this.fun=fun

		this.dCont=new DCont(par.dCont);	
		this.otstup=this.par.otstup
		this.wh=this.par.wh

		this.w=new DPanel(this.dCont, this.par.otstup, this.par.otstup);
    	this.w.height=par.wh+2*this.par.otstup;

		this.dCont1=new DCont(this.w);
    	self.input=undefined;
    	//SceneSB
    	this.menuScene=undefined;
    	
    	self.localStorage=this.par.localStorage
    	this.opentScane=function(){
    		bopent.visible=false
    		var oo=self.par.fun("returnHoneycomb");
			self.menuScene = new MenuScene(self.w.content, oo.visi3D, function(s,p){ trace(s,p)});
			self.menuScene.sceneSB.setObj(JSON.parse(oo.jsonCamera))
			self.menuScene.setObj();	
    	}


 


    	this.init1=function(){
    		var w=0
    		var b = new DButton(this.dCont1, w, this.par.otstup, "SP",function(){		       
    			self.par.mObject.setObject(self.par.p20.sp)
		    })
		    b.width=b.height=par.wh;
		    w+=par.wh+this.par.otstup

		    var b = new DButton(this.dCont1, w, this.par.otstup, "P20",function(){
		    	self.par.mObject.setObject(self.par.p20)
		    })
		    b.width=b.height=par.wh;
		    w+=par.wh+this.par.otstup

    		this.dCont1.width=w;
    	}
		this.init1();
    	
		this.openJSON=function(s){
			let o
			if(typeof s =='object')o=s
			else o=JSON.parse(s);

	        self.par.fun("setObjSP",o);
	        let r=self.par.par.p20.getRect(self.par.par.p20.index)
	       

	        if(r!=null){
	        	self.par.mGridDrag.setRect(r,this.par.otstup, true);
	        	
	        }
		}
		this.inputS
		this.visiId=function(s){
			if(this.inputS)this.inputS.text=s+""
		}
  		
    	this.init=function(){

	
		    var sahh=0


		    var b2 = new DButton(this.w, this.par.otstup+(par.wh+this.par.otstup)*sahh, this.par.otstup, "clear",function(){
		        trace(self.sp)
		        self.sp.clear()
		    })
		    b2.width=b2.height=par.wh;
		    sahh++

		    var b2 = new DButton(this.w, this.par.otstup+(par.wh+this.par.otstup)*sahh, this.par.otstup, "rect",function(){
		        let r=self.par.par.p20.getRect(self.par.par.p20.index)
		        self.par.mGridDrag.setRect(r,self.par.otstup, true);
		    })
		    b2.width=b2.height=par.wh;
		    sahh++

		    var b5 = new DButton(this.w, this.par.otstup+(par.wh+this.par.otstup)*sahh, this.par.otstup, "style",function(){
		      	self.sStyle.active=true;
		    })
		    b5.width=b5.height=par.wh;
		     sahh++

		    var b6 = new DButton(this.w, this.par.otstup+(par.wh+this.par.otstup)*sahh, this.par.otstup, "dev",function(){
		      	//self.sStyle.active=true;
		      	self.dev.active=!self.dev.active;
		      	
		      	//self.dev.active=true
		      	//self.dev.visible=true
		    })
		    b6.width=b6.height=par.wh;
		    sahh++

		    var b3 = new DButton(this.w, this.par.otstup+(par.wh+this.par.otstup)*sahh, this.par.otstup, "saveL",function(){
		        self.par.localStorage.object.model=self.par.mDragScane.p20.getObj();
		        self.par.localStorage.save();
		        b4.visible=true;
		    })
		    b3.width=par.wh;
		    b3.height=par.wh/2;		    

		    var b4 = new DButton(this.w, this.par.otstup+(par.wh+this.par.otstup)*sahh, this.par.otstup+par.wh/2, "clearL",function(){
		        self.par.localStorage.object.model=null;
		        self.par.localStorage.save();
		        b4.visible=false;
		    })
		    b4.width=par.wh;
		    b4.height=par.wh/2;
		    b4.visible=false;
		    sahh++


		    self.inputS=new DInput(this.w, this.par.otstup+(par.wh+this.par.otstup)*sahh, this.par.otstup,"20");
		    self.inputS.height=par.wh/2-2;
		    self.inputS.width=par.wh*2+this.par.otstup-3


		    var b7 = new DButton(this.w, this.par.otstup+(par.wh+this.par.otstup)*sahh, this.par.otstup+par.wh/2, "open",function(){
		      	self.fun("openId",self.inputS.text);
		    })
		    b7.width=par.wh;
		    b7.height=par.wh/2;
		    sahh++

		    var b8 = new DButton(this.w, this.par.otstup+(par.wh+this.par.otstup)*sahh, this.par.otstup+par.wh/2, "save",function(){
		      	trace("###########################################")
		      	self.fun("saveGetObjId");
		    })
		    b8.width=par.wh;
		    b8.height=par.wh/2;
		   	


			setTimeout(function() {
				if(self.par.localStorage.object.model==null){
					
				}else{
					self.openJSON(self.par.localStorage.object.model);
					b4.visible=true;				
				}
			},10);
	


		 

		    this.par.array[this.par.array.length]=this.sStyle = new MStyle(this, function(s,p){             
           		self.par.fun(s,p);
        	});

			setTimeout(function() {
				self.init3()

			}, 10);
		   	
	
    	}

    	this.init3=function(o){
			let script = document.createElement('script');
			// мы можем загрузить любой скрипт с любого домена
			script.src = "src/libMy/divLibPlus.js"
			document.head.append(script);

			script.onload = function() {
			  	// в скрипте создаётся вспомогательная функция с именем "_"
			  	self.dev=new DCompDev(self.dCont, 64, 80,"DevWindow",function(){})
			  	//self.dev1=new DWStenColiz(self.dev.dCont);
			  	self.dev1=new DebKR(self.dev.dCont);

			  	self.dev.addCont(self.dev1, self.dev1.dCont,"DWS",undefined,undefined)
				self.dev.active=false;	
				
				//////////////////////////////
				self.dev1.setKR(self.p20.korektRect)
				self.p20.korektRect.funRender=self.dev1.drag;			
				setTimeout(function() {
					self.dev.active=true;	
					self.dev.index=2	
				}, 1000);/**/
				/////////////////


			};
		}

		self.dev=undefined
		this.p20=undefined
		this.setP20=function(p20){
			this.p20=p20;		
		}

		this.sp=undefined
		this.setSP=function(sp){
			this.sp=sp			
		}
		
		
    	this.setObj=function(o){
	    	if(self.textArea==undefined)return   	
	    	let s=JSON.stringify(o);
	    	
	    	if(self.check.value==true){
	    		s=JSON.stringify(o, null, '\t');
	    	}	    	
	        self.textArea.value=s;
            
        }

        this.startObj=undefined
	    this.setArrObj=function(o){
	    	this.startObj=o;	    	
         	if(self.textArea==undefined)return;  
        	let s=JSON.stringify(o);
        	self.textArea.value=s;
        	
        }



	    this.setObject=function(object){
	    	if(self.textArea==undefined)return
	    	this.object=self.par.fun("returnScane");
	    	self.input.value=self.object.startVisi;	    	
	    	if(self.input.value == "null"){
	    		bGetScane.text="<"
	    	}else{
	    		bGetScane.text="x"
	    	}
	    	self.par.fun("index",-1);
	    	rot.value=this.object.time;
	    }
    	

    	this.sizeWindow=function(w,h,s){    		
    		this.w.width=w/s-par.otstup*2;    		
    		this.dCont1.x =this.w.width-this.dCont1.width;    		
    	}



    	

    	function getURLParameters(paramName){
	        var sURL = window.document.URL.toString();
			var arrParams = sURL.split("/");  			    		
	        if (sURL.indexOf("?") > 0) {
				var arrParams = sURL.split("?");
	        	var arrURLParams = arrParams[1].split("&");
	       	 	var arrParamNames = new Array(arrURLParams.length);
	        	var arrParamValues = new Array(arrURLParams.length);
	            arrParams = sURL.split("?");
	            arrURLParams = arrParams[1].split("&");
	            arrParamNames = new Array(arrURLParams.length);
	            arrParamValues = new Array(arrURLParams.length);
	            var i = 0;
	            for (i = 0; i < arrURLParams.length; i++) {

	                var sParam =  arrURLParams[i].split("=");
	                arrParamNames[i] = sParam[0];
	                if (sParam[1] != "")
	                    arrParamValues[i] = unescape(sParam[1]);
	                else
	                    arrParamValues[i] = null;
	            }
	            for (i=0; i<arrURLParams.length; i++) {
	                if (arrParamNames[i] == paramName) {
	                    return arrParamValues[i];
	                }
	            }
	            return null;
	        }
	    }

	    var infoDlaVorodis2=getURLParameters("infoDlaVorodis2");

	    if(infoDlaVorodis2!=null){
	    	let l =new DLabel(this.w, 500,20,"infoDlaVorodis2=  "+infoDlaVorodis2)
	    	l.fontSize=32
	    }




	    if(self.localStorage.object.debug&& self.localStorage.object.debug==true){	    	
	    	this.init();
	    }
    }
}
