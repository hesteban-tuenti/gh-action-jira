# -*- coding: utf-8 -*-
@jira.QANOV-377341
Feature: Fixed section


  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @sanity
  @vivobr
  Scenario Outline: convergente user with <product_plan> plan will see plan module in Assinatura tab
    Given user has a "convergente" account type
      And user has a "<product_plan>" plan in "active" status
      And user does not have a "siebel" plan
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is displayed
      And the "plans.fixo_product" section is displayed
      And the "plans.fixo_product.info" textfield is displayed

    Examples:
          | product_plan | ber | jira_id      |
          | internet     | ber | QANOV-377342 |
          | tv           |     | QANOV-377343 |

  @jira.QANOV-525505 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @sanity
  @vivobr
  Scenario: convergente user with tv plan will see plan module in Assinatura tab
    Given user has a "convergente" account type
      And user has a "tv" plan in "active" status
      And user has a "siebel" plan
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is displayed

  @jira.QANOV-525506 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @sanity
  @vivobr
  Scenario: convergente user with landline plan will see plan module in Assinatura tab
    Given user has a "convergente" account type
      And user has a "landline" plan in "active" status
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is displayed

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @smoke
  @vivobr
  Scenario Outline: convergente user with <product_plan> plan without mobile line will see plan module in Assinatura tab
    Given user has a "convergente" account type
      And user has a "<product_plan>" plan in "active" status
      And user does not have "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is displayed
      And the "plans.products_list" list is displayed
      And each element in the "plans.products_list" list has the "title" field
      And each element in the "plans.products_list" list has the "info" field

    Examples:
          | product_plan | ber | jira_id      |
          | trio         | ber | QANOV-377345 |
          | duo          |     | QANOV-377346 |

  @jira.QANOV-377347 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @smoke @vivobr
  Scenario: convergente user with with mobile line will see plan module in Assinatura tab
    Given user has a "convergente" account type
      And user has a "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is displayed
      And the "plans.mobile_allowances" section is displayed
      And the "plans.products_list" list is displayed
      And each element in the "plans.products_list" list has the "title" field
      And each element in the "plans.products_list" list has the "info" field

  @jira.QANOV-525507 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @smoke @vivobr
  Scenario: convergente user in pending installation status with mobile line will see plan module in Assinatura tab
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has a "mobile_line" product
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is displayed
      And the "plans.mobile_allowances" section is displayed
      And the "plans.fixo_product" section is displayed
      And the "plans.fixo_product.title" textfield with "Instalação em andamento" text is displayed
      And the "plans.fixo_product.subtitle" textfield with "Se já agendou a visita, vamos no dia agendado.Caso não, agende a sua instalação o quanto antes" text is displayed

  @jira.QANOV-420534 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @sanity
  @vivobr
  Scenario: convergente user with pending plan and without mobile_line will see plan module in Assinatura tab
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user does not have "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.fixo_product" section is displayed
      And the "plans.fixo_product.title" textfield with "Instalação em andamento" text is displayed
      And the "plans.fixo_product.subtitle" textfield with "Se já agendou a visita, vamos no dia agendado.Caso não, agende a sua instalação o quanto antes" text is displayed

  @jira.QANOV-525508 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @smoke @vivobr
  Scenario: convergente user in cancelled status will see plan module in Assinatura tab
    Given user has a "convergente" account type
      And user has a "any" plan in "cancelled" status
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.fixo_product" section is displayed
      And the "plans.fixo_product.title" textfield with "Assinatura cancelada" text is displayed
      And the "plans.fixo_product.subtitle" textfield with the "Data do cancelamento: \d\d/\d\d/\d\d\d\d" format is displayed

  @jira.QANOV-450780 @android @ios @ber @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke @vivobr
  Scenario: User with internet product will see plan module in Plan details page
    Given user has a "internet" product
      And user does not have a "siebel" plan
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "plan.internet" section is displayed
      And the "plan.internet_title" textfield is displayed
      And the "plan.download_information" textfield with "Download até" text is displayed
      And the "plan.internet_download" textfield with the "\d+ Mbps" format is displayed
      And the "plan.upload_information" textfield with "Upload até" text is displayed
      And the "plan.internet_upload" textfield with the "\d+ Mbps" format is displayed

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke @vivobr
  Scenario Outline: User with <product_plan> will see plan module in Plan details page
    Given user has a "<product_plan>" product
      And user does not have a "siebel" plan
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "plan.<product_plan>" section is displayed
      And the "plan.<product_plan>_title" textfield is displayed
      And the "plan.<product_plan>_information" textfield is displayed

    Examples:
          | product_plan | jira_id      |
          | landline     | QANOV-450781 |
          | tv           | QANOV-450782 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke @vivobr
  Scenario Outline: User with <product_plan> product siebel will see plan module in Plan details page
    Given user has a "<product_plan>" product
      And user has a "siebel" plan
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "plan.<product_plan>" section is displayed
      And the "plan.<product_plan>_title" textfield is displayed

    Examples:
          | product_plan | jira_id      |
          | landline     | QANOV-570510 |
          | tv           | QANOV-570511 |
          | internet     | QANOV-570512 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @sanity
  @vivobr
  Scenario Outline: convergente user with <product_plan> plan will see a plan card with "fixo" info in Assinatura tab during a maintenance window
    Given user has a "convergente" account type
      And user has a "<product_plan>" plan in "active" status
      And there is a maintenance window
      And the "fixo" information is available
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is not displayed
      And the "plans.fixo_product" section is displayed
      And the "plans.fixo_product.info" textfield is displayed
      And the "plans.footer_link" link is displayed

    Examples:
          | product_plan | ber | jira_id      |
          | internet     | ber | QANOV-517428 |
          | tv           |     | QANOV-517429 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile
  @regression @vivobr
  Scenario Outline: convergente user with <product_plan> plan and without the "fixo" information available will see a plan card with "fixo" info in Assinatura tab during a maintenance window
    Given user has a "convergente" account type
      And user has a "<product_plan>" plan in "active" status
      And there is a maintenance window
      And the "fixo" information is not available
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is not displayed
      And the "plans.fixo_product" section is not displayed
      And the "plans.custom_text" textfield is displayed
      And the "plans.footer_link" link is displayed

    Examples:
          | product_plan | jira_id      |
          | internet     | QANOV-517430 |
          | tv           | QANOV-517431 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @smoke
  @vivobr
  Scenario Outline: convergente user with <product_plan> plan without mobile line will see a plan card in Assinatura tab during a maintenance window
    Given user has a "convergente" account type
      And user has a "<product_plan>" plan in "active" status
      And user does not have "mobile_line" product
      And there is a maintenance window
      And the "fixo" information is available
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is not displayed
      And the "plans.products_list" list is displayed
      And each element in the "plans.products_list" list has the "title" field
      And each element in the "plans.products_list" list has the "info" field
      And the "plans.footer_link" link is displayed

    Examples:
          | product_plan | ber | jira_id      |
          | trio         | ber | QANOV-517432 |
          | duo          |     | QANOV-517433 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @regression
  @vivobr
  Scenario Outline: convergente user with <product_plan> plan without mobile line and without the "fixo" information available will see a plan card in Assinatura tab during a maintenance window
    Given user has a "convergente" account type
      And user has a "<product_plan>" plan in "active" status
      And user does not have "mobile_line" product
      And there is a maintenance window
      And the "fixo" information is not available
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is not displayed
      And the "plans.custom_text" textfield is displayed
      And the "plans.footer_link" link is displayed

    Examples:
          | product_plan | jira_id      |
          | trio         | QANOV-517434 |
          | duo          | QANOV-517435 |

  @jira.QANOV-525509 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @sanity
  @vivobr
  Scenario: convergente user with tv plan will see plan module in plan details page
    Given user has a "convergente" account type
      And user has a "tv" plan in "active" status
      And user has a "siebel" plan
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.subtitle" textfield is displayed

  @jira.QANOV-525510 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @sanity
  @vivobr
  Scenario: convergente user with landline plan will see plan module in plan details page
    Given user has a "convergente" account type
      And user has a "landline" plan in "active" status
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.subtitle" textfield is displayed
