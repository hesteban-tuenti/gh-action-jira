# -*- coding: utf-8 -*-
@jira.QANOV-8712
Feature: Pay per use

  Actions Before the Feature:
    Given user has a "any_admin" role
      And user has a "mobile_line" product
      And user has "data_sharing" service in "deactivated" status
      And user has a "Movistar Plus+ Lite; Tarifa 0" tariff

  @jira.<jira_id> @android @ios @mobile @jira.cv.10.4
  @jira.link.relates_to.NOV-47956 @moves @jira.link.parent_test_plan.QANOV-189597
  Scenario Outline: A <account_type> postpay user sees more information about "Pago por uso"
    commented_tags="@depends_on.NOV-47936 @depends_on.NOV-175721"
    Given user has a "<account_type> postpay" account type
      And user has "pay_per_use" service in "<ppu_status>" status
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "services_data_management" button
      And the "Data Management" page is displayed
      And clicks on the "pay_per_use_activate.more_information" link
     Then the "Pay Per Use Management" page is displayed
      And the "Gestionar datos" header is displayed
      And the "ppu_title" textfield with "Pago por uso" text is displayed
      And the "ppu_price" textfield with the "\d+,\d\d( | )€\/MB" format is displayed
      And the "ppu_specifications_title" textfield with "Especificaciones" text is displayed
      And the "ppu_specifications_text" textfield is displayed
      And the "<button_element>" button with "<button_text>" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Data Management" page is displayed

    @smoke @manual
    Examples:
          | account_type | module_id        | ppu_status  | button_element  | button_text | jira_id    |
          | telco        | services-summary | deactivated | activate_button | Activar     | QANOV-8714 |

    @regression @manual
    Examples:
          | account_type | module_id        | ppu_status | button_element    | button_text | jira_id    |
          | telco        | services-summary | activated  | deactivate_button | Desactivar  | QANOV-8716 |

    @regression @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | ppu_status  | button_element    | button_text | jira_id      |
          | legado       | smart-actions-legado | deactivated | activate_button   | Activar     | QANOV-254547 |
          | legado       | smart-actions-legado | activated   | deactivate_button | Desactivar  | QANOV-254548 |

  @jira.<jira_id> @<client> @mobile @jira.cv.10.4 @jira.link.relates_to.NOV-47957 @moves
  @regression
  Scenario Outline: A <account_type> postpay user can activate "Pago por uso"
    commented_tags="@depends_on.NOV-47936 @depends_on.NOV-175721"
    Given user has a "<account_type> postpay" account type
      And user has "pay_per_use" deactivated in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "activate_ppu" button
     Then the "Activate Pay Per Use" popup is displayed
      And the "title" textfield with "Activar pago por uso" text is displayed
      And the "message" textfield with "Modificar los límites de datos en pago por uso" text is displayed
      And the "not_now" button with "<not_now_text>" text is displayed
      And the "activate" button with "<activate_text>" text is displayed

    @manual
    Examples:
          | account_type | module_id        | client  | activate_text | not_now_text | jira_id    |
          | telco        | services-summary | android | ACTIVAR       | AHORA NO     | QANOV-8720 |
          | telco        | services-summary | ios     | Activar       | Ahora no     | QANOV-8722 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | client  | activate_text | not_now_text | jira_id      |
          | legado       | smart-actions-legado | android | ACTIVAR       | AHORA NO     | QANOV-254549 |
          | legado       | smart-actions-legado | ios     | Activar       | Ahora no     | QANOV-254550 |

  @jira.<jira_id> @android @ios @mobile @jira.cv.10.4 @jira.link.relates_to.NOV-47959
  @moves @regression
  Scenario Outline: A <account_type> postpay user cancels the activation of "Pago por uso"
    commented_tags="@depends_on.NOV-47936 @depends_on.NOV-175721"
    Given user has a "<account_type> postpay" account type
      And user has "pay_per_use" in "deactivated" status
      And user has "pay_per_use" deactivated in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "activate_ppu" button
      And the "Activate Pay Per Use" popup is displayed
      And clicks on the "not_now" button
     Then the "Activate Pay Per Use" popup is not displayed
      And the "Data Management" page is displayed
      And the "activate_ppu" button is displayed

    @manual
    Examples:
          | account_type | module_id        | jira_id    |
          | telco        | services-summary | QANOV-8724 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-254551 |

  @jira.<jira_id> @android @ios @mobile @jira.cv.10.4 @jira.link.relates_to.NOV-47958
  @moves @regression @automation.hard
  Scenario Outline: A <account_type> postpay user confirms the activation of "Pago por uso"
    internal_checkpoint="* Push notification, informing the customer about the activation (or if applicable, the error)
    is sent and received in Mi Movistar conversation
    - In parallel, OB triggers SMS"
    commented_tags="@depends_on.NOV-47936 @depends_on.NOV-175721"
    Given user has a "<account_type> postpay" account type
      And user has "pay_per_use" deactivated in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "activate_ppu" button
      And the "Activate Pay Per Use" popup is displayed
      And clicks on the "activate" button
     Then the "Feedback Success" page is displayed
      And the "success_title" textfield with "Tu solicitud ha sido enviada con éxito" text is displayed
      And the "success_message" textfield with "En un plazo máximo de 24 horas recibirás un SMS con la confirmación." text is displayed
      And the "back_to_account" button with "Volver a mi línea" text is displayed
      And the "navigation_top_bar.close_button" button is not displayed

    @manual
    Examples:
          | account_type | module_id        | jira_id    |
          | telco        | services-summary | QANOV-8727 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-254552 |

  @jira.<jira_id> @android @ios @mobile @jira.cv.11.6 @jira.link.relates_to.NOV-91287
  @moves @regression @automation.hard
  Scenario Outline: A <account_type> postpay user goes back to mobile line details after activating Pago por uso
    commented_tags="@depends_on.NOV-47936 @depends_on.NOV-175721"
    Given user has a "<account_type> postpay" account type
      And user has "pay_per_use" deactivated in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "activate_ppu" button
      And the "Activate Pay Per Use" popup is displayed
      And clicks on the "activate" button
      And the "Feedback Success" page is displayed
      And clicks on the "back_to_account" button
     Then the "Dashboard" page is displayed
      And the "Mis Productos" header is displayed

    @manual
    Examples:
          | account_type | module_id        | jira_id    |
          | telco        | services-summary | QANOV-8729 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-254553 |

  @jira.<jira_id> @<client> @mobile @jira.cv.10.4 @jira.link.relates_to.NOV-47960 @moves
  @regression
  Scenario Outline: A <account_type> postpay user can deactivate "Pago por uso"
    commented_tags="@depends_on.NOV-47936 @depends_on.NOV-175721"
    Given user has a "<account_type> postpay" account type
      And user has "pay_per_use" activated in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "deactivate_ppu" button
     Then the "Deactivate Pay Per Use" popup is displayed
      And the "title" textfield with "Desactivar pago por uso" text is displayed
      And the "message" textfield with "Para modificar los límites de datos en pago por uso desactiva a continuación" text is displayed
      And the "not_now" button with "<not_now_text>" text is displayed
      And the "deactivate" button with "<deactivate_text>" text is displayed

    @manual
    Examples:
          | account_type | module_id        | client  | activate_text | not_now_text | jira_id    |
          | telco        | services-summary | android | DESACTIVAR    | AHORA NO     | QANOV-8731 |
          | telco        | services-summary | ios     | Desactivar    | Ahora no     | QANOV-8733 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | client  | activate_text | not_now_text | jira_id      |
          | legado       | smart-actions-legado | android | DESACTIVAR    | AHORA NO     | QANOV-254554 |
          | legado       | smart-actions-legado | ios     | Desactivar    | Ahora no     | QANOV-254555 |

  @jira.<jira_id> @android @ios @mobile @jira.cv.10.4 @jira.link.relates_to.NOV-47962
  @moves @regression
  Scenario Outline: A <account_type> postpay user cancels the deactivation of "Pago por uso"
    commented_tags="@depends_on.NOV-47936 @depends_on.NOV-175721"
    Given user has a "<account_type> postpay" account type
      And user has "pay_per_use" activated in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "deactivate_ppu" button
      And the "Deactivate Pay Per Use" popup is displayed
      And clicks on the "not_now" button
     Then the "Deactivate Pay Per Use" popup is not displayed
      And the "Data Management" page is displayed
      And the "deactivate_ppu" button is displayed

    @manual
    Examples:
          | account_type | module_id        | jira_id    |
          | telco        | services-summary | QANOV-8735 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-254556 |

  @jira.<jira_id> @android @ios @mobile @jira.cv.10.4 @jira.link.relates_to.NOV-47961
  @moves @regression @automation.hard
  Scenario Outline: A <account_type> postpay user confirms the deactivation of "Pago por uso"
    internal_checkpoint="* Push notification, informing the customer about the activation (or if applicable, the error)
    is sent and received in Mi Movistar conversation
    - In parallel, OB triggers SMS"
    commented_tags="@depends_on.NOV-47936 @depends_on.NOV-175721"
    Given user has a "<account_type> postpay" account type
      And user has "pay_per_use" activated in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "deactivate_ppu" button
      And the "Deactivate Pay Per Use" popup is displayed
      And clicks on the "deactivate" button
     Then the "Feedback Success" page is displayed
      And the "success_title" textfield with "Tu solicitud ha sido enviada con éxito" text is displayed
      And the "success_message" textfield with "En un plazo máximo de 24 horas recibirás un SMS con la confirmación." text is displayed
      And the "back_to_account" button with "Volver a mi línea" text is displayed
      And the "navigation_top_bar.close_button" button is not displayed

    @manual
    Examples:
          | account_type | module_id        | jira_id    |
          | telco        | services-summary | QANOV-8737 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-254557 |

  @jira.<jira_id> @android @ios @mobile @jira.cv.11.6 @jira.link.relates_to.NOV-91289
  @moves @regression @automation.hard
  Scenario Outline: A <account_type> postpay user goes back to mobile line details after deactivating Pago por uso
    commented_tags="@depends_on.NOV-47936 @depends_on.NOV-175721"
    Given user has a "<account_type> postpay" account type
      And user has "pay_per_use" activated in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "deactivate_ppu" button
      And the "Deactivate Pay Per Use" popup is displayed
      And clicks on the "deactivate" button
      And the "Feedback Success" page is displayed
      And clicks on the "back_to_account" button
     Then the "Dashboard" page is displayed
      And the "Mis Productos" header is displayed

    @manual
    Examples:
          | account_type | module_id        | jira_id    |
          | telco        | services-summary | QANOV-8739 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-254558 |