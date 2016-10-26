pantherhackers.com
==========================================
This is the future PantherHackers website.

Currently the site is planned to be pure rails on both front and back.

A list of features our MVP will include are:


-Log in/account system for administrators to make changes and submit blog posts.
    
    +Account authentication is going to be handled via the devise gem
    
    +Profile models willl be associated 1 to 1 with the devise users
    
    +admin will just be a bool on the profile or user model

-Blog system
    
    +The editing/making of blog posts will be accept markup handled on the backend via the gem redcarpet
    
    +Blogs will be indexed on the homepage with a fade/stubbed out version available
    
    +Editing system for ADMINS ONLY
    
-Hackathon list
    
    +Hackathons will be scraped from the MLH website currently, however we are in the process of getting access to thier API
    
    +Will index all of the upcoming hackathons and have a marker for whether or not we plan on attending that hackathon AS pantherhackers. The whole div will be a link to that hackathon's site
    
-Event list
    
    +Events will be pulled from various sources and listed out chronologically
    
    +Will be editable by admins (deletable and updateable)




In panther hackers and want to contribute? Have a suggestion for another feature?

Contact us via email: kenneth.hyman@gmail.com or our slack channel: pantherhackers.slack.com
