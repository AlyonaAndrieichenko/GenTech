// В рамках БД 190923_MUSIC напишите след/запросы:
// Вывести названия двух произвольных треков с тегом awesome
db.tracks.aggregate([
    { $match: { tags: 'awesome' } },
    { $sample: { size: 2 } }
]);

// Вывести имя юзера с самым минимальным балансом
db.users.aggregate([
    { $sort: { balance: 1 } },
    { $limit: 1 },
    { $project: { fullname: 1, _id: 0 } }
]);

// Используя метод countDocuments(), вывести ко-во заблокированных юзеров с балансом от 10 до 1000 EUR
db.users.countDocuments(
    { is_blocked: true, balance: { $gte: 10, $lte: 1000 } }
);

// Используя метод aggregate(), вывести ко-во незаблокированных юзеров не из Germany и не из France с балансом до 1000 EUR
db.users.aggregate([
    {
        $match:
            {
                is_blocked: { $ne: true },
                country: { $nin: ['Germany', 'France'] },
                balance: { $lte: 1000 }
            }
    },
    { $count: 'unblocked_users' }
]);

// Также очень коротко опишите, как работает агрегация в MongoDB
// Агрегация в MongoDB работает с помощью фреймворка pipeline. Мы отдаём на вход определённые документы, а на выходе получаем уже
// результат агрегации, который был получен благодаря разным этапам обработки pipeline. В основном, pipeline представлены в виде
// функций или фильтраций.