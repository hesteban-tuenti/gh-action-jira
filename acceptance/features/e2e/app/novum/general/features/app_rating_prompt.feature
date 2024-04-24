# -*- coding: utf-8 -*-
@jira.QANOV-8853
Feature: App rating prompt

  Actions Before the Feature:
    Given app rating is "enabled"

  Actions After the Feature:
     Then app rating is "disabled"


  @jira.<jira_id> @<test_priority> @android @automatic @jira.cv.11.3 @jira.link.relates_to.NOV-137083 @mobile @vivobr @har
  Scenario Outline: Vivo user cannot rate the app without selecting any stars in Android devices
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user is in the "Explore" page
      And the App Rating popup is displayed
     When user has not selected any stars on "rating_star_bar" rating bar
     Then the "not_now_button" button is displayed
      And the "send_button" button is not displayed
      And clicks on the "not_now_button" button
      And the "Explore" page is displayed

    @qa
    Examples:
          | account_type | number_plans | test_priority | jira_id    |
          | legacy       | 1            | regression    | QANOV-8855 |

    @live @next
    Examples:
          | account_type | number_plans | test_priority | jira_id    |
          | beatrix      | any          | smoke         | QANOV-8856 |

  @jira.<jira_id> @<har> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-137083 @mobile @smoke
  Scenario Outline: A <product> user cannot rate the app without selecting any stars in Android devices
    Given user is in the "Support" page
      And the App Rating popup is displayed
     When user has not selected any stars on "rating_star_bar" rating bar
     Then the "not_now_button" button is displayed
      And the "send_button" button is not displayed
      And clicks on the "not_now_button" button
      And the "Support" page is displayed

    @automatic @cert0 @cert1 @live @next
    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 11.3 | QANOV-8860 |

    @manual
    Examples:
          | product | har | cv   | jira_id      |
          | blaude  |     | 14.5 | QANOV-375653 |
          | o2de    |     | 14.5 | QANOV-375655 |

  @jira.QANOV-8858 @android @automatic @cert2 @jira.cv.11.3 @jira.link.relates_to.NOV-137083 @live @mobile @moves @next
  @smoke
  Scenario: A moves user cannot rate the app without selecting any stars in Android devices
    Given user is in the "Start" page
      And the App Rating popup is displayed
     When user has not selected any stars on "rating_star_bar" rating bar
     Then the "not_now_button" button is displayed
      And the "send_button" button is not displayed
      And clicks on the "not_now_button" button
      And the "Start" page is displayed

  @jira.<jira_id> @android @automatic @jira.cv.11.3 @jira.link.relates_to.NOV-186991 @mobile @smoke @vivobr
  Scenario Outline: Vivo user who hasn't selected any stars can cancel to send a rating in Android devices
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user is in the "Explore" page
      And the App Rating popup is displayed
     When user has not selected any stars on "rating_star_bar" rating bar
      And clicks on the "not_now_button" button
     Then the "Popup Rate Stars" page is not displayed
      And the "Explore" page is displayed

    @qa
    Examples:
          | account_type | number_plans | jira_id    |
          | legacy       | 1            | QANOV-8861 |

    @live @next
    Examples:
          | account_type | number_plans | jira_id    |
          | beatrix      | any          | QANOV-8863 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-186991 @mobile @smoke
  Scenario Outline: A <product> user who hasn't selected any stars can cancel to send a rating in Android devices
    Given user is in the "Support" page
      And the App Rating popup is displayed
     When user has not selected any stars on "rating_star_bar" rating bar
      And clicks on the "not_now_button" button
     Then the "Popup Rate Stars" page is not displayed
      And the "Support" page is displayed

    @automatic @cert0 @cert1 @live @next
    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 11.3 | QANOV-8867 |

    @manual
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.5 | QANOV-375657 |
          | o2de    | 14.5 | QANOV-375658 |

  @jira.QANOV-8865 @android @automatic @cert2 @jira.cv.11.3 @jira.link.relates_to.NOV-137083 @live @mobile @moves @next
  @smoke
  Scenario: A moves user who hasn't selected any stars can cancel to send a rating in Android devices
    Given user is in the "Start" page
      And the App Rating popup is displayed
     When user has not selected any stars on "rating_star_bar" rating bar
      And clicks on the "not_now_button" button
     Then the "Popup Rate Stars" page is not displayed
      And the "Start" page is displayed

  @jira.<jira_id> @<product> @<test_priority> @android @automation.hard @jira.cv.<cv> @jira.link.detects.<detects>
  @jira.link.relates_to.NOV-194579 @manual @mobile
  Scenario Outline: A <product> user who sees the rating dialog can select stars to rate the app
    Given user is in the "Account" page
      And the App Rating popup is displayed
     When clicks on "<stars_number>" stars on "rating_star_bar" rating bar
     Then the "rating_star_bar" displays "<stars_number>" highlighted stars
      And the "not_now_button" button with "[LANG:app_rating.app_rating_android.button]" text is displayed
      And the "send_button" button with "[LANG:app_rating.app_rating_android.send_button]" text is displayed

    Examples:
          | product | cv   | stars_number | test_priority | detects      | jira_id      |
          | moves   | 11.3 | 1            | smoke         | ANDROID-9645 | QANOV-6851   |
          | moves   | 11.3 | 4            | smoke         | ANDROID-9645 | QANOV-6855   |
          | moves   | 11.3 | 2            | regression    | ANDROID-9645 | QANOV-6853   |
          | moves   | 11.3 | 3            | regression    | ANDROID-9645 | QANOV-6854   |
          | moves   | 11.3 | 5            | regression    | ANDROID-9645 | QANOV-6856   |
          | blaude  | 14.5 | 1            | smoke         |              | QANOV-375660 |
          | blaude  | 14.5 | 4            | smoke         |              | QANOV-375664 |
          | blaude  | 14.5 | 2            | regression    |              | QANOV-375661 |
          | blaude  | 14.5 | 3            | regression    |              | QANOV-375663 |
          | blaude  | 14.5 | 5            | regression    |              | QANOV-375665 |
          | o2de    | 14.5 | 1            | smoke         |              | QANOV-375666 |
          | o2de    | 14.5 | 4            | smoke         |              | QANOV-375670 |
          | o2de    | 14.5 | 2            | regression    |              | QANOV-375668 |
          | o2de    | 14.5 | 3            | regression    |              | QANOV-375669 |
          | o2de    | 14.5 | 5            | regression    |              | QANOV-375672 |

  @jira.<jira_id> @<product> @android @automation.hard @jira.cv.<cv> @jira.link.relates_to.NOV-194589 @manual @mobile
  @regression
  Scenario Outline: A <product> user who sees the rating dialog can modify the selected stars
    internal_checkpoint="afters selecting a number of stars the user will be able to change the selection but the
    minimum number of stars selected will be 1"
    Given user is in the "Account" page
      And the App Rating popup is displayed
      And user has selected "<stars_number_before>" stars
     When clicks on "<stars_number_after>" stars on "rating_star_bar" rating bar
     Then the "rating_star_bar" displays "<stars_number_after>" highlighted stars
      And the "not_now_button" button with "[LANG:app_rating.app_rating_android.button]" text is displayed
      And the "send_button" button with "[LANG:app_rating.app_rating_android.send_button]" text is displayed

    @har
    Examples:
          | product | cv   | stars_number_before | stars_number_after | jira_id      |
          | moves   | 11.3 | 1                   | 2                  | QANOV-6858   |
          | blaude  | 14.5 | 2                   | 5                  | QANOV-375674 |
          | o2de    | 14.5 | 5                   | 1                  | QANOV-375680 |

    Examples:
          | product | cv   | stars_number_before | stars_number_after | jira_id      |
          | moves   | 11.3 | 2                   | 5                  | QANOV-6859   |
          | moves   | 11.3 | 5                   | 1                  | QANOV-6860   |
          | moves   | 11.3 | 3                   | 4                  | QANOV-6861   |
          | moves   | 11.3 | 3                   | 2                  | QANOV-6862   |
          | blaude  | 14.5 | 1                   | 2                  | QANOV-375673 |
          | blaude  | 14.5 | 5                   | 1                  | QANOV-375675 |
          | blaude  | 14.5 | 3                   | 4                  | QANOV-375676 |
          | blaude  | 14.5 | 3                   | 2                  | QANOV-375677 |
          | o2de    | 14.5 | 1                   | 2                  | QANOV-375678 |
          | o2de    | 14.5 | 2                   | 5                  | QANOV-375679 |
          | o2de    | 14.5 | 3                   | 4                  | QANOV-375681 |
          | o2de    | 14.5 | 3                   | 2                  | QANOV-375682 |

  @jira.<jira_id> @<product> @android @automation.hard @jira.cv.<cv> @jira.link.relates_to.NOV-194591 @manual @mobile
  @regression
  Scenario Outline: A <product> user who sees the rating dialog can cancel the rating after selecting stars and return to the Profile screen
    Given user is in the "<page>" page
      And the App Rating popup is displayed
     When clicks on "<stars_number>" stars on "rating_star_bar" rating bar
      And clicks on the "not_now_button" button
     Then the "<page>" page is displayed

    Examples:
          | product | cv   | stars_number | page              | jira_id      |
          | moves   | 11.3 | 1            | App Configuration | QANOV-6866   |
          | blaude  | 14.5 | 3            | Explore           | QANOV-375684 |
          | o2de    | 14.5 | 5            | Support           | QANOV-375688 |

    Examples:
          | product | cv   | stars_number | page              | jira_id      |
          | moves   | 11.3 | 3            | App Configuration | QANOV-6867   |
          | moves   | 11.3 | 5            | App Configuration | QANOV-6868   |
          | blaude  | 14.5 | 1            | Account           | QANOV-375683 |
          | blaude  | 14.5 | 5            | Support           | QANOV-375685 |
          | o2de    | 14.5 | 1            | Account           | QANOV-375686 |
          | o2de    | 14.5 | 3            | Explore           | QANOV-375687 |

  @jira.<jira_id> @<ber> @<test_priority> @android @automatic @jira.cv.11.3 @jira.link.parent_test_plan.QANOV-181726 @<har>
  @jira.link.relates_to.NOV-137067 @mobile @vivobr
  Scenario Outline: A vivo user can rate the app positively (4 o 5 stars) in Android devices
    NOTE: If the app used for testing is not the Store one the Play Store will still be opened but with a not found message
    Check action triggers in the appRating config file for the relevant environment, e.g. for vivo:
    https://fisheye.tuenti.io/browse/unified_config/environment/novum/vivo-br/app-rating/appRating.yaml?hb=true
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user is in the "Explore" page
      And the App Rating popup is displayed
      And clicks on "<number_stars>" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
     Then the "Play Store" app is displayed
      And the "Store" page is displayed
      And the "app_name" textfield that contains the "Vivo" text is displayed
      And clicks on the native "back" button
      And the "Explore" page is displayed

    @qa
    Examples:
          | account_type | number_stars | number_plans | test_priority | ber | har | jira_id    |
          | legacy       | 4            | 1            | smoke         | ber |     | QANOV-8868 |
          | legacy       | 5            | 1            | sanity        |     |     | QANOV-8870 |

    @live @next
    Examples:
          | account_type | number_stars | number_plans | test_priority | ber | har | jira_id    |
          | beatrix      | 4            | any          | sanity        |     | har | QANOV-8871 |
          | beatrix      | 5            | any          | smoke         | ber |     | QANOV-8873 |

  @jira.<jira_id> @<ber> @<product> @<test_priority> @android @automatic @cert0 @cert1 @cert2 @jira.cv.<cv> @live @mobile
  @next
  Scenario Outline: A <product> user can rate the app positively (4 o 5 stars) in Android devices: user is redirected to the Play Store
    NOTE: If the app used for testing is not the Store one the Play Store will still be opened but with a not found message
    Check action triggers in the appRating config file for the relevant environment, e.g. for vivo:
    https://gitlab.tuenti.io/tuenti/unified_config/blob/master/environment/novum/vivo-br/tuenti-ng/appRating.yaml
    Given user is in the "Support" page
      And the App Rating popup is displayed
     When clicks on "<number_stars>" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
     Then the "Play Store" app is displayed
      And the "Store" page is displayed
      And the "app_name" textfield that contains the "<app_name>" text is displayed
      And clicks on the native "back" button
      And the "Support" page is displayed

    @har
    Examples:
          | product | cv   | number_stars | test_priority | ber | app_name | jira_id      |
          | o2uk    | 11.3 | 5            | smoke         | ber | My O2    | QANOV-8879   |
          | blaude  | 14.5 | 5            | regression    |     | Blau     | QANOV-375692 |
          | o2de    | 14.5 | 5            | smoke         | ber | Mein o2  | QANOV-375695 |

    Examples:
          | product | cv   | number_stars | test_priority | ber | app_name | jira_id      |
          | o2uk    | 11.3 | 4            | sanity        |     | My O2    | QANOV-8877   |
          | blaude  | 14.5 | 4            | smoke         | ber | Blau     | QANOV-375690 |
          | o2de    | 14.5 | 4            | regression    |     | Mein o2  | QANOV-375693 |

  @jira.<jira_id> @<test_priority> @android @automatic @cert2 @jira.cv.11.3 @live @mobile @moves @next
  Scenario Outline: A moves user can rate the app positively (4 o 5 stars) in Android devices: user is redirected to the Play Store
    NOTE: If the app used for testing is not the Store one the Play Store will still be opened but with a not found message
    Check action triggers in the appRating config file for the relevant environment, e.g. for vivo:
    https://gitlab.tuenti.io/tuenti/unified_config/blob/master/environment/novum/vivo-br/tuenti-ng/appRating.yaml
    Given user is in the "Start" page
      And the App Rating popup is displayed
     When clicks on "<number_stars>" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
     Then the "Play Store" app is displayed
      And the "Store" page is displayed
      And the "app_name" textfield that contains the "<app_name>" text is displayed
      And clicks on the native "back" button
      And the "Start" page is displayed

    @har
    Examples:
          | number_stars | test_priority | ber | app_name    | jira_id    |
          | 5            | sanity        |     | Mi Movistar | QANOV-8876 |

    Examples:
          | number_stars | test_priority | ber | app_name    | jira_id    |
          | 4            | smoke         | ber | Mi Movistar | QANOV-8874 |

  @jira.<jira_id> @<test_priority> @android @automatic @cert2 @jira.cv.14.5 @live @mobile @moves @next
  Scenario Outline: User can rate the app negatively after having performed some action that triggers the App rating feature in Android devices: Play Store is displayed
    NOTE: If the app used for testing is not the Store one the Play Store will still be opened but with a not found message
    Check action triggers in the appRating config file for the relevant environment
    Given user is in the "Start" page
      And the App Rating popup is displayed
     When clicks on "<number_stars>" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
     Then the "Play Store" app is displayed
      And the "Store" page is displayed
      And the "app_name" textfield that contains the "Mi Movistar" text is displayed
      And clicks on the native "back" button
      And the "Start" page is displayed

    @har @ber
    Examples:
          | number_stars | test_priority | jira_id      |
          | 1            | sanity        | QANOV-371671 |

    Examples:
          | number_stars | test_priority | jira_id      |
          | 2            | regression    | QANOV-371672 |
          | 3            | regression    | QANOV-371673 |

  @jira.<jira_id> @<product> @<test_priority> @android @automation.hard @jira.cv.<cv> @jira.link.detects.<bug_id>
  @jira.link.relates_to.NOV-194592 @manual @mobile
  Scenario Outline: A <product> user can rate the app negatively (less than 4 stars) in Android devices: user is redirected to a feedback form
    Given user is in the "Support" page
      And the App Rating popup is displayed
     When clicks on "<number_stars>" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
     Then the "App Rating Feedback" internal webview is displayed
      And the "[LANG:app_rating.feedback_form.header]" header is displayed
      And the "title" textfield with "[LANG:app_rating.feedback_form.title]" text is displayed
      And the "input_text" inputtext with the "[LANG:app_rating.feedback_form.input_text]" placeholder is displayed
      And the "input_text" inputtext does not display an input counter
      And the "send_button" button with "[LANG:app_rating.feedback_form.send_button]" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    @har
    Examples:
          | product | cv   | number_stars | test_priority | bug_id        | jira_id      |
          | blaude  | 14.5 | 1            | smoke         | ANDROID-13449 | QANOV-375698 |
          | o2de    | 14.5 | 3            | smoke         | ANDROID-13449 | QANOV-375706 |

    Examples:
          | product | cv   | number_stars | test_priority | bug_id        | jira_id      |
          | blaude  | 14.5 | 2            | regression    | ANDROID-13449 | QANOV-375699 |
          | blaude  | 14.5 | 3            | regression    | ANDROID-13449 | QANOV-375701 |
          | o2de    | 14.5 | 1            | regression    | ANDROID-13449 | QANOV-375703 |
          | o2de    | 14.5 | 2            | regression    | ANDROID-13449 | QANOV-375704 |

  @jira.<jira_id> @<product> @<test_priority> @android @automation.hard @jira.cv.<cv> @jira.link.relates_to.NOV-194592
  @manual @mobile
  Scenario Outline: A <product> user can rate the app negatively (less than 4 stars) in Android devices: user is redirected to a feedback form
    Given user is in the "Start" page
      And the App Rating popup is displayed
     When clicks on "<number_stars>" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
     Then the "App Rating Feedback" internal webview is displayed
      And the "[LANG:app_rating.feedback_form.header]" header is displayed
      And the "title" textfield with "[LANG:app_rating.feedback_form.title]" text is displayed
      And the "input_text" inputtext with the "[LANG:app_rating.feedback_form.input_text]" placeholder is displayed
      And the "input_text" inputtext does not display an input counter
      And the "send_button" button with "[LANG:app_rating.feedback_form.send_button]" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    @har
    Examples:
          | product | cv   | number_stars | test_priority | jira_id    |
          | moves   | 11.3 | 1            | smoke         | QANOV-6869 |

    Examples:
          | product | cv   | number_stars | test_priority | jira_id    |
          | moves   | 11.3 | 2            | regression    | QANOV-6871 |
          | moves   | 11.3 | 3            | regression    | QANOV-6872 |

  @jira.<jira_id> @automatic @ios @jira.cv.9.14 @jira.link.relates_to.NOV-13249 @mobile @regression @vivobr @har
  Scenario Outline: Vivo user cannot rate the app without selecting any stars in iOS devices
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user is in the "Explore" page
      And the App Rating popup is displayed
     When user has not selected any stars on "rating_star_bar" rating bar
     Then the "not_now_button" button is displayed
      And the "send_button" button is not displayed
      And clicks on the "not_now_button" button
      And the "Explore" page is displayed

    @qa
    Examples:
          | account_type | number_plans | jira_id    |
          | legacy       | 1            | QANOV-8941 |

    @live @next
    Examples:
          | account_type | number_plans | jira_id    |
          | beatrix      | any          | QANOV-8943 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.relates_to.NOV-13249 @mobile @regression
  Scenario Outline: A <product> user cannot rate the app without selecting any stars in iOS devices
    Given user is in the "Support" page
      And the App Rating popup is displayed
     When user has not selected any stars on "rating_star_bar" rating bar
     Then the "not_now_button" button is displayed
      And the "send_button" button is not displayed
      And clicks on the "not_now_button" button
      And the "Support" page is displayed

    @automatic @cert0 @cert1 @live @next
    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 9.14 | QANOV-8946 |

    @manual
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.5 | QANOV-375709 |
          | o2de    | 14.5 | QANOV-375710 |

  @jira.QANOV-8945 @automatic @cert2 @ios @jira.cv.9.14 @jira.link.relates_to.NOV-13249 @live @mobile @moves @next
  @regression
  Scenario: A moves user cannot rate the app without selecting any stars in iOS devices
    Given user is in the "Start" page
      And the App Rating popup is displayed
     When user has not selected any stars on "rating_star_bar" rating bar
     Then the "not_now_button" button is displayed
      And the "send_button" button is not displayed
      And clicks on the "not_now_button" button
      And the "Start" page is displayed

  @jira.<jira_id> @<ber> @ios @jira.cv.9.14 @jira.link.relates_to.NOV-13248 @jira.link.relates_to.NOV-39052 @mobile
  @old_app @sanity @vivobr
  Scenario Outline: Vivo user can rate the app on iOS devices
    internal_checkpoint="This TC can only be tested in live since in the Enterprise version of the app the submit button is disabled"
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "<services_page>" page
     When clicks on the "pacotes" entrypoint
      And the internal webview with "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<services_page>" page is displayed
      And the "Popup Rate Stars" popup is displayed
      And clicks on "any" stars on "rating_star_bar" image
      And clicks on the "send_button" button
     Then the "App Store" app is displayed

    @impeded_legacy @no_automatable
    Examples:
          | account_type | services_page | number_plans | ber | jira_id    |
          | legacy       | ServicesV1    | 1            | ber | QANOV-8948 |

    @manual
    Examples:
          | account_type | services_page | number_plans | ber | jira_id    |
          | beatrix      | Account       | any          |     | QANOV-8950 |

  @jira.<jira_id> @<ber> @ios @jira.cv.24.3 @mobile @sanity @vivobr
  Scenario Outline: Vivo user can rate the app on iOS devices
    internal_checkpoint="This TC can only be tested in live since in the Enterprise version of the app the submit button is disabled"
    Given user has a "<account_type>" account type
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Assinatura" page
     When clicks on the "pacotes" entrypoint
      And the internal webview with "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Assinatura" page is displayed
      And the "Popup Rate Stars" popup is displayed
      And clicks on "any" stars on "rating_star_bar" image
      And clicks on the "send_button" button
     Then the "App Store" app is displayed

    Examples:
          | account_type | ber | jira_id      |
          | legacy       | ber | QANOV-599249 |
          | beatrix      |     | QANOV-599250 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.relates_to.NOV-13248 @jira.link.relates_to.NOV-39052 @mobile
  @no_automatable @sanity
  Scenario Outline: A <product> user can rate the app on iOS devices
    internal_checkpoint="This TC can only be tested in live since in the Enterprise version of the app the submit button is disabled"
    Given user is in the "Support" page
      And the App Rating popup is displayed
     When clicks on "any" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
     Then the "Apple_Store" app is displayed

    Examples:
          | product | cv   | jira_id      |
          | o2uk    | 9.14 | QANOV-8955   |
          | blaude  | 14.5 | QANOV-375714 |
          | o2de    | 14.5 | QANOV-375716 |

  @jira.QANOV-8953 @ios @jira.cv.9.14 @jira.link.relates_to.NOV-13248 @jira.link.relates_to.NOV-39052 @mobile @moves
  @no_automatable @sanity
  Scenario: A moves user can rate the app on iOS devices
    internal_checkpoint="This TC can only be tested in live since in the Enterprise version of the app the submit button is disabled"
    Given user is in the "Start" page
      And the App Rating popup is displayed
     When clicks on "any" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
     Then the "Apple_Store" app is displayed

  @jira.<jira_id> @automatic @ios @jira.cv.9.14 @jira.link.relates_to.NOV-13250 @mobile @smoke @vivobr @har
  Scenario Outline: Vivo user can discard to rate the app in iOS devices
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user is in the "Explore" page
      And the App Rating popup is displayed
     When clicks on the "not_now_button" button
     Then the "Popup Rate Stars" page is not displayed
      And the "Explore" page is displayed

    @qa
    Examples:
          | account_type | number_plans | jira_id    |
          | legacy       | 1            | QANOV-8958 |

    @live @next
    Examples:
          | account_type | number_plans | jira_id    |
          | beatrix      | any          | QANOV-8960 |

  @jira.<jira_id> @<product> @har @ios @jira.cv.<cv> @jira.link.relates_to.NOV-13250 @mobile @smoke
  Scenario Outline: A <product> user can discard to rate the app without selecting stars in iOS devices
    Given user is in the "Support" page
      And the App Rating popup is displayed
     When clicks on the "not_now_button" button
     Then the "Popup Rate Stars" page is not displayed
      And the "Support" page is displayed

    @automatic @cert0 @cert1 @live @next
    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 9.14 | QANOV-8963 |

    @manual
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.5 | QANOV-375719 |
          | o2de    | 14.5 | QANOV-375721 |

  @jira.QANOV-8962 @automatic @cert2 @har @ios @jira.cv.9.14 @jira.link.relates_to.NOV-13250 @live @mobile @moves @next
  @smoke
  Scenario: A moves user can discard to rate the app without selecting stars in iOS devices
    Given user is in the "Start" page
      And the App Rating popup is displayed
     When clicks on the "not_now_button" button
     Then the "Popup Rate Stars" page is not displayed
      And the "Start" page is displayed

  @jira.<jira_id> @automatic @ios @jira.cv.9.14 @jira.link.relates_to.NOV-13250 @mobile @smoke @vivobr @har
  Scenario Outline: Vivo user can discard to rate the app after selecting stars in iOS devices
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user is in the "Explore" page
      And the App Rating popup is displayed
     When clicks on "any" stars on "rating_star_bar" rating bar
      And clicks on the "cancel_button" button
     Then the "Popup Rate Stars" page is not displayed
      And the "Explore" page is displayed

    @qa
    Examples:
          | account_type | number_plans | jira_id      |
          | legacy       | 1            | QANOV-168360 |

    @live @next
    Examples:
          | account_type | number_plans | jira_id      |
          | beatrix      | any          | QANOV-168361 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.relates_to.NOV-13250 @mobile @smoke
  Scenario Outline: A <product> user can discard to rate the app after selecting stars in iOS devices
    Given user is in the "Support" page
      And the App Rating popup is displayed
     When clicks on "any" stars on "rating_star_bar" rating bar
      And clicks on the "cancel_button" button
     Then the "Popup Rate Stars" page is not displayed
      And the "Support" page is displayed

    @automatic @cert0 @cert1 @live @next
    Examples:
          | product | cv   | jira_id      |
          | o2uk    | 9.14 | QANOV-168363 |

    @manual
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.5 | QANOV-375724 |
          | o2de    | 14.5 | QANOV-375726 |

  @jira.QANOV-168362 @automatic @cert2 @ios @jira.cv.9.14 @jira.link.relates_to.NOV-13250 @live @mobile @moves @next
  @smoke
  Scenario: A moves user can discard to rate the app after selecting stars in iOS devices
    Given user is in the "Start" page
      And the App Rating popup is displayed
     When clicks on "any" stars on "rating_star_bar" rating bar
      And clicks on the "cancel_button" button
     Then the "Popup Rate Stars" page is not displayed
      And the "Start" page is displayed

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.11.2 @jira.link.relates_to.NOV-121820 @manual @mobile
  @regression
  Scenario Outline: User who is logged in two devices with different OS and triggers an app rating event will see the app rating popup in both devices
    Given user is logged in with the same account in two devices with different OS
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account for any device
      And user is in the "Explore" page
     When clicks on the "navigation_tab_bar.support_tab" tab
      And the "Support" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed in the "Android" device
      And the "Popup Rate Stars" popup is displayed in the "iOS" device

    Examples:
          | product | jira_id    |
          | o2uk    | QANOV-8988 |
          | moves   | QANOV-8989 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.2 @jira.link.relates_to.NOV-121820 @manual @mobile @old_app
  @regression @vivobr
  Scenario Outline: Vivo user who is logged in two devices with different OS and triggers an app rating event will see the app rating popup in both devices
    Given user is logged in with the same account in two devices with different OS
      And user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account for any device
      And user is in the "<services_page>" page
     When clicks on the "pacotes" entrypoint
      And the internal webview with "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<services_page>" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed in the "Android" device
      And the "Popup Rate Stars" popup is displayed in the "iOS" device

    Examples:
          | account_type | services_page | number_plans | jira_id    |
          | legacy       | ServicesV1    | 1            | QANOV-8991 |
          | beatrix      | Account       | any          | QANOV-8993 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.24.3 @manual @mobile @regression @vivobr
  Scenario Outline: Vivo user who is logged in two devices with different OS and triggers an app rating event will see the app rating popup in both devices
    Given user is logged in with the same account in two devices with different OS
      And user has a "<account_type>" account type
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account for any device
      And user is in the "Assinatura" page
     When clicks on the "pacotes" entrypoint
      And the internal webview with "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Assinatura" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed in the "Android" device
      And the "Popup Rate Stars" popup is displayed in the "iOS" device

    Examples:
          | account_type | jira_id      |
          | legacy       | QANOV-599252 |
          | beatrix      | QANOV-599253 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.14.5 @manual @mobile @regression
  Scenario Outline: A <product> user who is logged in two devices with different OS and triggers an app rating event will see the app rating popup in both devices
    Given user is logged in with the same account in two devices with different OS
      And user has a "mobile_line" product in "active" status
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Account" page
     When makes a successful bundle purchase
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed in the "Android" device
      And the "Popup Rate Stars" popup is displayed in the "iOS" device

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-375728 |
          | o2de    | QANOV-375730 |
