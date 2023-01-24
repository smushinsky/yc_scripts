## Данная работа представляет собой дипломный проект по курсу "Старт в DevOps".

### Для удобства проект разделен на следующие этапы:

1. Описание структур и сервисов.
2. Подготовка рабочего места для взаимодействия с облачной инфраструктурой Яндекс.
3. Создание облачной инфраструктуры при помощи скриптов.
4. Конфигурация инфраструктуры.

### Пункт 1. Описание структур и сервисов.
Структура представляет из себя несколько виртуальных машин, разделенных по функциональному признаку.
1. CA_server - наш центр сертификации, ему будут доверять и им будут подписываться клиентские запросы.
2. VPN_server - сервер для удаленного доступа сотрудников к ресурсам компании.
3. Prom_server - сервер для мониторинга доступности критичных приложений и служб.
4. Backup_server - сервер для резервного копирования конфигураций.
