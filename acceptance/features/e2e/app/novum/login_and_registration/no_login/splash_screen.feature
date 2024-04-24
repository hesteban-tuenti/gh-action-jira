# -*- coding: utf-8 -*-
@jira.QANOV-2903
Feature: Splash Screen

  Actions Before each Scenario:
    Given terminates the app
      And launches the app
      And user is logged out


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-1872 @mobile @sanity @har
  Scenario Outline: A <product> specific carousel is shown when a non-logged user opens the app
     Then the "Splash Screen" page is displayed
      And the "carousel_title_first" textfield with "[LANG:launch_app.splash_screen.carousel_title_first]" text is displayed
      And the "carousel_description_first" textfield with "[LANG:launch_app.splash_screen.carousel_description_first]" text is displayed
      And swipes from right to left over "carousel_description_first" element
      And the "carousel_title_second" textfield with "[LANG:launch_app.splash_screen.carousel_title_second]" text is displayed
      And the "carousel_description_second" textfield with "[LANG:launch_app.splash_screen.carousel_description_second]" text is displayed
      And swipes from right to left over "carousel_description_second" element
      And the "carousel_title_third" textfield with "[LANG:launch_app.splash_screen.carousel_title_third]" text is displayed
      And the "carousel_description_third" textfield with "[LANG:launch_app.splash_screen.carousel_description_third]" text is displayed

    @cert0 @cert1 @live @next
    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 9.12 | QANOV-2905 |

    @cert2 @live @next
    Examples:
          | product | cv   | jira_id    |
          | moves   | 9.12 | QANOV-2906 |

    @cert3 @live @next
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-230113 |

    @cert3 @live @next
    Examples:
          | product | cv   | jira_id     |
          | o2de    | 14.2 | QANOV-49042 |

  @jira.QANOV-453647 @android @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: An o2es specific carousel is shown when a non-logged user opens the app
     Then the "Splash Screen" page is displayed
      And the "carousel_title_first" textfield with "[LANG:launch_app.splash_screen.carousel_title_first]" text is displayed
      And swipes from right to left over "carousel_description_first" element
      And the "carousel_title_second" textfield with "[LANG:launch_app.splash_screen.carousel_title_second]" text is displayed
      And swipes from right to left over "carousel_description_second" element
      And the "carousel_title_third" textfield with "[LANG:launch_app.splash_screen.carousel_title_third]" text is displayed

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-47602 @mobile @smoke
  Scenario Outline: A non-logged <product> user can open the app on Android devices: Splash screen will be shown with Terms & conditions footer
     Then the "Splash Screen" page is displayed
      And the "logo" icon is displayed
      And the "start_now" button with "[LANG:launch_app.splash_screen.start_now]" text is displayed
      And the "terms_and_conditions_footer" textfield with "[LANG:launch_app.splash_screen.terms_and_conditions_footer.android]" text is displayed

    @automatic @cert0 @cert1 @live @next
    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 10.2 | QANOV-2908 |

    @automatic @cert2 @live @next
    Examples:
          | product | cv   | jira_id    |
          | moves   | 10.2 | QANOV-2909 |

    @manual
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-453637 |

  @jira.QANOV-287453 @android @automatic @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-376900
  @jira.link.parent_test_plan.QANOV-444740 @jira.link.relates_to.NOV-47602 @jira.link.parent_test_plan.QANOV-472060
  @mobile @smoke @vivobr @har @old_app
  Scenario: A non-logged vivobr user can open the app on Android devices: Splash screen will be shown with Terms & conditions footer
     Then the "Splash Screen" page is displayed
      And the "logo" icon is displayed
      And the "start_now" button with "[LANG:launch_app.splash_screen.start_now]" text is displayed
      And the "non_clients" button with "[LANG:launch_app.splash_screen.non_clients]" text is displayed
      And the "terms_and_conditions_footer" textfield with "[LANG:launch_app.splash_screen.terms_and_conditions_footer.android]" text is displayed
      And the "terms_and_conditions_link" link with "[LANG:launch_app.splash_screen.terms_and_conditions_link]" text is displayed

  @jira.QANOV-525540 @android @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-444740 @har
  @jira.link.parent_test_plan.QANOV-472060 @manual @mobile @smoke @vivobr
  Scenario: A non-logged vivobr user can open the app on Android devices: Splash screen will be shown with Terms & conditions footer
     Then the "Splash Screen" page is displayed
      And the "logo" icon is displayed
      And the "start_now" button with "[LANG:launch_app.splash_screen.start_now_novo_app]" text is displayed
      And the "non_clients" button with "[LANG:launch_app.splash_screen.non_clients_novo_app]" text is displayed
      And the "terms_and_conditions_footer" textfield with "[LANG:launch_app.splash_screen.terms_and_conditions_footer_novo_app.android]" text is displayed
      And the "terms_and_conditions_link" link with "[LANG:launch_app.splash_screen.terms_and_conditions_link]" text is displayed

  @jira.<jira_id> @<product> @android @automatic @ber @cert3 @ios @jira.cv.<cv> @jira.link.detects.<detects> @live @mobile
  @next @qa @sanity @har
  Scenario Outline: A non-logged <product> user can open the app: Splash screen will be shown with legal links
    Given user has set the cookies preferences
     Then the "Splash Screen" page is displayed
      And the "start_now" button with "[LANG:launch_app.splash_screen.start_now]" text is displayed
      And the "become_customer_link" link with "<registration_text>" text is displayed
      And the "cookies_link" link with "Cookies" text is displayed
      And the "data_protection_link" link with "Datenschutz" text is displayed
      And the "imprint_link" link with "Impressum" text is displayed

    Examples:
          | product | cv   | registration_text       | detects                          | jira_id      |
          | blaude  | 13.9 | Jetzt Blau Kunde werden | OBO2DE-158:OBO2DE-159:OBO2DE-307 | QANOV-230114 |
          | o2de    | 14.2 | Jetzt O₂ Kunde werden   |                                  | QANOV-49043  |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.relates_to.NOV-47602 @mobile @smoke @har
  Scenario Outline: A non-logged <product> user can open the app on iOS devices: Splash screen will be shown with Terms & conditions footer
     Then the "Splash Screen" page is displayed
      And the "logo" icon is displayed
      And the "start_now" button with "[LANG:launch_app.splash_screen.start_now]" text is displayed
      And the "terms_and_conditions_footer" textfield with "[LANG:launch_app.splash_screen.terms_and_conditions_footer.ios]" text is displayed
      And the "terms_and_conditions_link" link with "[LANG:launch_app.splash_screen.terms_and_conditions_link]" text is displayed

    @automatic @cert0 @cert1 @live @next
    Examples:
          | product | cv   | jira_id     |
          | o2uk    | 10.2 | QANOV-28947 |

    @automatic @cert2 @live @next
    Examples:
          | product | cv   | jira_id     |
          | moves   | 10.2 | QANOV-28948 |

    @manual
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-453638 |

  @jira.QANOV-525541 @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-444740
  @jira.link.parent_test_plan.QANOV-472060 @manual @mobile @smoke @vivobr @har
  Scenario: A non-logged vivobr user can open the app on iOS devices: Splash screen will be shown with Terms & conditions footer
     Then the "Splash Screen" page is displayed
      And the "logo" icon is displayed
      And the "start_now" button with "[LANG:launch_app.splash_screen.start_now_novo_app]" text is displayed
      And the "non_clients" button with "[LANG:launch_app.splash_screen.non_clients_novo_app]" text is displayed
      And the "terms_and_conditions_footer" textfield with "[LANG:launch_app.splash_screen.terms_and_conditions_footer_novo_app.ios]" text is displayed
      And the "terms_and_conditions_link" link with "[LANG:launch_app.splash_screen.terms_and_conditions_link]" text is displayed

  @jira.QANOV-287454 @automatic @ios @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-376900
  @jira.link.parent_test_plan.QANOV-444740 @jira.link.relates_to.NOV-47602 @jira.link.parent_test_plan.QANOV-472060
  @mobile @smoke @vivobr @old_app @har
  Scenario: A non-logged vivobr user can open the app on iOS devices: Splash screen will be shown with Terms & conditions footer
     Then the "Splash Screen" page is displayed
      And the "logo" icon is displayed
      And the "start_now" button with "[LANG:launch_app.splash_screen.start_now]" text is displayed
      And the "non_clients" button with "[LANG:launch_app.splash_screen.non_clients]" text is displayed
      And the "terms_and_conditions_footer" textfield with "[LANG:launch_app.splash_screen.terms_and_conditions_footer.ios]" text is displayed
      And the "terms_and_conditions_link" link with "[LANG:launch_app.splash_screen.terms_and_conditions_link]" text is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke @har
  Scenario Outline: A non-logged <product> user can see an image in the Splash screen for big screen devices
    The minimum screen size to see the image equals the size of an Iphone X screen, 5.85 inches.
    Given user has a device with a "big" screen
      And user is in the "Splash Screen" page
     Then the "logo" icon is displayed

    Examples:
          | product | cv    | jira_id      |
          | vivobr  | 13.10 | QANOV-287506 |
          | blaude  | 13.10 | QANOV-285599 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-472060 @manual @mobile @smoke
  @vivobr @har
  Scenario Outline: A non-logged vivobr user can see an image in the Splash screen for <size> screen devices
    The minimum screen size to see the image equals the size of an Iphone X screen, 5.85 inches.
    Given user has a device with a "<size>" screen
      And user is in the "Splash Screen" page
     Then the "static" image is displayed

    Examples:
          | size  | jira_id      |
          | big   | QANOV-525542 |
          | small | QANOV-525543 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @<label>
  Scenario Outline: A non-logged <product> user cannot see an image in the Splash screen for small screen devices
    The minimum screen size to see the image equals the size of an Iphone X screen, 5.85 inches.
    Given user has a device with a "small" screen
      And user is in the "Splash Screen" page
     Then the "logo" icon is not displayed

    Examples:
          | product | cv    | jira_id      | label   |
          | vivobr  | 13.10 | QANOV-287509 | old_app |
          | blaude  | 13.10 | QANOV-285601 |         |

  @jira.<jira_id> @<client> @<product> @automation.pending_mock @impeded_mock @jira.cv.<cv>
  @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-472060 @jira.link.relates_to.NOV-29470 @manual
  @mobile @regression
  Scenario Outline: A <product> user taps log in button but there is a server error: a popup with error message is displayed in <client> devices
    Given there is a general server error
     When clicks on the "start_now" button
     Then the "Server Error" popup is displayed
      And the "popup.title" textfield with "[LANG:launch_app.splash_screen.server_error_popup.<client>.message]" text is displayed

    Examples:
          | product | client  | depends_on | cv     | parent_test_plan | jira_id      |
          | vivobr  | android | QANOV-2904 | 10.0   | QANOV-472060     | QANOV-2925   |
          | vivobr  | ios     | QANOV-2904 | 10.0   | QANOV-472060     | QANOV-2926   |
          | o2uk    | android | QANOV-2905 | 10.0   |                  | QANOV-2927   |
          | o2uk    | ios     | QANOV-2905 | 10.0   |                  | QANOV-2928   |
          | moves   | android | QANOV-2906 | 10.0   |                  | QANOV-2929   |
          | moves   | ios     | QANOV-2906 | 10.0   |                  | QANOV-2930   |
          | o2es    | android |            | Future |                  | QANOV-453639 |
          | o2es    | ios     |            | Future |                  | QANOV-453640 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A <product> user taps log in button but there is a server error: a popup with error message is displayed in <client> devices
    Given user has set the cookies preferences
      And user is in the "Splash Screen" page
      And there is a general server error
     When clicks on the "start_now" button
     Then the "Server Error" popup is displayed
      And the "popup.title" textfield with "[LANG:launch_app.splash_screen.server_error_popup.<client>.message]" text is displayed

    Examples:
          | product | cv   | client  | depends_on   | jira_id      |
          | blaude  | 13.9 | android | QANOV-230114 | QANOV-230116 |
          | blaude  | 13.9 | ios     | QANOV-230114 | QANOV-230117 |
          | o2de    | 14.2 | android | QANOV-49043  | QANOV-49050  |
          | o2de    | 14.2 | ios     | QANOV-49043  | QANOV-49051  |

  @jira.<jira_id> @<ber> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.<detects>
  @jira.link.relates_to.NOV-1873 @mobile @regression
  Scenario Outline: A non-logged <product> user with data connectivity can see the Terms and Conditions
     When clicks on the "terms_and_conditions_link" link
     Then the internal webview with "[LANG:launch_app.splash_screen.terms_and_conditions_screen.navbar_header]" header is displayed

    @automatic @jira.link.parent_test_plan.QANOV-472060 @live @next
    Examples:
          | product | detects  | ber | cv   | jira_id    |
          | vivobr  | IOS-7510 | ber | 9.12 | QANOV-2942 |

    @automatic @cert0 @cert1 @live @next
    Examples:
          | product | detects            | ber | cv   | jira_id    |
          | o2uk    | O2UK-3296:IOS-7510 | ber | 9.12 | QANOV-2943 |

    @automatic @cert2 @live @next
    Examples:
          | product | detects  | ber | cv   | jira_id    |
          | moves   | IOS-7510 | ber | 9.12 | QANOV-2944 |

  @jira.QANOV-453641 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A non-logged o2es user with data connectivity can see the Terms and Conditions
    Currently the pdf is displayed, in talks with the OB to make this a dynamic page.
     When clicks on the "terms_and_conditions_link" link
     Then the internal webview with "[LANG:launch_app.splash_screen.terms_and_conditions_screen.navbar_header]" header is displayed

  @jira.<jira_id> @<product> @android @automatic @ber @cert3 @ios @jira.cv.<cv> @live @mobile @next @qa @smoke
  Scenario Outline: A non-logged <product> user with data connectivity can see the "<legal_link_name>" legal link
    Given user has set the cookies preferences
      And user is in the "Splash Screen" page
     When clicks on the "<legal_link_id>" link
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

    Examples:
          | product | cv   | legal_link_name         | legal_link_id        | header                                                        | jira_id      |
          | blaude  | 13.9 | Jetzt Blau Kunde werden | become_customer_link | Mobilfunkanbieter: So günstig geht mobil \| Blau entdecken    | QANOV-243562 |
          | blaude  | 13.9 | Datenschutz             | data_protection_link | Datenschutzerklärung                                          | QANOV-243563 |
          | blaude  | 13.9 | Impressum               | imprint_link         | Impressum von Blau                                            | QANOV-243564 |
          | o2de    | 14.2 | Jetzt O₂ Kunde werden   | become_customer_link | o2 \| Mobilfunkanbieter für Handytarif, Smartphone & Internet | QANOV-243567 |
          | o2de    | 14.2 | Datenschutz             | data_protection_link | Datenschutzerklärung Mein o2 App                              | QANOV-243568 |
          | o2de    | 14.2 | Impressum               | imprint_link         | Impressum                                                     | QANOV-243569 |

  @jira.<jira_id> @<product> @android @automatic @ber @cert3 @ios @jira.cv.<cv> @live @mobile @next @qa @smoke
  Scenario Outline: A non-logged <product> user with data connectivity can see the Cookies legal link
    Given user has set the cookies preferences
      And user is in the "Splash Screen" page
     When clicks on the "cookies_link" link
     Then the "Cookies Permissions" page is displayed
      And the "title" textfield with "Einstellungen für Cookies und ähnliche Technologien" text is displayed
      And clicks on the "accept_all" button
      And the "Splash Screen" page is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-243565 |
          | o2de    | 14.2 | QANOV-243570 |

  @jira.<jira_id> @<product> @android @automation.pending_mock @impeded_mock @ios @jira.cv.<cv>
  @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression
  Scenario Outline: A <product> user can accept server error popup
    Given there is a general server error
      And clicks on the "start_now" button
      And the "Server Error" popup is displayed
     When clicks on the "popup.accept" button
     Then the "Splash Screen" page is displayed
      And the "terms_and_conditions_footer" textfield is not displayed

    Examples:
          | product | depends_on            | cv     | parent_test_plan | jira_id      |
          | vivobr  | QANOV-2925:QANOV-2926 | 10.0   | QANOV-472060     | QANOV-2931   |
          | o2uk    | QANOV-2927:QANOV-2928 | 10.0   |                  | QANOV-2932   |
          | moves   | QANOV-2929:QANOV-2930 | 10.0   |                  | QANOV-2933   |
          | o2es    | QANOV-453640          | Future |                  | QANOV-453642 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A <product> user can accept server error popup
    Given user has set the cookies preferences
      And user is in the "Splash Screen" page
      And there is a general server error
      And clicks on the "start_now" button
      And the "Server Error" popup is displayed
     When clicks on the "popup.accept" button
     Then the "Splash Screen" page is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-230116:QANOV-230117 | QANOV-230119 |
          | o2de    | 14.2 | QANOV-49050:QANOV-49051   | QANOV-49052  |

  @jira.<jira_id> @<ber> @<product> @android @automatic @ios @jira.cv.10.2 @jira.link.depends_on.<depends_on>
  @jira.link.detects.<detects> @jira.link.relates_to.NOV-65195 @mobile @sanity @har
  Scenario Outline: A <product> user can access to the login screen
     When clicks on the "start_now" button
     Then the "<login_page>" page is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "<quit_page>" <quit_page_type> is displayed

    @jira.link.parent_test_plan.QANOV-472060 @live @next @qa
    Examples:
          | product | login_page               | quit_page  | quit_page_type | button       | depends_on | ber | detects | jira_id    |
          | vivobr  | Vivobr Credentials Login | Quit Popup | popup          | close_button | QANOV-2907 | ber |         | QANOV-2945 |

    @cert0 @cert1 @live @next
    Examples:
          | product | login_page               | quit_page  | quit_page_type | button      | depends_on | ber | detects | jira_id    |
          | o2uk    | O2uk User Password Login | Quit Popup | popup          | back_button | QANOV-2908 |     |         | QANOV-2946 |

  @jira.<jira_id> @<product> @android @automatic @ber @cert3 @jira.cv.<cv> @jira.link.depends_on.<depends_on> @live
  @mobile @next @sanity @har
  Scenario Outline: A <product> user can access to the "Login Credentials" screen on Android devices
    The login webview is opened in a modal screen.
    Given user has set the cookies preferences
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
     Then the "<page> Credentials Login" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

    Examples:
          | product | cv   | page   | depends_on   | jira_id     |
          | blaude  | 13.9 | Blaude | QANOV-230114 | QANOV-49059 |
          | o2de    | 14.2 | O2de   | QANOV-49043  | QANOV-49056 |

  @jira.<jira_id> @<product> @automatic @ber @cert3 @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @live @mobile
  @next @sanity @har
  Scenario Outline: A <product> user can access to the "Login Credentials" screen on iOS devices
    The login webview is opened in a modal screen.
    Given user has set the cookies preferences
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "Domain Permission Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "<page> Credentials Login" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

    Examples:
          | product | cv   | page   | depends_on   | jira_id      |
          | blaude  | 13.9 | Blaude | QANOV-230114 | QANOV-266859 |
          | o2de    | 14.2 | O2de   | QANOV-49043  | QANOV-266860 |

  @jira.QANOV-2947 @android @automatic @cert0 @cert1 @ios @jira.cv.10.4 @jira.link.detects.O2UK-3105
  @jira.link.relates_to.NOV-63607 @live @mobile @next @o2uk @regression
  Scenario: User can access to registration flow from splash screen
     When clicks on the "register" link with "Not yet registered? Register now" text
     Then the internal webview with the "O2 \| Accounts" format in the header is displayed
      And the "Register" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

  @jira.QANOV-38910 @android @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-38862 @manual @mobile @moves @smoke @har
  Scenario: A user can access to the login screen with Custom tabs in android devices
     When clicks on the "start_now" button
     Then the "Moves Credentials Login" browser webview is displayed

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-38862 @jira.link.relates_to.NOV-175545 @manual @mobile @smoke @har
  Scenario Outline: A user can see a permissions popup before accessing to the Login screen in ios devices
     When clicks on the "start_now" button
     Then the "Domain Permission Popup" popup is displayed

    Examples:
          | product | cv     | parent_test_plan | jira_id      |
          | vivobr  | 24.3   | QANOV-472060     | QANOV-2950   |
          | o2uk    | Future |                  | QANOV-2951   |
          | moves   | 13.1   |                  | QANOV-2952   |
          | o2es    | Future |                  | QANOV-453643 |

  @jira.<jira_id> @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-38862 @manual @mobile @moves @smoke @har
  Scenario Outline: A user can access to the Login screen after accepting the permissions popup in ios devices
     When clicks on the "start_now" button
      And the "Domain Permission Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "<page>" browser webview is displayed

    Examples:
          | product | cv     | page                    | jira_id      |
          | moves   | 13.1   | Moves Credentials Login | QANOV-38911  |
          | o2es    | Future | O2es Credentials Login  | QANOV-453644 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-38862 @jira.link.relates_to.NOV-175548
  @manual @mobile @regression
  Scenario Outline: A user who sees the permissions popup is redirected to the Splash screen after tapping on the Cancel button in ios devices
     When clicks on the "start_now" button
      And the "Domain Permission Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Splash Screen" page is displayed

    Examples:
          | product | depends_on | cv     | parent_test_plan | jira_id      |
          | vivobr  | QANOV-2950 | 24.3   | QANOV-472060     | QANOV-43931  |
          | o2uk    | QANOV-2951 | Future |                  | QANOV-43932  |
          | moves   | QANOV-2952 | 13.1   |                  | QANOV-43933  |
          | o2es    |            | Future |                  | QANOV-453645 |

  @jira.QANOV-2959 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.6
  @jira.link.parent_test_plan.QANOV-21049 @jira.link.relates_to.NOV-194624 @manual @mobile @moves @regression
  Scenario: A Telco-out user whose migration to legados was completed, is logged out and redirected to the splash screen
    Given user has a "telco-out postpay" account type
      And user is logged in
     When migration to legados is completed
     Then the "Splash Screen" page is displayed

  @jira.QANOV-38912 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-38862 @manual @mobile @moves @regression
  Scenario: User can close the Custom tab login screen
    Given user is in the "Moves Credentials Login" browser webview
     When clicks on the "navigation_top_bar.close_button" button
     Then the "Splash Screen" page is displayed

  @jira.QANOV-38913 @android @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-38862 @manual @mobile @moves @regression
  Scenario: User can go back to the Splash from the Custom tab login screen on Android devices
    Given user is in the "Moves Credentials Login" browser webview
     When clicks on the native "back" button
     Then the "Splash Screen" page is displayed

  @jira.QANOV-287455 @android @ios @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-376900 @manual @mobile @smoke
  @vivobr @har @old_app
  Scenario: A vivobr user can access to the "Client Recruitment" screen
    Given user has set the cookies preferences
      And user is in the "Splash Screen" page
     When clicks on the "non_clients" button
     Then the internal webview with "[LANG:launch_app.splash_screen.non_clients]" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Splash Screen" page is displayed

  @jira.QANOV-446122 @android @ios @jira.link.parent_test_plan.QANOV-444740 @jira.link.parent_test_plan.QANOV-472060
  @manual @mobile @smoke @vivobr @har
  Scenario: A vivobr user can access to the "Area Aberta" screen in Nova app
    Given user has set the cookies preferences
      And user is in the "Splash Screen" page
     When clicks on the "non_clients" button
     Then the internal webview is displayed
      And the "Aproveitar" string is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Splash Screen" page is displayed
