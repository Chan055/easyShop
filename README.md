# Mobile Final Exam: EasyShop

## 1. App Concept and Design

### 1.1 User Personas

#### Persona 1:
- **Name**: Kyi Kyi Lin
- **Age**: 30 years old
- **Occupation**: Senior Marketing Manager

**Needs**:
- Kyi enjoys shopping for home goods but finds it hard to remember what she already has at home. She needs an app that allows her to quickly organize and categorize different products for personal and home use.

**Goals**:
- Create multiple lists (e.g., home goods, groceries)
- Track items that need to be bought

[GitHub Repository](https://github.com/Chan055/easyShop)  
[APK File](https://github.com/Chan055/easyShop/blob/main/easyshop_apk/app-release.apk.zip)

#### Persona 2:
- **Name**: Nay Chi
- **Age**: 28 years old
- **Occupation**: Freelance Designer

**Needs**:
- Nay Chi enjoys exploring new home furniture products but is conscious of sustainability. She wants to minimize waste and track her usage of eco-friendly products.

**Goals**:
- Create eco-friendly and sustainable product lists
- Add eco-friendly items she wants to try or buy again

---

### 1.2 App Goals

- **Simplify the shopping process for home goods**: Provide users with an easy way to manage and organize their shopping experiences, from planning to purchasing.
- **Enable the creation of customized shopping lists**: Allow users to create tailored lists based on categories like skincare, makeup, and personal care, helping them shop smarter.
- **Track products and add wishlist**: Let users monitor what items they have and what they might want to purchase next.
- **Create a seamless, intuitive interface for effortless shopping**: Ensure that users can navigate through the app easily, with clear organization and minimal steps to complete tasks.

---

### 1.3 Mock Up
*Add your app mockup images here.*

#### Start Page:
<img src="https://i.postimg.cc/G3MrfFPf/IMAGE-2568-04-29-17-49-50.jpg" width="500"/>

#### Login Page:
<img src="https://i.postimg.cc/hGsnLT2c/IMAGE-2568-04-29-17-53-23.jpg" width="500"/>

#### Signup Page:
<img src="https://i.postimg.cc/90pgSYqQ/IMAGE-2568-04-29-17-53-55.jpg" width="500"/>

#### Catagory:
<img src="https://i.postimg.cc/QxFcvq7Y/IMAGE-2568-04-29-17-54-28.jpg" width="500"/>

#### Catagory list:
<img src="https://i.postimg.cc/QxFcvq7Y/IMAGE-2568-04-29-17-54-28.jpg" width="500"/>

#### Profile Page:
<img src="https://i.postimg.cc/CKrDxvWq/IMAGE-2568-04-29-17-54-55.jpg" width="500"/>

---

### 1.4 User Flow

#### Flow 1: For new user (Sign up and Login)
- Open app → Tap “Sign Up” → Enter Email & Password → Tap “Sign Up” → Log in again → Tap “+” button for new category list → Tap the customized category list → Tap “+” button to fill the item name & quantity

#### Flow 2: For registered user (Login)
- Open app → Tap “Login” → Enter Email & Password → Tap “Log in” → Tap “+” button for new category list → Tap the customized category list → Tap “+” button to fill the item name & quantity

#### Flow 3: For managing items
- Tap the customized category list → Tap “+” button to fill the item name & quantity → Select item → Delete item

#### Flow 4: Customizing Experience
- Open app → Tap “Login” → Navigate to “Profile” → Toggle Dark Mode → Tap “Logout” when finished

---

## 2. App Implementation

### 2.1 Development Details

**Tools Used**:
- Flutter 3.29.1
- Dart 3.7.0
- Package: Provider
- Storage: Hive
- Authentication: Firebase

### 2.2 Features Implemented

**Feature Checklist: Shopping List App**
- **Firebase Authentication** (User Sign Up, Login, Logout): Users can securely sign up, log in, and log out using Firebase Authentication.
- **Customized Welcome Screen with Unique Theme**: The app greets users with a personalized message and incorporates a visually appealing, custom theme based on their preferences.
- **Create and Remove Shopping Lists with Customizable Names**: Users have the ability to create personalized shopping lists and remove them when no longer needed, with a simple modal interface for naming.
- **Seamless Navigation to Detailed List Items**: Users can easily tap on any shopping list to be redirected to a detailed screen showcasing the individual items within that list.
- **Account Deletion with Firebase Integration**: Users can choose to delete their account and all related data, with the change reflected in their Firebase profile and authentication settings.
- **Logout Functionality with Redirect to Login Screen**: After logging out, users are automatically redirected to the login screen, ensuring a clean exit from the app.

### 2.3 App Screenshots
*Add your app screenshots here.*

#### All App Pages:
<img src="https://i.postimg.cc/QxFcvq7Y/IMAGE-2568-04-29-17-54-28.jpg" width="500"/>
<img src="https://i.postimg.cc/CKrDxvWq/IMAGE-2568-04-29-17-54-55.jpg" width="500"/>
<img src="https://i.postimg.cc/hjxjRpgg/IMAGE-2568-04-29-17-55-18.jpg" width="500"/>
<img src="https://i.postimg.cc/SRTHTb5K/IMAGE-2568-04-29-17-55-38.jpg" width="500"/>
<img src="https://i.postimg.cc/Njhdg01c/IMAGE-2568-04-29-17-56-06.jpg" width="500"/>
<img src="https://i.postimg.cc/kM6Z9zkW/IMAGE-2568-04-29-17-56-21.jpg" width="500"/>
<img src="https://i.postimg.cc/BQ3CyzsS/IMAGE-2568-04-29-17-56-38.jpg" width="500"/>
<img src="https://i.postimg.cc/Vvmb73t2/IMAGE-2568-04-29-17-56-52.jpg" width="500"/>
<img src="https://i.postimg.cc/s2WQ3V9t/IMAGE-2568-04-29-17-57-03.jpg" width="500"/>

---

## 3. Deployment

### 3.1 Build Type
- **Debug**
- **Release**

### 3.2 Platform Tested
- Android
- iOS

### 3.3 README & Install Guide

**Steps to install the EasyShop App:**
1. Download the `.apk` file
2. Open the file on an Android device

---

## 4. Reflection

- **Struggled with managing state across screens**: Encountered difficulties in ensuring state updates were correctly reflected, particularly when syncing user data such as the display name between the app and Firebase Authentication.
- **Mastered dynamic state management using Provider**: Gained practical experience in using Provider to manage dynamic data, such as updating and removing shopping lists, and ensuring consistent UI updates across multiple screens.
- **Hands-on experience with Firebase Authentication**: Learned how to implement Firebase Authentication for handling secure login, sign-up, user session management, and account deletion — ensuring a seamless experience for users.

---

## 5. AI Assisted Development

### 5.1 AI-Assisted Idea Generation
**Prompt Used**: "Suggest mobile app ideas for users to manage shopping lists and track products."  
**Result**: AI suggested an app idea for organizing shopping lists by categories (e.g., skincare, makeup, groceries) and including features to track product quantities, restock alerts, and wishlist creation.

### 5.2 AI-Assisted UI Design
**Prompt Used**: "Design a simple layout for a shopping list app in Flutter with a bottom navigation bar."  
**Result**: AI provided a code structure for a Flutter Scaffold, with a BottomNavigationBar and separate pages for the shopping list, items, and profile.

### 5.3 AI-Assisted Code Writing
**Prompt Used**: "Flutter code to create a dynamic ListView for managing shopping list items with add/edit functionality."  
**Result**: The generated code was integrated into the app to display shopping items, with logic for adding, editing, and deleting items directly from the list.

### 5.4 AI-Assisted Debugging
**Prompt Used**: "My Flutter app crashes when I try to add a product to the shopping list. Here's the error: [attached error log]"  
**Result**: AI recommended checking for null values in the product data and verifying that the ListView was correctly updating when new items were added. It suggested adding a check for duplicate entries and proper error handling for invalid input, which resolved the issue.

### 5.5 AI-Assisted Deployment
**Prompt Used**: "How to generate a signed APK in Flutter for release?"  
**Result**: AI suggested running the command `flutter build apk --release` and guided on setting up the signing keys in the `key.properties` file. It also provided detailed steps to configure the `build.gradle` file for signing the APK, ensuring it was ready for production release and testing on real devices.

---

## Final Checklist

- Complete all sections of the report.
- Attach GitHub repository link and installation file (APK/IPA).
- Provide a reflection and use AI insights effectively.
