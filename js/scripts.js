
function createCookie(cookieName,cookieValue) {
    document.cookie = cookieName + "=" + cookieValue + ";" + "path=/";
}

function checkForCookie() {
    var cookie = getCookie("token");
    if (cookie != "") {
        window.location.href = "accountSettings.html"
    } else {
        //do nothing
    }
}

var username;
function getCookie(cookieName) {
    var name = cookieName + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var cookieArray = decodedCookie.split(';');
    for (var i = 0; i < cookieArray.length; i++) {
        var cookie = cookieArray[i];
        while (cookie.charAt(0) == ' ') {
            cookie = cookie.substring(1);
        }
        if (cookie.indexOf(name) == 0) {
            return cookie.substring(name.length, cookie.length);
        }
    }
    return "";
}

function decodeCookie() {
    //sends the token saved to a cookie up to the server to be read and decoded
    var xhttp = new XMLHttpRequest();
    var cookie = getCookie("token");
    console.log("cookie");
    console.log(cookie);
    xhttp.onreadystatechange = function() {
        if(this.readyState == 4 && this.status == 200) {
            //server will return decoded cookie
            var output = JSON.parse(this.responseText);
            if(output == null) {
                console.log("Failed to find user");
            } else {
                console.log("Found user");
                console.log(output.user);
                username = output.user;
                var xhttp2 = new XMLHttpRequest();
                xhttp2.onreadystatechange = function() {
                    if(this.readyState == 4 && this.status == 200) {
                        console.log("getting user info")
                        var secondOutput = JSON.parse(this.responseText);
                        document.getElementById("currentUsername").innerHTML = "You're currently logged in as " + secondOutput [0][0];
                        for (i = 0; i < secondOutput.length; i++) {
                            var favourites = document.createElement("p");
                            var text = document.createTextNode(secondOutput [i][1]);
                            favourites.appendChild(text);
                            var element = document.getElementById("favourites");
                            element.appendChild(favourites);
                            console.log(favourites);
                        }
                        console.log(secondOutput);                        

                    }
                }
            }
            xhttp2.open("POST", "http://cs2s.yorkdc.net:5012/getUserInfo?username="+username,false);
            xhttp2.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp2.send();
        }
    }
    xhttp.open("POST", "http://cs2s.yorkdc.net:5012/validateToken?token="+cookie, false);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send();
}

function printCookie() {
    var cookie = getCookie("token");
    console.log ("cookie");
    console.log(cookie);
}

function deleteCookie(cookieName) {
    document.cookie = cookieName + "=; expires 01 Jan 1970 00:00:00  UTC; path=/";
}

function logout() {
    deleteCookie("token");
    window.location.href = "index.html";
}

function getToken() {
    var xhttp = new XMLHttpRequest();
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;

    xhttp.onreadystatechange = function() {
        if(this.readyState == 4 && this.status == 200) {
            var output = JSON.parse(this.responseText);
            if(output == null) {
                console.log("Login failed");
                document.getElementById("loginFailMessage").innerHTML = "Login failed, please try again";
            }
            else {
                createCookie("token", output.token);
                console.log(output);
                window.location.href = "index.html";

            }
        }                
    }
    xhttp.open("POST", "http://cs2s.yorkdc.net:5012/getToken", true);    
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("username=" + username + "&password=" + password);
}

function register() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var checkPassword = document.getElementById("passwordConfirmation").value;
    
    //https://codepen.io/diegoleme/pen/surIK
    if (password != checkPassword) {
        document.getElementById("passwordError").innerHTML = "Passwords do not match";
    } else {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if(this.readyState == 4 && this.status == 200) {
                console.log("Registration sucessful");
                window.location.href = "loginPage.html"
            }
        }
        xhttp.open("POST", "http://cs2s.yorkdc.net:5012/registration", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("username=" + username + "&password=" + password);
    }

}

function updateUsername() {
    var currentUsername = username;
    var newUsername = document.getElementById("updatedUsername").value;
    console.log(currentUsername);

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if(this.readyState == 4 && this.status == 200) {
            var output = JSON.parse(this.responseText);
            if (output == null) {
                console.log("Update failed");
            }
            else {
                console.log("Update successful");
                deleteCookie("token");
                createCookie("token", output.token);
                console.log(output);
                window.location.reload();
                                      
            }
        }
    }   
    xhttp.open("POST", "http://cs2s.yorkdc.net:5012/updateUsername", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("newUsername=" +newUsername + "&currentUsername=" + currentUsername);
    
}

function updatePassword() {
    var currentUsername = username;
    var newPassword = document.getElementById("updatedPassword").value;
    console.log(currentUsername);

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if(this.readyState == 4 && this.status == 200) {
            var output = JSON.parse(this.responseText);
            if (output == null) {
                console.log("Update failed");
            }
            else {
                console.log("Update successful");
                
            }
        }
    }   
    xhttp.open("POST", "http://cs2s.yorkdc.net:5012/updatePassword", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("newPassword=" +newPassword + "&currentUsername=" + currentUsername);
    
}

function getDestination() {
    var destQuery = window.location.search;            
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if(this.readyState == 4 && this.status == 200) {
            console.log ("content return");
            var output = JSON.parse(this.responseText);
            console.log(output);

            document.getElementById("name").innerHTML = output[1];
            document.getElementById("feature1").innerHTML = output[4];
            document.getElementById("feature1Description").innerHTML = output[5];
            document.getElementById("feature2").innerHTML = output[6];
            document.getElementById("feature2Description").innerHTML = output[7];
            document.getElementById("posterImg").src = output[8];
            

        }
    }
    xhttp.open("POST", "http://cs2s.yorkdc.net:5012/getDestination", false);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("destQuery=" + destQuery);
    
}
function getReviews() {
    var destQuery =  window.location.search;
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if(this.readyState == 4 && this.status == 200) {
            var output = JSON.parse(this.responseText);

            for (i = 0; i < output.length; i++) {
                console.log(output);
                var paragraph = document.createElement("p");
                var node = document.createTextNode(output [i][1]);
                console.log(node);
                paragraph.appendChild(node);
                var element = document.getElementById("reviews");
                var saveButton = document.getElementById("Save");
                element.appendChild(paragraph);

            }      
        
        }
    
    }
    xhttp.open("POST", "http://cs2s.yorkdc.net:5012/getReviews", false);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("destQuery=" + destQuery);   
}
function getHotelReviews() {
    var hotelQuery =  window.location.search;
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if(this.readyState == 4 && this.status == 200) {
            var output = JSON.parse(this.responseText);

            for (i = 0; i < output.length; i++) {
                console.log(output);
                var paragraph = document.createElement("p");
                var node = document.createTextNode(output [i][1]);
                console.log(node);
                paragraph.appendChild(node);
                var element = document.getElementById("reviews");
                var saveButton = document.getElementById("Save");
                element.appendChild(paragraph);

            }      
        
        }
    
    }
    xhttp.open("POST", "http://cs2s.yorkdc.net:5012/getHotelReviews", false);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("hotelQuery=" + hotelQuery);   
}

function saveReview() {
    var review = document.getElementById("SubmittedReviewText").value;
    var destId = window.location.search;
    var cookie = getCookie("token");
        if (cookie != "") {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    var output = JSON.parse(this.responseText);
                    console.log(output);
                    window.location.reload();
                }
            } 
            xhttp.open("POST", "http://cs2s.yorkdc.net:5012/saveReview", true); 
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("review=" + review + "&destId=" + destId);
        } 
        else {
            console.log("Please log in");
        }
}

function saveHotelReview() {
    var review = document.getElementById("SubmittedReviewText").value;
    var hotelId = window.location.search;
    var cookie = getCookie("token");
        if (cookie != "") {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    var output = JSON.parse(this.responseText);
                    console.log(output);
                    window.location.reload();
                }
            } 
            xhttp.open("POST", "http://cs2s.yorkdc.net:5012/saveHotelReview", true); 
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("review=" + review + "&hotelId=" + hotelId);
        } 
        else {
            console.log("Please log in");
        }
}

function getHotels() {
    var hotelQuery = window.location.search;            
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if(this.readyState == 4 && this.status == 200) {
            console.log ("content return");
            var output = JSON.parse(this.responseText);
            console.log(output);

            document.getElementById("name").innerHTML = output[2];
            document.getElementById("feature1").innerHTML = output[5];
            document.getElementById("feature1Description").innerHTML = output[6];
            document.getElementById("feature2").innerHTML = output[7];
            document.getElementById("feature2Description").innerHTML = output[8];
            document.getElementById("posterImg").src = output[9];
            

        }
    }
    xhttp.open("POST", "http://cs2s.yorkdc.net:5012/getHotels", false);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("hotelQuery=" + hotelQuery);
    
}

function showHotels() { 
    var hotels = document.getElementById("hotels");
    var flights = document.getElementById("flights");
    if(hotels.style.display === "none") {
        flights.style.display = "none";  
        hotels.style.display = "block";
        
          
    }
}

function showFlights() {
    var hotels = document.getElementById("hotels");
    var flights = document.getElementById("flights");
    if(flights.style.display === "none") {
        flights.style.display = "block";  
        hotels.style.display = "none";
        
          
    }
}

function getTopHotels() {
    var destQuery = window.location.search;
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            console.log("Hotel return");
            var output = JSON.parse(this.responseText);
            console.log(output);
            document.getElementById("hotel1Name").innerHTML = output[0][1];
            document.getElementById("hotel1Name").href = "hotels.html" + output[0][0];
            document.getElementById("hotel1Description").innerHTML = output[0][2];
            document.getElementById("hotel1Img").src = output[0][3];

            document.getElementById("hotel2Name").innerHTML = output [1][1];
            document.getElementById("hotel2Name").href = "hotels.html" + output[1][0];
            document.getElementById("hotel2Description").innerHTML = output[1][2];
            document.getElementById("hotel2Img").src = output[1][3];
            
            document.getElementById("hotel3Name").innerHTML = output [2][1];
            document.getElementById("hotel3Name").href = "hotels.html" + output[2][0];
            document.getElementById("hotel3Description").innerHTML = output[2][2];
            document.getElementById("hotel3Img").src = output[2][3];

            document.getElementById("hotel4Name").innerHTML = output [3][1];
            document.getElementById("hotel4Name").href = "hotels.html" + output[3][0];
            document.getElementById("hotel4Description").innerHTML = output[3][2];
            document.getElementById("hotel4Img").src = output[3][3];

        }
    }
    xhttp.open("POST", "http://cs2s.yorkdc.net:5012/loadRelatedHotels", false);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("destQuery=" + destQuery);
}
var Saved;
function saveAsFavourite() {
    if (!Saved) {
        var cookie = getCookie("token");
        if (cookie != "") {
            var destId = window.location.search;
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    var output = JSON.parse(this.responseText);
                    console.log(output);
                    window.location.reload();
                }
            } 
            xhttp.open("POST", "http://cs2s.yorkdc.net:5012/saveDestination", true); 
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("username=" + username + "&destId=" + destId);
        } 
        else {
            console.log("Please log in");
        }
    } else {
        var cookie = getCookie("token");
        var destId = window.location.search;
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                var output = JSON.parse(this.responseText);
                console.log(output);
                window.location.reload();
            }
        } 
        xhttp.open("POST", "http://cs2s.yorkdc.net:5012/unsaveDestination", true); 
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("username=" + username + "&destId=" + destId);
    }

}

var hotelSaved;
function savehotelAsFavourite() {
    if (!hotelSaved) {
        var cookie = getCookie("token");
        if (cookie != "") {
            var hotelId = window.location.search;
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    var output = JSON.parse(this.responseText);
                    console.log(output);
                    window.location.reload();
                }
            } 
            xhttp.open("POST", "http://cs2s.yorkdc.net:5012/saveHotel", true); 
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("username=" + username + "&hotelId=" + hotelId);
        } 
        else {
            console.log("Please log in");
        }
    } else {
        var cookie = getCookie("token");
        var hotelId = window.location.search;
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                var output = JSON.parse(this.responseText);
                console.log(output);
                window.location.reload();
            }
        } 
        xhttp.open("POST", "http://cs2s.yorkdc.net:5012/unsaveHotel", true); 
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("username=" + username + "&hotelId=" + hotelId);
    }

}


function checkIfFavourite() {
    console.log("Checking if saved");
    var cookie = getCookie("token");
    if (cookie != "") {
        var destId = window.location.search;
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if(this.readyState == 4 && this.status == 200) {
                var output = JSON.parse(this.responseText);
                if(output != null) {
                    Saved = true;
                    console.log(output);
                    document.getElementById("Save").innerHTML = "Unsave";
                } else { 
                    Saved = false;
                    console.log("Failed");
                    document.getElementById("Save").innerHTML = "Save";
                }
            }            
        } 
        xhttp.open("POST", "http://cs2s.yorkdc.net:5012/CheckIfSaved", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("username=" + username + "&destId=" +destId);
    } else {
        console.log("Please log in");
        Saved = false;
        document.getElementById("Save").innerHTML = "Save";
    }
}

function checkIfHotelFavourite() {
    console.log("Checking if saved");
    var cookie = getCookie("token");
    if (cookie != "") {
        var hotelId = window.location.search;
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if(this.readyState == 4 && this.status == 200) {
                var output = JSON.parse(this.responseText);
                if(output != null) {
                    Saved = true;
                    console.log(output);
                    document.getElementById("Save").innerHTML = "Unsave";
                } else { 
                    Saved = false;
                    console.log("Failed");
                    document.getElementById("Save").innerHTML = "Save";
                }
            }            
        } 
        xhttp.open("POST", "http://cs2s.yorkdc.net:5012/CheckIfHotelSaved", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("username=" + username + "&hotelId=" +hotelId);
    } else {
        console.log("Please log in");
        Saved = false;
        document.getElementById("Save").innerHTML = "Save";
    }
}

function saveSearchResults() {
    var searchQuery = document.getElementById("SearchQuery").value;
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if(this.readyState == 4 && this.status == 200) {
            var output = JSON.parse(this.responseText)            
            console.log(output) 
            window.sessionStorage.setItem("Search Results", JSON.stringify(output));
            window.location.href = "SearchResults.html";
        }
    }
    xhttp.open("POST", "http://cs2s.yorkdc.net:5012/getSearchResults", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("searchQuery=" + searchQuery);   
    
}

function getSearchResults() {
    var output = JSON.parse(sessionStorage.getItem("Search Results"));
    console.log(output);
    for (i = 0; i < output.length; i++) {
        //Create the elements for the result
        var image = document.createElement("img");
        var namePara = document.createElement("a");
        var feature1 = document.createElement("p");
        var gap = document.createElement("br");
        //Find the data from the returned array
        
        var nameText = document.createTextNode(output [i][1]);
        var link = "Destination.html?destId="+ output[i][0];
        console.log(link);
        namePara.href = link;
    
        
        var feature1Text = document.createTextNode(output[i][5]);
        image.src = output[i][8];
        //Attach the data to the appropriete re
        namePara.appendChild(nameText);
        feature1.appendChild(feature1Text);
        //Find the div in the page
        var element = document.getElementById("searchResultsContainer");
        
        //Attach the paragraph to the div
        element.appendChild(image);
        element.appendChild(gap);
        element.appendChild(namePara);
        element.appendChild(feature1);
        
    }
    sessionStorage.removeItem("Search Results");
}
function getAllDestinations() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if(this.readyState == 4 && this.status == 200) {
            var output = JSON.parse(this.responseText)
            for (i = 0; i < output.length; i++) {
                //Create the elements for the result
                var image = document.createElement("img");
                var namePara = document.createElement("a");
                var feature1 = document.createElement("p");
                var gap = document.createElement("br");
                //Find the data from the returned array
                
                var nameText = document.createTextNode(output [i][1]);
                var link = "Destination.html?destId="+ output[i][0];
                console.log(link);
                namePara.href = link;
            
                
                var feature1Text = document.createTextNode(output[i][5]);
                image.src = output[i][8];
                //Attach the data to the appropriete re
                namePara.appendChild(nameText);
                feature1.appendChild(feature1Text);
                //Find the div in the page
                var element = document.getElementById("searchResultsContainer");
                
                //Attach the paragraph to the div
                element.appendChild(image);
                element.appendChild(gap);
                element.appendChild(namePara);
                element.appendChild(feature1);
                
            }

        }
    }
    xhttp.open("GET","http://cs2s.yorkdc.net:5012/displayAllDestinations", true);
    xhttp.send();
}
