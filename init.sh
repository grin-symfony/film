mkdir "./bundles/grin-symfony" -p
cd "./bundles/grin-symfony"

git clone "https://github.com/grin-symfony/command-bundle.git"
git clone "https://github.com/grin-symfony/service-bundle.git"
git clone "https://github.com/grin-symfony/env-processor-bundle.git"

cd "./command-bundle"
git fetch origin v1
git checkout -b v1
git checkout v1 -f && git merge origin/v1 -Xtheirs -m'auto update(merge v1)'
cd ".."

cd "./service-bundle"
git fetch origin v1
git checkout -b v1
git checkout v1 -f && git merge origin/v1 -Xtheirs -m'auto update(merge v1)'
cd ".."

cd "./env-processor-bundle"
git fetch origin v1
git checkout -b v1
git checkout v1 -f && git merge origin/v1 -Xtheirs -m'auto update(merge v1)'
cd ".."

cd "../.."
composer install
composer dump-autoload -o
php "./bin/film" "cache:clear" "-q"