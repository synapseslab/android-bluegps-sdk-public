> [!CAUTION]
> This repository is under development doesn't use for now.

![BlueGPS Logo](android-docs/docs/images/synapses_bluegps.png)

<p align="center">
  <a href="https://opensource.org/licenses/Apache-2.0"><img alt="License" src="https://img.shields.io/badge/License-Apache%202.0-blue.svg"/></a>
  <a href="https://android-arsenal.com/api?level=21"><img alt="API" src="https://img.shields.io/badge/API-21%2B-brightgreen.svg?style=flat"/></a>
</p>

# BlueGPS Android SDK

| Latest Update    | Stable Release	 | Beta Release    | Alpha Release   |
| ---------------- | --------------- | --------------- | --------------- |
| March 01, 2024   | 2.0.0           | -               | -               |

## Integration guide
### Requirements

Minimum requirements are:

- Minimum SDK: 21
- Usage of Android X

### Adding the Library to an existing Android application

Before you add BlueGPS depencencies, update your repositories in the `settings.gradle` file to include this repository

```gradle
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
        maven { url = uri("https://jitpack.io") }
    }
}
```

Or if you're using an older project setup, add this repository  in your project level `build.gradle` file:

```gradle
allprojects {
    repositories {
        google()
        mavenCentral()
        maven { url = uri("https://jitpack.io") }
    }
}
```

Then add the dependency for BlueGPS-SDK in the `build.gradle` file for your app or module:

```gradle
dependencies {
    implementation 'com.github.synapseslab:android-bluegps-sdk-public:<version>'
}
```

The `version` corresponds to release version, for example:

```gradle
dependencies {
    implementation 'com.github.synapseslab:android-bluegps-sdk-public:2.0.0'
}
```

## Usage guide
### Getting Started
Your first step is initializing the BlueGPSLib, which is the main entry point for all operations in the library. BlueGPSLib is a singleton: you'll create it once and re-use it across your application.

A best practice is to initialize BlueGPSLib in the Application class:

```kotlin
class App : Application() {
    override fun onCreate() {
        super.onCreate()
        
        BlueGPSLib.instance.initSDK(
            sdkEnvironment = Environment.sdkEnvironment,
            context = applicationContext,
            enabledNetworkLogs = true
        )
    }
}
```

> [!NOTE]  
> The BlueGSP-SDK use an `Environment` where integrator have to put SDK data for register the SDK and for create a communication with the BlueGPS Server. The management of the environment is demanded to the app.

```kotlin
object Environment {

    private val SDK_ENDPOINT = "{{provided-bluegps-endpoint}}"

    val keyCloakParameters = KeyCloakParameters(
        authorization_endpoint = "https://[BASE-URL]/realms/[REALMS]/protocol/openid-connect/auth",
        token_endpoint = "https://[BASE-URL]/realms/[REALMS]/protocol/openid-connect/token",
        redirect_uri = "{{HOST}}://{{SCHEME}}",
        clientId = "{{provided-client-secret}}", // for user authentication
        userinfo_endpoint = "https://[BASE-URL]/realms/[REALMS]/protocol/openid-connect/userinfo",
        end_session_endpoint = "https://[BASE-URL]/realms/[REALMS]/protocol/openid-connect/logout",
        guestClientSecret = "{{provided-guest-client-secret}}", // for guest authentication
        guestClientId = "{{provided-guest-client-id}}" // for guest authentication
    )

    val sdkEnvironment = SdkEnvironment(
        sdkEndpoint = SDK_ENDPOINT,
        keyCloakParameters = keyCloakParameters,
    )
}
```

### App Authentication
The BlueGPS_SDK offers a client for managing authentication and authorization within your application. It leverages [Keycloak](https://www.keycloak.org/) to handle user authentication.

BlueGPS provides 2 kinds of authentication: 
    
- **User Authentication:**
    
If you want only the User authentication you must set the **`clientId`**. 

This means that for each device this is the user on Keycloak that can manage grants for this particular user. 

- **Guest Authentication:**

If you want only the Guest authentication, you must set the **`guestClientSecret`** and **`guestClientId`**. 

This means that we don't have a user that has to login but we use client credentials and there is not an individual user for each app install. Instead BlueGPS treats the user account as a "guest"
In this case multiple devices can use the same client credentials to be authenticated and BlueGPS will register the user as a device, and not as a formal Keycloak user.

> [!NOTE]
> This paramaters are provided by **Synapses** after the purchase of the **BlueGPS license**.

Finally in your `AndroidManifest.xml` add this and change `host` and `scheme` with your configuration.

```xml
<activity
    android:name="com.synapseslab.bluegps_sdk.authentication.presentation.AuthenticationActivity"
    android:exported="true">
    <intent-filter>
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />

        <data
            android:host="{HOST}"
            android:scheme="{SCHEME}" />
    </intent-filter>
</activity>
```

Now your app is ready for use keycloak. See `KeycloakActivity.kt` example for an example of login, logout or refresh token.

### Authentication status
Once the SDK is correctly setup, you can ask for authentication status, by using the following accessor facility:

```kotlin
BlueGPSAuthManager.instance.currentTokenPayload
```

`currentTokenPayload` expose the current token object (if any). You can also ask for validity as follow:

```kotlin
// check if access token is still valid
BlueGPSAuthManager.instance.currentTokenPayload.accessTokenValid

// check if refresh token is still valid
BlueGPSAuthManager.instance.currentTokenPayload.refreshTokenValid
```

For **obtain the current access token** use the following function:
```kotlin
BlueGPSAuthManager.instance.accessToken()
```

### Guest login
For exec a guest login use the following function:

```kotlin
when (val result = BlueGPSAuthManager.instance.guestLogin()) {
    is Resource.Error -> {
        Log.e(TAG, result.message)
    }

    is Resource.Exception -> {
        Log.e(TAG, result.e.localizedMessage ?: "Exception")
    }

    is Resource.Success -> {
        Log.v(TAG, "Login in guest mode, ${result.data}")
        loginGuestMode.value = "Login in guest mode"

        // update access token on the environment
        Environment.sdkEnvironment.sdkToken = result.data.access_token
    }
}
```

### Logout
For logout, there's a specific call that will clear all credentials both from your side and backend:

```kotlin
BlueGPSAuthManager.instance.logout(handleCallback = {
    if (it) {
        Log.d(TAG, "SUCCESS logged out")
    } else {
        Log.e(TAG, "ERROR logged out")
    }
})
```

## SDK Changelog

[Changelog link](https://github.com/synapseslab/android-bluegps-sdk-public/blob/main/changelog.md)

## Documentation
For comprehensive details about BlueGPS SDK, please refer to the complete documentation available here.

**For version 2+** refer this
[Documentation link](https://synapseslab.com/android-bluegps-sdk-public/v2/v2.html)

For previous versions refer this
[Documentation link](https://synapseslab.com/android-bluegps-sdk-public/v1/bluegps_android_sdk.html)


## License

[LICENSE](https://github.com/synapseslab/android-bluegps-sdk-public/blob/main/LICENSE.md)
