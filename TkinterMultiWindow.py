import Tkinter as tk
from Tkinter import *
import requests
import json

class loginScreen:
    def __init__(self, master):
        self.master = master
        self.frame = tk.Frame(self.master)
        
        self.usernameLbl = Label(self.frame, text = "Username")
        self.username = Entry(self.frame)

        self.passwordLbl = Label(self.frame, text = "Password")
        self.password = Entry(self.frame)

        self.submit = tk.Button(self.frame, text = "Login", width = 25, command = self.login)

        self.usernameLbl.pack()
        self.username.pack()
        self.passwordLbl.pack()
        self.password.pack()
        self.submit.pack()
        self.frame.pack()

    def new_window(self):
        self.newWindow = tk.Toplevel(self.master)
        self.app = mainMenu(self.newWindow)
    def login(self):
        url = "http://cs2s.yorkdc.net:5012/getToken"
        loginInfo = {'username' : self.username.get(), 'password' : self.password.get()}
        
        y = requests.post(url, data = loginInfo)
        yjson = y.json()
        

        if yjson is None:
            print "Failed to login"
            return "Failed"
        else:
            self.new_window()
            
class mainMenu:
    def __init__(self, master):
        self.master = master
        self.frame = tk.Frame(self.master)

        self.AddDestinationButton = tk.Button(self.frame, text = "Add a new destination", command = self.addDestWin)
        self.UpdateDestinationButton = tk.Button(self.frame, text = "Update a destination", command = self.UpdateDestWin)

        self.AddDestinationButton.pack()
        self.UpdateDestinationButton.pack()

        self.frame.pack()

    def addDestWin(self):
        self.newWindow = tk.Toplevel(self.master)
        self.app = AddDestinationScreen(self.newWindow)

    def UpdateDestWin(self):
        self.newWindow = tk.Toplevel(self.master)
        self.app = UpdateDestinationQueryScreen(self.newWindow)

class AddDestinationScreen:
    def __init__(self, master):
        self.master = master
        self.frame = tk.Frame(self.master)
        
        self.destNameLbl = Label(self.frame, text = "Destination Name")
        self.destName = Entry(self.frame)
        
        self.Feature1HeaderLbl = Label(self.frame, text = "Feature 1 Header")
        self.Feature1Header = Entry(self.frame)

        self.Feature1DescriptionLbl = Label(self.frame, text = "Feature 1 Description")
        self.Feature1Description = Entry(self.frame)

        self.Feature2HeaderLbl = Label(self.frame, text = "Feature 2 Header")
        self.Feature2Header = Entry(self.frame)

        self.Feature2DescriptionLbl = Label(self.frame, text = "Feature 2 Description")
        self.Feature2Description = Entry(self.frame)

        self.button1 = tk.Button(self.frame, text = 'Submit Destination', width = 25, command = self.submitDestination)
        self.destNameLbl.pack()
        self.destName.pack()
        self.Feature1HeaderLbl.pack()
        self.Feature1Header.pack()
        self.Feature1DescriptionLbl.pack()
        self.Feature1Description.pack()
        self.Feature2HeaderLbl.pack()
        self.Feature2Header.pack()
        self.Feature2DescriptionLbl.pack()
        self.Feature2Description.pack()
        
        self.button1.pack()
        self.frame.pack()


    def submitDestination(self):
        url = "http://cs2s.yorkdc.net:5012/AddDestination"
        destInfo = {'name' : self.destName.get(), 'feature1': self.Feature1Header.get(), 'feature1Description' : self.Feature1Description.get(), 'feature2' : self.Feature2Header.get(), 'feature2Description' : self.Feature2Description.get()}
        
        y = requests.post(url, data = destInfo)

        yjson = y.json()

        print destInfo


class UpdateDestinationQueryScreen:
    def __init__(self, master):
        self.master = master
        self.frame = tk.Frame(self.master)
        self.DestinationQuestionLbl = Label(self.frame, text = "Enter the destination you wish to edit")
        self.DestinationQuery = Entry (self.frame)
        self.submitButton = tk.Button(self.frame, text = 'Submit', width = 25, command = self.getDestination)

        self.frame.pack()
        self.DestinationQuestionLbl.pack()
        self.DestinationQuery.pack()
        self.submitButton.pack()

    def getDestination(self):
        url = "http://cs2s.yorkdc.net:5012/getDestAdminClient"
        destInfo = {'destQuery' : self.DestinationQuery.get()}

        y = requests.post(url, data = destInfo)

        global destReturn 
        
        destReturn = y.json()
        
        print destReturn

        if destReturn is None:
            print "Failed to find destination"
        else:
            self.new_window()

    def new_window(self):
        self.newWindow = tk.Toplevel(self.master)
        self.app = UpdateDestinationScreen(self.newWindow)

 
class UpdateDestinationScreen:
    def __init__(self, master):
        self.master = master
        master.geometry("400x400")
        self.frame = tk.Frame(self.master)
        
        self.namelbl = Label(self.frame, text = "Destination Name")
        self.name = Entry (self.frame)

        self.f1hLbl = Label(self.frame, text = "Feature 1 header")
        self.feature1Header = Entry(self.frame)

        self.f1Lbl = Label(self.frame, text = "Feature 1")
        self.feature1 = Entry (self.frame)

        self.f2hLbl = Label(self.frame, text = "Feature 2 header")
        self.feature2Header = Entry(self.frame)

        self.f2Lbl = Label(self.frame, text = "Feature 2")
        self.feature2 = Entry(self.frame)

        self.submitButton = tk.Button(self.frame, text = "Submit", width = 25, command = self.updateDest)
       
        self.destId = destReturn[0]
        nameResult = destReturn[1]
        feature1HeaderResult = destReturn[4]
        feature1Result = destReturn[5]
        feature2HeaderResult = destReturn[6]
        feature2Result = destReturn[7]


        self.name.insert(END, nameResult)
        self.feature1Header.insert(END, feature1HeaderResult)
        self.feature1.insert(END, feature1Result)
        self.feature2Header.insert(END, feature2HeaderResult)
        self.feature2.insert(END, feature2Result)

        self.frame.pack()
        self.namelbl.pack()
        self.name.pack()
        self.f1hLbl.pack()
        self.feature1Header.pack()
        self.f1Lbl.pack()
        self.feature1.pack()
        self.f2hLbl.pack()
        self.feature2Header.pack()
        self.f2Lbl.pack()
        self.feature2.pack()
        self.submitButton.pack()
        print destReturn
    
    def updateDest(self):
        url = "http://cs2s.yorkdc.net:5012/updateDestination"
        destInfo = {'destId' : self.destId, 'name' : self.name.get(), 'feature1' : self.feature1Header.get(), 'feature1Description' : self.feature1.get(), 'feature2' : self.feature2Header.get(), 'feature2Description' : self.feature2.get()}

        y = requests.put(url, data  = destInfo)

        yjson = y.json()

        print yjson
    



class Win2:
    def __init__(self, master):
        self.master = master
        self.frame = tk.Frame(self.master)
        self.quitButton = tk.Button(self.frame, text = 'Quit', width = 25, command = self.close_windows)
        self.quitButton.pack()
        self.frame.pack()

    def close_windows(self):
        self.master.destroy()

def main():
    root = Tk()
    app = loginScreen(root)
    root.mainloop()

if __name__ == '__main__':
    main()
