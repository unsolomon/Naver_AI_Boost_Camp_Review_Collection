@echo off
echo =====================================
echo 🚀 Naver_AI_Boost_Camp_Review_Collection 자동 병합 시작
echo =====================================

REM 현재 폴더: Naver_AI_Boost_Camp_Review_Collection
cd /d "%~dp0"

REM === Product_Serving_review ===
git remote add repo_product_serving https://github.com/unsolomon/Product_Serving_review.git
git fetch repo_product_serving
git subtree add --prefix=reviews/Product_Serving_review repo_product_serving main

REM === GenerativeAI ===
git remote add repo_generativeai https://github.com/unsolomon/GenerativeAI.git
git fetch repo_generativeai
git subtree add --prefix=reviews/GenerativeAI repo_generativeai main

REM === NLP_RECENT_TRENDS ===
git remote add repo_nlp_trends https://github.com/unsolomon/NLP_RECENT_TRENDS.git
git fetch repo_nlp_trends
git subtree add --prefix=reviews/NLP_RECENT_TRENDS repo_nlp_trends main

REM === Generation_for_NLP_review ===
git remote add repo_gen4nlp https://github.com/unsolomon/Generation_for_NLP_review.git
git fetch repo_gen4nlp
git subtree add --prefix=reviews/Generation_for_NLP_review repo_gen4nlp main

REM === Data-centric ===
git remote add repo_datacentric https://github.com/unsolomon/Data-centric.git
git fetch repo_datacentric
git subtree add --prefix=reviews/Data-centric repo_datacentric main

REM === MRC_review ===
git remote add repo_mrc https://github.com/unsolomon/MRC_review.git
git fetch repo_mrc
git subtree add --prefix=reviews/MRC_review repo_mrc main

REM === NLP_basic_project_review ===
git remote add repo_nlp_basic https://github.com/unsolomon/NLP_basic_project_review.git
git fetch repo_nlp_basic
git subtree add --prefix=reviews/NLP_basic_project_review repo_nlp_basic main

REM === NLP_review ===
git remote add repo_nlp_review https://github.com/unsolomon/NLP_review.git
git fetch repo_nlp_review
git subtree add --prefix=reviews/NLP_review repo_nlp_review main

REM === AI_Development_Basics_review ===
git remote add repo_ai_basic https://github.com/unsolomon/AI_Development_Basics_review.git
git fetch repo_ai_basic
git subtree add --prefix=reviews/AI_Development_Basics_review repo_ai_basic main

REM === EDA_review ===
git remote add repo_eda https://github.com/unsolomon/EDA_review.git
git fetch repo_eda
git subtree add --prefix=reviews/EDA
