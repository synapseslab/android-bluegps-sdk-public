# Changelog: `android-bluegps-sdk`

### Version 2.0.8
June 24, 2024
#### ✅ New Features
- Add `resetPath()` API to BlueGPSMapView for clear the draw path on the map.
- Add `resetDataAndTag()` API to BlueGPSMapView for clear all the data and the tag draw on the map.
- Add `resetAll()` API to BlueGPSMapView for clear all elements draw on the map.
- Add `setTag()` API to BlueGPSMapView for draw the tagId on the map and follow it if true, otherwise only draw the tagId.
#### 🐞 Bug Fixes
- In some cases the assigned `tagId` was not saved correctly.

### Version 2.0.7
June 10, 2024
#### ✅ New Features
- Add `updateTicketFormManager()` API save the entire form that the interface will have to build..
- Add `minStart` and `maxEnd` attributes to `ScheduleInterval`.
#### ⬆️ Behavior Changes
#### ⚠️ API Changes
- Changed `getUUID()` API, now return a `String`.
#### 🐞 Bug Fixes
- Fix a bug when save the generated `uuid`.

### Version 2.0.6
May 31, 2024
#### ⬆️ Behavior Changes
- Changed all handle SSE events with `okhttp-sse` library.
#### 🐞 Bug Fixes
- Fix a bug `startNotifyPositionChanges()`.

### Version 2.0.5
May 30, 2024
#### ✅ New Features
- add `userTagId()` API function that return the tagId assigned to the user if exist.
- add `saveUserTagId()` API function to save the tagId assigned to the user.
#### ⬆️ Behavior Changes
- `BlueGPSAdvertisingService` save only the tagId as String

### Version 2.0.4
May 22, 2024
#### ⚠️ API Changes
- Changed `findResources()` API all paramaters now are optional.

### Version 2.0.3
May 16, 2024
#### ✅ New Features
- Created new `getAvailableSlots()` API that return available time slots for the specific resource.
- Created new `keepCredentialsAuth()` API only for the PIF build SDK
- Created new `qrCodeAuth()` API that perform a login with a qrcode.
#### ⚠️ API Changes
- Changed `AuthParameters` model, removed `microsoftToken`, `basic` and `authHeader` paramaters
- Changed `searchVisitor()` API, `lastName` parameter is now optional and add optional `email` parameter
#### 🐞 Bug Fixes
- Fix an internal bug on refresh token for guest mode authentication.


### Version 2.0.2
April 19, 2024
#### ✅ New Features
- Create new `getVisitorTemplate()` API that return an AbstractComponent that represent the visitor form. Used to build the UI.
- Create new `saveVisitor()` API that save the current visitor to BlueGPS backend.
- Create new `getVisitTemplate()` API that return an AbstractComponent that represent the visit form flow. Used to build the UI.
- Create new `saveVisit()` API that save the current visitor form to BlueGPS backend.
- Create new `searchVisitor()` API that search for a visitor by last name.
- Add `direction` parameter to `NavigationStats` class that return the directions during navigation.
- Add `getWidgetRoom()` API that returns all widgets for a specific room.
- Add `startWidgetRoomIdEvent()` SSE API for stream events of room widgets.

### Version 2.0.1
April 02, 2024
#### ⬆️ Behavior Changes
- In the `ScheduleRequest` and `ScheduleElement` classes attendees parameter has changed in `typeAttendees`.
#### ✅ New Features
- Create new `getBookingUserList()` API that return a list of user to invite to booking.
- Create new `TypeAttendee` class. 
#### 🐞 Bug Fixes
- Remediation for Intent Redirection Vulnerability on `AuthenticationActivity.onNewIntent()`
#### ⚠️ API Changes
- In `deleteNotifications()` and `readNotifications()` API now accepts type parameter.
- In `deleteNotifications()` and `readNotifications()` API changed the return type to `UpdateNotificationResponse` class.
- `getWidgetHome()` API now accepts `tagId` that is assigned to the current user
- `startWidgetIdEvent()` API now is `POST` and accepts `checkTimeout` parameter.


### Version 2.0.0
March 01, 2024
#### ⬆️ Behavior Changes
Now Keycloak is used for managing authentication and authorization within your application.

- changed the `initSdk()` function
- changed `SdkEnvironment` class
- removed the old authentication system with `sdkKey` and `sdkSecret`
- changed the access point to `BlueGPSAuthManager` from `BlueGPSAuthManager.shared` to `BlueGPSAuthManager.instance`
#### ✅ New Features
- Add new `guestLogin()` function
- Add `logout()` function


### Version 1.5.3
January 16, 2024
#### ⚠️ API Changes
- `getDeviceConfiguration(tagId: String? = null)` API deprecated, use the new `getOrCreateConfiguration(tagId: String? = null)`


### Version 1.5.2
December 13, 2023
#### 🐞 Bug Fixes
- Fix on `BlueGPSAuthManager` class
- On Keycloak class some params now are optional
#### ✅ New Features
- Add Marker API
  - `activatePositionMarker()` to activate/deactivate position marker layer to the map
  - `clearPositionMarker()` clear and remove position marker
  - `getPositionMarker()` retrive position marker


### Version 1.5.1
November 10, 2023
#### ⚠️ API Changes
- Changed `startNotifyEventChanges()`. Now the function receive a `streamType`, 
`outputEvents` a list of events to be notified for the specific types of stream and a 
`tagIdList` a list of tag id to monitoring. If empty receive notifications for all tags.


### Version 1.5.0
November 8, 2023
#### 🐞 Bug Fixes
- Fixed `registerReceiver`
#### ✅ New Features
- Add `setCompass(deg: Double)` on MapView
- Add `followUserTag` callback on MapView
- Add `FollowUserTag` class
- Add `nearJump` and `nearDestination` callback on MapView
- Add Notifications API
  - `allNotifications` Returns all available notifications
  - `countNotifications` Returns the number of notifications to read
  - `deleteNotifications` Delete the notifications
  - `updateNotifications` For update the status of the notifications
  - `registerDeviceForNotifications` For register the device and the push token for receive notifications
- Add SSE for generic events
- Add onStop callback on all SSE API
#### ⚠️ API Changes
- Changed `BlueGPSAuthManager`, removed `SCHEDULE_ALARM` permission
- Removed `BlueGPSAlarmManager`


### Version 1.4.10
October 4, 2023
#### ⚠️ API Changes
- `getDeviceConfiguration(tagId: String? = null)` API now has `tagId` as an optional property


### Version 1.4.9
October 2, 2023
#### ✅ New Features
- Add `tagid` property to `AdvDeviceConfiguration` class


### Version 1.4.8
September 21, 2023
#### 🐞 Bug Fixes
- Fix `startNotifyRegionChanges()` function
#### ⬆️ Behavior Changes
- Change `getRegionListInWhichIsContained()` function that in some cases return a not valid id or a null value


### Version 1.4.7
August 29, 2023
#### 🐞 Bug Fixes
- Fix `startNotifyRegionChanges()` function


### Version 1.4.6
August 10, 2023
#### ✅ New Features
- Add Ticket API
  - `getTicketTypes()` Returns the types for tickets ("INTERNAL", "IVIVA")
  - `getTicketMy()` Return all tickets for the logged user
  - `getTicketFormManager()` Return the entire form that the interface will have to build
  - `saveTicket()` save a ticket
  - `getTicketById()` Return the ticket detail
  - `deleteTicket()` Delete a ticket
- Add `getUUID()` function that return the UUID if set, null otherwise


### Version 1.4.5
July 27, 2023
#### 🐞 Bug Fixes
- Fix on `silentLogout()`
#### ✅ New Features
- Do not disturb and Out of Office API
  - Add `getDndOooDayTime()` to get the filter to set a do not disturb or out of office element
  - Add `setDndOoo()` to set to do not disturb or out of office and element
- Add navigation resource API `getNavigationResource()`
- Add `authError` and `pathRecalculation` callback on MapView
- Add `initAuth` function on MapView
- Add `getUserProfile()` API that return all associated profiles to the logged user
- Add `getBuildingList()` API that return a list of Buildings
- Add `buildings: List<Int>` param to `ConfigurationMap` class to load the maps of the selected building


### Version 1.4.4
May 23, 2023

For a sync problem there is a jump version from 1.4.2 to 1.4.4

#### 🐞 Bug Fixes
- Minor fix on BlueGPSAuthManager if `useOAuthAuthentication` attribute is `true`
#### ✅ New Features
- Language API section
  - Add function for get all available dictionaries `getLanguages()`
  - Add function for get a dictionary for a language code `getLanguage()`
- Search Object API section
  - Add a new function `getSearchableTrackTag()` to get a searchable track tag list filtering also by NFC code [documentation](https://github.com/synapseslab/android-bluegps-sdk-demoapp/blob/main/documentation/bluegps_android_sdk.md#86-getsearchabletracktag)


### Version 1.4.2
April 26, 2023
#### 🐞 Bug Fixes
- Fix on `startNotifyRegionChanges()` that now return a map that contains a list regions where the tags are currently located. [documentation](https://github.com/synapseslab/android-bluegps-sdk-demoapp/blob/main/documentation/bluegps_android_sdk.md#62-notify-region-changes)
- Fix on `deviceConfiguration()` save the UUID in shared preferences.
#### ✅ New Features
- Booking API Section 
  - Add function `getAgendaNextMy()`
  - Add function `scheduleCheck()`
  - Add function `deleteSchedule()`
- Add Home API Section
  - Add function `getHomeMy()`
- Add Locker API section
  - Add function `unlockLocker()`
  - Add function `releaseLocker()`
- Search API Section
  - Add function `getFilterResource()`


### Version 1.4.1
March 7, 2023
#### ✅ New Features
- Add `BlueGPSLocationManager` to start and stop the system location services.
#### ⚠️ API Changes
- Changed `floorLevel` and `floorLevelPercentageConfidence` to optional attributes.


### Version 1.4.0-alpha05
February 20, 2023
#### ✅ New Features
- Add function `getFilter()` [documentation](https://github.com/synapseslab/android-bluegps-sdk-demoapp/blob/main/documentation/bluegps_android_sdk.md#86-getfilter)
- Add function `search()` [documentation](https://github.com/synapseslab/android-bluegps-sdk-demoapp/blob/main/documentation/bluegps_android_sdk.md#87-search)
- Add Booking API
  - Add function `getAgendaDay()` [documentation](https://github.com/synapseslab/android-bluegps-sdk-demoapp/blob/main/documentation/bluegps_android_sdk.md#111-getagendaday)
  - Add function `getAgendaMy()` [documentation](https://github.com/synapseslab/android-bluegps-sdk-demoapp/blob/main/documentation/bluegps_android_sdk.md#112-getagendamy)
  - Add function `schedule()` [documentation](https://github.com/synapseslab/android-bluegps-sdk-demoapp/blob/main/documentation/bluegps_android_sdk.md#114-schedule)
  - Add function `agendaFind()` [documentation](https://github.com/synapseslab/android-bluegps-sdk-demoapp/blob/main/documentation/bluegps_android_sdk.md#113-agendafind)
- Add OAuth client for keycloak authentication [documentation](https://github.com/synapseslab/android-bluegps-sdk-demoapp/blob/main/documentation/bluegps_android_sdk.md#12-oauth-client-for-keycloak-authentication)
- Add notify position changes [documentation](https://github.com/synapseslab/android-bluegps-sdk-demoapp/blob/main/documentation/bluegps_android_sdk.md#63-notify-position-changes)
#### ⚠️ API Changes
- Add `tagid` attribute to `BGPGpsPosition` class


### Version 1.3.1
February 02, 2023
#### ✅ New Features
- Add function `getAreasList()`
- Add function `getAreaListRealtimeElement()`


### Version 1.2.0
November 25, 2022
#### ✅ New Features
- Add support for Rooms and Areas
- Add function `getRoomsCoordinates()`
- Add function `getMapsList()`
- Add function `getAreasWithTagsInside()`


### Version 1.1.3
November 11, 2022
#### ✅ New Features
- Add notify region changes
- Add function `setDarkMode(darkMode: Boolean)`


### Version 1.1.1
October 27, 2022
#### ✅ New Features
- Add support for Controllable items API
- Add function `initAllBookingLayerBy(bookFilter)`


### Version 1.1.0
October 12, 2022
#### ✅ New Features
- Change Blue GPS SDK name from `bluegps_sdk-release-1.0.3.aar` to `bluegps-sdk-release-1.1.0.aar` 
check the example app (**breakpoint!!**)
- Update gradle libraries
- updated target Sdk Version to 33 (Android 13)
- updated compiled sdk version to 33 (Android 13)
- Add support for SearchObject


### Version 1.0.3
December 01, 2021
#### ✅ New Features
- Changed the name of the BlueGPS_SDK lib to `bluegps_sdk-release-1.0.3`
- Add new callback `initSDKCompleted`
- Add new network call to `findResources()`
#### ⚠️ API Changes
- Changed the home screen example `HomeActivity.kt`
- Removed deprecated plugin `kotlin-android-extensions` on demo app


### Version 1.0.2-alpha
October 29, 2021
#### ✅ New Features
- Add `changeFloor` parameter
- Add Server Sent Events diagnostic
- Add function `centerToRoom(roomId)`
- Add function `centerToPosition(mapPosition, zoom)`
- Add new callback `roomEnter` 
- Add new callback `roomExit` 
- Add new callback `floorChange`
#### ⚠️ API Changes
- Removed callback `roomClick`
- `PaylodadResponse` class is deprecated. Use the new `GenericInfo` class
  for `TypeMapCallback.SUCCESS` and `TypeMapCallback.ERROR`
- Changed the return type of `TypeMapCallback.PARK_CONF` callback from `PaylodResponse`
  to `BookingConfiguration`
- Removed the callback `TypeMapCallback.INIT_SDK_END` now the init sdk event is managed
  on `TypeMapCallback.SUCCESS` for success or in `TypeMapCallback.ERROR` otherwise


### Version 1.0.1
October 14, 2021
#### ✅ New Features
- Add function `loadGenericResource(search, type, subtype)`
- Add function `selectPoi(poi)`
- Add function `selectPoiById(poiId)`
- Add function `drawPin(position, icon)` 
- Add function `getCurrentFloor()`
- Add new callback `resource` 
- Add new callback `tagVisibility`


### Version 1.0.0
October 16, 2021
#### ✅ New Features
- updated target Sdk Version to 31 (Android 12)
- updated compiled sdk version to 31 (Android 12)
- add `BLUETOOTH_ADVERTISE` and `BLUETOOTH_CONNECT` runtime permissions for Android 12 support
- Add function `removeNavigation()` 
- Add new callback `navigation stats`
- Add new callback `navigation info`
- Add new callback `success` info 
- Add new callback `error` info
- Add show park and desk on conf object
- Add new method on MapView SDK (getStyle(), setStyle(), setStartBookingDate(), setBookingDate())
- Add Map Web View Component
- Add map view interaction
- SDK Init
- Guest Authentication
- JWT Authentication
- Advertising
#### ⚠️ API Changes
- removed `androidx.security:security-crypto` library
- Update [5. BlueGPSMapView](#5-bluegpsmapview) section with a configuration for navigation
- Update the Path model
- Update the callback from web view click (room click, map click, tag click)
- Change initSDK method