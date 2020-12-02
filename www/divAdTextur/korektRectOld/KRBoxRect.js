


export class KRBoxRect  {
    constructor() {         
        this.type="KRBoxRect";        
        var self=this;

       
      
   
        this.idArr=-1;

        this.x=0;
        this.y=0;
        this.w=1000
        this.h=1000

        this.u=0;
        this.v=0;
        this.u1=1;
        this.v1=1;

        this.boolPoli=true;
        this.boolNa=false;
        this.boolOt=false;


        this.bool=[false,false,false,false];
        this.bool1=[false,false,false,false];

        this.povid={x:0,y:0}
        var i
        this.set=function(br){
            this.x=br.x
            this.y=br.y
            this.w=br.w
            this.h=br.h

            this.bool[0]=br.b
            this.bool[1]=br.b1
            this.bool[2]=br.b2
            this.bool[3]=br.b3

            this.u=br.u;
            this.v=br.v;
            this.u1=br.u1;
            this.v1=br.v1;
            for (i = 0; i < 4; i++) {
                this.bool[i]=br.bool[i]
                this.bool1[i]=br.bool1[i]
            } 
        }


        this.setP=function(x,y,w,h,b,b1,b2,b3,_x,_y,_x1,_y1){        
            this.x=x
            this.y=y
            this.w=w
            this.h=h

            this.bool[0]=b;
            this.bool[1]=b1;
            this.bool[2]=b2;
            this.bool[3]=b3;

            this.u=_x;
            this.v=_y;
            this.u1=_x1;
            this.v1=_y1;
        }

       this.clear=function(){

            for (i = 0; i < 4; i++) {
                this.bool[i]=false
                this.bool1[i]=false
            } 
            this.boolPoli=true; 
            this.boolNa=false;         
        }

        this.vertices
        this.uv
        this.setGeom=function(vertices, uv){
            this.vertices=vertices
            this.uv=uv
           
           
            if(this.boolPoli==true){
                if(this.boolNa==false){
                    this.sGm(1,0,2)
                    this.sGm(0,3,2)
                }else{
                    if(this.boolOt==true){ 
                        this.sGm(1,0,2)
                    }else{
                        this.sGm(0,3,2)
                    }
                }
                
            }else{
                if(this.boolNa==false){                    
                    this.sGm(2,1,3)
                    this.sGm(3,1,0)
                }else{
                    if(this.boolOt==true){ 
                        this.sGm(2,1,3)
                    }else{
                        this.sGm(3,1,0)
                    }
                }
                //this.sGm(0,3,2)
            }
           
            
        }

        this.sGm=function(p,p1,p2){
            this.sGmL(p)
            this.sGmL(p1)
            this.sGmL(p2)
        }

        this.sGmL=function(p){
            if(p==0){
                this.vertices.push(
                    this.x,//0
                    this.y,
                    0
                )
                this.uv.push(
                    this.u,//0
                    this.v
                )
            }

            if(p==1){
                this.vertices.push(
                    this.x+this.w,//1
                    this.y,
                    0
                )
                this.uv.push(
                    this.u1,//1
                    this.v
                )
            }

            if(p==2){
                this.vertices.push(
                    this.x+this.w,//2
                    this.y+this.h,
                    0,
                )
                this.uv.push(
                    this.u1,//2
                    this.v1
                )
            }

            if(p==3){
                this.vertices.push(
                    this.x,//3
                    this.y+this.h,
                    0, 
                )
                this.uv.push(
                    this.u,//3
                    this.v1
                )
            }
        }



        this.setGLVert=function(a){
            
            if(this.bool[0]===true||this.bool1[0]===true){
                a.push(
                    this.x,
                    this.y,
                    0,
                    this.x+this.w,
                    this.y,
                    0
                )
            }

            if(this.bool[1]===true||this.bool1[1]===true){
                a.push(
                    this.x+this.w,
                    this.y,
                    0,
                    this.x+this.w,
                    this.y+this.h,
                    0
                )
            }

            if(this.bool[2]===true||this.bool1[2]===true){
                a.push(
                    this.x+this.w,
                    this.y+this.h,
                    0,
                    this.x,
                    this.y+this.h,
                    0
                )
            }
           
            if(this.bool[3]===true||this.bool1[3]===true){
                a.push(
                    this.x,
                    this.y+this.h,
                    0,
                    this.x,
                    this.y,
                    0
                )
            }

            if(this.boolNa==true){
                if(this.boolPoli==true){
                    a.push(
                        this.x,
                        this.y,
                        0,
                        this.x+this.w,
                        this.y+this.h,
                        0
                    )
                }else{
                    a.push(
                        this.x+this.w,
                        this.ysetGeom,
                        0,
                        this.x,
                        this.y,
                        0
                    )
                }

            }
        }

        
    }
}