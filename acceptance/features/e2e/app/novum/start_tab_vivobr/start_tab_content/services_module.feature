# -*- coding: utf-8 -*-
@jira.QANOV-97680
Feature: Services module

  Actions Before each Scenario:
    Given user has the "service-carousel" module configured in CMS for "start" page


  @jira.QANOV-97681 @android @ber @ios @jira.cv.12.5 @automatic @mobile @smoke @vivobr @qa @old_app
  Scenario: A prepay/jeri postpay user will see the services module
    Given user has any "legacy prepay;jeri prepay" account types
      And user has "1" plans
      And user is in the "Start" page
     Then the "services" module is displayed
      And the "services.title" textfield with "SERVIÇOS DO MEU PRÉ" text is displayed
      And the "services.carousel" carousel with "Faça uma recarga;Troca de plano;Enviar internet disponível;Pedir internet aos meus contatos;Promoções" cards is displayed

  @jira.<jira_id> @android @ios @jira.cv.12.5 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A prepay user can access to "<service>" service webview
    Given user has any "legacy prepay;jeri prepay" account types
      And user has "any" plans
      And user is in the "Start" page
     When clicks on the "<index>" element in the "services.carousel_list" list
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

    Examples:
          | index | service                        | header                | jira_id     |
          | 0     | Faça uma recarga               | Faça uma recarga      | QANOV-97682 |
          | 1     | Troca de plano                 | Troca de plano        | QANOV-97683 |
          | 2     | Enviar internet disponível     | Compartilhar Internet | QANOV-97686 |
          | 3     | Pedir internet aos meus amigos | Pedir Internet        | QANOV-97684 |
          | 4     | Promoções                      | Minha promoção        | QANOV-97685 |


  @jira.QANOV-184179 @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario: A multiplan user can not see the services module
    Given user has any "legacy prepay;jeri prepay" account types
      And user has "several" plans
      And user is in the "Start" page
     Then the "services" module is not displayed
