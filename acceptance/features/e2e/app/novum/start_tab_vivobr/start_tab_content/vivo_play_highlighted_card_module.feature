# -*- coding: utf-8 -*-
@jira.QANOV-284682
Feature: Vivo play highlighted card module

  Actions Before each Scenario:
    Given user has the "vivo-play-highlighted-card" module configured in CMS for "start" page


  @jira.<jira_id> @<ber> @<test_priority> @android @automatic @ios @jira.cv.13.9 @live @mobile @next @qa @vivobr @old_app
  Scenario Outline: A user with <plans> plans will see the Vivo play module in Start tab
    Given user has any "<account_types>" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "<plans>" plans
      And user has a "any" plan in "active" status
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     Then the "vivo_play_highlighted_card_module" module is displayed
      And the "vivo_play_highlighted_card_module.title" textfield with "APROVEITE MAIS DA VIVO" text is displayed
      And the "vivo_play_highlighted_card_module.card.title" textfield is displayed
      And the "vivo_play_highlighted_card_module.card.subtitle" textfield is displayed
      And the "vivo_play_highlighted_card_module.card.link" link with "Ir para o Vivo Play" text is displayed
      And the "vivo_play_highlighted_card_module.card.image" image is displayed

    Examples:
          | account_types                                        | plans   | test_priority | ber | jira_id      |
          | beatrix;convergente;multivivo;control_n;jeri control | 1       | smoke         | ber | QANOV-284684 |
          | any                                                  | several | smoke         |     | QANOV-284685 |

  @jira.<jira_id> @android @jira.cv.13.9 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A user with <plans> plans can access to the Vivo Play app in Google Play from Vivo play link in Start tab on Android devices
    Given user has any "<account_types>" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "<plans>" plans
      And user has a "any" plan in "active" status
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When clicks on the "vivo_play_highlighted_card_module.card.link" entrypoint
     Then the "Google Play" app is displayed

    Examples:
          | account_types                                        | plans   | jira_id      |
          | convergente;multivivo;beatrix;control_n;jeri control | 1       | QANOV-284687 |
          | any                                                  | several | QANOV-284688 |

  @jira.<jira_id> @ios @jira.cv.13.9 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A user with <plans> plans can access to the Vivo Play app in App Store from Vivo play link in Start tab on iOS devices
    Given user has any "<account_types>" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "<plans>" plans
      And user has a "any" plan in "active" status
      And user is in the "Start" page
     When clicks on the "vivo_play_highlighted_card_module.card.link" link
     Then the "App Store" app is displayed

    Examples:
          | account_types                                        | plans   | jira_id      |
          | convergente;multivivo;beatrix;control_n;jeri control | 1       | QANOV-284689 |
          | any                                                  | several | QANOV-284690 |
