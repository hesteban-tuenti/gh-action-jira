# -*- coding: utf-8 -*-
@jira.QANOV-127150 @not_hardening
Feature: Feedback alerts installation

  Actions Before each Scenario:
    Given user has the "alerts" module configured in CMS for "dashboard" page

  @jira.QANOV-4790 @android @ios @mobile @manual @jira.cv.Future @jira.link.detects.VIVO-2338
  @jira.link.parent_test_plan.QANOV-56585 @regression @vivobr @impeded_mock @automation.pending_mock @old_app
  Scenario: A convergente user with only a scheduled visit can see an alert reminding the visit
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has scheduled a technical visit
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "Information about technician visit" preconfiguration
      And user has not closed the "visit_scheduled_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "visit_scheduled_alert.alert" element is displayed
      And the "visit_scheduled_alert.title" textfield with "Visita agendada" text is displayed
      And the "visit_scheduled_alert.subtitle" textfield is displayed
      And the "visit_scheduled_alert.close" button is displayed
      And the "visit_scheduled_alert.new_visit" link with "Reagendar" text is displayed
      And the "visit_scheduled_alert.more_options" link with "Mais opções" text is displayed

  @jira.QANOV-56946 @android @ios @mobile @manual @jira.cv.12.4
  @jira.link.parent_test_plan.QANOV-56585 @regression @vivobr @old_app
  Scenario: User with a scheduled visit will see an alert 24 hours after user closes the alert
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has scheduled a technical visit
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "Information about technician visit" preconfiguration
      And user has closed the "visit_scheduled_alert" alert more than "24 hours" ago
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "visit_scheduled_alert.alert" element is displayed
      And the "visit_scheduled_alert.title" textfield with "Visita agendada" text is displayed
      And the "visit_scheduled_alert.subtitle" textfield is displayed
      And the "visit_scheduled_alert.close" button is displayed
      And the "visit_scheduled_alert.new_visit" link with "Reagendar" text is displayed
      And the "visit_scheduled_alert.more_options" link with "Mais opções" text is displayed

  @jira.QANOV-4792 @TBD @android @ios @mobile @manual @jira.cv.12.4 @jira.link.depends_on.QANOV-4790
  @jira.link.parent_test_plan.QANOV-56585 @regression @vivobr @old_app
  Scenario: A convergente user with only a scheduled visit alert taps on the "Reagendar" link in alert: user will be redirected to the Reagendar webview
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has scheduled a technical visit
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "Information about technician visit" preconfiguration
      And user has not closed the "visit_scheduled_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "visit_scheduled_alert.new_visit" link
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-4794 @TBD @android @ios @mobile @manual @jira.cv.12.4 @jira.link.depends_on.QANOV-4790
  @jira.link.parent_test_plan.QANOV-56585 @regression @vivobr @old_app
  Scenario: A convergente user with only a scheduled visit alert taps on the "Mais opções" link in alert: user will be redirected to the Technical visit status webview
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has scheduled a technical visit
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "Information about technician visit" preconfiguration
      And user has not closed the "visit_scheduled_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "visit_scheduled_alert.more_options" link
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-4796 @android @ios @mobile @manual @jira.cv.12.4 @jira.link.depends_on.QANOV-4790
  @jira.link.parent_test_plan.QANOV-56585 @regression @vivobr @old_app
  Scenario: A convergente user can close a scheduled visit alert in the account dashboard
    internal_checkpoint="if the user refreshes the account, the alert shouldn't be displayed"
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has scheduled a technical visit
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "Information about technician visit" preconfiguration
      And user has not closed the "visit_scheduled_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "visit_scheduled_alert.close" button
     Then the "visit_scheduled_alert.alert" element is not displayed

  @jira.QANOV-21917 @android @ios @mobile @manual @jira.cv.Future
  @jira.link.parent_test_plan.QANOV-76707 @smoke @vivobr @TBD @old_app
  Scenario: A convergente user with a plan pending installation and without a scheduled visit can see an alert in the account dashboard
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has not scheduled a technical visit
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "schedule_visit_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "schedule_visit_alert.alert" element is displayed
      And the "schedule_visit_alert.title" textfield with "Agende sua visita" text is displayed
      And the "schedule_visit_alert.subtitle" textfield with "Agende a visita técnica para instalação de seu produto Vivo" text is displayed
      And the "schedule_visit_alert.close" button is displayed
      And the "schedule_visit_alert.new_visit" link with "Agendar" text is displayed

  @jira.QANOV-77643 @android @ios @mobile @manual @jira.cv.Future
  @jira.link.parent_test_plan.QANOV-76707 @regression @vivobr @TBD @old_app
  Scenario: A convergente user without a scheduled visit will see an alert 24 hours after user closes the alert
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has not scheduled a technical visit
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has closed the "schedule_visit_alert" alert more than "24 hours" ago
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "schedule_visit_alert.alert" element is displayed
      And the "schedule_visit_alert.title" textfield with "Agende sua visita" text is displayed
      And the "schedule_visit_alert.subtitle" textfield with "Agende a visita técnica para instalação de seu produto Vivo" text is displayed
      And the "schedule_visit_alert.close" button is displayed
      And the "schedule_visit_alert.new_visit" link with "Agendar" text is displayed

  @jira.QANOV-21918 @android @ios @mobile @manual @jira.cv.Future @jira.link.depends_on.QANOV-21917
  @jira.link.parent_test_plan.QANOV-76707 @regression @vivobr @TBD @old_app
  Scenario: A convergente user with the schedule a visit alert taps on the "Agendar" link in alert: user will be redirected to the Agendar webview
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has not scheduled a technical visit
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "schedule_visit_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "schedule_visit_alert.new_visit" link
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-21920 @android @ios @mobile @manual @jira.cv.Future @jira.link.depends_on.QANOV-21917
  @jira.link.parent_test_plan.QANOV-76707 @regression @vivobr @TBD @old_app
  Scenario: A convergente user can close a schedule a visit alert in the account dashboard
    internal_checkpoint="if the user refreshes the account, the alert shouldn't be displayed"
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has not scheduled a technical visit
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "schedule_visit_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "schedule_visit_alert.close" button
     Then the "schedule_visit_alert" alert is not displayed

  @jira.QANOV-21921 @android @ios @mobile @manual @jira.cv.Future
  @jira.link.parent_test_plan.QANOV-76707 @regression @vivobr @TBD @old_app
  Scenario: A convergente user with a plan pending installation and with a scheduled visit that needs to be rescheduled can see an alert in the account dashboard
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has a technical visit scheduled pending to be rescheduled
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "reschedule_visit_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "reschedule_visit_alert.alert" element is displayed
      And the "reschedule_visit_alert.title" textfield with "Visita pendente" text is displayed
      And the "reschedule_visit_alert.subtitle" textfield with "Vamos entrar em contato para novo agendamento" text is displayed
      And the "reschedule_visit_alert.close" button is displayed
      And the "reschedule_visit_alert.more_options" link with "Ver mais" text is displayed

  @jira.QANOV-77644 @android @ios @mobile @manual @jira.cv.Future @old_app
  @jira.link.parent_test_plan.QANOV-76707 @regression @vivobr @TBD
  Scenario: A convergente user with a scheduled visit that needs to be rescheduled will see an alert 24 hours after user closes the alert
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has a technical visit scheduled pending to be rescheduled
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has closed the "reschedule_visit_alert" alert more than "24 hours" ago
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "reschedule_visit_alert.alert" element is displayed
      And the "reschedule_visit_alert.title" textfield with "Visita pendente" text is displayed
      And the "reschedule_visit_alert.subtitle" textfield with "Vamos entrar em contato para novo agendamento" text is displayed
      And the "reschedule_visit_alert.close" button is displayed
      And the "reschedule_visit_alert.more_options" link with "Ver mais" text is displayed

  @jira.QANOV-21923 @android @ios @mobile @manual @jira.cv.Future @jira.link.depends_on.QANOV-21921
  @jira.link.parent_test_plan.QANOV-76707 @regression @vivobr @TBD @old_app
  Scenario: A convergente user with a reschedule visit alert taps on the "Ver mais" link in alert: user will be redirected to the Technical visit status webview
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has a technical visit scheduled pending to be rescheduled
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "reschedule_visit_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "reschedule_visit_alert.more_options" link
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-21924 @android @ios @mobile @manual @jira.cv.Future @jira.link.depends_on.QANOV-21921
  @jira.link.parent_test_plan.QANOV-76707 @regression @vivobr @TBD @old_app
  Scenario: A convergente user can close a reschedule visit alert in the account dashboard
    internal_checkpoint="if the user refreshes the account, the alert shouldn't be displayed"
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has a technical visit scheduled pending to be rescheduled
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "reschedule_visit_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "reschedule_visit_alert.close" button
     Then the "reschedule_visit_alert" alert is not displayed

  @jira.QANOV-21928 @android @ios @mobile @manual @jira.cv.Future
  @jira.link.parent_test_plan.QANOV-76707 @regression @vivobr @TBD @old_app
  Scenario: A convergente user with a plan pending installation and the technician is on the way can see an alert in the account dashboard
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has scheduled a technical visit and the technician is on the way
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "technician_on_the_way_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "technician_on_the_way_alert.alert" element is displayed
      And the "technician_on_the_way_alert.title" textfield with "Técnico a caminho" text is displayed
      And the "technician_on_the_way_alert.subtitle" textfield with the "{tech_name} está a caminho da visita técnica" format is displayed
      And the "technician_on_the_way_alert.close" button is displayed
      And the "technician_on_the_way_alert.see_details" link with "Ver detalhes" text is displayed
      And the "technician_on_the_way_alert.new_visit" link with "Reagendar" text is displayed

  @jira.QANOV-77645 @android @ios @mobile @manual @jira.cv.Future
  @jira.link.parent_test_plan.QANOV-76707 @regression @vivobr @TBD @old_app
  Scenario: A convergente user and the technician is on the way will see an alert 24 hours after user closes the alert
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has scheduled a technical visit and the technician is on the way
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has closed the "technician_on_the_way_alert" alert more than "24 hours" ago
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "technician_on_the_way_alert.alert" element is displayed
      And the "technician_on_the_way_alert.title" textfield with "Técnico a caminho" text is displayed
      And the "technician_on_the_way_alert.subtitle" textfield with the "{tech_name} está a caminho da visita técnica" format is displayed
      And the "technician_on_the_way_alert.close" button is displayed
      And the "technician_on_the_way_alert.see_details" link with "Ver detalhes" text is displayed
      And the "technician_on_the_way_alert.new_visit" link with "Reagendar" text is displayed

  @jira.QANOV-26326 @android @ios @mobile @manual @jira.cv.Future @jira.link.depends_on.QANOV-21928
  @jira.link.parent_test_plan.QANOV-76707 @regression @vivobr @TBD @old_app
  Scenario: A convergente user with a tech on the way alert taps on the "Ver detalhes" link in alert: user will be redirected to the Map webview
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has scheduled a technical visit and the technician is on the way
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "technician_on_the_way_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "technician_on_the_way_alert.see_details" link
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-21929 @android @ios @mobile @manual @jira.cv.Future @jira.link.depends_on.QANOV-21928
  @jira.link.parent_test_plan.QANOV-76707 @regression @vivobr @TBD @old_app
  Scenario: A convergente user with a tech on the way alert taps on the "Reagendar" link in alert: user will be redirected to the Reagendar webview
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has scheduled a technical visit and the technician is on the way
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "technician_on_the_way_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "technician_on_the_way_alert.new_visit" link
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-21930 @android @ios @mobile @manual @jira.cv.Future @jira.link.depends_on.QANOV-21928
  @jira.link.parent_test_plan.QANOV-76707 @regression @vivobr @TBD @old_app
  Scenario: A convergente user can close a tech on the way alert in the account dashboard
    internal_checkpoint="if the user refreshes the account, the alert shouldn't be displayed"
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has scheduled a technical visit and the technician is on the way
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "technician_on_the_way_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "technician_on_the_way_alert.close" button
     Then the "technician_on_the_way_alert" alert is not displayed

  @jira.QANOV-21931 @android @ios @mobile @manual @jira.cv.Future
  @jira.link.parent_test_plan.QANOV-76707 @regression @vivobr @TBD @old_app
  Scenario: A convergente user with a plan pending installation and the technician has arrived can see an alert in the account dashboard
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has scheduled a technical visit and the technician has arrived
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "technician_arrived_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "technician_arrived_alert.alert" element is displayed
      And the "technician_arrived_alert.title" textfield with "Técnico está no local" text is displayed
      And the "technician_arrived_alert.subtitle" textfield with the "{tech_name} chegou no local para a visita técnica" format is displayed
      And the "technician_arrived_alert.close" button is displayed
      And the "technician_arrived_alert.see_details" link with "Ver detalhes" text is displayed

  @jira.QANOV-77646 @android @ios @mobile @manual @jira.cv.Future @old_app
  @jira.link.parent_test_plan.QANOV-76707 @regression @vivobr @TBD
  Scenario: A convergente user and the technician has arrived will see an alert 24 hours after user closes the alert
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has scheduled a technical visit and the technician has arrived
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has closed the "technician_arrived_alert" alert more than "24 hours" ago
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "technician_arrived_alert.alert" element is displayed
      And the "technician_arrived_alert.title" textfield with "Técnico está no local" text is displayed
      And the "technician_arrived_alert.subtitle" textfield with the "{tech_name} chegou no local para a visita técnica" format is displayed
      And the "technician_arrived_alert.close" button is displayed
      And the "technician_arrived_alert.see_details" link with "Ver detalhes" text is displayed

  @jira.QANOV-21932 @android @ios @mobile @manual @jira.cv.Future @jira.link.depends_on.QANOV-21931
  @jira.link.parent_test_plan.QANOV-76707 @regression @vivobr @TBD @old_app
  Scenario: A convergente user with a tech arrived alert taps on the "Ver detalhes" link in alert: user will be redirected to the Map webview
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has scheduled a technical visit and the technician has arrived
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "technician_arrived_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "technician_arrived_alert.see_details" link
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-21933 @android @ios @mobile @manual @jira.cv.Future @jira.link.depends_on.QANOV-21931
  @jira.link.parent_test_plan.QANOV-76707 @regression @vivobr @TBD @old_app
  Scenario: A convergente user can close a tech arrived alert in the account dashboard
    internal_checkpoint="if the user refreshes the account, the alert shouldn't be displayed"
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has scheduled a technical visit and the technician has arrived
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "technician_arrived_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "technician_arrived_alert.close" button
     Then the "technician_arrived_alert" alert is not displayed

  @jira.QANOV-21937 @android @ios @mobile @manual @jira.cv.Future
  @jira.link.parent_test_plan.QANOV-76707 @regression @vivobr @TBD @old_app
  Scenario: A convergente user with a plan pending installation and the installation has finished can see an alert in the account dashboard
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And the installation of the pending product has finished
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "installation_finished_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "installation_finished_alert.alert" element is displayed
      And the "installation_finished_alert.title" textfield with "Visita concluída" text is displayed
      And the "installation_finished_alert.subtitle" textfield with "Seus produtos foram instalados com sucesso" text is displayed
      And the "installation_finished_alert.close" button is displayed
      And the "installation_finished_alert.details" link with "Ver detalhes" text is displayed

  @jira.QANOV-77647 @android @ios @mobile @manual @jira.cv.Future
  @jira.link.parent_test_plan.QANOV-76707 @regression @vivobr @TBD @old_app
  Scenario: A convergente user and the installation has finished will see an alert 24 hours after user closes the alert
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And the installation of the pending product has finished
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has closed the "installation_finished_alert" alert more than "24 hours" ago
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "installation_finished_alert.alert" element is displayed
      And the "installation_finished_alert.title" textfield with "Visita concluída" text is displayed
      And the "installation_finished_alert.subtitle" textfield with "Seus produtos foram instalados com sucesso" text is displayed
      And the "installation_finished_alert.close" button is displayed
      And the "installation_finished_alert.details" link with "Ver detalhes" text is displayed

  @jira.QANOV-21938 @android @ios @mobile @manual @jira.cv.Future @jira.link.depends_on.QANOV-21937
  @jira.link.parent_test_plan.QANOV-76707 @regression @vivobr @TBD @old_app
  Scenario: A convergente user with an installation finished alert taps on the "Ver detalhes" link in alert: user will be redirected to the Technical visit status webview
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And the installation of the pending product has finished
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "installation_finished_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "installation_finished_alert.details" link
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-21939 @android @ios @mobile @manual @jira.cv.Future @jira.link.depends_on.QANOV-21937
  @jira.link.parent_test_plan.QANOV-76707 @regression @vivobr @TBD @old_app
  Scenario: A convergente user can close an installation finished alert in the account dashboard
    internal_checkpoint="if the user refreshes the account, the alert shouldn't be displayed"
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And the installation of the pending product has finished
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "installation_finished_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "installation_finished_alert.close" button
     Then the "installation_finished_alert.alert" element is not displayed

  @jira.QANOV-21940 @android @ios @mobile @manual @jira.cv.12.4 @old_app
  @jira.link.parent_test_plan.QANOV-56585 @regression @vivobr
  Scenario: A user who has a scheduled visit alert and at least one consumption alert can see the technical one first
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has scheduled a technical visit
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "Information about technician visit" preconfiguration
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "visit_scheduled_alert" alert
      And user has a consumption alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "visit_scheduled_alert.alert" element is displayed

  @jira.QANOV-21941 @android @ios @mobile @manual @jira.cv.Future @regression @vivobr @TBD @old_app
  Scenario: A user who has a schedule a visit alert and at least one consumption alert can see the technical one first
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has not scheduled a technical visit
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "schedule_visit_alert" alert
      And user has a consumption alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "schedule_visit_alert.alert" element is displayed

  @jira.QANOV-21942 @android @ios @mobile @manual @jira.cv.Future @regression @vivobr @TBD @old_app
  Scenario: A user who has a reschedule a visit alert and at least one consumption of alert can see the technical one first
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has a technical visit scheduled pending to be rescheduled
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "reschedule_visit_alert" alert
      And user has a consumption alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "reschedule_visit_alert.alert" element is displayed

  @jira.QANOV-21943 @android @ios @mobile @manual @jira.cv.Future @regression @vivobr @TBD @old_app
  Scenario: A user who has a pending visit alert and at least one consumption alert can see the technical one first
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has scheduled a technical visit and the technician has had a problem
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "pending_visit_alert" alert
      And user has a consumption alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "pending_visit_alert.alert" element is displayed

  @jira.QANOV-21944 @android @ios @mobile @manual @jira.cv.Future @regression @vivobr @TBD @old_app
  Scenario: A user who has a tech on the way alert and at least one consumption alert can see the technical one first
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has scheduled a technical visit and the technician is on the way
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "technician_on_the_way_alert" alert
      And user has a consumption alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "technician_on_the_way_alert.alert" element is displayed

  @jira.QANOV-21945 @android @ios @mobile @manual @jira.cv.Future @regression @vivobr @TBD @old_app
  Scenario: A user who has a tech arrived alert and at least one consumption alert can see the technical one first
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user has scheduled a technical visit and the technician has arrived
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "technician_arrived_alert" alert
      And user has a consumption alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "technician_arrived_alert.alert" element is displayed

  @jira.QANOV-21946 @android @ios @mobile @manual @jira.cv.Future @regression @vivobr @TBD @old_app
  Scenario: A user who has an installation problem alert and at least one consumption alert can see the technical one first
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And there is a problem during the installation of the pending product
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "installation_problem_alert" alert
      And user has a consumption alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "installation_problem_alert.alert" element is displayed

  @jira.QANOV-21947 @android @ios @mobile @manual @jira.cv.Future @regression @vivobr @TBD @old_app
  Scenario: A user who has an installation finished alert and at least one consumption alert can see the technical one first
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And the installation of the pending product has finished
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "installation_finished_alert" alert
      And user has a consumption alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "installation_finished_alert.alert" element is displayed
