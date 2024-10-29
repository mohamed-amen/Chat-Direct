# Chat Direct

This flutter project was built to help me and my friends open WhatsApp chats directly without the need to save the phone number you want to chat with. and we find it pretty useful! 

The application is currently only available in Arabic.

## Features & How it works
- selecting country code from the dialogue
- phone code data are loaded from a JSON file in the ```/assets``` folder
- The selected country code will be saved locally using Hive and loaded whenever you open the app
- when you fill code field the app will search among phone codes, if there is only one similar result it will select it automatically
- pressing the final button "ابدأ المحادثة" will launch ```wa.me``` URL with the phone code + number

## Screenshots

<img src="https://github.com/user-attachments/assets/d9c2cd8c-c173-4f61-923c-078251fd5f4c" width="500" />
<img src="https://github.com/user-attachments/assets/34379f71-4ad1-4f58-8396-354d35c2dbee" width="500" />
<img src="https://github.com/user-attachments/assets/9a0d7826-8ad2-4ccb-80b1-88a2e9b2dc1c" width="500" />
<img src="https://github.com/user-attachments/assets/536a624e-acef-4ec1-865d-b43e98d02490" width="500" />



