# Tableau Dashboard Plan: Mental Health Trends Among University Students

## Data Source
- `Student_Mental_health_CLEAN.csv` (or connect to the `mental_health.students_mental_health` MySQL table)

## Dashboard Pages / Sheets

1. **Overview (Summary KPI)**
   - KPI tiles: Total students, % Depression, % Anxiety, Avg GPA_num
   - Filters: Year (if available), Gender

2. **Mental Health by Demographics**
   - Bar chart: Depression % by Gender
   - Stacked bar: Depression/Anxiety by Year_study

3. **GPA vs Mental Health**
   - Boxplot: GPA_num distribution split by Depression (Yes/No)
   - Line or bar: Avg GPA_num by Depression & Year_study

4. **Academic Pressure & Outcomes**
   - Heatmap or stacked bar: Academic Pressure (if present) vs Depression rate

5. **Detail Table / Download**
   - Table with row-level details for selected filters and a download button

## Interactivity
- Filters: Gender, Year_study, Year, GPA_range
- Tooltips: show counts and percentages, sample size (n)
- Actions: Clicking Gender drills down to Year_study charts

## Styling
- Clean, minimal color palette (2-3 colors). Use color for binary status (Depression: red, No: grey).
- Use consistent fonts and 2xl rounded cards for KPI tiles.
