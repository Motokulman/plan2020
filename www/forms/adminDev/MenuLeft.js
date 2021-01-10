



export class MenuLeft  {
  	constructor(par,fun) {  		
  		this.type="MenuLeft";
  		this.fun=fun
  		this.par=par
  		var self=this;
	


        this.param=par.param;


        this.dCont=new DCont(par.dCont);

        var sah = 1;
        var pic =  function(n) {
          let linkPic  = '../../resources/forms/'
          let typePic  = 'w.png'
          sah = n != undefined ? n : sah
          let ret =  linkPic+sah+typePic
          sah += 1

          return ret
        }

        this.init=function(){           

            this.three=new DThreeBool(this.dCont,0,0,function(o){                
                self.fun("sobThree", o.obj.valueName);
            }); 

            var arr=[]
          /*  arr.push({uuid:Math.random(),name:"План", valueName:"plan3ds", link:pic(1),array:[
                    {uuid:Math.random(),name:"Список", valueName:"plan3dsList",link:pic(2),array:[]}, 
                    {uuid:Math.random(),name:"Добавить",valueName:"plan3dsCreat" ,link:pic(3),array:[]}
                ]})*/

            arr.push({uuid:Math.random(),name:"Объекты", valueName:"objects3d", link:pic(5),array:[
                    {uuid:Math.random(),name:"Список", valueName:"objects3dList",link:pic(2),array:[]}, 
                    {uuid:Math.random(),name:"Добавить",valueName:"objects3dCreat" ,link:pic(3),array:[]}
                ]})

            arr.push({uuid:Math.random(),name:"Матерьялы", valueName:"materials", link:pic(6),array:[
                    {uuid:Math.random(),name:"Список", valueName:"materialsList",link:pic(2),array:[]}, 
                    {uuid:Math.random(),name:"Добавить",valueName:"materialsCreat" ,link:pic(3),array:[]}
                ]})
            arr.push({uuid:Math.random(),name:"Текстуры", valueName:"textures", link:pic(3),array:[
                    {uuid:Math.random(),name:"Список", valueName:"texturesList",link:pic(2),array:[]}, 
                    {uuid:Math.random(),name:"Добавить",valueName:"texturesCreat" ,link:pic(3),array:[]}
                ]})

            

            this.three.setObj(arr,"array","name");

        }



        this.setParam=function(){ 
         
            this.three.x=this.param.otstup;
            this.three.y=this.param.otstup*4+this.param.wh;


            this.three.heightBut=this.param.wh


           

            if(this.param.mobile==true){
                this.three.width=this.param.wh;
            }else{
                this.three.width=this.param.wb;
            }     

            this.sizeWindow()
        }

        this.init()




		var w,h,s
  		this.sizeWindow = function(_w,_h,_s){
  			if(_w){
  				w=_w;
  				h=_h;
  				s=_s;
  			}
      
            this.three.height=h/s-(this.param.otstup*5+this.param.wh)                 
  		}


  	}
}





