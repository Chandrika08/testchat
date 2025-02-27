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

<table>
  <tr>
    <td align="center">
      <strong>Login Screen</strong><br>
      <img src="https://github.com/Chava-Sai/Chat-Buddy/assets/129037829/3626916d-c15e-4387-b58f-92816cb675f3" alt="Login Screen" width="400"/>
    </td>
    <td align="center">
      <strong>Signup</strong><br>
      <img src="https://github.com/Chava-Sai/Chat-Buddy/assets/129037829/1b6fb915-2729-4892-9277-b4e8fea64cd9" alt="Signup" width="400"/>
    </td>
  </tr>
  <tr>
    <td align="center">
      <strong>Successfully Registered</strong><br>
      <img src="https://github.com/Chava-Sai/Chat-Buddy/assets/129037829/1c7f5431-d7dd-45f8-ba79-072680010dac" alt="Successfully Registered" width="400"/>
    </td>
    <td align="center">
      <strong>Home Screen</strong><br>
      <img src="https://github.com/Chava-Sai/Chat-Buddy/assets/129037829/0e459464-7683-49ff-988b-9dc3743cc14d" alt="Home Screen" width="400"/>
    </td>
  </tr>
  <tr>
    <td align="center">
      <strong>Group Chat Screen</strong><br>
      <img src="https://github.com/Chava-Sai/Chat-Buddy/assets/129037829/de44c93e-77d9-4c17-97f8-726ec3ec1be5" alt="Group Chat Screen" width="400"/>
    </td>
    <td align="center">
      <strong>Search Screen</strong><br>
      <img src="https://github.com/Chava-Sai/Chat-Buddy/assets/129037829/06f0e627-563c-464f-8f6e-b59f04e188d4" alt="Search Screen" width="400"/>
    </td>
  </tr>
  <tr>
    <td align="center">
      <strong>Audio Call</strong><br>
      <img src="https://github.com/Chava-Sai/Chat-Buddy/assets/129037829/21e88f05-93e4-43cd-ad00-ffd1241a131a" alt="Audio Call" width="400"/>
    </td>
    <td align="center">
      <strong>Video Call</strong><br>
      <img src="https://github.com/Chava-Sai/Chat-Buddy/assets/129037829/466e9b56-c25c-4e5e-baab-bd52becdef01" alt="Video Call" width="400"/>
    </td>
  </tr>
  <tr>
    <td align="center">
      <strong>Members Screen</strong><br>
      <img src="https://github.com/Chava-Sai/Chat-Buddy/assets/129037829/260d8ec2-f67b-4915-9601-3dba0d3528f7" alt="Members Screen" width="400"/>
    </td>
    <td align="center">
      <strong>Settings Screen</strong><br>
      <img src="https://github.com/Chava-Sai/Chat-Buddy/assets/129037829/374f8d6b-f1ac-48f4-b223-cfaa36deec3b" alt="Settings Screen" width="400"/>
    </td>
  </tr>
</table>

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

## Integration

1. **Firebase Firestore**: Stores user and group details. Each user’s email, name, groups, and unique IDs are stored in Firestore.
   
   - **Users Collection**: Stores user-specific information.
   - **Groups Collection**: Stores information on group names, messages, and members.

2. **Zego Cloud Platform**: Used for voice and video calling features. This is integrated via the Zego Cloud API and Flutter's `http` package to handle requests.


---

**Thank you for checking out Chat Buddy! Let’s chat, connect, and create bonds together!**

---
