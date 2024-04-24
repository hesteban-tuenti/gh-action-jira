# -*- coding: utf-8 -*-
@jira.QANOV-6741
Feature: Rate us


  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-194572 @mobile @sanity @har
  Scenario Outline: A user who taps in the "rate us" entrypoint will access to the App Store to rate the app on iOS devices
    commented_tags="@depends_on.NOV-47204"
    Given user is in the "<page>" page
     When clicks on the "<entrypoint>" button
     Then the "Apple_Store" app is displayed

    @automatic @cert2 @deprecate_profile_moves @jira.dv.Future @live @next
    Examples:
          | product | cv   | page              | entrypoint                     | depends_on                | jira_id    |
          | moves   | 11.6 | App Configuration | rate_us_in_appstore_entrypoint | QANOV-205523:QANOV-205524 | QANOV-6742 |

    @jira.link.detects.O2DE-3296 @manual
    Examples:
          | product | cv   | page    | entrypoint         | depends_on                             | jira_id      |
          | blaude  | 14.5 | Profile | rate_us_entrypoint | QANOV-217320:QANOV-217321:QANOV-240222 | QANOV-376047 |
          | o2de    | 14.5 | Profile | rate_us_entrypoint | QANOV-259695:QANOV-259696:QANOV-240223 | QANOV-376048 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-194571 @mobile @sanity @har
  Scenario Outline: A user who taps in the "rate us" entrypoint will see the app rating dialog on android devices
    commented_tags="@depends_on.NOV-47204"
    Given user is in the "<page>" page
     When clicks on the "<entrypoint>" entrypoint
     Then the "Popup Rate Stars" popup is displayed
      And the "<logo>" image is displayed
      And the "title_textfield" textfield with "[LANG:app_rating.app_rating_android.title]" text is displayed
      And the "message_textfield" textfield with "[LANG:app_rating.app_rating_android.message]" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "[LANG:app_rating.app_rating_android.button]" text is displayed

    @automatic @cert2 @deprecate_profile_moves @jira.dv.Future
    @jira.link.detects.ANDROID-9853 @live @next
    Examples:
          | product | cv   | page              | entrypoint                      | logo          | depends_on                | jira_id    |
          | moves   | 11.8 | App Configuration | rate_us_in_playstore_entrypoint | movistar_logo | QANOV-205523:QANOV-205524 | QANOV-6849 |

    @manual
    Examples:
          | product | cv   | page    | entrypoint         | logo        | depends_on                                                                    | jira_id      |
          | blaude  | 14.5 | Profile | rate_us_entrypoint | blaude_logo | QANOV-217320:QANOV-217321:QANOV-240222:QANOV-386057:QANOV-386059:QANOV-386061 | QANOV-376051 |
          | o2de    | 14.5 | Profile | rate_us_entrypoint | o2de_logo   | QANOV-259695:QANOV-259696:QANOV-240223:QANOV-386058:QANOV-386060:QANOV-386062 | QANOV-376053 |

  @jira.<jira_id> @<client> @automation.hard @deprecate_profile_moves @impeded_mock @jira.cv.11.8 @jira.dv.Future @manual
  @mobile @moves @regression
  Scenario Outline: User receives a notification to rate the app: a badge will be displayed in the profile icon on <client> device
    Given user has entered into the app at least 1 per week during 2 months consecutively
      And user has never rated the app via the "<rate_row>" option in profile screen
      And user hasn't rated the app via the event-based dialog in the last two months
     When receives a notification to rate the app
      And launches the app
     Then a "non_numeric" red badge is displayed in the "navigation_top_bar.profile_icon" icon

    Examples:
          | client  | rate_row                | jira_id    |
          | android | Valóranos en Play Store | QANOV-6743 |
          | ios     | Valóranos en App Store  | QANOV-6744 |

  @jira.<jira_id> @<client> @automation.hard @deprecate_profile_moves @impeded_mock @jira.cv.11.6 @jira.dv.Future
  @jira.link.relates_to.NOV-53823 @manual @mobile @moves @regression
  Scenario Outline: User receives a notification to rate the app: a badge will be displayed in the "Rate us on App Store/Play Store" row
    Given user is in the "App Configuration" page
      And user has entered into the app at least 1 per week during 2 months consecutively
      And user has never rated the app via the "<rate_row>" option in profile screen
      And user hasn't rated the app via the event-based dialog in the last two months
     When receives a notification to rate the app
     Then a "non_numeric" red badge is displayed in the "<rate_row>" item

    Examples:
          | client  | rate_row                | jira_id    |
          | android | Valóranos en Play Store | QANOV-6745 |
          | ios     | Valóranos en App Store  | QANOV-6746 |

  @jira.QANOV-6749 @automation.hard @deprecate_profile_moves @ios @jira.cv.11.8 @jira.dv.Future
  @jira.link.depends_on.QANOV-6746 @jira.link.relates_to.NOV-53824 @manual @mobile @moves @regression
  Scenario: A user clicks on the "Rate us on App Store" option in Profile screen: the badge disappears
    Given user is in the "App Configuration" page
      And a "non_numeric" red badge is displayed in the "Valóranos en App Store" item
     When clicks on the "Valóranos en App Store" entrypoint
      And clicks on the native "back" button
     Then the notification badge is not displayed in the "Valóranos en App Store" item

  @jira.QANOV-6750 @android @automation.hard @deprecate_profile_moves @jira.cv.11.8 @jira.dv.Future
  @jira.link.depends_on.QANOV-6746 @jira.link.relates_to.NOV-53824 @manual @mobile @moves @regression
  Scenario: A user clicks on the "Rate us on Play Store" option in Profile screen: the badge disappears
    Given user is in the "App Configuration" page
      And a "non_numeric" red badge is displayed in the "Valóranos en Play Store" item
     When clicks on the "Valóranos en Play Store" entrypoint
      And the "Popup Rate Stars" popup is displayed
      And clicks on the "not_now" button
      And the "App Configuration" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed
     Then the notification badge is not displayed in the "Valóranos en Play Store" item

  @jira.<jira_id> @<client> @automation.hard @deprecate_profile_moves @jira.cv.11.8 @jira.dv.Future
  @jira.link.depends_on.QANOV-6746 @jira.link.relates_to.NOV-82310 @manual @mobile @moves @regression
  Scenario Outline: A user doesn't click on the "Rate us on App Store/Play Store" option in Profile tab: the badge does not disappear
    Given a "non_numeric" red badge is displayed in the "navigation_top_bar.profile_icon" icon
     When clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
      And clicks on the "app_configuration_entrypoint" entrypoint
      And the "App Configuration" page is displayed
     Then a "non_numeric" red badge is displayed in the "<rate_row>" item

    Examples:
          | client  | rate_row                | jira_id    |
          | android | Valóranos en Play Store | QANOV-6754 |
          | ios     | Valóranos en App Store  | QANOV-6755 |

  @jira.<jira_id> @<client> @automation.hard @deprecate_profile_moves @impeded_mock @jira.cv.11.8 @jira.dv.Future
  @jira.link.relates_to.NOV-82311 @manual @mobile @moves @regression
  Scenario Outline: A user won't receive a notification to rate the app if he/she has already rated it using the "Rate us" option in Profile page
    Given user hasn't rated the app via the event-based dialog in the last two months
      And user has rated the app via the "<rate_row>" option in profile screen
     When enters into the app at least 1 per week during 2 months consecutively
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
      And clicks on the "app_configuration_entrypoint" entrypoint
      And the "App Configuration" page is displayed
     Then the notification badge is not displayed in the "<rate_row>" item

    Examples:
          | client  | rate_row                | jira_id    |
          | android | Valóranos en Play Store | QANOV-6756 |
          | ios     | Valóranos en App Store  | QANOV-6758 |

  @jira.<jira_id> @<client> @automation.hard @deprecate_profile_moves @impeded_mock @jira.cv.11.8 @jira.dv.Future
  @jira.link.relates_to.NOV-82312 @manual @mobile @moves @regression
  Scenario Outline: A user won't receive a notification to rate the app if he/she has rated it via the event-based dialog in the last two months
    Given user has rated the app via the event-based dialog in the last two months
      And user hasn't rated the app via the "<rate_row>" option in profile screen
     When enters into the app at least 1 per week during 2 months consecutively except one week
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
      And clicks on the "app_configuration_entrypoint" entrypoint
      And the "App Configuration" page is displayed
     Then the notification badge is not displayed in the "<rate_row>" item

    Examples:
          | client  | rate_row                | jira_id    |
          | android | Valóranos en Play Store | QANOV-6759 |
          | ios     | Valóranos en App Store  | QANOV-6760 |

  @jira.<jira_id> @<client> @automation.hard @deprecate_profile_moves @impeded_mock @jira.cv.11.8 @jira.dv.Future
  @jira.link.relates_to.NOV-82313 @manual @mobile @moves @regression
  Scenario Outline: A user won't receive a notification to rate the app if he/she hasn't entered into the app at least 1 per week during 2 months consecutively
    Given user is in the "App Configuration" page
      And hasn't rated the app via the event-based dialog in the last two months
      And hasn't rated the app via the "<rate_row>" option in profile screen
     When enters into the app at least 1 per week during 2 months consecutively except one week
     Then the notification badge is not displayed in the "<rate_row>" item

    Examples:
          | client  | rate_row                | jira_id    |
          | android | Valóranos en Play Store | QANOV-6762 |
          | ios     | Valóranos en App Store  | QANOV-6764 |

  @jira.<jira_id> @<client> @automation.hard @deprecate_profile_moves @jira.cv.11.8 @jira.dv.Future @manual @mobile @moves
  @regression
  Scenario Outline: User who has a badge notification in the "Rate us on App Store/Play Store" option can see also badge notification in the Profile icon
    Given user is in the "App Configuration" page
      And a "non_numeric" red badge is displayed in the "<rate_row>" item
     When clicks on the "close" button
      And the "App Configuration" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed
     Then a "non_numeric" red badge is displayed in the "navigation_top_bar.profile_icon" icon

    Examples:
          | client  | rate_row                | jira_id    |
          | android | Valóranos en Play Store | QANOV-6765 |
          | ios     | Valóranos en App Store  | QANOV-6766 |

  @jira.QANOV-410719 @android @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A user can trigger the native app rating from profile
    This will open the native app rating, which is an OS feature
    Given user is in the "Profile" page
     When clicks on the "rate_app" button
     Then the "Native App Rating" app is displayed
