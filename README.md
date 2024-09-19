## Note: The project is currently under development, and features are being actively implemented and refined.

# eMart: Developer README

**eMart** is a Flutter-based e-commerce platform with separate applications for users and admins. The project focuses on modular architecture, efficient state management, and seamless integration of third-party services like Firebase, payment gateways, and HTTP APIs.

## Features
### User Application
- User Registration and Authentication
- Product Browsing
- Shopping Cart
- Order Placement
- Payment Integration
- Order Tracking
- User Profile Management
- Feedback and Reviews

### Admin Application
- Product Management
- Order Processing
- User Management
- Analytics and Reporting
- Promotions and Discounts
- System Configuration
- Customer Support

---

## Dependency Overview

Key dependencies for the eMart project include state management, routing, API integrations, and Firebase services.

### Core Dependencies
- **State Management:** `bloc`, `provider`, `flutter_bloc`, `hydrated_bloc`
- **Routing:** `go_router`
- **UI Elements:** `flutter_svg`, `flutter_rating_bar`, `smooth_page_indicator`
- **Networking:** `http`, `connectivity_plus`, `cached_network_image`
- **Firebase:** `firebase_auth`, `firebase_messaging`, `firebase_ui_auth`, `firebase_ui_oauth_google`
- **Payments:** `razorpay_flutter`, `phonepe_payment_sdk`
- **Local Storage:** `hive_cache`
- **Logging:** `logger`

### Firebase Services
- Firebase authentication, push notifications, and OAuth integration for user management and security.

This project is structured for scalability and maintainability, leveraging Flutter’s best practices for building high-performance mobile applications.
