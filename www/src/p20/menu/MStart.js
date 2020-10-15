
export class MStart  {
    constructor(par, idArr) {
    	this.type="MStart";
		var self=this;
		this.par=par
		this.idArr=idArr

		this.dCont=new DCont(par.dCont);	
		

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
		this.init1()





    	

  		
    	this.init=function(){
		    var b = new DButton(this.w, 204, this.par.otstup, "set",function(){
		        let o=JSON.parse(self.textArea.value);
		        self.par.fun("setObjSP",o);

		    })
		    b.width=b.height=par.wh;

		    var b1 = new DButton(this.w, 204+par.wh+this.par.otstup, this.par.otstup, "get",function(){
		     
		        var oo=self.par.mDragScane.p20.getObj()
		        
		        self.textArea.value=JSON.stringify(oo)
		    })
		    b1.width=b1.height=par.wh;	

		    var b2 = new DButton(this.w, 204+(par.wh+this.par.otstup)*2, this.par.otstup, "rect",function(){
		        self.par.mDragScane.redrag();
		    })
		    b2.width=b2.height=par.wh;

		    var b3 = new DButton(this.w, 204+(par.wh+this.par.otstup)*3, this.par.otstup, "save",function(){
		        self.par.localStorage.object.model=self.par.mDragScane.p20.getObj();
		        self.par.localStorage.save();
		    })
		    b3.width=b3.height=par.wh;


		    let ss='{"type":"SpStageSten","tipPoint":"SpPointSten","tipSplice":"SpliceSten","arrPoint":[{"type":"SpPointSten","idArr":0,"position":{"x":-100,"y":800}},{"type":"SpPointSten","idArr":1,"position":{"x":1500,"y":600}},{"type":"SpPointSten","idArr":2,"position":{"x":2250,"y":-1350}},{"type":"SpPointSten","idArr":3,"position":{"x":3000,"y":0}},{"type":"SpPointSten","idArr":4,"position":{"x":-1575,"y":0}},{"type":"SpPointSten","idArr":5,"position":{"x":-1575,"y":4000}},{"type":"SpPointSten","idArr":6,"position":{"x":4625,"y":4000}},{"type":"SpPointSten","idArr":7,"position":{"x":4625,"y":0}},{"type":"SpPointSten","idArr":8,"position":{"x":-1575,"y":1850}},{"type":"SpPointSten","idArr":9,"position":{"x":4625,"y":1850}},{"type":"SpPointSten","idArr":10,"position":{"x":750,"y":4000}},{"type":"SpPointSten","idArr":11,"position":{"x":750,"y":5296}},{"type":"SpPointSten","idArr":12,"position":{"x":2250,"y":5296}},{"type":"SpPointSten","idArr":13,"position":{"x":2250,"y":4000}},{"type":"SpPointSten","idArr":14,"position":{"x":750,"y":6132}},{"type":"SpPointSten","idArr":15,"position":{"x":-1061,"y":6132}},{"type":"SpPointSten","idArr":16,"position":{"x":-1061,"y":4000}},{"type":"SpPointSten","idArr":17,"position":{"x":2250,"y":1850}}],"arrSplice":[{"type":"SpliceSten","idArr":0,"delph":500,"tip":0,"position":{"x":-100,"y":800},"position1":{"x":1500,"y":600},"connected":{"arr":["29C7B3F8-B0C6-41DA-9400-1F2836F068E9","86E2A5CD-5F6B-4D12-B5EF-C105FC83AEE9"],"arr1":["29C7B3F8-B0C6-41DA-9400-1F2836F068E9","C1CCA22D-9E11-427D-B080-F4289EF9D0D1"]},"uuid":"29C7B3F8-B0C6-41DA-9400-1F2836F068E9","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":1,"delph":500,"tip":0,"position":{"x":1500,"y":600},"position1":{"x":2250,"y":-1350},"connected":{"arr":["29C7B3F8-B0C6-41DA-9400-1F2836F068E9","C1CCA22D-9E11-427D-B080-F4289EF9D0D1"],"arr1":["C1CCA22D-9E11-427D-B080-F4289EF9D0D1","87684ED2-4CF4-49C2-A80C-DD041D075249"]},"uuid":"C1CCA22D-9E11-427D-B080-F4289EF9D0D1","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":2,"delph":500,"tip":0,"position":{"x":2250,"y":-1350},"position1":{"x":3000,"y":0},"connected":{"arr":["C1CCA22D-9E11-427D-B080-F4289EF9D0D1","87684ED2-4CF4-49C2-A80C-DD041D075249"],"arr1":["87684ED2-4CF4-49C2-A80C-DD041D075249","CA9984EA-D34F-450F-B952-8FF830E3656F"]},"uuid":"87684ED2-4CF4-49C2-A80C-DD041D075249","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":3,"delph":500,"tip":0,"position":{"x":-100,"y":800},"position1":{"x":-1575,"y":0},"connected":{"arr":["29C7B3F8-B0C6-41DA-9400-1F2836F068E9","86E2A5CD-5F6B-4D12-B5EF-C105FC83AEE9"],"arr1":["86E2A5CD-5F6B-4D12-B5EF-C105FC83AEE9","2062EF26-C109-4D81-8FD9-520F503B9826"]},"uuid":"86E2A5CD-5F6B-4D12-B5EF-C105FC83AEE9","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":4,"delph":500,"tip":0,"position":{"x":-1575,"y":0},"position1":{"x":-1575,"y":4000},"connected":{"arr":["86E2A5CD-5F6B-4D12-B5EF-C105FC83AEE9","2062EF26-C109-4D81-8FD9-520F503B9826"],"arr1":["2062EF26-C109-4D81-8FD9-520F503B9826","80B99746-E584-4664-9507-53C9D6683CC6"]},"uuid":"2062EF26-C109-4D81-8FD9-520F503B9826","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":5,"delph":500,"tip":0,"position":{"x":4625,"y":4000},"position1":{"x":4625,"y":0},"connected":{"arr":["0D3E941A-2495-4BBD-8216-24A673E1D3A2","5D328221-9036-4B66-8DFF-BFE03726689D"],"arr1":["0D3E941A-2495-4BBD-8216-24A673E1D3A2","CA9984EA-D34F-450F-B952-8FF830E3656F"]},"uuid":"0D3E941A-2495-4BBD-8216-24A673E1D3A2","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":6,"delph":500,"tip":0,"position":{"x":4625,"y":0},"position1":{"x":3000,"y":0},"connected":{"arr":["0D3E941A-2495-4BBD-8216-24A673E1D3A2","CA9984EA-D34F-450F-B952-8FF830E3656F"],"arr1":["87684ED2-4CF4-49C2-A80C-DD041D075249","CA9984EA-D34F-450F-B952-8FF830E3656F"]},"uuid":"CA9984EA-D34F-450F-B952-8FF830E3656F","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":7,"delph":400,"tip":0,"position":{"x":-1575,"y":1850},"position1":{"x":4625,"y":1850},"connected":{"arr":["D2C6559D-35F3-469D-9A24-D70D3F1D3030"],"arr1":["D2C6559D-35F3-469D-9A24-D70D3F1D3030"]},"uuid":"D2C6559D-35F3-469D-9A24-D70D3F1D3030","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":8,"delph":500,"tip":0,"position":{"x":-1575,"y":4000},"position1":{"x":750,"y":4000},"connected":{"arr":["2062EF26-C109-4D81-8FD9-520F503B9826","80B99746-E584-4664-9507-53C9D6683CC6"],"arr1":["80B99746-E584-4664-9507-53C9D6683CC6","6E8C96AB-C10A-48CB-B028-4E587204DBAA","45FAC236-686F-4D3C-8181-78EAE76BA925","1C82AD8A-F7DB-40F6-8699-F49FFA91BD94"]},"uuid":"80B99746-E584-4664-9507-53C9D6683CC6","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":9,"delph":500,"tip":0,"position":{"x":750,"y":5296},"position1":{"x":2250,"y":5296},"connected":{"arr":["FC15324F-1C5A-4BC3-845B-E80E8192328C","6E8C96AB-C10A-48CB-B028-4E587204DBAA"],"arr1":["FC15324F-1C5A-4BC3-845B-E80E8192328C","A620A75A-B3E4-4E8A-B0C1-9D08D74F3169"]},"uuid":"FC15324F-1C5A-4BC3-845B-E80E8192328C","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":10,"delph":500,"tip":0,"position":{"x":2250,"y":5296},"position1":{"x":2250,"y":4000},"connected":{"arr":["FC15324F-1C5A-4BC3-845B-E80E8192328C","A620A75A-B3E4-4E8A-B0C1-9D08D74F3169"],"arr1":["A620A75A-B3E4-4E8A-B0C1-9D08D74F3169","5D328221-9036-4B66-8DFF-BFE03726689D","AF46CC10-1FB7-4C4C-84C9-96FE032FC433"]},"uuid":"A620A75A-B3E4-4E8A-B0C1-9D08D74F3169","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":11,"delph":500,"tip":0,"position":{"x":2250,"y":4000},"position1":{"x":4625,"y":4000},"connected":{"arr":["A620A75A-B3E4-4E8A-B0C1-9D08D74F3169","5D328221-9036-4B66-8DFF-BFE03726689D","AF46CC10-1FB7-4C4C-84C9-96FE032FC433"],"arr1":["0D3E941A-2495-4BBD-8216-24A673E1D3A2","5D328221-9036-4B66-8DFF-BFE03726689D"]},"uuid":"5D328221-9036-4B66-8DFF-BFE03726689D","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":12,"delph":500,"tip":0,"position":{"x":750,"y":4000},"position1":{"x":750,"y":5296},"connected":{"arr":["80B99746-E584-4664-9507-53C9D6683CC6","6E8C96AB-C10A-48CB-B028-4E587204DBAA","45FAC236-686F-4D3C-8181-78EAE76BA925","1C82AD8A-F7DB-40F6-8699-F49FFA91BD94"],"arr1":["FC15324F-1C5A-4BC3-845B-E80E8192328C","6E8C96AB-C10A-48CB-B028-4E587204DBAA"]},"uuid":"6E8C96AB-C10A-48CB-B028-4E587204DBAA","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":13,"delph":400,"tip":0,"position":{"x":750,"y":4000},"position1":{"x":750,"y":6132},"connected":{"arr":["80B99746-E584-4664-9507-53C9D6683CC6","6E8C96AB-C10A-48CB-B028-4E587204DBAA","45FAC236-686F-4D3C-8181-78EAE76BA925","1C82AD8A-F7DB-40F6-8699-F49FFA91BD94"],"arr1":["45FAC236-686F-4D3C-8181-78EAE76BA925","7D012FAE-E0E4-4511-958E-E7B449058801"]},"uuid":"45FAC236-686F-4D3C-8181-78EAE76BA925","height":300,"sUi":13,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":14,"delph":400,"tip":0,"position":{"x":750,"y":6132},"position1":{"x":-1061,"y":6132},"connected":{"arr":["45FAC236-686F-4D3C-8181-78EAE76BA925","7D012FAE-E0E4-4511-958E-E7B449058801"],"arr1":["7D012FAE-E0E4-4511-958E-E7B449058801","2C22BF49-BD03-4A42-BB22-8D16E3756AA6"]},"uuid":"7D012FAE-E0E4-4511-958E-E7B449058801","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":15,"delph":400,"tip":0,"position":{"x":-1061,"y":6132},"position1":{"x":-1061,"y":4000},"connected":{"arr":["7D012FAE-E0E4-4511-958E-E7B449058801","2C22BF49-BD03-4A42-BB22-8D16E3756AA6"],"arr1":["2C22BF49-BD03-4A42-BB22-8D16E3756AA6","1C82AD8A-F7DB-40F6-8699-F49FFA91BD94"]},"uuid":"2C22BF49-BD03-4A42-BB22-8D16E3756AA6","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":16,"delph":400,"tip":0,"position":{"x":-1061,"y":4000},"position1":{"x":750,"y":4000},"connected":{"arr":["2C22BF49-BD03-4A42-BB22-8D16E3756AA6","1C82AD8A-F7DB-40F6-8699-F49FFA91BD94"],"arr1":["80B99746-E584-4664-9507-53C9D6683CC6","6E8C96AB-C10A-48CB-B028-4E587204DBAA","45FAC236-686F-4D3C-8181-78EAE76BA925","1C82AD8A-F7DB-40F6-8699-F49FFA91BD94"]},"uuid":"1C82AD8A-F7DB-40F6-8699-F49FFA91BD94","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":17,"delph":100,"tip":0,"position":{"x":2250,"y":4000},"position1":{"x":2250,"y":1850},"connected":{"arr":["A620A75A-B3E4-4E8A-B0C1-9D08D74F3169","5D328221-9036-4B66-8DFF-BFE03726689D","AF46CC10-1FB7-4C4C-84C9-96FE032FC433"],"arr1":["AF46CC10-1FB7-4C4C-84C9-96FE032FC433"]},"uuid":"AF46CC10-1FB7-4C4C-84C9-96FE032FC433","height":300,"sUi":11,"offset":0,"bChaz":true}],"arrPol":[],"color":"#47aec8","alpha":1,"lineWord":{"array":[{"position":{"x":-3020,"y":1330},"position1":{"x":-4710,"y":4140},"otstup":500},{"position":{"x":-2910,"y":3210},"position1":{"x":-3100,"y":4690},"otstup":500},{"position":{"x":-1325,"y":1650.0000000000007},"position1":{"x":-1830,"y":4260},"otstup":500},{"position":{"x":1507.7319587628865,"y":579.8969072164946},"position1":{"x":4625,"y":1800},"otstup":500},{"position":{"x":4625,"y":3950},"position1":{"x":2250,"y":3960},"otstup":500},{"position":{"x":2000,"y":4010},"position1":{"x":740,"y":3750},"otstup":500},{"position":{"x":6340,"y":3600},"position1":{"x":4875,"y":4250},"otstup":500}]}}'



		    this.textArea=new DTextArea(this.w, this.par.otstup, this.par.otstup, ss,function(){
		        
		    });
		    this.textArea.width=200-this.par.otstup*2;
		    this.textArea.fontSize=8;
		    this.textArea.height=par.wh;

		    
		    if(this.startObj!=undefined){
		    	trace(this.startObj)
		    }

		    setTimeout(function() {
	    		if(self.par.localStorage.object.model){	    			
		        	self.par.fun("setObj",self.par.localStorage.object.model);
		        	self.par.mDragScane.redrag();
	    		}
	    	}, 100);

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
    		//trace(w,h,s,par.otstup)
    		this.w.width=w/s-par.otstup*2;    		
    		this.dCont1.x =this.w.width-this.dCont1.width
    		
    	}




	    if(self.localStorage.object.debug&& self.localStorage.object.debug==true){	    	
	    	this.init();
	    }
    }
}
