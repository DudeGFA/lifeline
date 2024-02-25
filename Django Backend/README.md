**Documentation for UserProfileView:**

### Class: UserProfileView(APIView)

This view handles the retrieval and creation of user profiles, including emergency contact information.

#### Endpoints:

- **GET /api/userprofile/**
  - Retrieves the user profile information for the specified user.
  - If no `username` is provided, a new user is created, and their profile information is returned.
  - Returns a JSON response containing the user's username and profile data.

- **GET /api/userprofile/<user_id>**
  - Retrieves the user profile information for the specified `user_id`.
  - Returns a JSON response containing the user's username and profile data.

#### Methods:

- **GET Method: `def get(self, request, username=None)`**
  - Parameters:
    - `request`: Django request object.
    - `username` (optional): Username for which to retrieve the profile. If not provided, a new user is created.
  - Returns a JSON response containing the user's username and profile data.

- **POST Method: `def post(self, request, username=None)`**
  - Parameters:
    - `request`: Django request object containing the user profile and emergency contact information.
    - `username` (optional): Username for which to create/update the profile. If not provided, a new user is created.
  - Creates or updates the user profile and associated emergency contact information.
  - Returns a JSON response containing the user's username, profile data, and emergency contact data (if provided).

#### Request Parameters:

- **GET Request:**
  - `username` (optional): Username for which to retrieve the profile.

- **POST Request:**
  - `username` (optional): Username for which to create/update the profile.
  - `request.data`: User profile information to be updated or created.
    - Expected fields: ['phone_number', 'relationship', 'home_address', 'preferred_hospital', 'conditions', 'allergies', 'medication_name', 'medication_dosage', 'medication_start_date', 'blood_type', 'organ_donor_status', 'preferred_language', 'profile_picture', 'emergency_contact'].
    - Optional emergency contact information under the key "emergency_contact".

    **sample POST request body**
    ```json
    {
            "phone_number": "1234567890",
            "relationship": "Friend",
            "home_address": "123 Main St, Cityville",
            "preferred_hospital": "City General Hospital",
            "conditions": "Asthma",
            "allergies": "Peanuts",
            "medication_name": "Ventolin",
            "medication_dosage": "2 puffs every 6 hours",
            "medication_start_date": "2023-01-15",
            "blood_type": "O+",
            "organ_donor_status": "Yes",
            "preferred_language": "English",
            "profile_picture": "path/to/profile_picture.jpg",
            "emergency_contact": [
            {
                "relationship": "Family",
                "first_name": "John",
                "phone_number": "9876543210"
            },
            {
                "relationship": "Friend",
                "first_name": "Jane",
                "phone_number": "5555555555"
            }
            ]
        }
    ```

#### Response Format:

- **Success Response:**
  - Status Code: 200 OK
  - JSON Object:
    ```json
    {
        "user_id": "username",
        "data": {
            "phone_number": "1234567890",
            "relationship": "Friend",
            "home_address": "123 Main St, Cityville",
            "preferred_hospital": "City General Hospital",
            "conditions": "Asthma",
            "allergies": "Peanuts",
            "medication_name": "Ventolin",
            "medication_dosage": "2 puffs every 6 hours",
            "medication_start_date": "2023-01-15",
            "blood_type": "O+",
            "organ_donor_status": "Yes",
            "preferred_language": "English",
            "profile_picture": "path/to/profile_picture.jpg",
            "emergency_contact": [
            {
                "relationship": "Family",
                "first_name": "John",
                "phone_number": "9876543210"
            },
            {
                "relationship": "Friend",
                "first_name": "Jane",
                "phone_number": "5555555555"
            }
            ]
        }
    }
    ```

- **Error Response:**
  - Status Code: 400 Bad Request or 500 Internal Server Error
  - JSON Object:
    ```json
    {
      "error": "Description of the error"
    }
    ```

#### Notes:

- If the `emc` field is present in the POST request data, emergency contact information is processed and associated with the user.

#### URLs:

- **Endpoint 1: /api/userprofile/**
  - Method: GET
  - Description: Retrieve user profile information. If no username is provided, a new user is created.

- **Endpoint 2: /api/userprofile/<user_id>**
  - Method: GET
  - Description: Retrieve user profile information for the specified user_id.