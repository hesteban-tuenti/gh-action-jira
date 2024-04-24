# -*- coding: utf-8 -*-
@jira.QANOV-6610
Feature: Check my last bill

  Actions Before the Feature:
    Given user has the Aura feature

  Actions After the Feature:
     Then clicks on the "close_aura" button
      And user is in the "Support" page


  @jira.QANOV-6616 @android @automatic @cert0 @cert1 @impeded_mock @ios @jira.cv.9.13 @jira.link.detects.NOV-228786
  @jira.link.detects.NOV-87589 @jira.link.relates_to.NOV-8312 @live @mobile @next @o2uk @smoke
  Scenario: A My O2 user can ask for the last bill through the question mark
    internal_checkpoint="On My O2 use the Query to search for users:
    SELECT * FROM `bill_previousbills` where (`bill_previousbills`.`result` LIKE '%05.2019%' OR
    `bill_previousbills`.`result` LIKE '%06.2019%') ORDER BY `result` DESC
    (where 05.2019 is the previous month and 06.2019 the actual month).
    NOTE: Aura doesn't support Emojis (Aura will read aloud emojis if there are sent in the response)
    NOTE: When user has several bills, they will be shown in a carrousel"
    Given user has a "postpay" account type
      And user has "1" mobile lines
      And user has a bill in the last "30" days
      And user is in the "Aura" page
     When clicks on the "question_mark_button" button
      And clicks on the alfred "alfred_main_topic_button" button with "[LANG:aura.menu_first_level.billing]" text
      And clicks on the alfred "alfred_sub_topic_button" button with "[LANG:aura.menu_second_level.last_bill]" text
     Then the "aura_card" card is displayed
      And the "aura_card.bill_amount" textfield with the "^£\d+(\.\d{1,2})?$" format is displayed
      And the "aura_card.bill_period" textfield with the "^From (0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d to (0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$" format is displayed
      And the "aura_card.view_on_app" link with "View on app" text is displayed
      And scrolls down
      And the "suggestions" list has "<=3" elements
      And the "suggestions" list is displayed

  @jira.QANOV-6622 @android @automatic @cert0 @cert1 @impeded_mock @ios @jira.cv.9.16 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-24924 @live @mobile @netcracker @next @o2uk @sanity
  Scenario: A My O2 user can ask for last bill through chat
    internal_checkpoint="On My O2 use the Query to search for users:
    SELECT * FROM `bill_previousbills` where (`bill_previousbills`.`result` LIKE '%05.2019%' OR
    `bill_previousbills`.`result` LIKE '%06.2019%') ORDER BY `result` DESC
    (where 05.2019 is the previous month and 06.2019 the actual month).
    NOTE: Aura doesn't support Emojis (Aura will read aloud emojis if there are sent in the response)
    NOTE: When user has several bills, they will be shown in a carrousel"
    Given user has a "postpay" account type
      And user has "1" mobile lines
      And user has a bill in the last "30" days
      And user is in the "Aura" page
     When sends the message "Last bill" to Aura via "keyboard"
     Then the "aura_card" card is displayed
      And the "aura_card.bill_amount" textfield with the "^£\d+(\.\d{1,2})?$" format is displayed
      And the "aura_card.bill_period" textfield with the "^From (0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d to (0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$" format is displayed
      And the "aura_card.view_on_app" link with "View on app" text is displayed
      And scrolls down
      And the "suggestions" list has "<=3" elements
      And the "suggestions" list is displayed

  @jira.QANOV-6629 @android @cert0 @cert1 @impeded_mock @ios @jira.cv.9.16 @jira.link.relates_to.NOV-24926 @mobile
  @no_automatable @o2uk @regression
  Scenario: A My O2 user can ask for the last bill through microphone
    internal_checkpoint="On My O2 use the Query to search for users:
    SELECT * FROM `bill_previousbills` where (`bill_previousbills`.`result` LIKE '%05.2019%' OR
    `bill_previousbills`.`result` LIKE '%06.2019%') ORDER BY `result` DESC
    (where 05.2019 is the previous month and 06.2019 the actual month).
    NOTE: Aura doesn't support Emojis (Aura will read aloud emojis if there are sent in the response)
    NOTE: When user has several bills, they will be shown in a carrousel"
    Given user has a "postpay" account type
      And user has "1" mobile lines
      And user has a bill in the last "30" days
      And user is in the "Aura" page
     When sends the message "Last bill" to Aura via "microphone"
     Then the "aura_card" card is displayed
      And the "aura_card.bill_amount" textfield with the "^£\d+(\.\d{1,2})?$" format is displayed
      And the "aura_card.bill_period" textfield with the "^From (0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d to (0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$" format is displayed
      And the "aura_card.view_on_app" link with "View on app" text is displayed
      And aura reads aloud the answer

  @jira.QANOV-6635 @android @automation.pending_mock @impeded_mock @ios @jira.cv.9.13 @jira.link.depends_on.QANOV-6616
  @jira.link.depends_on.QANOV-6622 @jira.link.depends_on.QANOV-6629 @jira.link.detects.NOV-183263
  @jira.link.detects.NOV-202243 @jira.link.detects.NOV-41108 @jira.link.relates_to.NOV-8356 @manual @mobile @o2uk
  @regression
  Scenario: A user can see last bill
    internal_checkpoint=" On My O2 use the Query to search for users:
    SELECT * FROM `bill_previousbills` where (`bill_previousbills`.`response` LIKE '%05.2019%' OR
    `bill_previousbills`.`response` LIKE '%06.2019%') ORDER BY `response` DESC
    (where 05.2019 is the previous month and 06.2019 the actual month)."
    commented_tags="@depends_on.NOV-24923"
    Given user has a "postpay" account type
      And user has "1" mobile lines
      And user has a bill in the last "30" days
      And user is in the "Aura" page
     When clicks on the "question_mark_button" button
      And clicks on the alfred "alfred_main_topic_button" button with "[LANG:aura.menu_first_level.billing]" text
      And clicks on the alfred "alfred_sub_topic_button" button with "[LANG:aura.menu_second_level.last_bill]" text
      And clicks on the "aura_card.view_on_app" link
     Then the "Bills" page is displayed

  @jira.QANOV-6636 @android @automation.pending_mock @cert0 @cert1 @impeded_mock @ios @jira.cv.10.8 @jira.link.detects.NOV-201014
  @jira.link.relates_to.NOV-91869 @manual @mobile @o2uk @regression
  Scenario: A user with phone plan can ask for last bill
    internal_checkpoint="User to test on CERT0 (Tested on 02/12/19): weq79356053@stf.ref.o2.co.uk"
    Given user has a "postpay" account type
      And user has the device plan in "any" status
      And user has "1" mobile lines
      And user has a bill in the last "30" days
      And user is in the "Aura" page
     When sends the message "Last bill" to Aura via "keyboard"
     Then the "aura_card" card is displayed
      And the "response_description" textfield with "Let's take a look. You've got 2 bills." text is displayed
      And the "billing_card_carousel" carousel has "2" cards
