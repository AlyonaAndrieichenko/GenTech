// В рамках БД "190923_MUSIC" напишите след/запросы:
// Вывести заголовки статей без тега test
db.articles.find(
    { tags: { $ne: 'test' } },
    { title: 1, _id: 0 }
);

// Вывести статьи у которых есть теги spring и joy (оба тега)
db.articles.find(
    { tags: { $all: ['spring', 'joy'] } },
    {}
);

// Удалить у всех статей теги test1 и test2
db.articles.updateMany(
    {},
    { $pullAll: { tags: ['test1', 'test2'] } }
);

// Добавить к статьям с тегом spring тег awesome и поле is_checked со значением true
db.articles.updateMany(
    { tags: 'spring' },
    { $addToSet: { tags: 'awesome' }, $set: { is_checked: true } }
);