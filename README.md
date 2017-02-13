# Zengine
ActionScript Framework for game dev.

if you are familiar with Entity Component Systems the code will make more sense.

Basically zengine provides a simple way to create game objects quickly.

here is a real basic walkthrough..

1. import these:

       import zengine.entity.ZengineObject;

2. instantiate a zengine object:

       var po:ZengineObject = new ZengineObject(TwoDAssets.texture1,pos1,40,TwoDAssets.texture1.rect, 0);  
                                                                                  //the last argument is the guid for step 4.

3. instantiate a zengine system:

       private var g:GraphicSystem = new GraphicSystem(stage); // do this from your main as3 class to get stage attribute
       
4. register your zengine object:
      
       g.register(0); //that 0 is the guid -- the last argument to the ZengineObject constructor
       
       
5. call update on the Zengine System 'g' 

       g.update(fps); //fps is a Number type and stands for frames per second
       
       
6. look at your texture texture1 on the screen and admire the simplicity :)

7.  Check out the code for "Drifter" https://github.com/bitrot7/Drifter a game that utilizes zengine.  Seeing zengine in action will help.

-- More notes for developers -- (who else would be reading this anyways..)

Zengine has more systems for physics, motion and input.  have a look at the code in the package zengine.system.  

Also, Take a look at the data the systems in zengine.system work with in the packages: zengine.entity and 
zengine.entity.component.

When you are ready extend the ZengineObject class and make your own systems to work with your own user defined data.  Leaving 
all the tedious physics and rendering to Zengine !!



       

