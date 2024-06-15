from setuptools import setup, find_packages

with open("README.md", "r", encoding="utf-8") as f:
    long_description = f.read()

# Variables
REPO_NAME = "Books-Recommender-System-Using-Machine-Learning"
AUTHOR_USER_NAME = "entbappy"
SRC_REPO = "src"
LIST_OF_REQUIREMENTS = ['streamlit', 'numpy', 'pandas', 'scikit-learn', 'jupyter', 'matplotlib', 'seaborn']

setup(
    name=SRC_REPO,
    version="0.0.1",
    author=AUTHOR_USER_NAME,
    description="A small package for Books Recommender System",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url=f"https://github.com/{AUTHOR_USER_NAME}/{REPO_NAME}",
    author_email="entbappy73@gmail.com",
    packages=find_packages(where=SRC_REPO),
    package_dir={"": SRC_REPO},
    license="MIT",
    python_requires=">=3.7",
    install_requires=LIST_OF_REQUIREMENTS
)
