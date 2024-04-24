# -*- coding: utf-8 -*-
@jira.QANOV-8268
Feature: Terms & Conditions


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.10.3 @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-47314 @mobile @regression
  Scenario Outline: <product> user can access to the internal webview after accessing the <term_text> link inside the Terms and conditions
    Given user is in the "Terms And Conditions Settings" page
      And the internal webview is displayed
     When clicks on the "webview" element with "<term_text>" text
     Then the internal webview with "<header_name>" header is displayed
      And clicks on the "<button>" button
      And the "<page>" page is displayed

    @cert0 @cert1 @live @next
    Examples:
          | product | term_text                                                                 | header_name                                                                                                                                                | button                          | page                          | depends_on | jira_id    |
          | o2uk    | https://www.o2.co.uk/contactus                                            | Contact Us \| Help, Support and Useful Numbers \| O2                                                                                                       | navigation_top_bar.close_button | Terms And Conditions Settings | QANOV-8271 | QANOV-8275 |
          | o2uk    | https://www.o2.co.uk/apps/myo2                                            | My O2 App \| Available on iOS, Android and Windows \| O2                                                                                                   | navigation_top_bar.close_button | Terms And Conditions Settings | QANOV-8271 | QANOV-8276 |
          | o2uk    | www.o2.co.uk/termsandconditions/privacy-policy                            | O2 \| Terms and Conditions \| Privacy Policy                                                                                                               | navigation_top_bar.close_button | Terms And Conditions Settings | QANOV-8271 | QANOV-8278 |
          | o2uk    | https://www.o2.co.uk/termsandconditions                                   | Terms & conditions \| O2                                                                                                                                   | navigation_top_bar.close_button | Terms And Conditions Settings | QANOV-8271 | QANOV-8279 |
          | o2uk    | https://www.competitionagency.com                                         | Prize Promotion Agency for Competitions and Prize Draws \| Competition PR, Marketing, Design, Legal, Compliance, Prize fulfilment - The Competition Agency | navigation_top_bar.close_button | Terms And Conditions Settings | QANOV-8271 | QANOV-8280 |
          | o2uk    | https://www.o2.co.uk/termsandconditions/other-products-and-services/my-o2 | O2 \| My O2 Terms and Conditions                                                                                                                           | navigation_top_bar.close_button | Terms And Conditions Settings | QANOV-8271 | QANOV-8281 |

    @cert2 @deprecate_profile_moves @jira.dv.Future @jira.link.detects.MOVES-5613
    @jira.link.detects.MOVES-5736 @live @next
    Examples:
          | product | term_text                 | header_name                                                | button                         | page                          | depends_on | jira_id    |
          | moves   | www.movistar.es/contratos | Movistar: Internet, Móvil y TV ¡Ofertas exclusivas Online! | navigation_top_bar.back_button | Terms And Conditions Settings | QANOV-8272 | QANOV-8282 |
          | moves   | www.movistar.es           | Movistar: Internet, Móvil, TV y ¡Ofertas exclusivas!       | navigation_top_bar.back_button | Terms And Conditions Settings | QANOV-8272 | QANOV-8284 |

    @deprecate_profile_moves @jira.dv.Future @jira.link.detects.MOVES-7996 @manual
    Examples:
          | product | term_text                   | header_name                                                | button                         | page                          | depends_on | jira_id    |
          | moves   | Privacidad de Google        | Política de Privacidad – Privacidad y Condiciones – Google | navigation_top_bar.back_button | Terms And Conditions Settings | QANOV-8272 | QANOV-8289 |
          | moves   | Personalización de anuncios | Configuración de anuncios                                  | navigation_top_bar.back_button | Terms And Conditions Settings | QANOV-8272 | QANOV-8287 |

  @jira.<jira_id> @android @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.10.3 @jira.dv.Future
  @jira.link.depends_on.QANOV-8272 @jira.link.relates_to.NOV-47314 @live @mobile @moves @next @regression
  Scenario Outline: Moves user can access to the external webview after accessing the <term_text> link inside the Terms and conditions
    Given user is in the "Terms And Conditions Settings" page
     When clicks on the "<term_text>" link
     Then the external webview is displayed
      And the "<text>" string is displayed
      And clicks on the native "back" button
      And the "Terms And Conditions Settings" page is displayed

    Examples:
          | term_text         | text       | jira_id    |
          | privacy_link      | Privacidad | QANOV-8286 |
          | privacy_more_info | adicional  | QANOV-8288 |
