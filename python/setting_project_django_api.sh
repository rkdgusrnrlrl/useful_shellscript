PROJECT_NAME=$1

if [ "$1" = "" ]; then
  echo "프로젝트 명을 입력 해주세요"
  exit 1
fi

PWD=$(pwd)
PIP="$PWD/$PROJECT_NAME/venv/bin/pip"
django-admin startproject "$PROJECT_NAME"
cd "$PROJECT_NAME"
python3 -m venv venv
$PIP install django
$PIP install djangorestframework
$PIP install pytest-django
$PIP freeze > requirements.txt
