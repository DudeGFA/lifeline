API Endpoint List:

1. Emergency Message Creation:
   - Endpoint: /api/emergency_message/
   - Method: POST
   - Description: Create an emergency message and send it to the nearest hospital.
   - Parameters:
     - location: Location coordinates where the emergency occurred.
   - Authentication: Required

2. Registration Endpoint:
   - Endpoint: /register/
   - Method: POST
   - Description: Register a new user.
   - Parameters:
     - email: User's email address.
     - first_name: User's first name.
     - last_name: User's last name.
     - password: User's password.
   - Authentication: Required

3. Login Endpoint:
   - Endpoint: /login/
   - Method: POST
   - Description: Log in an existing user.
   - Parameters:
     - email: User's email address.
     - password: User's password.
   - Authentication: Required (Authentication required for accessing protected resources)

4. Dashboard Endpoint:
   - Endpoint: /dashboard/
   - Method: GET
   - Description: Retrieve user's dashboard information.
   - Authentication: Token-based authentication required

5. Video Chat Endpoint:
   - Endpoint: /meeting/
   - Method: GET
   - Description: Access the video chat feature.
   - Authentication: Token-based authentication required

6. Logout Endpoint:
   - Endpoint: /logout/
   - Method: POST
   - Description: Log out the user.
   - Authentication: Token-based authentication required

7. Join Room Endpoint:
   - Endpoint: /join/
   - Method: POST
   - Description: Join a meeting room.
   - Parameters:
     - roomID: Unique identifier for the meeting room.
   - Authentication: Token-based authentication required

8. Medical Practitioner Profile Endpoint:
   - Endpoint: /medical_practitioner_profile/
   - Method: GET, POST
   - Description: Retrieve or update the user's medical practitioner profile data.
   - Authentication: Token-based authentication required

9. Nearby Hospitals Endpoint:
   - Endpoint: /nearby-hospitals/
   - Method: POST
   - Description: Find nearby hospitals based on user's location.
   - Parameters:
     - location: Latitude and longitude coordinates of the user's location.
   - Authentication: Token-based authentication required
