import { MStyle} from './MStyle.js';


export class MStart  {
    constructor(par, idArr) {
    	this.type="MStart";
		var self=this;
		this.par=par
		this.idArr=idArr

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
  		
    	this.init=function(){

    		


		    var b = new DButton(this.w, 204, this.par.otstup, "set",function(){
		        self.openJSON(self.textArea.value)
		    })
		    b.width=b.height=par.wh;

		    var b1 = new DButton(this.w, 204+par.wh+this.par.otstup, this.par.otstup, "get",function(){
		     
		        var oo=self.par.mDragScane.p20.getObj()
		        
		        self.textArea.value=JSON.stringify(oo)
		    })
		    b1.width=b1.height=par.wh;	

		    var b2 = new DButton(this.w, 204+(par.wh+this.par.otstup)*2, this.par.otstup, "rect",function(){
		        let r=self.par.par.p20.getRect(self.par.par.p20.index)
		        self.par.mGridDrag.setRect(r,self.par.otstup, true);
		    })
		    b2.width=b2.height=par.wh;

		    var b3 = new DButton(this.w, 204+(par.wh+this.par.otstup)*3, this.par.otstup, "save",function(){
		        self.par.localStorage.object.model=self.par.mDragScane.p20.getObj();
		        self.par.localStorage.save();
		    })
		    b3.width=par.wh;
		    b3.height=par.wh/2;		    

		    var b4 = new DButton(this.w, 204+(par.wh+this.par.otstup)*3, this.par.otstup+par.wh/2, "clear",function(){
		        self.par.localStorage.object.model=null;
		        self.par.localStorage.save();
		    })
		    b4.width=par.wh;
		    b4.height=par.wh/2;

		    var b5 = new DButton(this.w, 204+(par.wh+this.par.otstup)*4, this.par.otstup, "style",function(){
		      	self.sStyle.active=true;
		    })
		    b5.width=b5.height=par.wh;

		    var b6 = new DButton(this.w, 204+(par.wh+this.par.otstup)*5, this.par.otstup, "dev",function(){
		      	//self.sStyle.active=true;
		      	self.dev.active=!self.dev.active
		      	b6.x = 100
		      	//self.dev.active=true
		      	//self.dev.visible=true
		    })
		    b6.width=b6.height=par.wh;





		    var ss='{"type":"SpStageSten","tipPoint":"SpPointSten","tipSplice":"SpliceSten","arrPoint":[{"type":"SpPointSten","idArr":0,"position":{"x":-100,"y":800}},{"type":"SpPointSten","idArr":1,"position":{"x":1500,"y":600}},{"type":"SpPointSten","idArr":2,"position":{"x":2250,"y":-1350}},{"type":"SpPointSten","idArr":3,"position":{"x":3000,"y":0}},{"type":"SpPointSten","idArr":4,"position":{"x":-1575,"y":0}},{"type":"SpPointSten","idArr":5,"position":{"x":-1575,"y":4000}},{"type":"SpPointSten","idArr":6,"position":{"x":4625,"y":4000}},{"type":"SpPointSten","idArr":7,"position":{"x":4625,"y":0}},{"type":"SpPointSten","idArr":8,"position":{"x":-1575,"y":1850}},{"type":"SpPointSten","idArr":9,"position":{"x":4625,"y":1850}},{"type":"SpPointSten","idArr":10,"position":{"x":750,"y":4000}},{"type":"SpPointSten","idArr":11,"position":{"x":750,"y":5296}},{"type":"SpPointSten","idArr":12,"position":{"x":2250,"y":5296}},{"type":"SpPointSten","idArr":13,"position":{"x":2250,"y":4000}},{"type":"SpPointSten","idArr":14,"position":{"x":750,"y":6132}},{"type":"SpPointSten","idArr":15,"position":{"x":-1061,"y":6132}},{"type":"SpPointSten","idArr":16,"position":{"x":-1061,"y":4000}},{"type":"SpPointSten","idArr":17,"position":{"x":2250,"y":1850}}],"arrSplice":[{"type":"SpliceSten","idArr":0,"delph":500,"tip":0,"position":{"x":-100,"y":800},"position1":{"x":1500,"y":600},"connected":{"arr":["29C7B3F8-B0C6-41DA-9400-1F2836F068E9","86E2A5CD-5F6B-4D12-B5EF-C105FC83AEE9"],"arr1":["29C7B3F8-B0C6-41DA-9400-1F2836F068E9","C1CCA22D-9E11-427D-B080-F4289EF9D0D1"]},"uuid":"29C7B3F8-B0C6-41DA-9400-1F2836F068E9","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":1,"delph":500,"tip":0,"position":{"x":1500,"y":600},"position1":{"x":2250,"y":-1350},"connected":{"arr":["29C7B3F8-B0C6-41DA-9400-1F2836F068E9","C1CCA22D-9E11-427D-B080-F4289EF9D0D1"],"arr1":["C1CCA22D-9E11-427D-B080-F4289EF9D0D1","87684ED2-4CF4-49C2-A80C-DD041D075249"]},"uuid":"C1CCA22D-9E11-427D-B080-F4289EF9D0D1","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":2,"delph":500,"tip":0,"position":{"x":2250,"y":-1350},"position1":{"x":3000,"y":0},"connected":{"arr":["C1CCA22D-9E11-427D-B080-F4289EF9D0D1","87684ED2-4CF4-49C2-A80C-DD041D075249"],"arr1":["87684ED2-4CF4-49C2-A80C-DD041D075249","CA9984EA-D34F-450F-B952-8FF830E3656F"]},"uuid":"87684ED2-4CF4-49C2-A80C-DD041D075249","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":3,"delph":500,"tip":0,"position":{"x":-100,"y":800},"position1":{"x":-1575,"y":0},"connected":{"arr":["29C7B3F8-B0C6-41DA-9400-1F2836F068E9","86E2A5CD-5F6B-4D12-B5EF-C105FC83AEE9"],"arr1":["86E2A5CD-5F6B-4D12-B5EF-C105FC83AEE9","2062EF26-C109-4D81-8FD9-520F503B9826"]},"uuid":"86E2A5CD-5F6B-4D12-B5EF-C105FC83AEE9","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":4,"delph":500,"tip":0,"position":{"x":-1575,"y":0},"position1":{"x":-1575,"y":4000},"connected":{"arr":["86E2A5CD-5F6B-4D12-B5EF-C105FC83AEE9","2062EF26-C109-4D81-8FD9-520F503B9826"],"arr1":["2062EF26-C109-4D81-8FD9-520F503B9826","80B99746-E584-4664-9507-53C9D6683CC6"]},"uuid":"2062EF26-C109-4D81-8FD9-520F503B9826","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":5,"delph":500,"tip":0,"position":{"x":4625,"y":4000},"position1":{"x":4625,"y":0},"connected":{"arr":["0D3E941A-2495-4BBD-8216-24A673E1D3A2","5D328221-9036-4B66-8DFF-BFE03726689D"],"arr1":["0D3E941A-2495-4BBD-8216-24A673E1D3A2","CA9984EA-D34F-450F-B952-8FF830E3656F"]},"uuid":"0D3E941A-2495-4BBD-8216-24A673E1D3A2","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":6,"delph":500,"tip":0,"position":{"x":4625,"y":0},"position1":{"x":3000,"y":0},"connected":{"arr":["0D3E941A-2495-4BBD-8216-24A673E1D3A2","CA9984EA-D34F-450F-B952-8FF830E3656F"],"arr1":["87684ED2-4CF4-49C2-A80C-DD041D075249","CA9984EA-D34F-450F-B952-8FF830E3656F"]},"uuid":"CA9984EA-D34F-450F-B952-8FF830E3656F","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":7,"delph":400,"tip":0,"position":{"x":-1575,"y":1850},"position1":{"x":4625,"y":1850},"connected":{"arr":["D2C6559D-35F3-469D-9A24-D70D3F1D3030"],"arr1":["D2C6559D-35F3-469D-9A24-D70D3F1D3030"]},"uuid":"D2C6559D-35F3-469D-9A24-D70D3F1D3030","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":8,"delph":500,"tip":0,"position":{"x":-1575,"y":4000},"position1":{"x":750,"y":4000},"connected":{"arr":["2062EF26-C109-4D81-8FD9-520F503B9826","80B99746-E584-4664-9507-53C9D6683CC6"],"arr1":["80B99746-E584-4664-9507-53C9D6683CC6","6E8C96AB-C10A-48CB-B028-4E587204DBAA","45FAC236-686F-4D3C-8181-78EAE76BA925","1C82AD8A-F7DB-40F6-8699-F49FFA91BD94"]},"uuid":"80B99746-E584-4664-9507-53C9D6683CC6","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":9,"delph":500,"tip":0,"position":{"x":750,"y":5296},"position1":{"x":2250,"y":5296},"connected":{"arr":["FC15324F-1C5A-4BC3-845B-E80E8192328C","6E8C96AB-C10A-48CB-B028-4E587204DBAA"],"arr1":["FC15324F-1C5A-4BC3-845B-E80E8192328C","A620A75A-B3E4-4E8A-B0C1-9D08D74F3169"]},"uuid":"FC15324F-1C5A-4BC3-845B-E80E8192328C","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":10,"delph":500,"tip":0,"position":{"x":2250,"y":5296},"position1":{"x":2250,"y":4000},"connected":{"arr":["FC15324F-1C5A-4BC3-845B-E80E8192328C","A620A75A-B3E4-4E8A-B0C1-9D08D74F3169"],"arr1":["A620A75A-B3E4-4E8A-B0C1-9D08D74F3169","5D328221-9036-4B66-8DFF-BFE03726689D","AF46CC10-1FB7-4C4C-84C9-96FE032FC433"]},"uuid":"A620A75A-B3E4-4E8A-B0C1-9D08D74F3169","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":11,"delph":500,"tip":0,"position":{"x":2250,"y":4000},"position1":{"x":4625,"y":4000},"connected":{"arr":["A620A75A-B3E4-4E8A-B0C1-9D08D74F3169","5D328221-9036-4B66-8DFF-BFE03726689D","AF46CC10-1FB7-4C4C-84C9-96FE032FC433"],"arr1":["0D3E941A-2495-4BBD-8216-24A673E1D3A2","5D328221-9036-4B66-8DFF-BFE03726689D"]},"uuid":"5D328221-9036-4B66-8DFF-BFE03726689D","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":12,"delph":500,"tip":0,"position":{"x":750,"y":4000},"position1":{"x":750,"y":5296},"connected":{"arr":["80B99746-E584-4664-9507-53C9D6683CC6","6E8C96AB-C10A-48CB-B028-4E587204DBAA","45FAC236-686F-4D3C-8181-78EAE76BA925","1C82AD8A-F7DB-40F6-8699-F49FFA91BD94"],"arr1":["FC15324F-1C5A-4BC3-845B-E80E8192328C","6E8C96AB-C10A-48CB-B028-4E587204DBAA"]},"uuid":"6E8C96AB-C10A-48CB-B028-4E587204DBAA","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":13,"delph":400,"tip":0,"position":{"x":750,"y":4000},"position1":{"x":750,"y":6132},"connected":{"arr":["80B99746-E584-4664-9507-53C9D6683CC6","6E8C96AB-C10A-48CB-B028-4E587204DBAA","45FAC236-686F-4D3C-8181-78EAE76BA925","1C82AD8A-F7DB-40F6-8699-F49FFA91BD94"],"arr1":["45FAC236-686F-4D3C-8181-78EAE76BA925","7D012FAE-E0E4-4511-958E-E7B449058801"]},"uuid":"45FAC236-686F-4D3C-8181-78EAE76BA925","height":300,"sUi":13,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":14,"delph":400,"tip":0,"position":{"x":750,"y":6132},"position1":{"x":-1061,"y":6132},"connected":{"arr":["45FAC236-686F-4D3C-8181-78EAE76BA925","7D012FAE-E0E4-4511-958E-E7B449058801"],"arr1":["7D012FAE-E0E4-4511-958E-E7B449058801","2C22BF49-BD03-4A42-BB22-8D16E3756AA6"]},"uuid":"7D012FAE-E0E4-4511-958E-E7B449058801","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":15,"delph":400,"tip":0,"position":{"x":-1061,"y":6132},"position1":{"x":-1061,"y":4000},"connected":{"arr":["7D012FAE-E0E4-4511-958E-E7B449058801","2C22BF49-BD03-4A42-BB22-8D16E3756AA6"],"arr1":["2C22BF49-BD03-4A42-BB22-8D16E3756AA6","1C82AD8A-F7DB-40F6-8699-F49FFA91BD94"]},"uuid":"2C22BF49-BD03-4A42-BB22-8D16E3756AA6","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":16,"delph":400,"tip":0,"position":{"x":-1061,"y":4000},"position1":{"x":750,"y":4000},"connected":{"arr":["2C22BF49-BD03-4A42-BB22-8D16E3756AA6","1C82AD8A-F7DB-40F6-8699-F49FFA91BD94"],"arr1":["80B99746-E584-4664-9507-53C9D6683CC6","6E8C96AB-C10A-48CB-B028-4E587204DBAA","45FAC236-686F-4D3C-8181-78EAE76BA925","1C82AD8A-F7DB-40F6-8699-F49FFA91BD94"]},"uuid":"1C82AD8A-F7DB-40F6-8699-F49FFA91BD94","height":300,"sUi":-1,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":17,"delph":100,"tip":0,"position":{"x":2250,"y":4000},"position1":{"x":2250,"y":1850},"connected":{"arr":["A620A75A-B3E4-4E8A-B0C1-9D08D74F3169","5D328221-9036-4B66-8DFF-BFE03726689D","AF46CC10-1FB7-4C4C-84C9-96FE032FC433"],"arr1":["AF46CC10-1FB7-4C4C-84C9-96FE032FC433"]},"uuid":"AF46CC10-1FB7-4C4C-84C9-96FE032FC433","height":300,"sUi":11,"offset":0,"bChaz":true}],"arrPol":[],"color":"#47aec8","alpha":1,"lineWord":{"array":[{"position":{"x":-3020,"y":1330},"position1":{"x":-4710,"y":4140},"otstup":500},{"position":{"x":-2910,"y":3210},"position1":{"x":-3100,"y":4690},"otstup":500},{"position":{"x":-1325,"y":1650.0000000000007},"position1":{"x":-1830,"y":4260},"otstup":500},{"position":{"x":1507.7319587628865,"y":579.8969072164946},"position1":{"x":4625,"y":1800},"otstup":500},{"position":{"x":4625,"y":3950},"position1":{"x":2250,"y":3960},"otstup":500},{"position":{"x":2000,"y":4010},"position1":{"x":740,"y":3750},"otstup":500},{"position":{"x":6340,"y":3600},"position1":{"x":4875,"y":4250},"otstup":500}]}}'
			var ss='{"type":"SpStageSten","tipPoint":"SpPointSten","tipSplice":"SpliceSten","arrPoint":[{"type":"SpPointSten","idArr":0,"position":{"x":-13400,"y":4200,"z":0}},{"type":"SpPointSten","idArr":2,"position":{"x":4500,"y":-400,"z":0}},{"type":"SpPointSten","idArr":3,"position":{"x":4500,"y":1800,"z":0}},{"type":"SpPointSten","idArr":4,"position":{"x":4500,"y":-2200,"z":0}},{"type":"SpPointSten","idArr":5,"position":{"x":-1900,"y":-2200,"z":0}},{"type":"SpPointSten","idArr":6,"position":{"x":-7900,"y":-3900,"z":0}},{"type":"SpPointSten","idArr":7,"position":{"x":-7800,"y":4100,"z":0}}],"arrSplice":[{"type":"SpliceSten","idArr":0,"delph":500,"tip":0,"position":{"x":-13400,"y":4200,"z":0},"position1":{"x":-7900,"y":-3900,"z":0},"connected":{"arr":["b2192393-da17fdcd"],"arr1":["e752dd0Z-5a335610","10d4b9a9-ff3f244a","b2192393-da17fdcd"]},"uuid":"b2192393-da17fdcd","windows":{"array":[{"id":1,"x":3333.4213577656983,"y":0,"z":0,"w":3000,"h":200,"d":500},{"id":0,"x":9261.427149049861,"y":0,"z":0,"w":2000,"h":200,"d":500}]},"height":300,"sUi":-1,"idUi":700,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":1,"delph":500,"tip":0,"position":{"x":4500,"y":-400,"z":0},"position1":{"x":4500,"y":1800,"z":0},"connected":{"arr":["7ea1de44-da223771","68c485de-9827ee83"],"arr1":["7ea1de44-da223771"]},"uuid":"7ea1de44-da223771","windows":{"array":[]},"height":300,"sUi":-1,"idUi":345,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":2,"delph":159,"tip":0,"position":{"x":4500,"y":-2200,"z":0},"position1":{"x":4500,"y":-400,"z":0},"connected":{"arr":["68c485de-9827ee83"],"arr1":["7ea1de44-da223771","68c485de-9827ee83"]},"uuid":"68c485de-9827ee83","windows":{"array":[]},"height":300,"sUi":"7ea1de44-da223771","idUi":567,"offset":-170.5,"bChaz":false},{"type":"SpliceSten","idArr":3,"delph":355,"tip":0,"position":{"x":-1900,"y":-2200,"z":0},"position1":{"x":-7900,"y":-3900,"z":0},"connected":{"arr":["e752dd0Z-5a335610"],"arr1":["e752dd0Z-5a335610","10d4b9a9-ff3f244a","b2192393-da17fdcd"]},"uuid":"e752dd0Z-5a335610","windows":{"array":[]},"height":300,"sUi":-1,"idUi":426,"offset":0,"bChaz":false},{"type":"SpliceSten","idArr":4,"delph":500,"tip":0,"position":{"x":-7900,"y":-3900,"z":0},"position1":{"x":-7800,"y":4100,"z":0},"connected":{"arr":["e752dd0Z-5a335610","10d4b9a9-ff3f244a","b2192393-da17fdcd"],"arr1":["10d4b9a9-ff3f244a"]},"uuid":"10d4b9a9-ff3f244a","windows":{"array":[{"id":2,"x":6102.861649052241,"y":0,"z":0,"w":2000,"h":200,"d":500},{"id":0,"x":5328.481047529021,"y":0,"z":0,"w":2000,"h":200,"d":500}]},"height":300,"sUi":-1,"idUi":889,"offset":0,"bChaz":false}],"arrPol":[],"color":"#c5d6e0","alpha":1,"lineWord":{"array":[]},"worldBlok":{"array":[]}}'
			var ss='{"type":"SpStageSten","tipPoint":"SpPointSten","tipSplice":"SpliceSten","arrPoint":[{"type":"SpPointSten","idArr":0,"position":{"x":-15900,"y":-4200,"z":0}},{"type":"SpPointSten","idArr":1,"position":{"x":-11200,"y":-4200,"z":0}},{"type":"SpPointSten","idArr":2,"position":{"x":-8900,"y":-4200,"z":0}},{"type":"SpPointSten","idArr":3,"position":{"x":-8900,"y":200,"z":0}},{"type":"SpPointSten","idArr":4,"position":{"x":-15900,"y":6000,"z":0}},{"type":"SpPointSten","idArr":5,"position":{"x":-8900,"y":6000,"z":0}},{"type":"SpPointSten","idArr":6,"position":{"x":-15900,"y":-2400,"z":0}},{"type":"SpPointSten","idArr":7,"position":{"x":-1300,"y":-4200,"z":0}},{"type":"SpPointSten","idArr":8,"position":{"x":-1300,"y":200,"z":0}},{"type":"SpPointSten","idArr":9,"position":{"x":-1300,"y":6000,"z":0}},{"type":"SpPointSten","idArr":10,"position":{"x":5100,"y":6000,"z":0}},{"type":"SpPointSten","idArr":11,"position":{"x":5100,"y":-4200,"z":0}},{"type":"SpPointSten","idArr":12,"position":{"x":394.0650141615288,"y":-4200,"z":0}},{"type":"SpPointSten","idArr":13,"position":{"x":394.0650141615288,"y":-7200,"z":0}},{"type":"SpPointSten","idArr":14,"position":{"x":-11200,"y":-7200,"z":0}},{"type":"SpPointSten","idArr":15,"position":{"x":-19300,"y":-4200,"z":0}},{"type":"SpPointSten","idArr":16,"position":{"x":-19300,"y":-2400,"z":0}},{"type":"SpPointSten","idArr":17,"position":{"x":5100,"y":-6500,"z":0}},{"type":"SpPointSten","idArr":18,"position":{"x":1612.0929875367883,"y":-5528.048492806976,"z":0}}],"arrSplice":[{"type":"SpliceSten","idArr":0,"delph":600,"tip":0,"position":{"x":-15900,"y":-4200,"z":0},"position1":{"x":-11200,"y":-4200,"z":0},"connected":{"arr":["b2192393-da17fdcd","34c8fa3Z-5ad737bZ","2a3d4c36-27b44bbd"],"arr1":["b2192393-da17fdcd","6adea118-d22db22e","98912f3Z-2fb0671a"]},"uuid":"b2192393-da17fdcd","windows":{"array":[{"id":1,"x":2250.169707145785,"y":0,"z":0,"w":3000,"h":200,"d":600}]},"height":300,"sUi":-1,"idUi":700,"offset":0,"bChaz":false,"carrier":true,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":1,"delph":200,"tip":0,"position":{"x":-8900,"y":-4200,"z":0},"position1":{"x":-8900,"y":200,"z":0},"connected":{"arr":["c03f95cZ-fb185be1","ba7985ZZ-50821c4b","98912f3Z-2fb0671a"],"arr1":["c03f95cZ-fb185be1","39397493-11a476bZ","27d4c4aZ-8ea0542e"]},"uuid":"c03f95cZ-fb185be1","windows":{"array":[{"id":0,"x":1728.3439714466615,"y":0,"z":0,"w":2000,"h":200,"d":200}]},"height":300,"sUi":-1,"idUi":753,"offset":0,"bChaz":false,"carrier":false,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":2,"delph":600,"tip":0,"position":{"x":-15900,"y":6000,"z":0},"position1":{"x":-8900,"y":6000,"z":0},"connected":{"arr":["18ac2611-9174b714","5e53b6aa-c1d4238Z"],"arr1":["18ac2611-9174b714","27d4c4aZ-8ea0542e","72ede5c5-e8ff5a53"]},"uuid":"18ac2611-9174b714","windows":{"array":[{"id":1,"x":3373.087289701478,"y":0,"z":0,"w":3000,"h":200,"d":600}]},"height":300,"sUi":-1,"idUi":302,"offset":0,"bChaz":false,"carrier":true,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":3,"delph":600,"tip":0,"position":{"x":-15900,"y":-4200,"z":0},"position1":{"x":-15900,"y":-2400,"z":0},"connected":{"arr":["b2192393-da17fdcd","34c8fa3Z-5ad737bZ","2a3d4c36-27b44bbd"],"arr1":["34c8fa3Z-5ad737bZ","46bc188Z-a76cf838","5e53b6aa-c1d4238Z"]},"uuid":"34c8fa3Z-5ad737bZ","windows":{"array":[]},"height":300,"sUi":-1,"idUi":459,"offset":0,"bChaz":false,"carrier":true,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":4,"delph":200,"tip":0,"position":{"x":-1300,"y":-4200,"z":0},"position1":{"x":-8900,"y":-4200,"z":0},"connected":{"arr":["ba7985ZZ-50821c4b","dede2946-432f65cc","96bdbb9b-64efe334"],"arr1":["c03f95cZ-fb185be1","ba7985ZZ-50821c4b","98912f3Z-2fb0671a"]},"uuid":"ba7985ZZ-50821c4b","windows":{"array":[{"id":1,"x":2074.4996505322397,"y":0,"z":0,"w":3000,"h":200,"d":200}]},"height":300,"sUi":"98912f3Z-2fb0671a","idUi":900,"offset":200,"bChaz":true,"carrier":false,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":5,"delph":200,"tip":0,"position":{"x":-1300,"y":200,"z":0},"position1":{"x":-1300,"y":-4200,"z":0},"connected":{"arr":["dede2946-432f65cc","39397493-11a476bZ","c697b880-b1fdaaa7"],"arr1":["ba7985ZZ-50821c4b","dede2946-432f65cc","96bdbb9b-64efe334"]},"uuid":"dede2946-432f65cc","windows":{"array":[{"id":2,"x":2477.3844814578783,"y":0,"z":0,"w":2000,"h":200,"d":200}]},"height":300,"sUi":-1,"idUi":158,"offset":0,"bChaz":false,"carrier":false,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":6,"delph":200,"tip":0,"position":{"x":-8900,"y":200,"z":0},"position1":{"x":-1300,"y":200,"z":0},"connected":{"arr":["c03f95cZ-fb185be1","39397493-11a476bZ","27d4c4aZ-8ea0542e"],"arr1":["dede2946-432f65cc","39397493-11a476bZ","c697b880-b1fdaaa7"]},"uuid":"39397493-11a476bZ","windows":{"array":[{"id":1,"x":2469.0561929561427,"y":0,"z":0,"w":3000,"h":200,"d":200}]},"height":300,"sUi":-1,"idUi":942,"offset":0,"bChaz":false,"carrier":false,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":7,"delph":200,"tip":0,"position":{"x":-8900,"y":200,"z":0},"position1":{"x":-8900,"y":6000,"z":0},"connected":{"arr":["c03f95cZ-fb185be1","39397493-11a476bZ","27d4c4aZ-8ea0542e"],"arr1":["18ac2611-9174b714","27d4c4aZ-8ea0542e","72ede5c5-e8ff5a53"]},"uuid":"27d4c4aZ-8ea0542e","windows":{"array":[{"id":1,"x":2489.701291564442,"y":0,"z":0,"w":3000,"h":200,"d":200}]},"height":300,"sUi":-1,"idUi":139,"offset":0,"bChaz":false,"carrier":false,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":8,"delph":200,"tip":0,"position":{"x":-1300,"y":6000,"z":0},"position1":{"x":-1300,"y":200,"z":0},"connected":{"arr":["c697b880-b1fdaaa7","72ede5c5-e8ff5a53","a924f16a-efd065cc"],"arr1":["dede2946-432f65cc","39397493-11a476bZ","c697b880-b1fdaaa7"]},"uuid":"c697b880-b1fdaaa7","windows":{"array":[{"id":1,"x":2507.853256226218,"y":0,"z":0,"w":3000,"h":200,"d":200}]},"height":300,"sUi":-1,"idUi":992,"offset":0,"bChaz":false,"carrier":false,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":9,"delph":600,"tip":0,"position":{"x":-8900,"y":6000,"z":0},"position1":{"x":-1300,"y":6000,"z":0},"connected":{"arr":["18ac2611-9174b714","27d4c4aZ-8ea0542e","72ede5c5-e8ff5a53"],"arr1":["c697b880-b1fdaaa7","72ede5c5-e8ff5a53","a924f16a-efd065cc"]},"uuid":"72ede5c5-e8ff5a53","windows":{"array":[{"id":0,"x":2469.0561929561436,"y":0,"z":0,"w":2000,"h":200,"d":600}]},"height":300,"sUi":-1,"idUi":386,"offset":0,"bChaz":false,"carrier":true,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":10,"delph":600,"tip":0,"position":{"x":5100,"y":6000,"z":0},"position1":{"x":-1300,"y":6000,"z":0},"connected":{"arr":["a924f16a-efd065cc","7947ee1c-8f7b2b7Z"],"arr1":["c697b880-b1fdaaa7","72ede5c5-e8ff5a53","a924f16a-efd065cc"]},"uuid":"a924f16a-efd065cc","windows":{"array":[{"id":0,"x":4466.964538207414,"y":0,"z":0,"w":2000,"h":200,"d":600},{"id":0,"x":1644.7567126265494,"y":0,"z":0,"w":2000,"h":200,"d":600}]},"height":300,"sUi":-1,"idUi":818,"offset":0,"bChaz":false,"carrier":true,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":11,"delph":600,"tip":0,"position":{"x":5100,"y":-4200,"z":0},"position1":{"x":5100,"y":6000,"z":0},"connected":{"arr":["7947ee1c-8f7b2b7Z","17fa6be3-f16cf82Z"],"arr1":["a924f16a-efd065cc","7947ee1c-8f7b2b7Z"]},"uuid":"7947ee1c-8f7b2b7Z","windows":{"array":[{"id":0,"x":6876.8129785412075,"y":0,"z":0,"w":2000,"h":200,"d":600},{"id":0,"x":2841.055787960572,"y":0,"z":0,"w":2000,"h":200,"d":600}]},"height":300,"sUi":-1,"idUi":388,"offset":0,"bChaz":false,"carrier":true,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":12,"delph":600,"tip":0,"position":{"x":-1300,"y":-4200,"z":0},"position1":{"x":394.0650141615288,"y":-4200,"z":0},"connected":{"arr":["ba7985ZZ-50821c4b","dede2946-432f65cc","96bdbb9b-64efe334"],"arr1":["96bdbb9b-64efe334","17fa6be3-f16cf82Z","71c62868-74746ddb"]},"uuid":"96bdbb9b-64efe334","windows":{"array":[]},"height":300,"sUi":-1,"idUi":114,"offset":0,"bChaz":false,"carrier":true,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":13,"delph":600,"tip":0,"position":{"x":394.0650141615288,"y":-4200,"z":0},"position1":{"x":5100,"y":-4200,"z":0},"connected":{"arr":["96bdbb9b-64efe334","17fa6be3-f16cf82Z","71c62868-74746ddb"],"arr1":["7947ee1c-8f7b2b7Z","17fa6be3-f16cf82Z"]},"uuid":"17fa6be3-f16cf82Z","windows":{"array":[{"id":0,"x":2016.9613777470022,"y":0,"z":0,"w":2000,"h":200,"d":600}]},"height":300,"sUi":-1,"idUi":96,"offset":0,"bChaz":false,"carrier":true,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":14,"delph":600,"tip":0,"position":{"x":394.0650141615288,"y":-7200,"z":0},"position1":{"x":394.0650141615288,"y":-4200,"z":0},"connected":{"arr":["71c62868-74746ddb","7ebd2faZ-79476aZZ"],"arr1":["96bdbb9b-64efe334","17fa6be3-f16cf82Z","71c62868-74746ddb"]},"uuid":"71c62868-74746ddb","windows":{"array":[]},"height":300,"sUi":-1,"idUi":539,"offset":0,"bChaz":false,"carrier":true,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":15,"delph":600,"tip":0,"position":{"x":-11200,"y":-7200,"z":0},"position1":{"x":394.0650141615288,"y":-7200,"z":0},"connected":{"arr":["7ebd2faZ-79476aZZ","6adea118-d22db22e"],"arr1":["71c62868-74746ddb","7ebd2faZ-79476aZZ"]},"uuid":"7ebd2faZ-79476aZZ","windows":{"array":[{"id":0,"x":6885.712062141793,"y":0,"z":0,"w":2000,"h":200,"d":600},{"id":0,"x":3047.5094193518153,"y":0,"z":0,"w":2000,"h":200,"d":600}]},"height":300,"sUi":-1,"idUi":297,"offset":0,"bChaz":false,"carrier":true,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":16,"delph":600,"tip":0,"position":{"x":-11200,"y":-4200,"z":0},"position1":{"x":-11200,"y":-7200,"z":0},"connected":{"arr":["b2192393-da17fdcd","6adea118-d22db22e","98912f3Z-2fb0671a"],"arr1":["7ebd2faZ-79476aZZ","6adea118-d22db22e"]},"uuid":"6adea118-d22db22e","windows":{"array":[]},"height":300,"sUi":-1,"idUi":872,"offset":0,"bChaz":false,"carrier":true,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":17,"delph":600,"tip":0,"position":{"x":-11200,"y":-4200,"z":0},"position1":{"x":-8900,"y":-4200,"z":0},"connected":{"arr":["b2192393-da17fdcd","6adea118-d22db22e","98912f3Z-2fb0671a"],"arr1":["c03f95cZ-fb185be1","ba7985ZZ-50821c4b","98912f3Z-2fb0671a"]},"uuid":"98912f3Z-2fb0671a","windows":{"array":[]},"height":300,"sUi":-1,"idUi":996,"offset":0,"bChaz":false,"carrier":true,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":18,"delph":500,"tip":0,"position":{"x":-19300,"y":-4200,"z":0},"position1":{"x":-15900,"y":-4200,"z":0},"connected":{"arr":["2a3d4c36-27b44bbd","5418cace-b021cd50"],"arr1":["b2192393-da17fdcd","34c8fa3Z-5ad737bZ","2a3d4c36-27b44bbd"]},"uuid":"2a3d4c36-27b44bbd","windows":{"array":[]},"height":300,"sUi":-1,"idUi":621,"offset":0,"bChaz":false,"carrier":true,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":19,"delph":500,"tip":0,"position":{"x":-19300,"y":-2400,"z":0},"position1":{"x":-19300,"y":-4200,"z":0},"connected":{"arr":["5418cace-b021cd50","46bc188Z-a76cf838"],"arr1":["2a3d4c36-27b44bbd","5418cace-b021cd50"]},"uuid":"5418cace-b021cd50","windows":{"array":[]},"height":300,"sUi":-1,"idUi":275,"offset":0,"bChaz":false,"carrier":true,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":20,"delph":500,"tip":0,"position":{"x":-15900,"y":-2400,"z":0},"position1":{"x":-19300,"y":-2400,"z":0},"connected":{"arr":["34c8fa3Z-5ad737bZ","46bc188Z-a76cf838","5e53b6aa-c1d4238Z"],"arr1":["5418cace-b021cd50","46bc188Z-a76cf838"]},"uuid":"46bc188Z-a76cf838","windows":{"array":[]},"height":300,"sUi":-1,"idUi":890,"offset":0,"bChaz":false,"carrier":true,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":21,"delph":600,"tip":0,"position":{"x":-15900,"y":-2400,"z":0},"position1":{"x":-15900,"y":6000,"z":0},"connected":{"arr":["34c8fa3Z-5ad737bZ","46bc188Z-a76cf838","5e53b6aa-c1d4238Z"],"arr1":["18ac2611-9174b714","5e53b6aa-c1d4238Z"]},"uuid":"5e53b6aa-c1d4238Z","windows":{"array":[]},"height":300,"sUi":-1,"idUi":946,"offset":0,"bChaz":false,"carrier":true,"out":true,"adjacent":true},{"type":"SpliceSten","idArr":22,"delph":500,"tip":0,"position":{"x":5100,"y":-6500,"z":0},"position1":{"x":1612.0929875367883,"y":-5528.048492806976,"z":0},"connected":{"arr":["15ba4269-12fc3993"],"arr1":["15ba4269-12fc3993"]},"uuid":"15ba4269-12fc3993","windows":{"array":[]},"height":300,"sUi":-1,"idUi":949,"offset":0,"bChaz":false,"carrier":true,"out":true,"adjacent":true}],"arrPol":[],"color":"#4ecbfe","alpha":1,"lineWord":{"array":[]},"worldBlok":{"array":[]}}'

			setTimeout(function() {
				if(self.par.localStorage.object.model==null){
					self.openJSON(ss)
				}else{
					self.openJSON(self.par.localStorage.object.model);				
				}
			},10);



		    this.textArea=new DTextArea(this.w, this.par.otstup, this.par.otstup, ss,function(){
		        
		    });
		    this.textArea.width=200-this.par.otstup*2;
		    this.textArea.fontSize=8;
		    this.textArea.height=par.wh;

		    
		    if(this.startObj!=undefined){
		    	trace(this.startObj)
		    }


		    this.par.array[this.par.array.length]=this.sStyle=new MStyle(this, function(s,p){             
           		self.par.fun(s,p);
        	});


		   	this.init3()

    	}

    	this.init3=function(o){
			let script = document.createElement('script');

			// мы можем загрузить любой скрипт с любого домена
			script.src = "src/libMy/divLibPlus.js"
			document.head.append(script);


			script.onload = function() {
			  	// в скрипте создаётся вспомогательная функция с именем "_"
			  	

			  	self.dev=new DCompDev(self.dCont,25,25,"test33",function(){          

				}) 
				//self.dev.visible=false	
				self.dev.active=true//=false	
			};
		}	
		self.dev=undefined

		
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
	    trace("####################################",infoDlaVorodis2);
	    if(infoDlaVorodis2!=null){
	    	let l =new DLabel(this.w, 500,20,"infoDlaVorodis2=  "+infoDlaVorodis2)
	    	l.fontSize=32
	    }




	    if(self.localStorage.object.debug&& self.localStorage.object.debug==true){	    	
	    	this.init();
	    }
    }
}
