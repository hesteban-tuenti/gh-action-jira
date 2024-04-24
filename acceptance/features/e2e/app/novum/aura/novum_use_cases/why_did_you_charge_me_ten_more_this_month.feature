@jira.QANOV-6601
Feature: Why did you charge me ten more this month?

  Actions Before the Feature:
    Given user has the Aura feature

  Actions After the Feature:
     Then clicks on the "close_aura" button
      And user is in the "Support" page

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has "1" mobile lines
      And user is in the "Aura" page


  @jira.<jira_id> @android @ios @mobile @jira.cv.10.8 @manual @jira.link.relates_to.NOV-91866
  @o2uk @amoke @impeded_mock @automation.pending_mock
  Scenario Outline: A user can ask why is his/her bill higher this month when his/her last bill is higher than the previous bills by <input_type>
    Given user has bills for "several" months
      And last bill is higher than the amount of previous bill
     When sends the message "Why is my bill 10 pound more this month?" to Aura via "<input_type>"
     Then the "aura_response" textfield with "Let's take a look. Your latest bill was £ XX.XX higher than usual because of extra costs." format is displayed
      And the "aura_response_link" link is displayed

    Examples:
      | input_type | jira_id    |
      | keyboard   | QANOV-6602 |
      | microphone | QANOV-6604 |

  @jira.QANOV-6605 @android @ios @mobile @jira.cv.10.8 @manual @jira.link.relates_to.NOV-91867
  @o2uk @sanity @impeded_mock @automation.pending_mock
  Scenario: A user can see why is his/her bill higher this month from question mark icon
    Given user has bills for "several" months
      And last bill is higher than the amount of previous bill
     When clicks on the "question_mark_button" button
      And clicks on the "billing" button with "[LANG:aura.menu_first_level.billing]" text
      And clicks on the "higher_charges" button with "Higher charges,why?" text
     Then the "aura_response" textfield with "Let's take a look. Your latest bill was £ XX.XX higher than usual because of extra costs." format is displayed
      And the "aura_response_link" link is displayed

  @jira.<jira_id> @android @ios @mobile @jira.cv.10.8 @<execution_mode> @jira.link.detects.NOV-228786
  @jira.link.relates_to.NOV-91868 @live @o2uk @regression @cert0 @cert1 @next
  Scenario Outline: A user can not compare his/her higher bills without enough bills by <input_type>
    Given user has no bills
     When sends the message "Why is my bill 10 pound more this month?" to Aura via "<input_type>"
      And waits until the "response_description" element is visible
     Then the "response_description" textfield with "Unfortunately I can’t help you with overcharging info today. If you need more information on your O2 products and services, go to MyO2." text is displayed

    Examples:
      | input_type | jira_id    | execution_mode |
      | keyboard   | QANOV-6606 | automatic      |
      | microphone | QANOV-6607 | no_automatable |
