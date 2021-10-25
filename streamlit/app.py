import streamlit as st
import streamlit.components.v1 as components
import requests

base_url = 'https://rsc.radixu.com/hospital-report-generator/'

st.title(':hospital: Parameterized Report Example')

form = st.form(key='my_form')

report_type = form.selectbox(
    'What type of data would you like the report to pull?',
    ('Last Month', 'Last Year', 'Last Five Years'))
hospital = form.selectbox(
    'Select the name of the hospital:', 
    ("Central Hospital", "Military Hospital", "Port Hospital", "St. Mark's Maternity Hospital (SMMH)"))
severity = form.radio(
    'Should the report include Level 3 severity events?',
    ('Yes', 'No'))

preview_report = form.form_submit_button(label='Preview Report')
save_report = form.form_submit_button(label='Save Report')

if preview_report:
    url = f"{base_url}report?hospital={hospital}&report={report_type}&severity={severity}"
    req = requests.get(url)
    components.html(req.text, height = 1000)

if save_report: 
    st.write(f'Oh no! :scream: Saving this report for {hospital} is not currently available.')