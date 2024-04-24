# -*- coding: utf-8 -*-
@jira.QANOV-126433
Feature: Rate us without connectivity


  @jira.<jira_id> @<product> @android @automation.hard @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.ANDROID-13438 @jira.link.relates_to.NOV-194595 @manual @mobile @regression
  Scenario Outline: A user who loses the connection before sending the form will see a spinner while the app retries sending the form
    Given user is in the "Popup Rate Stars" popup
     When clicks on "1" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
      And the "App Rating Feedback" page is displayed
      And user turns on the Airplane mode
      And fills the "input_text" inputtext with the "This is a Qsys test from Novum" text
      And clicks on the "send_button" button
     Then the "App Rating Feedback" page is displayed
      And the "send_button" button displays a spinner in it

    Examples:
          | product | cv   | depends_on                             | jira_id      |
          | moves   | 11.8 | QANOV-6869:QANOV-6871:QANOV-6872       | QANOV-6879   |
          | blaude  | 14.5 | QANOV-375698:QANOV-375699:QANOV-375701 | QANOV-375613 |
          | o2de    | 14.5 | QANOV-375703:QANOV-375704:QANOV-375706 | QANOV-375614 |

  @jira.<jira_id> @<product> @android @automation.hard @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-194597 @manual @mobile @regression
  Scenario Outline: A user who lost the connection and sent the form will see the Feedback Success screen when recovering the connection
    Given user is in the "Popup Rate Stars" popup
     When clicks on "3" stars on "rating_star_bar" rating bar
      And clicks on the "send" button
      And the "App Rating Feedback" page is displayed
      And user turns on the Airplane mode
      And fills the "input_text" inputtext with the "This is a Qsys test from Novum" text
      And clicks on the "send_button" button
      And the "App Rating Feedback" page is displayed
      And turns off the Airplane mode
      And clicks on the "send_button" button
     Then the "Feedback Rating Success" internal webview is displayed
      And the "title" textfield with "[LANG:app_rating.feedback_success.title]" text is displayed
      And the "text" textfield with "[LANG:app_rating.feedback_success.subtitle]" text is displayed
      And the "close_button" button with "[LANG:app_rating.feedback_success.close_button]" text is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | moves   | 11.8 | QANOV-6879   | QANOV-6880   |
          | blaude  | 14.5 | QANOV-375613 | QANOV-375615 |
          | o2de    | 14.5 | QANOV-375614 | QANOV-375616 |

  @jira.<jira_id> @<product> @android @automation.hard @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-194599 @manual @mobile @regression
  Scenario Outline: A user who loses the connection and rates negatively the app will see the No connectivity screen
    Given user is in the "Popup Rate Stars" popup
      And user turns on the Airplane mode
     When clicks on "<stars_number>" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
     Then the "No Connectivity" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed

    Examples:
          | product | cv   | stars_number | depends_on   | jira_id      |
          | moves   | 11.8 | 1            | QANOV-6849   | QANOV-6881   |
          | moves   | 11.8 | 2            | QANOV-6849   | QANOV-6882   |
          | moves   | 11.8 | 3            | QANOV-6849   | QANOV-6884   |
          | blaude  | 14.5 | 1            | QANOV-376051 | QANOV-375618 |
          | blaude  | 14.5 | 2            | QANOV-376051 | QANOV-375619 |
          | blaude  | 14.5 | 3            | QANOV-376051 | QANOV-375621 |
          | o2de    | 14.5 | 1            | QANOV-376053 | QANOV-375622 |
          | o2de    | 14.5 | 2            | QANOV-376053 | QANOV-375623 |
          | o2de    | 14.5 | 3            | QANOV-376053 | QANOV-375625 |

  @jira.<jira_id> @<product> @android @automation.hard @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-199239 @manual @mobile @regression
  Scenario Outline: A user who loses the connection and rates the app positively will be redirected to the Play Store and see a no connectivity message
    Given user is in the "Popup Rate Stars" popup
      And user turns on the Airplane mode
     When clicks on "<stars_number>" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
     Then the "Play Store" app is displayed

    Examples:
          | product | cv   | stars_number | depends_on   | jira_id      |
          | moves   | 11.8 | 4            | QANOV-6849   | QANOV-6885   |
          | moves   | 11.8 | 5            | QANOV-6849   | QANOV-6886   |
          | blaude  | 14.5 | 4            | QANOV-376051 | QANOV-375626 |
          | blaude  | 14.5 | 5            | QANOV-376051 | QANOV-375627 |
          | o2de    | 14.5 | 4            | QANOV-376053 | QANOV-375628 |
          | o2de    | 14.5 | 5            | QANOV-376053 | QANOV-375630 |

  @jira.<jira_id> @<product> @android @automation.hard @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-194600 @manual @mobile @regression
  Scenario Outline: A user who lost the connection and rated the app negatively will be redirected to the feedback form screen after recovering the connection
    Given user is in the "Popup Rate Stars" popup
      And user turns on the Airplane mode
     When clicks on "1" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
      And the "No Connectivity" page is displayed
      And turns off the Airplane mode
      And clicks on the "retry" button
     Then the "App Rating Feedback" page is displayed

    Examples:
          | product | cv   | depends_on                             | jira_id      |
          | moves   | 11.8 | QANOV-6881:QANOV-6882:QANOV-6884       | QANOV-6887   |
          | blaude  | 14.5 | QANOV-375618:QANOV-375619:QANOV-375621 | QANOV-375631 |
          | o2de    | 14.5 | QANOV-375622:QANOV-375623:QANOV-375625 | QANOV-375632 |

  @jira.<jira_id> @<product> @android @automation.hard @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-194602 @manual @mobile @regression
  Scenario Outline: A user who lost the connection and rated the app will remain in the same screen after retrying without recovering the connection
    Given user is in the "Popup Rate Stars" popup
      And user turns on the Airplane mode
     When clicks on "1" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
      And the "No Connectivity" page is displayed
      And clicks on the "retry" button
     Then the "No Connectivity" page is displayed

    Examples:
          | product | cv   | depends_on                                                       | jira_id      |
          | moves   | 11.8 | QANOV-6881:QANOV-6882:QANOV-6884:QANOV-6885:QANOV-6886           | QANOV-27014  |
          | blaude  | 14.5 | QANOV-375618:QANOV-375619:QANOV-375621:QANOV-375626:QANOV-375627 | QANOV-375634 |
          | o2de    | 14.5 | QANOV-375622:QANOV-375623:QANOV-375625:QANOV-375628:QANOV-375630 | QANOV-375635 |
