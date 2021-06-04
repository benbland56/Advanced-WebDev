3CB109 - Advanced Web Development README
----------------------------------------
Installation
The rest server is located at /home/benjamin.bland/htdocs/RestServerTest.py

To use this Flask Server, the following packages must be installed

from flask import Flask, jsonify, request, render_template, make_response
from flaskext.mysql import mySQL
import jwt 
import json
import bcrypt
import datetime
from functools import wraps

To run the server, run the RestServerTest.py file with the following command. python RestServerTest.py

A known issue with the server is a crash upon loading the destinations. The console shows a bad interface error, and it didn't become present until a few days before submission and i was unable to find a solution for it. I think its due to the large number of POST requests being made, causing some of them to time out when the CS2S server is busy. It also seems to happen more frequently on slower internet connections. If the crash does happen, just restart the server and refresh the page and it will work again. 

I've also included an sql file of my database with my submission, should it be required. However this does contain tables from previous projects.

----------------------------------------
Web Client 1 - Website

This website is a holiday finding website. It provides information about various holiday destinations and also local hotels in the area as well.

Users can create an account, and all passwords are hashed and salted using bcrypt.

When the user logs in, they're given an encypted token which contains their username and a secret key. Whenever an action is performed that requires a user to be logged in, this token is sent to the python web server for decryption, which returns the users account details to be used for whatever is required. This is safer than saving user credentials in plain text in a cookie.

Users are able to save destinations from the relevant destination page, and view their saved destinations in the account settings page, which is accessed by clicking the login button in the top right of the navbar again once they've signed in.

From the account settings page, users are also able to update their usernames and also their passwords, and log out.

All webpages, except the index page are dynamically populated using the ID of either the destination or the hotel.

Signed in users are also able to leave reviews about destinations and hotels should they wish. A user cannot leave a review if they are not logged in.

There is a search function which will find destinations based on the users search query, and return an image, a link to the destinations page, and also a brief description about the destination.

----------------------------------------
Web Client 2 - Python Administration Tool

The second client is a program made with python.

To use the Python tool you must first log in. Here's a username and password to use

username: Ben
password: test

It uses Tkinter for its UI, this must be installed to run the program.
Other modules that need to be installed are
requests
json

All the required modules can be installed using pip

To run the second client, use the console command python TkinterMultiWindow.py

This program is designed to be an Admininstration tool for Web Client 1 (the website)

This program is able to add new destinations to the database which will the be accessible from the Holiday website.

As all webpages are dynamically populated, no HTML coding is required from the admin client. The admin simply fills out the text boxes on the program, and the database will automatically increment the new destination's ID number by 1, meaning the Python Web Server can find it and populate the destinations page with the submitted info.

The Admin Tool is also able to update the information of the destinations. It does this via a PUT request.


