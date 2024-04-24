@jira.QANOV-7027
Feature: Movements


  @jira.QANOV-7028 @android @ios @mobile @jira.cv.10.5 @regression
  @jira.link.relates_to.NOV-65704 @jira.link.relates_to.NOV-65706 @moves @impeded_legacy @no_automatable
  Scenario: Legado prepay user with movements can access to the last movements from the account dashboard
    internal_checkpoint="NOTE: for some movements it will take a while until they are shown.
    Types of movements, icons and color of the price:
    || movement                          || icon                                                        || color||
    |  top-up                            | $ symbol and a + symbol on the right, with purple background | black |
    |  bundle purchase with balance      | ticket, with purple background                               | red   |
    |  balance loan                      | TBD                                                          | black |
    |  data, min or SMS events with cost | symbols for data, calls or messages                          | red   |
    |  tariff renewal                    | ticket, with purple background                               | red   |"
    commented_tags="@depends_on.NOV-119856"
    Given user has a "legado prepay" account type
      And user has movements in the last "30" days
      And user has the matching subscription selected in the account
      And user has the "latest-movements" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "consumption-events-list-prepay" module configured in CMS for "movements" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "last_movements" entrypoint
     Then the "Movements" page is displayed
      And the "Movimientos" header is displayed
      And the "movements.events_list" list is displayed
      And each element in the "movements.events_list" list has the "date" textfield with the "\d{1,2}\/\d{1,2}\/\d{4}" format
      And each element in the "movements_by_date" list within the "movements.events_list" list has the "icon" field
      And each element in the "movements_by_date" list within the "movements.events_list" list has the "movement_type" field
      And each element in the "movements_by_date" list within the "movements.events_list" list has the "movement_time" textfield with the "XX:XX" format
      And each element in the "movements_by_date" list within the "movements.events_list" list has the "price" textfield with the "(-)?\d+,\d\d( | )€" format


  @jira.QANOV-7031 @android @ios @mobile @jira.cv.10.5 @no_automatable @impeded_legacy @jira.link.depends_on.QANOV-7028
  @jira.link.relates_to.NOV-65716 @moves @regression
  Scenario: user can go back from the last movements screen to the Account Dashboard
    internal_checkpoint="The step 'user has the communications and leisure content displayed' just apply to TELCO users because in this Account steps
    is needed that the 'Comunicaciones y ocio' vertical is selected"
    Given user has a "legado prepay" account type
      And user has the matching subscription selected in the account
      And user has the "latest-movements" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "last_movements" entrypoint
      And user is in the "Movements" page
     When clicks on the "notification_top_bar.back" button
     Then the "Account" page is displayed
      And the "Mis Productos" header is displayed


  @jira.QANOV-7033 @android @ios @mobile @jira.cv.10.5 @impeded_legacy
  @jira.link.relates_to.NOV-65706 @jira.link.relates_to.NOV-65707 @moves @regression @no_automatable
  Scenario: Prepay user can see the last movements of his/her mobile line from the balance screen
    internal_checkpoint="NOTE: for some movements it will take a while until they are shown.
    Types of movements, icons and color of the price:
    || movement                          || icon                                                        || color||
    |  top-up                            | $ symbol and a + symbol on the right, with purple background | black |
    |  bundle purchase with balance      | ticket, with purple background                               | red   |
    |  balance loan                      | TBD                                                          | black |
    |  data, min or SMS events with cost | symbols for data, calls or messages                          | red   |
    |  tariff renewal                    | ticket, with purple background                               | red   |"
    commented_tags="@depends_on.NOV-64016"
    Given user has a "legado prepay" account type
      And user has movements in the last "30" days
      And user has the matching subscription selected in the account
      And user has the "latest-movements" module configured in CMS for "balance-details" page for the "mobile" product
      And user has the "consumption-events-list-prepay" module configured in CMS for "movements" page for the "mobile" product
      And user is in the "Balance" page
     When clicks on the "last_movements" entrypoint
     Then the "Movements" page is displayed
      And the "Movimientos" header is displayed
      And the "movements.events_list" list is displayed
      And each element in the "movements.events_list" list has the "date" textfield with the "\d{1,2}\/\d{1,2}\/\d{4}" format
      And each element in the "movements_by_date" list within the "movements.events_list" list has the "icon" field
      And each element in the "movements_by_date" list within the "movements.events_list" list has the "movement_type" field
      And each element in the "movements_by_date" list within the "movements.events_list" list has the "movement_time" textfield with the "XX:XX" format
      And each element in the "movements_by_date" list within the "movements.events_list" list has the "price" textfield with the "(-)?\d+,\d\d( | )€" format


  @jira.<jira_id> @android @ios @mobile @jira.cv.10.5 @jira.link.detects.<detects> @impeded_legacy
  @jira.link.relates_to.NOV-65706 @jira.link.relates_to.NOV-65707 @moves @regression @no_automatable
  Scenario Outline: Prepay user can see the last movements of his/her mobile line from the balance screen
    commented_tags="@depends_on.NOV-64016"
    Given user has a "legado prepay" account type
      And user has "<movement_type>" movements in the last "30" days
      And user has the matching subscription selected in the account
      And user has the "consumption-events-list-prepay" module configured in CMS for "movements" page for the "mobile" product
      And user is in the "Movements" page
     Then the "movements.events_list" list is displayed
      And the "movements.events_list" list has the "date" textfield with the "\d{1,2}\/\d{1,2}\/\d{4}" format
      And the "<movement_type>" element in the "movements_by_date" list within the "movements.events_list" list has the "<element_icon>" field
      And the "<movement_type>" element in the "movements_by_date" list within the "movements.events_list" list has the "<element_movement_type>" field
      And the "<movement_type>" element in the "movements_by_date" list within the "movements.events_list" list has the "price" textfield with the "(-)?\d+,\d\d( | )€" format
      And the "<movement_type>" element in the "movements_by_date" list within the "movements.events_list" list has the "price" textfield with "<price_color>" color

    Examples: 
      | movement_type                | element_icon                  | element_movement_type | price_color | jira_id    | detects    |
      | top_up                       | top_up_movement_icon          | Recarga               | black       | QANOV-7035 |            |
      | bundle_purchase_with_balance | bundle_purchase_movement_icon | Alta de bono extra    | red         | QANOV-7038 |            |
      | balance_loan                 | balance_loan_icon             | Anticipo de saldo     | black       | QANOV-7041 |            |
      | allowance_event_with_cost    | allowance_event_movement_icon | allowance_type        | red         | QANOV-7044 |            |
      | tariff_renewal               | tariff_renewal_icon           | Renovación de tarifa  | red         | QANOV-7046 | MOVES-5313 |


  @jira.QANOV-7049 @android @ios @mobile @jira.cv.10.5 @no_automatable @impeded_legacy @jira.link.depends_on.QANOV-7033
  @jira.link.relates_to.NOV-65717 @moves @regression
  Scenario: User can go back from the last movements screen to the Balance page
    Given user has a "legado prepay" account type
      And user has the matching subscription selected in the account
      And user has the "latest-movements" module configured in CMS for "balance-details" page for the "mobile" product
      And user is in the "Balance" page
     When clicks on the "last_movements" entrypoint
      And user is in the "Movements" page
      And clicks on the "notification_top_bar.back" button
     Then the "Balance" page is displayed
      And the "Saldo" header is displayed


  @jira.QANOV-7051 @android @ios @mobile @jira.cv.10.5 @jira.link.relates_to.NOV-136881
  @moves @regression @no_automatable @impeded_legacy
  Scenario: Prepay user without movements can access to the last movements from the account dashboard
    commented_tags="@depends_on.NOV-119856"
    other_affected_versions="2021-45-B"
    Given user has a "legado prepay" account type
      And user has no movements in the last "30" days
      And user has the matching subscription selected in the account
      And user has the "latest-movements" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "consumption-events-list-prepay" module configured in CMS for "movements" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "last_movements" entrypoint
     Then the "Movements" page is displayed
      And the "Movimientos" header is displayed
      And the "movements.events_list" list is not displayed
      And the "movements.empty_case_icon" icon is displayed
      And the "movements.empty_case_title" textfield with "No tienes movimientos" text is displayed
      And the "movements.empty_case_subtitle" textfield with "Aquí aparecerán los últimos movimientos relacionados con tu cuenta" text is displayed


  @jira.QANOV-7054 @android @ios @mobile @jira.cv.10.5 @jira.link.relates_to.NOV-136881
  @moves @regression @no_automatable @impeded_legacy
  Scenario: Prepay user without movements can access to the last movements from the Balance screen
    commented_tags="@depends_on.NOV-64016"
    other_affected_versions="2021-45-B"
    Given user has a "legado prepay" account type
      And user has no movements in the last "30" days
      And user has the matching subscription selected in the account
      And user has the "latest-movements" module configured in CMS for "balance-details" page for the "mobile" product
      And user has the "consumption-events-list-prepay" module configured in CMS for "movements" page for the "mobile" product
      And user is in the "Balance" page
     When clicks on the "last_movements" entrypoint
     Then the "Movements" page is displayed
      And the "Movimientos" header is displayed
      And the "movements.events_list" list is not displayed
      And the "movements.empty_case_icon" icon is displayed
      And the "movements.empty_case_title" textfield with "No tienes movimientos" text is displayed
      And the "movements.empty_case_subtitle" textfield with "Aquí aparecerán los últimos movimientos relacionados con tu cuenta" text is displayed
