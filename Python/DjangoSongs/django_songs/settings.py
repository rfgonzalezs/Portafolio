from pathlib import Path
import os
import environ

# --- Configuración base ---
BASE_DIR = Path(__file__).resolve().parent.parent
# --- Inicializar django-environ ---
env = environ.Env(DEBUG=(bool, False))
environ.Env.read_env(os.path.join(BASE_DIR, '.env'))
# --- Variables desde .env ---
SECRET_KEY = env('SECRET_KEY', default='django-insecure-dev-key')
DEBUG = env('DEBUG')
ALLOWED_HOSTS = []
# --- Aplicaciones ---
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'canciones',
]
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]
ROOT_URLCONF = 'django_songs.urls'
TEMPLATES = [
    {
    'BACKEND': 'django.template.backends.django.DjangoTemplates',
    'DIRS': [BASE_DIR / 'templates'],
    'APP_DIRS': True,
    'OPTIONS': {
    'context_processors': [
    'django.template.context_processors.debug',
    'django.template.context_processors.request',
    'django.contrib.auth.context_processors.auth',
    'django.contrib.messages.context_processors.messages',
    ],
    },
},
]
WSGI_APPLICATION = 'django_songs.wsgi.application'
# --- Configuración de base de datos (MySQL con PyMySQL) ---
DATABASES = {
    'default': {
    'ENGINE': 'django.db.backends.mysql',
    'NAME': env('DB_NAME'),
    'USER': env('DB_USER'),
    'PASSWORD': env('DB_PASSWORD'),
    'HOST': env('DB_HOST'),
    'PORT': env('DB_PORT'),
    'OPTIONS': {
    'charset': 'utf8mb4',
    },
    }
}
# --- Validaciones ---
AUTH_PASSWORD_VALIDATORS = [
    {'NAME':
    'django.contrib.auth.password_validation.UserAttributeSimilarityValidator'},
    {'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator'},
    {'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator'},
    {'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator'},
]
# --- Regionalización ---
LANGUAGE_CODE = 'es'
TIME_ZONE = 'America/Mexico_City'
USE_I18N = True
USE_TZ = True
STATIC_URL = 'static/'
DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'