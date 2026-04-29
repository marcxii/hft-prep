Lab 2: Self-Healing Infrastructure (Salt Beacons & Reactors)

The Setup: On a Salt Minion, install the pyinotify package and configure a Salt Beacon to continuously monitor a critical configuration file, such as /etc/hosts or an index.html file.  

The Drill: Write a Salt Reactor state on the master that listens for this specific beacon event. SSH into the minion and manually alter or corrupt the monitored file. The goal is to watch the beacon detect the unauthorized change and the reactor instantly and autonomously apply the correct state to revert the file to its original form.