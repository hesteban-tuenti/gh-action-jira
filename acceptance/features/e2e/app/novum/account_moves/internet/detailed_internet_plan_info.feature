# -*- coding: utf-8 -*-
@jira.QANOV-8444
Feature: Detailed internet plan info



  @jira.QANOV-26119 @android @automation.pending_mock @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-25222 @mobile
  @moves @regression @manual
  Scenario: ADMIN user eligible for a Speed Upgrade will see the promotion button on the Internet dashboard
    other_affected_versions="2021-01"
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has a "internet" product
      And user has the "internet-header" module configured in CMS for "internet" page for the "internet" product
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has a plan eligible for a speed upgrade
      And user has not upgraded the internet speed
      And user has the matching subscription selected in the account
      And user is in the "Internet" page
     Then the "Internet" header is displayed
      And the "speed_upgrade_button" button with "Sube la velocidad" text is displayed

  @android @automation.pending_mock @ios @jira.<jira_id> @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-25222 @mobile
  @moves @regression @manual
  Scenario Outline: ADMIN user eligible for a <speed_option> Speed Upgrade can access to the Speed Upgrade page from the Internet dashboard
    other_affected_versions="2021-01"
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has a "internet" product
      And user has a plan eligible for a "<speed_option>" speed upgrade
      And user has not upgraded the internet speed
      And user has the "internet-header" module configured in CMS for "internet" page for the "internet" product
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the matching subscription selected in the account
      And user is in the "Internet" page
     When clicks on the "speed_upgrade_button" button
     Then the "Speed Upgrade" page is displayed
      And the "<header>" header is displayed
      And the "image" image is displayed
      And the "title" textfield with "<page_title>" text is displayed
      And the "subtitle" textfield with "Movistar sube la velocidad de tu fibra para que naveges sin límites aún más rápido." text is displayed
      And the "subtitle_with_link" textfield with "<page_text>" text is displayed
      And the "terms_conditions_link" link with "movistar.es/contratos" text is displayed
      And the "finish" button with "Finalizar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Internet" page is displayed

    Examples:
          | speed_option   | header              | page_title                             | page_text                                                                                                                                                                                                              | jira_id     |
          | 600Mb to 1Gb   | Subida de velocidad | Sube la velocidad de tu fibra a 1 Gb   | Al continuar estas aceptando que la velocidad de navegación de tu fibra pase a ser de 1 Gb sin alterar ningún otro componente de tu producto. Puedes consultar las condiciones del producto que tienes contratado en   | QANOV-26120 |
          | 100Mb to 300Mb | Subida de velocidad | Sube la velocidad de tu fibra a 300 Mb | Al continuar estas aceptando que la velocidad de navegación de tu fibra pase a ser de 300 Mb sin alterar ningún otro componente de tu producto. Puedes consultar las condiciones del producto que tienes contratado en | QANOV-47752 |

  @jira.QANOV-26121 @android @automation.hard @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-25222 @mobile @moves
  @regression @manual
  Scenario: ADMIN who had already updated the Internet Speed but the change has not yet taken effect: Will see the promotion button on the Internet dashboard
    other_affected_versions="2021-01"
    internal_checkpoint="As it could take between 24 and 48 hours to have this updated,
    we will disable the page in which customers can opt-in to the upgrade.
    So if customers access through any point such as deeplink, Explore, push notification, internet dashboard,
    the page will be disable."
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has a "internet" product
      And user has a plan eligible for a speed upgrade
      And user has already upgraded the internet speed but the change has not yet taken effect
      And user has the "internet-header" module configured in CMS for "internet" page for the "internet" product
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the matching subscription selected in the account
      And user is in the "Internet" page
     Then the "Internet" header is displayed
      And the "speed_upgrade_button" button with "Sube la velocidad" text is displayed

  @android @automation.hard @ios @jira.<jira_id> @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-25222 @mobile @moves
  @regression @manual @impeded_legacy
  Scenario Outline: Legado ADMIN who had already updated the Internet Speed from <speed_option> but the change has not yet taken effect: access to the Speed Upgrade informative page
    other_affected_versions="2021-01"
    internal_checkpoint="As it could take between 24 and 48 hours to have this updated,
    we will disable the page in which customers can opt-in to the upgrade.
    So if customers access through any point such as deeplink, Explore, push notification, internet dashboard,
    the page will be disable."
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "internet" product
      And user has a plan eligible for a "<speed_option>" speed upgrade
      And user has already upgraded the internet speed but the change has not yet taken effect
      And user has the "internet-header" module configured in CMS for "internet" page for the "internet" product
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the matching subscription selected in the account
      And user is in the "Internet" page
     When clicks on the "speed_upgrade_button" button
     Then the "Speed Upgrade" page is displayed
      And the "<header>" header is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Ya habías solicitado el aumento de la velocidad a <upgrade_vale>" text is displayed
      And the "informative_message" textfield with "El cambio se hará efectivo en las próximas horas" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | speed_option   | header              | upgrade_vale | jira_id     |
          | 600Mb to 1Gb   | Subida de velocidad | 1 Gb         | QANOV-26122 |
          | 100Mb to 300Mb | Subida de velocidad | 300 Mb       | QANOV-47753 |

  @android @automation.pending_mock @ios @jira.<jira_id> @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-25222 @mobile
  @moves @regression @manual
  Scenario Outline: ADMIN who had already updated the Internet Speed from <speed_option>: Won't see the promotion button on the Internet Dashboard and the speed will be updated
    other_affected_versions="2021-01"
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has a "internet" product
      And user has a plan eligible for a "<speed_option>" speed upgrade
      And user has already upgraded the internet speed
      And user has the "internet-header" module configured in CMS for "internet" page for the "internet" product
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the matching subscription selected in the account
      And user is in the "Internet" page
     Then the "Internet" header is displayed
      And the "speed_upgrade_button" button is not displayed
      And the "speed_info.upload_speed" textfield with "<new_speed>" text is displayed
      And the "speed_info.download_speed" textfield with "<new_speed>" text is displayed

    Examples:
          | speed_option   | new_speed | jira_id     |
          | 600Mb to 1Gb   | 1 Gb      | QANOV-26123 |
          | 100Mb to 300Mb | 300 Mb    | QANOV-47754 |

  @jira.QANOV-26124 @android @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-25222 @mobile @moves @regression @manual
  Scenario: ADMIN user NOT eligible for a Speed Upgrade won't see the promotion button on the Internet dashboard
    other_affected_versions="2021-01"
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has a "internet" product
      And user has not a plan eligible for a speed upgrade
      And user has the "internet-header" module configured in CMS for "internet" page for the "internet" product
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the matching subscription selected in the account
      And user is in the "Internet" page
     Then the "Internet" header is displayed
      And the "speed_upgrade_button" button is not displayed
