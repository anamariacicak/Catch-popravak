class FirstGame{
  

  int rnd; //random number to choose falling object
  int lives;
  FallingObject obj;
  ArrayList<FallingObject> objects;
  int time1,time2,timespeed1,timespeed2;
  float time,low,up;
  float secondsToFall;
  
  FirstGame(){
    lives=3;
    objects = new ArrayList<FallingObject>();
    time1=0;
    time2=0;
    timespeed1=0;
    timespeed2=0;
    time=1000;
    low=700;
    up=1500;
    secondsToFall=3;
  }
  
  void myDraw(){
    
    time2=millis();
    timespeed2=millis();
    
    background(background1);
    imageMode(CORNER);
    //score
    fill(255);
    textSize(20);
    textAlign(RIGHT);
    fill(color(blue));
    text("SCORE: "+score, width-5, 30);
    //lives
    for(int i=0; i<lives; i++){
      image(heart, 35*i+10, 10);
    }
    for(int i=lives; i<3; i++){
      image(heartEmpty, 35*i+10, 10);
    }
    

    
    for (int i = objects.size()-1; i >= 0; i--) {
      obj = objects.get(i);
    
      image(objectImages[obj.index],obj.posX,obj.posY+=float(height)/secondsToFall/(int(frameRate)));
      
      if(obj.posY>height){
        objects.remove(i);
        if(obj.bomb==false){
          error.play();
          lives--;
          if(lives<=0)
            setGameOver();
        }
      }
      
     else if(obj.posY+obj.height>height-basket.height && obj.posY<height-basket.height
       && obj.posX+obj.width/2>mouseX-basket.width/2 && obj.posX+obj.width/2<mouseX+basket.width/2){
        if(obj.bomb==false){
          pop.play();
          score+=obj.points;
        }
        else{
          error.play();
          lives--;
          if(lives<=0)
            setGameOver();
        }
        objects.remove(i);
      }
    
    }
      
    if(time2-time1>time){
      rnd=int(random(0,numFall-1));
      if(rnd==0){
        obj=new FallingObject(rnd, int(random(0,width-width/10)), 0, true);
      }
      else{
        obj=new FallingObject(rnd, int(random(0,width-width/10)), 5, false);
      }
      objects.add(obj);
      time1=time2;
      time=random(low,up);
    }
    
    
      if(difficulty==0){
        if(timespeed2-timespeed1>2000){
          if(secondsToFall>1.2)
            secondsToFall-=0.02;
          if(low>600)
            low-=10;
          if(up>1000)
            up-=10;
          timespeed1=timespeed2;
        }
      }
      else if(difficulty==1){
        if(timespeed2-timespeed1>1000){
          if(secondsToFall>0.7)
            secondsToFall-=0.02;
          if(low>200)
            low-=5;
          if(up>600)
            up-=10;
          timespeed1=timespeed2;
        }
      }
      else if(difficulty==2){
        if(timespeed2-timespeed1>1000){
          if(secondsToFall>0.6)
            secondsToFall-=0.05;
          if(low>200)
            low-=10;
          if(up>600)
            up-=50;
          timespeed1=timespeed2;
        }
      }
      else if(difficulty==3){
        if(timespeed2-timespeed1>1000){
          if(secondsToFall>0.7)
            secondsToFall-=0.07;
          if(low>100)
            low-=10;
          if(up>300)
            up-=70;
          timespeed1=timespeed2;
        }
      }
      
    
    

      
    image(basket,mouseX-basket.width/2,height-basket.height);
      
    //.................back button....................
    if(overCircle(30,height-50,50)==true){  
      fill(darkblue);
      stroke(darkblue);
    }
    else{
      fill(blue);
      stroke(blue);
    }
    circle(30, height-30, 50);
    imageMode(CENTER);
    image(leftArrow,30,height-30);
    

  }
  
  void setGameOver(){ 
    appendTextToFile("scores.txt", score + " "+day()+"/"+month()+"/"+year()+"-"+hour()+":"+minute()+":"+second() );
    firstGameB=false;
    gameOverB=true;
  }

  void myMousePressed() {
    
    if(overCircle(30,height-30,50)==true){
       click.play();
       homeB=true;
       firstGameB=false;
       firstGame = new FirstGame();
       score=0;
     }
  }
  

}
