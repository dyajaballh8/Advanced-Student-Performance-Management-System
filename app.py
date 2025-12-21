import streamlit as st
import pandas as pd
import pickle

# ---------------- Load Model ----------------
@st.cache_resource
def load_model()
    with open(best_stack_pipeline.pkl, rb) as f
        model = pickle.load(f)
    return model

model = load_model()

st.title(🚀 Startup Success Prediction)
st.write(أدخل بيانات الاستارت أب وسيقوم النموذج بتوقع النجاح  الفشل)

# ---------------- Input Fields ----------------
# NOTE نفس الأعمدة اللي كانت موجودة في الـ Data بعد التنظيف
# لو عايز أضبط القيم بالضبط ابعتلي شكل الأعمدة وهظبطها

age_first_milestone_year = st.number_input(Age First Milestone Year, min_value=0)
age_last_milestone_year = st.number_input(Age Last Milestone Year, min_value=0)
funding_total_usd = st.number_input(Total Funding (USD), min_value=0)
milestones = st.number_input(Milestones, min_value=0)
relationships = st.number_input(Relationships, min_value=0)
funding_rounds = st.number_input(Funding Rounds, min_value=0)
has_VC = st.selectbox(Has VC, [0, 1])
is_top500 = st.selectbox(Is Top 500, [0, 1])

# ---------------- Predict Button ----------------
if st.button(🔮 Predict)
    input_data = pd.DataFrame([{
        age_first_milestone_year age_first_milestone_year,
        age_last_milestone_year age_last_milestone_year,
        funding_total_usd funding_total_usd,
        milestones milestones,
        relationships relationships,
        funding_rounds funding_rounds,
        has_VC has_VC,
        is_top500 is_top500
    }])

    prediction = model.predict(input_data)[0]

    if prediction == 1
        st.success(🎉 Prediction SUCCESSFUL Startup)
    else
        st.error(⚠️ Prediction FAILED  Not Successful)
