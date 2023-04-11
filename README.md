# divide-and-conquer
A simple two-screen iOS app that helps split the bill.


What I've learned building this app?

### creating a second view controller

In order to LINK the second storyboard [second user interface view] that we have to a new ViewController, we need to create a new COCOA TOUCH file into the Controllers folder.

After creating the cocoa touch file, which I have created as a class named ResultViewController with a superclass of a UIViewController, I just need to access the screen in the main file to link them.

After selecting the screen in that arrow that is above the phone screen [the one selected in blue], I just need to change the class reference in the IDENTITY INSPECTOR [right side of the screen] to the new class that I just created.
After this, I would be able to open the assistant screen to help me link the IBOutlets, IBActions, etc.

To link both screens I need to create a SEGUE!
And, to do this, I just need to select the CalculateViewController [main viewController that I renamed], hold control, and link them up, the same as I do to create and link IBActions, IBOutlets, etc.
I also need to define a name for that SEGUE, so I can access it:

In the top right corner of the image, it’s clear to see that I’ve defined the identifier of this SEGUE as goToResult.

Now that we have the segue with the proper identifier, we can leverage the fact that we have all the functionality from a UIViewController to ask it to PERFORM A SEGUE, and, as we can have many segues in one view controller, we also need to tell the UIViewController which SEGUE to PERFORM:

Here, on line 26 we have used the method performSegue(…) in self to perform the “goToResult” segue, which was triggered from self.
Now, we need to pass data between the classes!

To make the ResultViewController goes back, we need to add some functionality to the Recalculate Button, and to do this, the UIViewController has a method called .dismiss( … ) which performs what we need.

