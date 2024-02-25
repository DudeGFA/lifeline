Emergency Message Creation Endpoint:

Purpose: Allows users to send emergency messages to the nearest hospital.
Method: POST
URL: /api/emergency-message/
Parameters:
location: The location coordinates where the emergency occurred.
Authentication: Required (Token-based authentication)
Response: Returns a success message if the emergency message is sent successfully.
Registration Endpoint:

Purpose: Enables users to register a new account in the system.
Method: POST
URL: /api/register/
Parameters:
email: User's email address.
first_name: User's first name.
last_name: User's last name.
password: User's password.
Authentication: Not required
Response: Returns a success message upon successful registration.
Login Endpoint:

Purpose: Allows users to log in to their existing accounts.
Method: POST
URL: /api/login/
Parameters:
email: User's email address.
password: User's password.
Authentication: Not required
Response: Returns an authentication token upon successful login.
Dashboard Endpoint:

Purpose: Retrieves the user's dashboard information.
Method: GET
URL: /api/dashboard/
Parameters: None
Authentication: Required (Token-based authentication)
Response: Returns the user's dashboard data.
Video Chat Endpoint:

Purpose: Provides access to the video chat feature.
Method: POST
URL: /api/video-chat/
Parameters: None
Authentication: Required (Token-based authentication)
Response: Returns data necessary for initiating a video chat session.
Logout Endpoint:

Purpose: Logs out the user from the system.
Method: POST
URL: /api/logout/
Parameters: None
Authentication: Required (Token-based authentication)
Response: Returns a success message upon successful logout.
Join Room Endpoint:

Purpose: Allows users to join a meeting room.
Method: POST
URL: /api/join-room/
Parameters:
roomID: The ID of the meeting room to join.
Authentication: Required (Token-based authentication)
Response: Returns data necessary for joining the meeting room.
Medical Practitioner Profile Endpoint:

Purpose: Retrieves or updates the user's medical practitioner profile data.
Method: GET (to retrieve), PUT/PATCH (to update)
URL: /api/medical-practitioner-profile/
Parameters: None (for retrieval), Profile data fields (for update)
Authentication: Required (Token-based authentication)
Response: Returns the user's medical practitioner profile data.
Nearby Hospitals Endpoint:

Purpose: Finds nearby hospitals based on the user's location.
Method: POST
URL: /api/nearby-hospitals/
Parameters:
location: The location coordinates.
Authentication: Required (Token-based authentication)
Response: Returns a list of nearby hospitals.