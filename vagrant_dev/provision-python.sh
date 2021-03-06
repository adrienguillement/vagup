python3.6 -m venv venv-vagup
source ~/venv-vagup/bin/activate
cd /srv/vagup

# requirements
source ~/venv-vagup/bin/activate \
&& cd /srv/vagup/src/vagup \
&& pip3.6 install -r /srv/vagup/src/requirements/base.txt \
&& python manage.py makemigrations \
&& python manage.py migrate \
&& echo "from django.contrib.auth.models import User; User.objects.filter(username='admin').exists() or User.objects.create_superuser('admin', 'admin@example.com', 'admin')" | python manage.py shell \
&& deactivate