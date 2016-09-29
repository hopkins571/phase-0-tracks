# Some of the major philosophies of Linux:
* **open source:** everything is free and non-commercial, built and tested by a volunteer community, and all source code for software is freely available for other devs to build on
* **keep it small:** programs are small and focus on doing one thing really well
* **keep things portable:** use shell scripts so software can be used on otherwise incompatible systems
* **assume the user is computer literate:** users have complete control
* **keep things open ended:** there are many built in features allowing users a great deal of power and flexibility

A **VPS** is a virtual computer (an OS running on an image - like using Parallels) that is available for remote use as a server. They are a great way to practice using different unix distributions because they provide a worry free environment to play around. Wanna see what happens when you run ```sudo rm -rf / ```? **GO DO IT!** You can always destroy your droplet and start over. I can think of plenty of other handy uses for a VPS-- say you're about to travel to China. You could set one up as a private proxy and not have to worry about having to face the harsh reality of social media withdrawal.

Running programs as root is **bad**. Just don't do it. When you're signed on as root (or are running a command preceded by ```sudo```), any process running has the authority to do ANYTHING to your system. ANYTHING. Say you're surfing the web and run into some malicious code. That's what we call a **terrible**, *horrible*, **no good**, very. bad. day.

# HTML element properties
* onmouseover
* oncopy
* onkeypress
* onloadstart
* onscroll
