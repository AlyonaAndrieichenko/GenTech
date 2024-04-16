// 1. Завершите описание схемы БД “Приложение доставки блюд из ресторанов”.
// https://dbdiagram.io/d/Restaurant-659e75c2ac844320ae9f4745

// 2. В рамках БД 190923_MUSIC напишите следующие запросы:
// Вывести общее ко-во реакций, используя метод aggregate()
db.reactions.aggregate([
    { $count: 'total_reactions' }
]);

// Вывести данные о реакциях, включая название трека и имя автора
db.reactions.aggregate([
    {
        $lookup: {
            from: 'users',
            localField: 'author_id',
            foreignField: '_id',
            as: 'author'
        }
    },
    {
        $lookup: {
            from: 'tracks',
            localField: 'track_id',
            foreignField: '_id',
            as: 'track'
        }
    },
]);

// как вывести так, что бы подтянулось конкретно имя и название трека, пока не знаю