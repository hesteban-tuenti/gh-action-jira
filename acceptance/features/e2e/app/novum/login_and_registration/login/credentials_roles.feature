# -*- coding: utf-8 -*-
@jira.QANOV-126323
Feature: Credentials roles

  Actions Before each Scenario:
    Given user is in the "Splash Screen" page


  @jira.<jira_id> @TBD @android @ios @mobile @jira.cv.Future @manual @jira.link.parent_test_plan.QANOV-66688
  @jira.link.parent_test_plan.QANOV-77438 @o2uk @sanity @har
  Scenario Outline: A user with <role> role and at least a product with role different than user can login in the app
    commented_tags="@relates_to.NOV-47602 @relates_to.NOV-47610 @relates_to.NOV-47695 @relates_to.NOV-175429"
    internal_checkpoint="To search for this kind of user, search in userprofile API for a subscription with
    'roles': owner for the item corresponding to the email and at least one valid subscription (mobile_postpaid,
    mobile_internet, mobile_prepaid, device) with role owner"
    Given user is in the "O2uk User Password Login" page
     When fills the "email_field" inputtext with the "<role_user_email>" text
      And fills the "pass_field" inputtext with the "<role_user_pass>" text
      And clicks on the "continue_button" button
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | role  | role_user_email | role_user_pass | jira_id     |
          | owner | TBD             | TBD            | QANOV-67134 |
          | POA   | TBD             | TBD            | QANOV-67135 |

  @jira.QANOV-106131 @android @ios @mobile @jira.cv.Future @manual @jira.link.parent_test_plan.QANOV-66688
  @jira.link.parent_test_plan.QANOV-77438 @o2uk @smoke @har
  Scenario: A user with a valid role and some of the products of role user can see only the non-user products in the account
    commented_tags="@relates_to.NOV-47602 @relates_to.NOV-47610 @relates_to.NOV-47695 @relates_to.NOV-175429"
    internal_checkpoint="To search for this kind of user, search in userprofile API for a subscription with
    'roles': owner for the item corresponding to the email and at least one valid subscription (mobile_postpaid,
    mobile_internet, mobile_prepaid, device) with role owner and at least onne with role user"
    Given user is in the "O2uk User Password Login" page
     When logs in the application
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "subscription_selector" button
     Then the elements in the "subscription.list" list do not include "[CONTEXT:user_role_product]" product

  @jira.QANOV-67136 @TBD @android @ios @mobile @jira.cv.Future @manual
  @jira.link.parent_test_plan.QANOV-66688 @jira.link.parent_test_plan.QANOV-77438 @o2uk @regression
  Scenario: A user with role different from owner or PoA cannot login in the app
    internal_checkpoint="To search for this kind of user, search in userprofile API for a subscription with
    'roles' different than owner"
    commented_tags="@relates_to.NOV-47602 @relates_to.NOV-47610 @relates_to.NOV-47695 @relates_to.NOV-175429"
    Given user is in the "O2uk User Password Login" page
     When fills the "email_field" inputtext with the "non_owner_poa_user_email" text
      And fills the "pass_field" inputtext with the "non_owner_poa_user_pass" text
      And clicks on the "continue_button" button
     Then the "Invalid Role" popup is displayed
      And the "popup.title" textfield with "Sorry..." text is displayed
      And the "popup.message" textfield with "Only account owners can sign into the My O2 app. Please sign in using the My O2 web page." text is displayed
      And the "popup.accept" button with "Go to My O2 Web" text is displayed
      And the "popup.cancel" button with "Cancel" text is displayed

  @jira.QANOV-106132 @TBD @android @ios @mobile @jira.cv.Future @manual
  @jira.link.parent_test_plan.QANOV-66688 @jira.link.parent_test_plan.QANOV-77438 @o2uk @regression
  Scenario: A user with an owner identity but all products with user role cannot login in the app
    internal_checkpoint="To search for this kind of user, search in userprofile API for a subscription with
    'roles': owner for the item corresponding to the email and all the valid subscription (mobile_postpaid,
    mobile_internet, mobile_prepaid, device) with role user"
    Given user is in the "O2uk User Password Login" page
     When fills the "email_field" inputtext with the "non_owner_poa_user_email" text
      And fills the "pass_field" inputtext with the "non_owner_poa_user_pass" text
      And clicks on the "continue_button" button
     Then the "Invalid Role" popup is displayed
      And the "popup.title" textfield with "Sorry..." text is displayed
      And the "popup.message" textfield with "Only account owners can sign into the My O2 app. Please sign in using the My O2 web page." text is displayed
      And the "popup.accept" button with "Go to My O2 Web" text is displayed
      And the "popup.cancel" button with "Cancel" text is displayed

  @jira.QANOV-67137 @TBD @android @ios @mobile @jira.cv.Future @manual
  @jira.link.parent_test_plan.QANOV-66688 @jira.link.parent_test_plan.QANOV-77438 @o2uk @regression
  Scenario: A user with an invalid role taps on the "Go to My O2 Web" button: the browser is displayed
    Given Given user is in the "O2uk User Password Login" page
     When fills the "email_field" inputtext with the "non_owner_poa_user_email" text
      And fills the "pass_field" inputtext with the "non_owner_poa_user_pass" text
      And clicks on the "continue_button" button
      And the "Invalid Role" popup is displayed
      And clicks on the "popup.accept" button
     Then the external webview is displayed
      And the "TBD" url is displayed
      And clicks on the native "back" button
      And the "Splash Screen" page is displayed

  @jira.QANOV-67138 @android @ios @mobile @jira.cv.Future @manual @jira.link.parent_test_plan.QANOV-66688
  @jira.link.parent_test_plan.QANOV-77438 @o2uk @regression
  Scenario: A user with an invalid role taps on the "Cancel" button: the Splash screen is displayed
    Given Given user is in the "O2uk User Password Login" page
     When fills the "email_field" inputtext with the "non_owner_poa_user_email" text
      And fills the "pass_field" inputtext with the "non_owner_poa_user_pass" text
      And clicks on the "continue_button" button
      And the "Invalid Role" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Splash Screen" page is displayed
