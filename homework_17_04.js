//В рамках БД 190923_MUSIC напишите следующие запросы:

//Вывести среднюю реакцию по всем трекам
db.reactions.aggregate([
    {
        $group: {
            _id: null,
            avg_value: { $avg: '$value' }
        }
    }
])

//Вывести среднюю реакцию по всем трекам с авторами (треков) из USA
db.reactions.aggregate([
    {
        $lookup: {
            from: 'tracks',
            localField: 'track_id',
            foreignField: '_id',
            as: 'track'
        }
    },
    { $unwind: '$track' },
    {
        $lookup: {
            from: 'users',
            localField: 'track.author_id',
            foreignField: '_id',
            as: 'track_author'
        }
    },
    { $unwind: '$track_author' },
    { $match: { 'track_author.country': 'USA' } },
    {
        $group: {
            _id: null,
            avg_value: { $avg: '$value' }
        }
    }
])


//Увеличить баланс всех незаблокированных юзеров на 0.5%
db.users.updateMany(
    { is_blocked: { $ne: true } },
    { $mul: { balance: 1.005 } }
)

//Вывести ко-во реакций с оценкой 4
db.reactions.countDocuments(
    { value: 4 }
)


//Вывести три произвольных названия треков юзеров не из Germany
db.tracks.aggregate([
    {
        $lookup: {
            from: 'users',
            localField: 'author_id',
            foreignField: '_id',
            as: 'author'
        }
    },
    { $unwind: '$author' },
    { $match: { 'author.country': { $ne: 'Germany' } } },
    { $sample: { size: 3 } },
    { $project: { title: 1, _id: 0 } }
])


//Вывести имена юзеров, у которых есть треки
db.users.aggregate([
    {
        $lookup: {
            from: 'tracks',
            localField: '_id',
            foreignField: 'author_id',
            as: 'track'
        }
    },
    { $match: { track: { $ne: [] } } },
    { $project: { fullname: 1, _id: 0 } }
])
// только в такой извращённый способ получилось вывести так, что бы не было дублей

//Используя метод aggregate(), вывести ко-во юзеров с балансом до 1000 EUR (вкл.)
db.users.aggregate([
    { $match: { balance: { $lte: 1000 } } },
    { $count: 'users_with_balance_till_1000' }
])