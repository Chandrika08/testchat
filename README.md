---

# Chat Buddy App

![Chat Buddy](https://i.imgur.com/fbUHTPQ.png)

Welcome to **Chat Buddy** – where connections happen! This app is designed to facilitate communication through group chats, voice, and video calls, with an emphasis on privacy, role differentiation, and user experience.

---

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Screenshots](#screenshots)
- [Technology Stack](#technology-stack)
- [Installation](#installation)
- [Usage](#usage)
- [Authentication](#authentication)
- [Widgets](#widgets)
- [Integration](#integration)
- [Contributors](#contributors)

---

## Introduction

**Chat Buddy** is an intuitive group chat app built for real-time communication, providing seamless collaboration and dynamic interactions. It features distinct roles for admins and students, ensuring a personalized user experience.

### Key Highlights:
- 🌐 Connect Anytime, Anywhere
- 👥 Group Dynamics Redefined
- 🔐 Privacy at the Core
- 🤝 Building Communities

---

## Features

- **Video and Voice Call Functionality**: Experience clear voice and video calls across any device.
- **Group Chat**: Engage in dynamic discussions through instant messaging.
- **Role Differentiation**: Admins manage the group, and students enjoy unique privileges.
- **Firebase Authentication**: Secure login for students and admins with role-specific access.
- **Password Recovery**: Easily reset your password with Firebase integration.
- **Group Management**: View group members, exit groups, and manage users.
- **Zego Cloud Integration**: Seamless voice and video calls powered by Zego Cloud.

---

## Screenshots

### Login Screen
![Login Screen](<img src="https://github.com/Chava-Sai/Chat-Buddy/assets/129037829/3626916d-c15e-4387-b58f-92816cb675f3" alt="Login Screen" width="400"/>
)

### Home Screen
![Home Screen](path_to_home_screen_image)

### Group Chat Screen
![Group Chat Screen](path_to_group_chat_image)

### Search Screen
![Search Screen](path_to_search_screen_image)

### Members Screen
![Members Screen](path_to_members_screen_image)

### Settings Screen
![Settings Screen](path_to_settings_screen_image)

---

## Technology Stack

- **Frontend**: Flutter
- **Backend**: Firebase (Authentication, Firestore)
- **API Integration**: Zego Cloud Platform (for voice and video calls)
- **Other Libraries**: 
  - Flutter's `http` package for HTTP requests
  - Shared Preferences for local storage

---

## Installation

To get a local copy up and running, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/your_username/chat-buddy.git
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Configure Firebase:
   - Add your Firebase project configurations to the app (iOS and Android).

4. Run the app:
   ```bash
   flutter run
   ```

---

## Usage

1. **Login**: Students and admins can log in using their email and password.
2. **Forgot Password**: Reset passwords via email using Firebase’s password recovery feature.
3. **Group Chat**: Join or create groups for discussions. All messages are stored securely in Firebase Firestore.
4. **Voice/Video Calls**: Enjoy high-quality voice and video calls using the Zego Cloud API.

---

## Authentication

We use **Firebase Authentication** to ensure a secure login process for both students and admins. The login screens for these roles are customized to provide access to the app’s features based on the user’s role.

- **Students**: Log in to access chat features and groups.
- **Admins**: Have additional permissions to manage users and groups.

---

## Widgets

### Pre-learned Widgets:
- **MaterialApp**
- **Text**, **Center**, **AppBar**
- **Container**, **Row**, **Column**
- **ListTile**, **CircleAvatar**
- **Bottom Navigation Bar**
  
### New Widgets We Learned:
- **GestureDetector**
- **StreamBuilder**
- **FloatingActionButton**
- **CircularProgressIndicator**
- **ClipPath** (AppBarClipper)
- **LinearGradient**

---

## Integration

1. **Firebase Firestore**: Stores user and group details. Each user’s email, name, groups, and unique IDs are stored in Firestore.
   
   - **Users Collection**: Stores user-specific information.
   - **Groups Collection**: Stores information on group names, messages, and members.

2. **Zego Cloud Platform**: Used for voice and video calling features. This is integrated via the Zego Cloud API and Flutter's `http` package to handle requests.

---

## Contributors

- **A. Saras Chandrika** (21BDS003)
- **Ch. Srinivasa Sai** (21BDS012)
- **K. Sai Kartheek Reddy** (21BDS027)
- **R. Vinay Kumar** (21BDS056)

---

**Thank you for checking out Chat Buddy! Let’s chat, connect, and create bonds together!**

---
