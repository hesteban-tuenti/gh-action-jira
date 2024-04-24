@jira.QANOV-6652
Feature: Knowledge base integration (Aura R0)

  Actions Before the Feature:
    Given user has the Aura feature

  Actions Before each Scenario:
      And user is in the "Aura" page

  Actions After the Feature:
     Then clicks on the "close_aura" button
      And user is in the "Support" page


  @jira.<jira_id> @android @ios @mobile @jira.cv.10.8 @<execution_mode> @live @next @cert0 @cert1
  @jira.link.relates_to.NOV-91858 @o2uk @sanity @jira.link.detects.NOV-226828
  Scenario Outline: A user asks through <input> how to set up a personal hotspot
    Given user has a "postpay" account type
      And user has "1" mobile lines
     When sends the message "How do I set up a personal hotspot?" to Aura via "<input>"
      And waits until the "response_description" element is visible
     Then the "response_description" textfield with "To use your phone as a personal hotspot, you’ll need a 3G or 4G connection. You can find out how to set up a mobile hotspot using our online device support pages." text is displayed

    Examples:
          | input      | jira_id    | execution_mode |
          | microphone | QANOV-6653 | no_automatable |
          | keyboard   | QANOV-6654 | automatic      |

  @jira.<jira_id> @android @ios @mobile @jira.cv.11.4 @jira.link.depends_on.QANOV-6654
  @jira.link.relates_to.NOV-150611 @o2uk @regression @<execution_mode> @har
  Scenario Outline: A user can access to the online device support pages after asking through <input>
    Given user has a "postpay" account type
      And user has "1" mobile lines
     When sends the message "How do I set up a personal hotspot?" to Aura via "<input>"
      And clicks on the "online_device_support" link
     Then the browser webview is displayed
      And the "Product Support| Online help for your product | O2" header is displayed

    Examples:
          | input      | jira_id    | execution_mode |
          | microphone | QANOV-6655 | no_automatable |
          | keyboard   | QANOV-6656 | manual         |

  @jira.<jira_id> @android @ios @mobile @jira.cv.10.8 @<execution_mode> @jira.link.detects.NOV-226238
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-91859 @o2uk @smoke
  @jira.link.detects.APPS-7577 @live @next @cert0 @cert1 @har
  Scenario Outline: A user asks through <input> how to add a bolt on
    Given user has a "postpay" account type
      And user has "1" mobile lines
     When sends the message "Can I add a Bolt On" to Aura via "<input>"
      And waits until the "response_description" element is visible
     Then the "response_description" textfield with "We have many Data Bolt Ons to choose from." text is displayed

    Examples:
          | input      | jira_id    | execution_mode |
          | microphone | QANOV-6657 | no_automatable |
          | keyboard   | QANOV-6659 | automatic      |

  @jira.<jira_id> @android @ios @mobile @jira.cv.10.8 @<execution_mode> @jira.link.detects.NOV-223828
  @jira.link.relates_to.NOV-91857 @live @o2uk @regression @next @har
  Scenario Outline: A user asks through <input> if the payment date can be changed
    Given user has a "postpay" account type
      And user has "1" mobile lines
     When sends the message "Can I change my payment date" to Aura via "<input>"
      And waits until the "response_description" element is visible
     Then the "response_description" textfield with "You can change your billing or payment date by speaking to an advisor via My O2. Your billing date is when your bill is produced and your allowances reset. The payment date will be on the nearest working day, around 14 days later." text is displayed

    Examples:
          | input      | jira_id    | execution_mode |
          | microphone | QANOV-6660 | no_automatable |
          | keyboard   | QANOV-6662 | automatic      |

  @jira.<jira_id> @android @ios @mobile @jira.cv.10.8 @<execution_mode> @jira.link.relates_to.NOV-91855
  @live @o2uk @regression @next @cert0 @cert1
  Scenario Outline: A user asks through <input> if the phone abroad can be used
    Given user has a "postpay" account type
      And user has "1" mobile lines
     When sends the message "Can I use my phone abroad" to Aura via "<input>"
      And waits until the "response_description" element is visible
     Then the "response_description" textfield that contains the "You can use your device abroad, just make sure you have roaming enabled." text is displayed
     Then the "response_description" textfield that contains the "You can find more information on the O2 roaming support pages." text is displayed

    Examples:
          | input      | jira_id    | execution_mode |
          | microphone | QANOV-6663 | no_automatable |
          | keyboard   | QANOV-6664 | automatic      |

  @jira.<jira_id> @android @ios @mobile @jira.cv.10.8 @<execution_mode> @jira.link.relates_to.NOV-91854
  @live @o2uk @regression @next @cert0 @cert1
  Scenario Outline: A user asks through <input> why there is no signal
    Given user has a "postpay" account type
      And user has "1" mobile lines
     When sends the message "Why do I have no signal?" to Aura via "<input>"
      And waits until the "response_description" element is visible
     Then the "response_description" textfield that contains the "Use the O2 network checker to keep tabs on any O2 network issues or maintenance in your area, or to raise an issue yourself." text is displayed

    Examples:
          | input      | jira_id    | execution_mode |
          | microphone | QANOV-6665 | no_automatable |
          | keyboard   | QANOV-6666 | automatic      |
