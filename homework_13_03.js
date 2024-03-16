// В рамках БД 190923_MUSIC напишите след/запросы:
// Заблокировать юзеров не из France с балансом от 200 до 500 EUR
db.users.updateMany(
    { country: { $ne: 'France' }, balance: { $gte: 200, $lte: 500 } },
    { $set: { is_blocked: true } }
);

// Вывести имена и баланс незаблокированных юзеров из Germany и France
db.users.find(
    { is_blocked: { $ne: true }, country: { $in: ['Germany', 'France'] } },
    { fullname: 1, balance: 1, _id: 0 }
);

// Разблокировать юзеров из UK и Germany с положительным балансом
db.users.updateMany(
    { country: { $in: ['UK', 'Germany'] }, balance: { $gt: 0 } },
    { $unset: { is_blocked: null } }
);

// Увеличить баланс на 3.5% и разблокировать всех юзеров из UK с положительным балансом
db.users.updateMany(
    { country: 'UK', balance: { gt: 0 } },
    { $mul: { balance: 1.035 }, $unset: { is_blocked: null } }
);

// Уменьшить баланс на 20 EUR всех юзеров из France с балансом от 500 EUR и более
db.users.updateMany(
    { country: 'France', balance: { $gte: 500 } },
    { $inc: { balance: -20 } }
);