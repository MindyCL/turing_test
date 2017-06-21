
import processing.serial.*;
Serial myPort;  // Create object from Serial class

PFont f;
String answer = "x";

// int
final int startScreen = 0; // possible states 
final int play = 1;
final int play2 = 2;
final int play3 = 3;
final int play4 = 4;
final int play5 = 5;
final int thinking = 10;
final int replay = 11;
final int decision = 12;
final int token = 13;
int human_machine = 0;


int at_question = 1;
int state = startScreen;
int space = 20;

void setup() {
  fullScreen();
  background(0);
  
  //Arduino set up
 // String portName = Serial.list()[5]; //change the 0 to a 1 or 2 etc. to match your port
  //myPort = new Serial(this, portName, 9600);

  // Create the font
  f = createFont("Ubuntu.ttf", 20);
  textFont(f);
  textAlign(LEFT, CENTER);
}

void draw() {
  background(0);
  fill(#00FF00);

  //starting the test
  switch(state) {
   case startScreen:
    showstartscreen();
    break;
   case play:
     play();
     break;
   case play2:
     play2();
     break;
   case play3:
     play3();
     break;
   case play4:
     play4();
     break;
   case play5:
     play5();
     break;
   case thinking:
     thinking();
     break;
   case decision:
     delay(3000);
     decision();
   case token:
     token();
     break;
   case replay:
     replay();
     break;
   default:
      println("error");
      exit();
      break;
    }
  }
    
    

void showstartscreen(){
  String intro = "In order to prevent unauthorized acccess to admin controls, please take a moment to prove you are not a bot. \n \n Press any key to start";
  text(intro, width/4,height/3,width/2,height/3);
}

void play2(){
      background(0);
      String Q1 = "Here's your first question: Who evolved better at learning deceit, machines or humans?";
      String A1 = "1 Machines";
      String A2 = "2 Humans";
      text(Q1,width/4,height/3,width/2,height/3);
      text(A1,width/4,(height/3)+100 ,width/2,height/3);
      text(A2,width/4,(height/3)+140,width/2,height/3);
  }
      
void play() {
      String Q2 = "2+2 =?";
      String A3 = "2";
      String A4 = "3";
      String A5 = "4";
      String A6 = "5";
      text(Q2,width/4,height/3,width/2,height/3);
      text(A3,width/4,(height/3)+100 ,width/2,height/3);
      text(A4,width/4,(height/3)+140 ,width/2,height/3);
      text(A5,width/4,(height/3)+180 ,width/2,height/3);
      text(A6,width/4,(height/3)+220 ,width/2,height/3);
  }
  
void play3() {
      String Q3 = "Can you explain to me why time flies like an arrow, but fruit flies like a banana?";
      String A7 = "1 Yes";
      String A8 = "2 No";
      String A9 = "3 What?";
      text(Q3,width/4,height/3,width/2,height/3);
      text(A7,width/4,(height/3)+100 ,width/2,height/3);
      text(A8,width/4,(height/3)+140 ,width/2,height/3);
      text(A9,width/4,(height/3)+180 ,width/2,height/3);     
  }
  
void play4() {
      String Q4 = "What best describes a human?";
      String A10 = "1 A human being";
      String A11 = "2 A citizen";
      String A12 = "3 A being of entropy";
      String A13 = "4 A rational animal";
      String A14 = "5 A problem solving system";
      text(Q4,width/4,height/3,width/2,height/3);
      text(A10,width/4,(height/3)+100 ,width/2,height/3);
      text(A11,width/4,(height/3)+140 ,width/2,height/3);
      text(A12,width/4,(height/3)+180 ,width/2,height/3);
      text(A13,width/4,(height/3)+220 ,width/2,height/3);
      text(A14,width/4,(height/3)+260 ,width/2,height/3);
  }
  
void play5() {
      String Q5 = "The quality of life of persons should be maximized";
      String A15 = "1 Generallly Agree";
      String A16 = "2 Generally Disagree";

      text(Q5,width/4,height/3,width/2,height/3);
      text(A15,width/4,(height/3)+100 ,width/2,height/3);
      text(A16,width/4,(height/3)+140 ,width/2,height/3);
  }

void thinking() {

      
      String human4 = "Calculating...";
      text(human4,width/4,height/3,width/2,height/3);
      //delay(1000);
      
      state = decision;
}

void decision() {
    human_machine = round(random(1)+1);
    println(human_machine);
    state = token;
}

void token() {
 
   String youarehuman = "You are a human. Press a key for your token.";
   String youaremachine = "You are a Machine. Press a key for your token.";

  if (human_machine == 1) {
    text(youarehuman,width/4,height/3,width/2,height/3);
  }else if (human_machine ==2){
    text(youaremachine,width/4,height/3,width/2,height/3);
  } else {
  
  };
  
}


void replay() {
    String human = "Play again? Press a key.";
      text(human,10,10,750,750);
}


void keyPressed()
{
  //now states:
  switch(state) {
  case startScreen:
    state = play;
    break;
  
  case play:
    int choice2 = key - '1';
    //println(choice2);
    //println(answer);
    if (choice2 < 1 || choice2 >= 5) {
     return;
     } else if (choice2 == 1) {
       answer = answer + '1';
     } else if (choice2 == 2) {
       answer = answer + '2';
     } else if (choice2 == 3) {
       answer = answer + '3';
     }else{
       answer = answer + '4';
     }
    println(answer);
    state = play2;
    break;
    
  case play2:
    int choice = key-'1';
    //println(choice +"/n");
    if (choice < 0 || choice >= 2) {
     return;
     } else if (choice == 0) {
       answer = answer + "1";
     } else {
       answer = answer + "2";
     }
    state = play3;
    println(answer);
    break;
  
  case play3:
    int choice3 = key - '1';
    println(choice3);
    if (choice3 < 0 || choice3 >= 3) {
     return;
     } else if (choice3 == 0) {
       answer = answer + '1';
     } else if (choice3 == 1) {
       answer = answer + '2';
     } else {
       answer = answer + '3';
     }
    state = play4;
    println(answer);
    break;
  case play4:
    int choice4 = key - '1';
    println(choice4);
    if (choice4 < 0 || choice4 >= 5) {
     return;
     } else if (choice4 == 0) {
       answer = answer + '1';
     } else if (choice4 == 1) {
       answer = answer + '2';
     } else if (choice4 == 2) {
       answer = answer + '3';
     } else if (choice4 == 3) {
       answer = answer + '4';
     } else {
       answer = answer + '5';
     }
    state = play5;
    println(answer);
    break;
  case play5:
    int choice5 = key - '1';
    println(choice5);
    if (choice5 < 0 || choice5 >= 2) {
     return;
     } else if (choice5 == 0) {
       answer = answer + '1';
     } else {
       answer = answer + '2';
     }
    println(answer);
    state = thinking;
    break;  
    
  case token:
    if (human_machine == 1) {
      //myPort.write('1');
      //myPort.write('0');
      human_machine = 3;
      println(human_machine);
    }else if (human_machine ==2) {
      //myPort.write('2');
      //myPort.write('0');
      human_machine= 3;
    } else {
      //myPort.write('0');
    }
    println(human_machine);
    state = replay;
    break;
    
  case replay:
    state = startScreen;
    break;
  
  }
}