# -*- coding: utf-8 -*-
@jira.QANOV-325857
Feature: Plan Data Module


  @jira.QANOV-325859 @android @automatic @ber @cert2 @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live
  @mobile @moves @next @qa @smoke @webapp
  Scenario: User can see the "Plan Data" module in the "Mobile Line Dashboard" page
    Given user has a "mobile_line" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     Then the "plan_data.title" textfield is displayed
      And the "plan_data.pretitle" textfield with the "Fecha de contratación: .+" format is displayed
      And the "plan_data.link" textfield with "Ver detalle" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  Scenario Outline: User can see the "Plan Data" module in the "<page>" page
    Given user has a "<product>" product
      And user is in the "<page>" page
     Then the "plan_data.title" textfield is displayed
      And the "plan_data.pretitle" textfield with the "Fecha de contratación: .+" format is displayed
      And the "plan_data.link" textfield with "Ver detalle" text is displayed

    @automatic @cert2 @live @next @qa @smoke @webapp @ber
    Examples:
          | product  | page               | jira_id      |
          | mobile   | Mobile Dashboard   | QANOV-325859 |
          | landline | Landline Dashboard | QANOV-325860 |
          | internet | Internet Dashboard | QANOV-325862 |
          | tv       | TV Dashboard       | QANOV-419492 |

    @manual @regression
    Examples:
          | product | page            | jira_id      |
          | radio   | Radio Dashboard | QANOV-360676 |

  @jira.<jira_id> @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves @regression
  Scenario Outline: User can tap on the "Ver detalle" link of the "Plan Data" module from the <page> page: internal webview is displayed
    Given user has a "<product>" product
      And user is in the "<page>" page
     When clicks on the "plan_data.link" link
     Then the internal webview with "Área privada Movistar" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "<page>" page is displayed

    Examples:
          | product  | page               | jira_id      |
          | mobile   | Mobile Dashboard   | QANOV-325870 |
          | landline | Landline Dashboard | QANOV-325872 |
          | internet | Internet Dashboard | QANOV-325874 |
          | radio    | Radio Dashboard    | QANOV-360677 |
          | tv       | TV Dashboard       | QANOV-419500 |

  @jira.<jira_id> @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  Scenario Outline: User can see the "Plan Data" module title with "Producto incluido en" if the product belongs to a bundle
    Given user has a "<product>" product
      And the product belongs to a bundle
      And user is in the "<page>" page
      And the "plan_data.title" textfield with the "<title>" format is displayed

    @smoke @ber
    Examples:
          | product  | page               | title                | jira_id      |
          | mobile   | Mobile Dashboard   | Línea incluida en    | QANOV-325876 |
          | landline | Landline Dashboard | Linea incluida en    | QANOV-325879 |
          | internet | Internet Dashboard | Producto incluido en | QANOV-325881 |
          | tv       | TV Dashboard       | Producto incluido en | QANOV-419509 |

    @regression
    Examples:
          | product | page            | title                | jira_id      |
          | radio   | Radio Dashboard | Producto incluido en | QANOV-360678 |

  @jira.<jira_id> @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves @smoke
  Scenario Outline: User can see the "Plan Data" module title with "TU TARIFA" if the product does not belongs to a bundle
    Given user has a "<product>" product
      And the product does not belongs to a bundle
      And user is in the "<page>" page
      And the "plan_data.title" textfield with "TU TARIFA" text is displayed
      And the "plan_data.link" textfield with "Ver detalle" text is displayed
      And the "plan_data.button" textfield with "Cambiar tarifa" text is displayed

    Examples:
          | product  | page                  | jira_id      |
          | mobile   | Mobile Line Dashboard | QANOV-325883 |
          | landline | Landline Dashboard    | QANOV-325885 |

  @jira.<jira_id> @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves @smoke
  Scenario Outline: User with a <product> product that does not belongs to a bundle clicks on the plan_data button: Ob webview is displayed
    Given user has a "<product>" product
      And the product does not belongs to a bundle
      And user is in the "<page>" page
     When clicks on the "plan_data.button" button
     Then the browser webview is displayed
      And the header that contains the "Tarifas" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "<page>" page is displayed

    Examples:
          | product  | page                  | jira_id      |
          | mobile   | Mobile Line Dashboard | QANOV-360679 |
          | landline | Landline Dashboard    | QANOV-360680 |
