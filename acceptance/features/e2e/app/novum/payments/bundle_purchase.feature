# -*- coding: utf-8 -*-
@jira.QANOV-624080
Feature: Bundle Purchase


  @jira.QANOV-624081 @android @ber @e2e @ios @jira.link.parent_test_plan.QANOV-142826
  @jira.link.parent_test_plan.QANOV-624033 @manual @o2es @sanity
  Scenario: A user can see topup flow entrypoint
    Given user has "1" mobile lines
      And user is in the "Account" page
      And user can buy topups
      And user has not reached maximum topup purchase
     Then the "topup_entrypoint" entrypoint with "Ver bonos" text is displayed

  @jira.QANOV-624082 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-624033
  @manual @o2es @smoke
  Scenario: A user with several lines can see desimbiguation screen in topup flow
    Given user has ">1" mobile lines
      And user is in the "Account" page
      And user can buy topups
      And user has not reached maximum topup purchase
     When clicks on the "topup_entrypoint" entrypoint
     Then the "Disambiguation" page is displayed
      And the "line_list" list is displayed
      And each element in the "line_list" list has the "icon" field
      And each element in the "line_list" list has the "title" field
      And each element in the "line_list" list has the "chevron" field
      And the "line_list" list has ">1" elements
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-624083 @android @ber @e2e @ios @jira.link.parent_test_plan.QANOV-142826
  @jira.link.parent_test_plan.QANOV-624033 @manual @o2es @sanity
  Scenario: A user with just one line can see available topups
    Given user is in the "Account" page
      And user has "1" mobile lines
      And user can buy topups
      And user has not reached maximum topup purchase
     When clicks on the "topup_entrypoint" entrypoint
     Then the "Topup Selection" page is displayed
      And the header that contains the "Bono de datos" text is displayed
      And the "topup_selection_title" textfield with "Bono de datos extra" text is displayed
      And the "topup_selection_subtitle" textfield with "Puedes complementar tu tarifa mensual con datos adicionales para seguir navegando a máxima velocidad." text is displayed
      And the "topup_list" list is displayed with all the lines associated to the multivivo plan
      And each element in the "topup_list" list has the "chevron" field
      And each element in the "topup_list" list has the "data_cuantity" textfield with the "\d+(\,\d{1,2})? (GB)" format
      And each element in the "topup_list" list has the "price" textfield with the "\d+,\d\d €" format
      And the "topup_footer" textfield with "Podrás disfrutar de los bonos que actives hasta el día 17, el último de tu ciclo de facturación." text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-624084 @android @ber @e2e @ios @jira.link.parent_test_plan.QANOV-142826
  @jira.link.parent_test_plan.QANOV-624033 @manual @o2es @smoke
  Scenario: A user who has reached monthly purchase limit can see informative screen
    Given user is in the "Account" page
      And user has a "mobile" product
      And user can buy topups
      And user has reached maximum topup purchase
     When clicks on the "topup_entrypoint" entrypoint
     Then the "Topup limit feedback" page is displayed
      And the "Bonos de datos" header is displayed
      And the "info" icon is displayed
      And the "limit_title" textfield with "Has activado todos los bonos disponibles este mes" text is displayed
      And the "limit_description" textfield with the "Podrás adquirir nuevos bonos desde el día \d{2}, durante tu próximo ciclo de facturación." format is displayed
      And the "ok_button" button with "Volver" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-624085 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-624033
  @manual @o2es @regression
  Scenario: A user who has reached monthly purchase limit can go back after informative screen
    Given user is in the "Account" page
      And user has a "mobile" product
      And user can buy topups
      And user has reached maximum topup purchase
     When clicks on the "topup_entrypoint" entrypoint
     Then the "Topup limit feedback" page is displayed
      And clicks on the "ok_button" button
      And the "Account" page is displayed

  @jira.QANOV-624086 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-624033
  @manual @o2es @smoke
  Scenario: A user can see confirmation popup before purchasing topup
    Given user is in the "Account" page
      And user has a "mobile" product
      And user can buy topups
      And user has not reached maximum topup purchase
     When clicks on the "topup_entrypoint" entrypoint
      And clicks on any element in the "topup_list" list
     Then the "topup_confirmation" popup is displayed
      And the "topup_confirmation" textfield with the "Bono de \d+(\,\d{1,2})?j GB" format is displayed
      And the "topup_confirmation.price" textfield with the "\d+,\d\d €" format is displayed
      And the "topup_confirmation.description" textfield with the "Disfruta de datos extra a máxima velocidad hasta el día \d{2}, el último de tu ciclo de facturación." format is displayed
      And the "topup_confirmation.continue" button with "Activar bono" text is displayed
      And the "topup_confirmation.cancel" button with "Cancelar" text is displayed

  @jira.QANOV-624087 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-624033
  @manual @o2es @regression
  Scenario: A user can go back after confirmation popup is displayed
    Given user is in the "Account" page
      And user has a "mobile" product
      And user can buy topups
      And user has not reached maximum topup purchase
     When clicks on the "topup_entrypoint" entrypoint
      And clicks on any element in the "topup_list" list
     Then the "topup_confirmation" popup is displayed
      And clicks the "topup_confirmation.cancel" button with "Cancelar" text is displayed
      And the "topup_confirmation" popup is not displayed

  @jira.QANOV-624088 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-624033
  @manual @o2es @regression
  Scenario: A user purchases new topup: success feedback is shown
    Given user is in the "Account" page
      And user has a "mobile" product
      And user can buy topups
      And user has not reached maximum topup purchase
     When clicks on the "topup_entrypoint" entrypoint
      And clicks on any element in the "topup_list" list
      And the "topup_confirmation" popup is displayed
      And clicks on the "topup_confirmation.continue" button
     Then the "Topup processing" page is displayed
      And the "spinner" element is displayed
      And the header that contains the "Bonos de datos" text is displayed
      And the "navigation_top_bar.back_button" button is displayed
      And the "navigation_top_bar.close_button" button with "Cerrar" text is displayed
      And the "processing_title" textfield with "Estamos activando tu bono..." text is displayed
      And the "processing_subtitle" textfield with "Esto puede tardar hasta 10 segundos." text is displayed
      And waits until the "spinner" element is not visible
      And the "Topup Feedback" page is displayed
      And the "topup_feedback_title" textfield with "Tu bono estará listo en unos minutos" text is displayed
      And the "topup_feedback_description" textfield with "Cuando esté activo, recibirás un SMS con la confirmación y lo verás en Mi O2." text is displayed
      And the "ok_button" button with "Entendido" text is displayed

  @jira.QANOV-624089 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-624033
  @manual @o2es @regression
  Scenario: A user purchases new topup and clicks continue button on feedback screen
    Given user is in the "Account" page
      And user has a "mobile" product
      And user can buy topups
      And user has not reached maximum topup purchase
     When clicks on the "topup_entrypoint" entrypoint
      And clicks on any element in the "topup_list" list
      And clicks on the "topup_confirmation.continue" button
      And the "Topup processing" page is displayed
      And waits until the "spinner" element is not visible
      And the "Topup Feedback" page is displayed
      And clicks on the "ok_button" button with "Entendido" text
     Then the "Account" page is displayed

  @jira.QANOV-624090 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-624033
  @manual @o2es @regression
  Scenario: A user purchases new topup bundle: KO feedback is shown
    Given user is in the "Account" page
      And user has a "mobile" product
      And user can buy topups
      And user has not reached maximum topup purchase
      And clicks on the "topup_entrypoint" entrypoint
      And clicks on any element in the "topup_list" list
      And the "topup_confirmation" popup is displayed
     When clicks on the "topup_confirmation.continue" button
      And an activation error happen
      And waits until the "spinner" element is not visible
     Then the "Topup Feedback" page is displayed
      And the "topup_feedback_title" textfield with "Tu bono no se ha activado" text is displayed
      And the "topup_feedback_description" textfield with "Puedes intentarlo más tarde o llamar al 1551." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver" text is displayed

  @jira.QANOV-624091 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-624033
  @manual @o2es @regression
  Scenario: A user retry after KO topup feedback
    Given user is in the "Account" page
      And user has a "mobile" product
      And user can buy topups
      And user has not reached maximum topup purchase
     When clicks on the "topup_entrypoint" entrypoint
      And clicks on any element in the "topup_list" list
      And the "topup_confirmation" popup is displayed
      And clicks on the "topup_confirmation.continue" button
      And an activation error happen
      And waits until the "spinner" element is not visible
      And the "Topup Feedback" page is displayed
      And clicks on the "retry" button
     Then the "Topup Selection" page is displayed

  @jira.QANOV-624092 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-624033
  @manual @o2es @regression
  Scenario: A user goes back after KO topup feedback
    Given user is in the "Account" page
      And user has a "mobile" product
      And user can buy topups
      And user has not reached maximum topup purchase
     When clicks on the "topup_entrypoint" entrypoint
      And clicks on any element in the "topup_list" list
      And the "topup_confirmation" popup is displayed
      And clicks on the "topup_confirmation.continue" button
      And waits until the "spinner" element is not visible
      And an activation error happen
      And the "Topup Feedback" page is displayed
      And clicks on the "back" button with "Volver" text
     Then the "Account" page is displayed

  @jira.QANOV-624093 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-624033
  @manual @o2es @regression
  Scenario: A user purchases new topup bundle: ONGOING feedback is shown
    Given user is in the "Account" page
      And user has a "mobile" product
      And user can buy topups
      And user has not reached maximum topup purchase
     When clicks on the "topup_entrypoint" entrypoint
      And clicks on any element in the "topup_list" list
      And the "topup_confirmation" popup is displayed
      And clicks on the "topup_confirmation.continue" button
      And waits until the "spinner" element is not visible
      And petition does timeout
     Then the "Topup Feedback" page is displayed
      And the "topup_feedback_title" textfield with "Seguimos intentando activar tu bono" text is displayed
      And the "topup_feedback_description" textfield with "Cuando esté activo, recibirás un SMS con la confirmación y lo verás en Mi O2. Solo se te cobrará si se activa correctamente." text is displayed
      And the "back" button with "Volver" text is displayed

  @jira.QANOV-624094 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-624033
  @manual @o2es @regression
  Scenario: A user goes back after ONGOING topup feedback
    Given user is in the "Account" page
      And user has a "mobile" product
      And user can buy topups
      And user has not reached maximum topup purchase
     When clicks on the "topup_entrypoint" entrypoint
      And clicks on any element in the "topup_list" list
      And the "topup_confirmation" popup is displayed
      And clicks on the "topup_confirmation.continue" button
      And waits until the "spinner" element is not visible
      And petition does timeout
      And the "Topup Feedback" page is displayed
      And clicks on the "back" button with "Volver" text
     Then the "Account" page is displayed

  @jira.QANOV-624095 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-624033
  @manual @o2es @regression
  Scenario: A user purchases new topup bundle: generic error feedback is shown
    Given user is in the "Account" page
      And user has a "mobile" product
      And user can buy topups
      And user has not reached maximum topup purchase
     When clicks on the "topup_entrypoint" entrypoint
      And clicks on any element in the "topup_list" list
      And the "topup_confirmation" popup is displayed
      And clicks on the "topup_confirmation.continue" button
      And waits until the "spinner" element is not visible
      And an unexpected error happen
     Then the "Topup Feedback" page is displayed
      And the "topup_feedback_title" textfield with "Algo ha ido mal" text is displayed
      And the "topup_feedback_description" textfield with "Estamos solucionando el problema para que puedas continuar. Por favor, inténtalo de nuevo más tarde." text is displayed
      And the "back" button with "Volver" text is displayed

  @jira.QANOV-624096 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-624033
  @manual @o2es @regression
  Scenario: A user goes back after generic topup feedback
    Given user is in the "Account" page
      And user has a "mobile" product
      And user can buy topups
      And user has not reached maximum topup purchase
     When clicks on the "topup_entrypoint" entrypoint
      And clicks on any element in the "topup_list" list
      And the "topup_confirmation" popup is displayed
      And clicks on the "topup_confirmation.continue" button
      And waits until the "spinner" element is not visible
      And an unexpected error happen
      And the "Topup Feedback" page is displayed
      And clicks on the "back" button with "Volver" text
     Then the "Account" page is displayed

  @jira.QANOV-624097 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-624033
  @manual @o2es @regression
  Scenario: A user without connection selects new topup bundle: no connectivity info screen is displayed
    Given user is in the "Account" page
      And user has a "mobile" product
      And user can buy topups
      And user has not reached maximum topup purchase
     When clicks on the "topup_entrypoint" entrypoint
      And the "Topup Selection" page is displayed
      And turns on the Airplane mode
      And clicks on any element in the "topup_list" list
     Then the "No Connectivity Screen" page is displayed
      And the "no_connection_title" textfield with "Parede que no tienes conexión" text is displayed
      And the "no_connection_description" textfield with "Comprueba el estado de tu red e inténtalo de nuevo." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver" text is displayed
      And turns off the Airplane mode
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-624098 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-624033
  @manual @o2es @regression
  Scenario: A user without connection can retry from no connection feedback screen
    Given user is in the "Account" page
      And user has a "mobile" product
      And user can buy topups
      And user has not reached maximum topup purchase
     When clicks on the "topup_entrypoint" entrypoint
      And the "Topup Selection" page is displayed
      And turns on the Airplane mode
      And clicks on any element in the "topup_list" list
      And the "No Connectivity Screen" page is displayed
      And turns off the Airplane mode
      And clicks on the "retry" button with "Reintentar" text
     Then the "Topup Selection" page is displayed

  @jira.QANOV-624099 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-624033
  @manual @o2es @regression
  Scenario: A user without connection can return from no connection feedback screen
    Given user is in the "Account" page
      And user has a "mobile" product
      And user can buy topups
      And user has not reached maximum topup purchase
     When clicks on the "topup_entrypoint" entrypoint
      And the "Topup Selection" page is displayed
      And turns on the Airplane mode
      And clicks on any element in the "topup_list" list
      And the "No Connectivity Screen" page is displayed
      And turns off the Airplane mode
      And And the "back" button with "Volver" text is displayed
     Then the "Account" page is displayed
