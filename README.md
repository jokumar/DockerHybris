= Docker Hybris  Local Development Environment
:toc:
:icons:
:linkcss:
:imagesdir: ../../resources/images



== Overview 

This document covers the setup of Hybris in Docker for Windows. This will help in building and starting of the application faster and more performant compared to Windows. As per the solution, Hybris will start in a new container named as hybris_docker. Solr will start in the same container where hybris is starting. MySQL will be a separate container hybris_sql and the volume is mounted in the Linux VM. The volume for media is also mounted in Linux VM. Hence with container start/stop the data will persist. 



== Install Docker in Windows


. Create an user in Docker hub(https://hub.docker.com/) – (Ignore if you already have )

. Download the docker for windows from (https://store.docker.com/editions/community/docker-ce-desktop-windows ) Make sure to download stable CE version.

. Install Docker .Do not select the checkbox for Windows Container. We will be running it in Linux Container. You should be able to see docker symbol in taskbar.

. Right click on the Docker in task bar and got to settings. Give the below specifications for starting Docker :
	CPU : 2 
	Memory : 3584 MB for 8 GB RAM. If you have 16 GB , please allocate more than 6GB for docker . Also if you custom folder increases, 3584 MB might not suffice and you might need to increase it.
. It might ask you to restart your system to enable virtualization. If still it gives error, take it to ITS for enabling virtualization .If you see Docker is running then Bingo!!! You are ready to deploy your first application in Docker .If you get any error message related to memory, you need to cleanup by uninstalling some of the applications to make some space . 