# -*- coding: utf-8 -*-
@jira.QANOV-10791
Feature: Youtube videos in Explore

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-136541 @mobile @smoke @har
  Scenario Outline: User can play a youtube video in explore tab
    To configure a youtube link in CMS use the deeplink base address followed by /youtube/videoid
    Given user has a card with a valid youtube link configured in the CMS
     When searches the "card"
      And clicks on the "<button_type>" field in the explore "card"
     Then the "Youtube Player" page is displayed
      And the video is reproduced on the fullscreen embedded video player
      And terminates the app
      And launches the app
      And initiate the app

    @automatic @qa
    Examples:
          | product | button_type      | cv   | jira_id     |
          | vivobr  | button_container | 13.3 | QANOV-10905 |

    @automatic @cert0 @cert1 @qa
    Examples:
          | product | button_type | cv   | jira_id     |
          | o2uk    | cta_button  | 13.3 | QANOV-10913 |

    @automatic @qa
    Examples:
          | product | button_type | cv   | jira_id     |
          | moves   | cta_button  | 13.3 | QANOV-10921 |

    @automatic @qa @raitt_drop1
    Examples:
          | product | button_type | cv   | jira_id      |
          | blaude  | cta_button  | 13.9 | QANOV-228422 |

    @manual
    Examples:
          | product | button_type | cv     | jira_id      |
          | o2de    | cta_button  | 14.2   | QANOV-49167  |
          | o2es    | TBD         | Future | QANOV-407316 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-136550
  @mobile @regression
  Scenario Outline: User can play a video on landscape orientation
    Given user has a card with a valid youtube link configured in the CMS
     When searches the card
      And opens the youtube card
      And the "Youtube Player" page is displayed
      And sets the device to "landscape" orientation
     Then the video is reproduced on the fullscreen embedded video player
      And sets the device to "portrait" orientation
      And clicks on the native "back" button

    @android @live @manual @next
    Examples:
          | product | cv   | depends_on  | jira_id     |
          | vivobr  | 13.3 | QANOV-10905 | QANOV-10930 |

    @android @cert0 @cert1 @live @manual @next
    Examples:
          | product | cv   | depends_on  | jira_id     |
          | o2uk    | 13.3 | QANOV-10913 | QANOV-10932 |

    @android @cert2 @live @manual @next
    Examples:
          | product | cv   | depends_on  | jira_id     |
          | moves   | 13.3 | QANOV-10921 | QANOV-10934 |

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | blaude  | 13.9   | QANOV-228422 | QANOV-228423 |
          | o2de    | 14.2   | QANOV-49167  | QANOV-49168  |
          | o2es    | Future |              | QANOV-407318 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-189664 @manual @mobile @regression
  Scenario Outline: User can close a video that is watching in explore tab after changing screen orientation to landscape orientation
    internal_checkpoint="If you are watching the video in landscape orientation and close the video, the Explore
    screen will be displayed in landscape orientation for android devices. For iOS devices, the Explore screen
    will be displayed in portrait orientation."
    Given user has a card with a "valid" youtube link configured in the CMS
     When clicks on the explore item
      And sets the device to "landscape" orientation
      And clicks on the "video_close" button
     Then the "Explore" page is displayed
      And sets the device to "portrait" orientation

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | vivobr  | 13.3   | QANOV-10930  | QANOV-10936  |
          | o2uk    | 13.3   | QANOV-10932  | QANOV-10938  |
          | moves   | 13.3   | QANOV-10934  | QANOV-10940  |
          | blaude  | 13.9   | QANOV-228423 | QANOV-228424 |
          | o2de    | 14.2   | QANOV-49168  | QANOV-49169  |
          | o2es    | Future |              | QANOV-407319 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-136554 @mobile @no_automatable @regression
  Scenario Outline: Youtube player will be closed automatically when the video playback finishes
    Given user is reproducing a youtube video
     When the video ends playing
     Then the "Explore" page is displayed
      And the scroll point will be placed at the video watched

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | vivobr  | 13.3   | QANOV-10905  | QANOV-10969  |
          | o2uk    | 13.3   | QANOV-10913  | QANOV-10971  |
          | moves   | 13.3   | QANOV-10921  | QANOV-10973  |
          | blaude  | 13.9   | QANOV-228422 | QANOV-228425 |
          | o2de    | 14.2   | QANOV-49167  | QANOV-49174  |
          | o2es    | Future |              | QANOV-407320 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-136578 @manual @mobile @regression
  Scenario Outline: User connected with Wi-Fi that plays a video won't see zero rating alert
    Given user has a card with a "valid" youtube link configured in the CMS
      And has never accepted the zero rating alert since logged in
     When clicks on the explore item
     Then the "Zero Rating Alert" popup is not displayed
      And the video is reproduced on the embedded video player

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 13.3   | QANOV-11017  |
          | o2uk    | 13.3   | QANOV-11019  |
          | moves   | 13.3   | QANOV-11021  |
          | blaude  | 13.9   | QANOV-228426 |
          | o2de    | 14.2   | QANOV-49180  |
          | o2es    | Future | QANOV-407321 |

  @jira.QANOV-11023 @android @ios @jira.cv.13.3 @jira.link.relates_to.NOV-169679 @mobile @moves @no_automatable
  @regression
  Scenario: User that plays a video for the first time not connected through Wi-Fi won't see zero rating alert
    Given user has a card with a "valid" youtube link configured in the CMS
      And user turns off the Wi-Fi
      And user turns on the mobile data
     When clicks on the explore item
     Then the "Zero Rating Alert" popup is not displayed
      And the video is reproduced on the embedded video player

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-136570 @mobile @no_automatable @smoke
  Scenario Outline: User that plays a video for the first time not connected through Wi-Fi will see zero rating alert
    Given user has a card with a "valid" youtube link configured in the CMS
      And user has never accepted zero rating alert since logged in
      And user turns off the Wi-Fi
      And user turns on the mobile data
     When clicks on the explore item
     Then the "Zero Rating Alert" popup is displayed
      And the "title" textfield with "<title_text>" text is displayed
      And the "body" textfield with "<body_text>" text is displayed
      And the "continue" button with "<continue_button>" text is displayed
      And the "cancel" button with "<cancel_button>" text is displayed

    Examples:
          | product | cv     | title_text                                              | body_text                                                                 | continue_button | cancel_button | jira_id      |
          | vivobr  | 13.3   | Os vídeos do YouTube podem consumir seu pacote de dados | Se você estiver conectado ao Wi-Fi não gastará a internet do seu plano.   | Continuar       | Cancelar      | QANOV-11025  |
          | o2uk    | 13.3   | YouTube videos use data from your tariff                | If you're connected to Wi-Fi, you won't spend data from your data bundle. | Continue        | Cancel        | QANOV-11027  |
          | blaude  | 13.9   | TBD                                                     | TBD                                                                       | TBD             | TBD           | QANOV-228427 |
          | o2de    | 14.2   | TBD                                                     | TBD                                                                       | TBD             | TBD           | QANOV-228428 |
          | o2es    | Future | TBD                                                     | TBD                                                                       | TBD             | TBD           | QANOV-407322 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-136574 @mobile @no_automatable @regression
  Scenario Outline: User can cancel zero rating alert
    Given user has a card with a "valid" youtube link configured in the CMS
      And user turns off the Wi-Fi
      And user turns on the mobile data
      And user is in the "Zero Rating Alert" popup
     When clicks on the "cancel" button
     Then the "Zero Rating Alert" popup is not displayed
      And the "Explore" page is displayed

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | vivobr  | 13.3   | QANOV-11025  | QANOV-11029  |
          | o2uk    | 13.3   | QANOV-11027  | QANOV-11031  |
          | blaude  | 13.9   | QANOV-228427 | QANOV-228429 |
          | o2de    | 14.2   | QANOV-228428 | QANOV-228430 |
          | o2es    | Future |              | QANOV-407323 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-136577 @mobile @no_automatable @regression
  Scenario Outline: Zero rating alert will be shown if the user has cancelled zero rating alert before
    Given user has a card with a "valid" youtube link configured in the CMS
      And user has cancelled the zero rating alert before
      And user turns off the Wi-Fi
      And user turns on the mobile data
     When clicks on the explore item
     Then the "Zero Rating Alert" popup is displayed
      And the "title" textfield with "<title_text>" text is displayed
      And the "body" textfield with "<body_text>" text is displayed
      And the "continue" button with "<continue_button>" text is displayed
      And the "cancel" button with "<cancel_button>" text is displayed

    Examples:
          | product | cv     | title_text                                                         | body_text                                                                 | continue_button | cancel_button | depends_on   | jira_id      |
          | vivobr  | 13.3   | Os vídeos do YouTube podem consumir seu pacote de dados            | Se você estiver conectado ao Wi-Fi não gastará a internet do seu plano.   | Continuar       | Cancelar      | QANOV-11029  | QANOV-11033  |
          | o2uk    | 13.3   | YouTube videos use data from your tariff. Do you want to continue? | If you're connected to Wi-Fi, you won't spend data from your data bundle. | Continue        | Cancel        | QANOV-11031  | QANOV-11035  |
          | blaude  | 13.9   | TBD                                                                | TBD                                                                       | TBD             | TBD           | QANOV-228429 | QANOV-228431 |
          | o2de    | 14.2   | TBD                                                                | TBD                                                                       | TBD             | TBD           | QANOV-228430 | QANOV-228432 |
          | o2es    | Future | TBD                                                                | TBD                                                                       | TBD             | TBD           |              | QANOV-407324 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-136575 @mobile @no_automatable @smoke
  Scenario Outline: User that accepts zero rating alert will watch the video
    Given user has a card with a "valid" youtube link configured in the CMS
      And user turns off the Wi-Fi
      And user turns on the mobile data
      And the "zero-rating-alert" popup is displayed
     When clicks on the "accept" button
     Then the "Zero Rating Alert" popup is not displayed
      And the video is reproduced on the embedded video player

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | vivobr  | 13.3   | QANOV-11033  | QANOV-11036  |
          | o2uk    | 13.3   | QANOV-11035  | QANOV-11039  |
          | blaude  | 13.9   | QANOV-228431 | QANOV-228433 |
          | o2de    | 14.2   | QANOV-228432 | QANOV-228434 |
          | o2es    | Future |              | QANOV-407325 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-136576 @mobile @no_automatable @regression
  Scenario Outline: Zero rating alert will not be shown if the user has accepted zero rating alert before
    Given user has a card with a "valid" youtube link configured in the CMS
      And user has accepted the zero rating alert before
      And user turns off the Wi-Fi
      And user turns on the mobile data
     When clicks on the explore item
     Then the "Zero Rating Alert" popup is not displayed

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | vivobr  | 13.3   | QANOV-11036  | QANOV-11040  |
          | o2uk    | 13.3   | QANOV-11039  | QANOV-11041  |
          | blaude  | 13.9   | QANOV-228433 | QANOV-228435 |
          | o2de    | 14.2   | QANOV-228434 | QANOV-228436 |
          | o2es    | Future |              | QANOV-407326 |
