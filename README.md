## Данная работа представляет собой дипломный проект по курсу "Старт в DevOps".

### Для удобства проект разделен на следующие этапы:

1. Описание структур и сервисов.
2. Системные требования.
3. Подготовка рабочего места для взаимодействия с облачной инфраструктурой Яндекс.
4. Создание облачной инфраструктуры при помощи скриптов.
5. Конфигурация инфраструктуры.

### Пункт 1. Описание структур и сервисов.
Структура представляет из себя несколько виртуальных машин, разделенных по функциональному признаку.
1. CA_server - наш центр сертификации, ему будут доверять и им будут подписываться клиентские запросы.
2. VPN_server - сервер для удаленного доступа сотрудников к ресурсам компании.
3. Prom_server - сервер для мониторинга доступности критичных приложений и служб.
4. Backup_server - сервер для резервного копирования конфигураций.

### Пункт 2. Системные требования.
Для работы с системой необходим пк с установленной ос linux и стабильным выходом в интернет.
Также для удобства необходимо создать папку scripts в домашней директории и перенести туда все скрипты из моего репозитория.
Для удаленного доступа к серверу необходимо создать ключевую пару, для этого воспользуйтесь командой: ssh-keygen.
В домашней директории будет создано два файла, id_rsa.pub это и есть публичный ключ.

### Пункт 3. Подготовка рабочего места для взаимодействия с облачной инфраструктурой Яндекс.

1. Зарегистрируйте аккаунт по ссылке https://passport.yandex.ru/registration
2. Пройдите процедуру установки приложения Яндекс и получения токена по ссылке https://cloud.yandex.ru/docs/cli/quickstart

### Пункт 4. Создание облачной инфраструктуры при помощи скриптов.

1. Создайте сеть и подсеть при помощи скрипта yc_create_network.sh
2. Создайте виртуальную машину при помощи скрипта yc_create_vm.sh
3. При помощи команды yc vpc address list узнайте IP-адрес созданной машины.

### 5. Конфигурация инфраструктуры.

#### Установка центра сертификации.

1. При помощи команды ssh yc-user@IP-адрес зайте на виртуальную машину.
2. Установите пакет easy-rsa: sudo apt-get install easy-rsa
3. Создайте папку scripts в вашей домашней директории и скопируйте туда yc_create_ca.sh
4. Запустите скрипт yc_create_ca.sh, в процессе выполнения заполните запрашиваемые поля.
5. Центр сертификации установлен. Сертификат и ключ будут по пути ~/easy-rsa/keys с названиями ca.crt и ca.key соответственно.


