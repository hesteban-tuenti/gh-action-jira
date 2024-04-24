# -*- coding: utf-8 -*-
@jira.QANOV-7486
Feature: Profile avatar


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @har
  Scenario Outline: A user can see a pencil icon in the profile avatar
    Given user has a "<role>" role
      And user is in the "Profile" page
     Then the "avatar_pencil" icon is displayed

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv    | role | jira_id      |
          | vivobr  | 14.10 | any  | QANOV-453443 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv    | role  | jira_id      |
          | moves   | 14.10 | admin | QANOV-478550 |

    Examples:
          | product | cv    | role | jira_id      |
          | o2uk    | 14.10 | any  | QANOV-478551 |
          | blaude  | 14.10 | any  | QANOV-478553 |
          | o2de    | 14.10 | any  | QANOV-478554 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @jira.link.relates_to.NOV-47404 @mobile @regression
  Scenario Outline: A user who has not uploaded the avatar picture will not see the "See picture" option
    Given user has a "<role>" role
      And user is in the "Profile" page
      And user has not uploaded the avatar picture
     When clicks on the "photo" icon
      And the "Avatar Options Sheet" sheet is displayed
     Then the "open_camera" textfield with "[LANG:profile.avatar.avatar_options_popup.open_camera]" text is displayed
      And the "choose_from_gallery" textfield with "[LANG:profile.avatar.avatar_options_popup.choose_from_gallery]" text is displayed
      And the "see_picture" icon is not displayed

    @automatic @live @next @qa
    Examples:
          | product | cv   | depends_on | detects | role | jira_id    |
          | vivobr  | 10.8 | QANOV-7487 |         | any  | QANOV-7557 |

    @automatic @cert0 @cert1 @live @next
    Examples:
          | product | cv   | depends_on | detects | role | jira_id    |
          | o2uk    | 10.8 | QANOV-7488 |         | any  | QANOV-7560 |

    @automatic @cert2 @jira.link.parent_test_plan.QANOV-525498 @live @next
    Examples:
          | product | cv   | depends_on | detects | role  | jira_id    |
          | moves   | 10.8 | QANOV-7489 |         | admin | QANOV-7564 |

    @manual
    Examples:
          | product | cv   | depends_on   | detects    | role | jira_id      |
          | blaude  | 13.9 | QANOV-241381 | OBO2DE-112 | any  | QANOV-241389 |
          | o2de    | 14.2 | QANOV-241382 |            | any  | QANOV-241390 |

  @jira.QANOV-453445 @android @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression
  @vivobr
  Scenario: A user who has not uploaded the avatar picture will not see the options to see and delete the profile picture
    Given user is in the "Profile" page
      And user has not uploaded the avatar picture
     When clicks on the "photo" icon
      And the "Avatar Options Sheet" sheet is displayed
     Then the "open_camera" textfield with "Tirar foto" text is displayed
      And the "choose_from_gallery" textfield with "Escolha da galeria" text is displayed
      And the "see_picture" icon is not displayed
      And the "delete_profile_picture" icon is not displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user who just installed the app will see the camera permission popup when selecting the open camera option from the profile avatar options
    Given user has a "<role>" role
      And user just installed the application
      And user is in the "Profile" page
     When clicks on the "avatar_image" icon
      And the "avatar_options" popup is displayed
      And clicks on the "open_camera" icon
     Then the "Camera Permissions Popup" popup is displayed

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv   | role | jira_id      |
          | vivobr  | 10.8 | any  | QANOV-143249 |

    Examples:
          | product | cv   | role | jira_id      |
          | o2uk    | 10.8 | any  | QANOV-143250 |
          | blaude  | 13.9 | any  | QANOV-241391 |
          | o2de    | 14.2 | any  | QANOV-241392 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv   | role  | jira_id      |
          | moves   | 10.8 | admin | QANOV-143251 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: An ios user who just installed the app and rejects the camera permission when selecting the open camera option from the profile avatar options will see a feedback warning
    Given user has a "<role>" role
      And user just installed the application
      And user is in the "Profile" page
     When clicks on the "avatar_image" icon
      And the "avatar_options" popup is displayed
      And clicks on the "open_camera" icon
      And the "Camera Permissions Popup" popup is displayed
      And clicks on the "popup.reject" button
     Then the "reject_permissions_feedback_text" textfield with "[LANG:profile.avatar.avatar_camera_feedback.text]" text is displayed
      And the "reject_permissions_feedback_button" textfield with "[LANG:profile.avatar.avatar_camera_feedback.close]" text is displayed

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv    | role | jira_id      |
          | vivobr  | 14.10 | any  | QANOV-484948 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv    | role  | jira_id      |
          | moves   | 14.10 | admin | QANOV-478555 |

    Examples:
          | product | cv    | role | jira_id      |
          | o2uk    | 14.10 | any  | QANOV-478556 |
          | blaude  | 14.10 | any  | QANOV-478558 |
          | o2de    | 14.10 | any  | QANOV-478559 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user who just installed the app and rejects the galery permission when selecting the galery option from the profile avatar options will see a feedback warning
    Given user has a "<role>" role
      And user just installed the application
      And user is in the "Profile" page
     When clicks on the "avatar_image" icon
      And the "avatar_options" popup is displayed
      And clicks on the "choose_from_gallery" icon
      And the "Gallery Permissions Popup" popup is displayed
      And clicks on the "popup.reject" button
     Then the "reject_permissions_feedback_text" textfield with "[LANG:profile.avatar.avatar_gallery_feedback.text]" text is displayed
      And the "reject_permissions_feedback_button" textfield with "[LANG:profile.avatar.avatar_gallery_feedback.close]" text is displayed

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv    | role | jira_id      |
          | vivobr  | 14.10 | any  | QANOV-453457 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv    | role  | jira_id      |
          | moves   | 14.10 | admin | QANOV-478560 |

    Examples:
          | product | cv    | role | jira_id      |
          | o2uk    | 14.10 | any  | QANOV-478561 |
          | blaude  | 14.10 | any  | QANOV-478563 |
          | o2de    | 14.10 | any  | QANOV-478564 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user who just installed the app will see the photos permission popup when finishing adding the profile avatar picture with the camera in iOS devices
    Given user has a "<role>" role
      And user just installed the application
      And user is in the "Profile" page
     When clicks on the "avatar_image" icon
      And the "avatar_options" popup is displayed
      And clicks on the "open_camera" icon
      And the "Camera Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Camera" page is displayed
      And clicks on the "capture" button
      And clicks on the "use_picture" button
     Then the "Photos Permissions Popup" popup is displayed

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv   | role | jira_id      |
          | vivobr  | 10.8 | any  | QANOV-143252 |

    Examples:
          | product | cv   | role | jira_id      |
          | o2uk    | 10.8 | any  | QANOV-143253 |
          | blaude  | 13.9 | any  | QANOV-241393 |
          | o2de    | 14.2 | any  | QANOV-241394 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv   | role  | jira_id      |
          | moves   | 10.8 | admin | QANOV-143254 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user who just installed the app will see the photos permission popup when selecting the choose from gallery option in the profile avatar options in iOS devices
    Given user has a "<role>" role
      And user just installed the application
      And user is in the "Profile" page
     When clicks on the "avatar_image" icon
      And the "avatar_options" popup is displayed
      And clicks on the "choose_from_gallery" icon
     Then the "Photos Permissions Popup" popup is displayed

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv   | role | jira_id      |
          | vivobr  | 10.8 | any  | QANOV-143255 |

    Examples:
          | product | cv   | role | jira_id      |
          | o2uk    | 10.8 | any  | QANOV-143256 |
          | blaude  | 13.9 | any  | QANOV-241397 |
          | o2de    | 14.2 | any  | QANOV-241398 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv   | role  | jira_id      |
          | moves   | 10.8 | admin | QANOV-143257 |

  @jira.<jira_id> @<execution> @<product> @android @cert0 @cert1 @cert2 @ios @jira.cv.<cv> @jira.link.detects.APPS-7613
  @jira.link.detects.IOS-7031 @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-428 @live @mobile
  @next @qa @smoke @har
  Scenario Outline: A user can upload the avatar picture using the device camera
    Given user has a "<role>" role
      And takes a profile baseline picture
      And user has "granted" "camera" permissions
      And user is in the "Profile" page
     When clicks on the "photo" icon
      And the "Avatar Options Sheet" sheet is displayed
      And clicks on the "open_camera" icon
      And takes a picture from profile
     Then the "avatar_feedback_text" textfield with "[LANG:profile.avatar.avatar_change_feedback.text]" text is displayed
      And the "avatar_feedback_button" button with "[LANG:profile.avatar.avatar_change_feedback.close]" text is displayed
      And the profile avatar icon displays the new picture

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv   | execution | role | jira_id    |
          | vivobr  | 10.8 | manual    | any  | QANOV-7516 |

    Examples:
          | product | cv   | execution | parent_test_plan | role  | jira_id      |
          | o2uk    | 10.8 | manual    |                  | any   | QANOV-7521   |
          | moves   | 10.8 | manual    | QANOV-525498     | admin | QANOV-7524   |
          | blaude  | 13.9 | manual    |                  | any   | QANOV-241407 |
          | o2de    | 14.2 | manual    | QANOV-437471     | any   | QANOV-241408 |

  @jira.<jira_id> @<client> @<execution> @<product> @cert0 @cert1 @cert2 @jira.cv.<cv> @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-429 @live @mobile @next @qa @sanity @har
  Scenario Outline: A user can upload the avatar picture using the device picture gallery
    Given user has a "<role>" role
      And takes a profile baseline picture
      And user has "granted" "<permission>" permissions
      And user is in the "Profile" page
     When clicks on the "photo" icon
      And the "Avatar Options Sheet" sheet is displayed
      And clicks on the "choose_from_gallery" icon
      And the "Profile Avatar Gallery" page is displayed
      And the "gallery_list" list is displayed
      And selects a picture from the gallery
      And the "Profile" page is displayed
     Then the "avatar_feedback_text" textfield with "[LANG:profile.avatar.avatar_change_feedback.text]" text is displayed
      And the "avatar_feedback_button" button with "[LANG:profile.avatar.avatar_change_feedback.close]" text is displayed
      And the profile avatar icon displays the new picture

    Examples:
          | client  | product | cv   | permission | execution | detects  | parent_test_plan | role  | jira_id      |
          | android | o2uk    | 10.8 | storage    | manual    |          |                  | any   | QANOV-7532   |
          | android | moves   | 10.8 | storage    | manual    |          | QANOV-525498     | admin | QANOV-7537   |
          | android | blaude  | 13.9 | storage    | manual    |          |                  | any   | QANOV-241411 |
          | android | o2de    | 14.2 | storage    | manual    |          | QANOV-437471     | any   | QANOV-241412 |
          | ios     | o2uk    | 10.8 | photo      | manual    | IOS-8112 |                  | any   | QANOV-143262 |
          | ios     | moves   | 10.8 | photo      | manual    | IOS-8112 | QANOV-525498     | admin | QANOV-143263 |
          | ios     | blaude  | 13.9 | photo      | manual    | IOS-8112 |                  | any   | QANOV-241413 |
          | ios     | o2de    | 14.2 | photo      | manual    | IOS-8112 | QANOV-437471     | any   | QANOV-241414 |

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | client  | product | cv   | permission | execution | detects  | role | jira_id      |
          | android | vivobr  | 10.8 | storage    | manual    |          | any  | QANOV-7527   |
          | ios     | vivobr  | 10.8 | photo      | manual    | IOS-8112 | any  | QANOV-143261 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @har
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-47377 @mobile @regression
  Scenario Outline: A user who uploaded the avatar picture can open it
    Given user has a "<role>" role
      And user is in the "Profile" page
      And user has uploaded the avatar picture
     When clicks on the "photo" icon
      And the "Avatar Options Sheet" sheet is displayed
      And clicks on the "see_picture" icon
     Then the "Profile Avatar" page is displayed
      And the "avatar_photo" element is on display

    @automatic @jira.link.parent_test_plan.QANOV-437387 @live @next @qa
    Examples:
          | product | cv   | depends_on            | parent_test_plan | role | jira_id    |
          | vivobr  | 10.8 | QANOV-7516:QANOV-7527 |                  | any  | QANOV-7549 |

    @automatic @cert0 @cert1 @live @next
    Examples:
          | product | cv   | depends_on            | parent_test_plan | role | jira_id    |
          | o2uk    | 10.8 | QANOV-7521:QANOV-7532 |                  | any  | QANOV-7551 |

    @automatic @cert2 @live @next
    Examples:
          | product | cv   | depends_on            | parent_test_plan | role  | jira_id    |
          | moves   | 10.8 | QANOV-7524:QANOV-7537 | QANOV-525498     | admin | QANOV-7553 |

    @manual
    Examples:
          | product | cv   | depends_on                             | parent_test_plan | role | jira_id      |
          | blaude  | 13.9 | QANOV-241407:QANOV-241411:QANOV-241413 |                  | any  | QANOV-241417 |
          | o2de    | 14.2 | QANOV-241408:QANOV-241412:QANOV-241414 | QANOV-437471     | any  | QANOV-241418 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-68058 @mobile @regression
  Scenario Outline: A user who uploaded the avatar picture can open it without connectivity
    Given user has a "<role>" role
      And user is in the "Profile" page
      And user has uploaded the avatar picture
      And the avatar picture is cached
      And user turns on the Airplane mode
     When clicks on the "photo" icon
      And the "Avatar Options Sheet" sheet is displayed
      And clicks on the "see_picture" icon
     Then the "Profile Avatar" page is displayed
      And the "avatar_photo" element is on display

    @automatic @jira.link.parent_test_plan.QANOV-437387 @live @next @qa
    Examples:
          | product | cv   | depends_on            | role | jira_id    |
          | vivobr  | 10.8 | QANOV-7516:QANOV-7527 | any  | QANOV-7566 |

    @automatic @cert0 @cert1 @live @next
    Examples:
          | product | cv   | depends_on            | role | jira_id    |
          | o2uk    | 10.8 | QANOV-7521:QANOV-7532 | any  | QANOV-7569 |

    @automatic @cert2 @jira.link.parent_test_plan.QANOV-525498 @live @next
    Examples:
          | product | cv   | depends_on            | role  | jira_id    |
          | moves   | 10.8 | QANOV-7524:QANOV-7537 | admin | QANOV-7571 |

    @manual
    Examples:
          | product | cv   | depends_on                             | role | jira_id      |
          | blaude  | 13.9 | QANOV-241407:QANOV-241411:QANOV-241413 | any  | QANOV-241419 |
          | o2de    | 14.2 | QANOV-241408:QANOV-241412:QANOV-241414 | any  | QANOV-241420 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-270108 @manual @mobile @regression
  Scenario Outline: A user who has not uploaded the avatar picture will not see the "Delete profile picture" option
    Given user has a "<role>" role
      And user is in the "Profile" page
      And user has not uploaded the avatar picture
     When clicks on the "photo" icon
      And the "Avatar Options Sheet" sheet is displayed
     Then the "open_camera" textfield with "[LANG:profile.avatar.avatar_options_popup.open_camera]" text is displayed
      And the "choose_from_gallery" textfield with "[LANG:profile.avatar.avatar_options_popup.choose_from_gallery]" text is displayed
      And the "delete_profile_picture" icon is not displayed

    Examples:
          | product | cv   | depends_on   | role | jira_id      |
          | vivobr  | 13.9 | QANOV-7487   | any  | QANOV-270088 |
          | o2uk    | 13.9 | QANOV-7488   | any  | QANOV-270089 |
          | blaude  | 13.9 | QANOV-241381 | any  | QANOV-270091 |
          | o2de    | 14.2 | QANOV-241382 | any  | QANOV-270092 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv   | depends_on | role  | jira_id      |
          | moves   | 13.9 | QANOV-7489 | admin | QANOV-270090 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-270108 @manual @mobile @regression
  Scenario Outline: A user who uploaded the avatar picture will see the "Delete profile picture" option
    Given user has a "<role>" role
      And user is in the "Profile" page
      And user has uploaded the avatar picture
     When clicks on the "photo" icon
      And the "Avatar Options Sheet" sheet is displayed
     Then the "see_picture" textfield with "[LANG:profile.avatar.avatar_options_popup.see_picture]" text is displayed
      And the "open_camera" textfield with "[LANG:profile.avatar.avatar_options_popup.open_camera]" text is displayed
      And the "choose_from_gallery" textfield with "[LANG:profile.avatar.avatar_options_popup.choose_from_gallery]" text is displayed
      And the "delete_profile_picture" textfield with "[LANG:profile.avatar.avatar_options_popup.delete_profile_picture]" text is displayed

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv   | depends_on            | role | jira_id      |
          | vivobr  | 13.9 | QANOV-7516:QANOV-7527 | any  | QANOV-270093 |

    Examples:
          | product | cv   | depends_on                             | role | jira_id      |
          | o2uk    | 13.9 | QANOV-7521:QANOV-7532                  | any  | QANOV-270094 |
          | blaude  | 13.9 | QANOV-241407:QANOV-241411:QANOV-241413 | any  | QANOV-270096 |
          | o2de    | 14.2 | QANOV-241408:QANOV-241412:QANOV-241414 | any  | QANOV-270097 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv   | depends_on            | role  | jira_id      |
          | moves   | 13.9 | QANOV-7524:QANOV-7537 | admin | QANOV-270095 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-270108 @manual @mobile @regression
  Scenario Outline: A user who uploaded the avatar picture cannot delete the avatar picture if an error happens
    Given user has a "<role>" role
      And user is in the "Profile" page
      And user has uploaded the avatar picture
     When clicks on the "photo" icon
      And the "Avatar Options Sheet" sheet is displayed
      And clicks on the "delete_profile_picture" icon
      And there is an error deleting the profile picture
     Then the "Profile" page is displayed
      And the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Your photo has not been deleted. Try again later." text is displayed
      And the profile avatar icon does not display the default picture

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv   | depends_on            | role | jira_id      |
          | vivobr  | 13.9 | QANOV-7516:QANOV-7527 | any  | QANOV-272261 |

    Examples:
          | product | cv   | depends_on                             | role | jira_id      |
          | o2uk    | 13.9 | QANOV-7521:QANOV-7532                  | any  | QANOV-272262 |
          | blaude  | 13.9 | QANOV-241407:QANOV-241411:QANOV-241413 | any  | QANOV-272264 |
          | o2de    | 14.2 | QANOV-241408:QANOV-241412:QANOV-241414 | any  | QANOV-272265 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv   | depends_on            | role  | jira_id      |
          | moves   | 13.9 | QANOV-7524:QANOV-7537 | admin | QANOV-272263 |

  @jira.<jira_id> @<product> @android @ios @ira.<jira_id> @jira.cv.<cv> @jira.link.depends_on.<depends_on> @har
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-270108 @manual @mobile @smoke
  Scenario Outline: A user who uploaded the avatar picture can delete the avatar picture
    Given user is in the "Profile" page
      And user has uploaded the avatar picture
     When clicks on the "photo" icon
      And the "Avatar Options Sheet" sheet is displayed
      And clicks on the "delete_profile_picture" icon
     Then the "Profile" page is displayed
      And the profile avatar icon displays the default picture

    Examples:
          | product | cv   | depends_on                             | parent_test_plan          | jira_id      |
          | vivobr  | 13.9 | QANOV-7516:QANOV-7527                  | QANOV-270108              | QANOV-556387 |
          | blaude  | 13.9 | QANOV-241407:QANOV-241411:QANOV-241413 | QANOV-270108              | QANOV-556388 |
          | o2de    | 14.2 | QANOV-241408:QANOV-241412:QANOV-241414 | QANOV-270108:QANOV-437471 | QANOV-556389 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user who uploaded the avatar picture can see the popup to delete the avatar picture
    Given user has a "<role>" role
      And user is in the "Profile" page
      And user has uploaded the avatar picture
     When clicks on the "photo" icon
      And the "Avatar Options Sheet" sheet is displayed
      And clicks on the "delete_profile_picture" icon
     Then the "Delete Avatar Photo" popup is displayed
      And the "popup.title" textfield with "[LANG:profile.avatar.avatar_delete_popup.title]" text is displayed
      And the "popup.accept" button with "[LANG:profile.avatar.avatar_delete_popup.accept]" text is displayed
      And the "popup.cancel" button with "[LANG:profile.avatar.avatar_delete_popup.cancel]" text is displayed

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv    | role | jira_id      |
          | vivobr  | 14.10 | any  | QANOV-453453 |

    Examples:
          | product | cv    | role | jira_id      |
          | o2uk    | 14.10 | any  | QANOV-478571 |
          | blaude  | 14.10 | any  | QANOV-478573 |
          | o2de    | 14.10 | any  | QANOV-478574 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv    | role  | jira_id      |
          | moves   | 14.10 | admin | QANOV-478570 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user who uploaded the avatar picture can cancel to delete the avatar picture
    Given user has a "<role>" role
      And user is in the "Profile" page
      And user has uploaded the avatar picture
     When clicks on the "photo" icon
      And the "Avatar Options Sheet" sheet is displayed
      And clicks on the "delete_profile_picture" icon
      And the "Delete Avatar Photo" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Delete Avatar Photo" popup is not displayed
      And the "Profile" page is displayed
      And the profile avatar icon displays the same picture

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv    | role | jira_id      |
          | vivobr  | 14.10 | any  | QANOV-453454 |

    Examples:
          | product | cv    | role | jira_id      |
          | o2uk    | 14.10 | any  | QANOV-478576 |
          | blaude  | 14.10 | any  | QANOV-478578 |
          | o2de    | 14.10 | any  | QANOV-478579 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv    | role  | jira_id      |
          | moves   | 14.10 | admin | QANOV-478575 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke @har
  Scenario Outline: A user who uploaded the avatar picture can delete the avatar picture
    Given user has a "<role>" role
      And user is in the "Profile" page
      And user has uploaded the avatar picture
     When clicks on the "photo" icon
      And the "Avatar Options Sheet" sheet is displayed
      And clicks on the "delete_profile_picture" icon
      And the "Delete Avatar Photo" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Delete Avatar Photo" popup is not displayed
      And the "Profile" page is displayed
      And the "avatar_feedback_text" textfield with "[LANG:profile.avatar.avatar_delete_feedback.text]" text is displayed
      And the "avatar_feedback_button" button with "[LANG:profile.avatar.avatar_delete_feedback.close]" text is displayed
      And the profile avatar icon displays the default picture

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv    | role | jira_id      |
          | vivobr  | 14.10 | any  | QANOV-453455 |

    Examples:
          | product | cv    | role | jira_id      |
          | o2uk    | 14.10 | any  | QANOV-478581 |
          | blaude  | 14.10 | any  | QANOV-478583 |
          | o2de    | 14.10 | any  | QANOV-478584 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv    | role  | jira_id      |
          | moves   | 14.10 | admin | QANOV-478580 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-270108 @manual @mobile @regression
  Scenario Outline: A user can upload a new avatar picture, after deleted it
    Given user has a "<role>" role
      And user is in the "Profile" page
      And user has uploaded the avatar picture
     When clicks on the "photo" icon
      And the "Avatar Options Sheet" sheet is displayed
      And clicks on the "delete_profile_picture" icon
      And the "Delete Avatar Photo" popup is displayed
      And clicks on the "popup.accept" button
      And the "Profile" page is displayed
      And clicks on the "photo" icon
      And the "Avatar Options Sheet" sheet is displayed
      And clicks on the "choose_from_gallery" icon
      And the "Profile Avatar Gallery" page is displayed
      And the "gallery_list" list is displayed
      And selects a picture from the gallery
      And the "Profile" page is displayed
     Then the profile avatar icon displays the new picture

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv   | depends_on   | role | jira_id      |
          | vivobr  | 13.9 | QANOV-270098 | any  | QANOV-270103 |

    Examples:
          | product | cv   | depends_on   | role | jira_id      |
          | o2uk    | 13.9 | QANOV-270099 | any  | QANOV-270104 |
          | blaude  | 13.9 | QANOV-270101 | any  | QANOV-270106 |
          | o2de    | 14.2 | QANOV-270102 | any  | QANOV-270107 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv   | depends_on   | role  | jira_id      |
          | moves   | 13.9 | QANOV-270100 | admin | QANOV-270105 |

  @jira.QANOV-556394 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @mobile @moves @no_automatable
  @regression
  Scenario: A user who has not uploaded the avatar picture will see its initials
    Given user has a "admin" role
      And user is in the "Profile" page
      And user has not uploaded the avatar picture
     Then the "avatar" icon with the user's initials is displayed
