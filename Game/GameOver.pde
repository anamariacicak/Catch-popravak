class GameOver{
  //width and height of button rectangles
  int a,b;
  int rectW, rectH;

  GameOver(){
    a=height/8;
    b=width/3;
    rectW=b;
    rectH=a/2+10;
  }
  
  void myDraw(){
    
    background(background1);
      
    fill(255);
    textSize(a/2);
    textAlign(CENTER,CENTER);
    fill(color(blue));
    text("GAME OVER",width/2, a*2);
    
    textSize(a/3);
    fill(color(blue));
    text("SCORE: "+score, width/2, a*3);

   //Play again button
   if(overRect(b, a*4, rectW, rectH)==true){  
      fill(darkblue);
      stroke(darkblue);
    }
    else{
      fill(blue);
      stroke(blue);
    }
    rect(b, a*4, rectW, rectH, 20);
    fill(white);
    text("Play again", width/2, a*4+rectH/2);
      
    //Home button
   if(overRect(b, a*5, rectW, rectH)==true){  
      fill(darkblue);
      stroke(darkblue);
    }
    else{
      fill(blue);
      stroke(blue);
    }
    rect(b, a*5, rectW, rectH, 20);
    fill(white);
    text("Home", width/2, a*5+rectH/2);
    

  }

  void myMousePressed() {
    //Play again pressed
    if(overRect(b, a*4, rectW, rectH)==true)
    {
      click.play();
      score=0;
      firstGame = new FirstGame();
      gameOverB=false;
      firstGameB=true;
    }
    //Home pressed
    if(overRect(b, a*5, rectW, rectH)==true)
    {
      click.play();
      score=0;
      gameOverB=false;
      homeB=true;
      firstGame = new FirstGame();
    }

        
 
  }
  

}
