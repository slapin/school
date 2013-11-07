-- $Name: School$
-- $Version: 0.0$

instead_version "1.9.1"

require "xact" -- подключаем модуль xact
require "hideinv" -- подключаем модуль hideinv
require "para" -- догадайтесь, что мы подключили в этот раз ;)
require "dash" -- подключаем dash
-- require "quotes" -- подключаем quotes

game.act = 'Не получается.';
game.inv = 'Гм.. Странная штука..';
game.use = 'Не сработает...';

main = room {
        forcedsc = true,
        nam = "Школа",
        dsc = [[Самый обычный день, зимнее солнце мягко ласкает окружающий
	пейзаж. Я смотрю на вход своей новой школы. Стальные ворота, КПП,
	колючая проволока - не остается никаких сомнений. Появившийся охранник
	оглядел меня с головы до ног сквозь решетчятую дверь и молча открыл
	ее, приглашая меня {next|зайти внутрь}.]],
        obj = {
                xact('next', code[[walk(lobby);]]),
        },
	hideinv = true,

};

woodstick = obj {
                
        nam = 'Палка',
        dsc = [[Под ногами валяется {палка} метрового размера.]],
        tak = [[Вы подобрали палку.]],
        inv = [[Палка как палка...]],

};

lobby = room {
	forcedsc = true,
	nam = "Холл",
	dsc = [[Огромный, плохо освещенный зал, обставленный старой
	        мебелью.]],
	way = {
		'ladder',
		'elevator',
		'corridor',
	},
}

ladder = room {
	forcedsc = true,
	nam = "Лестница",
	dsc = [[Лестница терялась в темноте, тусклые лампы едва
	        позволяют угадывать очертания предметов]],
	way = {
		'lobby',
	},
}

elevator = room {
	forcedsc = true,
	nam = "Лифты",
	dsc = [[Три двери лифта приглашают подняться на любой этаж.]],
	way = {
		'lobby',
	},
	obj = {
		'lift_button1',
		'lift_button2',
		'lift_button3',
	}
}
lift_button1 = obj {
	nam = "Кнопка вызова лифта 1",
	dsc = "{кнопка} вызова лифта 1",
	act = code[[walk(floor_index)]]
}
lift_button2 = obj {
	nam = "Кнопка вызова лифта 2",
	dsc = "{кнопка} вызова лифта 2",
	act = code[[walk(floor_index)]]
}
lift_button3 = obj {
	nam = "Кнопка вызова лифта 3",
	dsc = "{кнопка} вызова лифта 3",
	act = code[[walk(floor_index)]]
}

noroom = room {
	nam = "Ничего",
	dsc = [[Пока ничего нет]],
	way = {
		'floor_index',
	},
}
dorm1_floor = noroom
dorm2_floor = noroom
dorm3_floor = noroom
dorm4_floor = noroom
library_floor = noroom
cafeteria_floor = noroom
studies1_floor = noroom
studies2_floor = noroom
studies3_floor = noroom
studies4_floor = noroom
studies5_floor = noroom
studies6_floor = noroom
hospital_floor = noroom
x_floor = noroom
y_floor = noroom
z_floor = noroom
floor_index = room {
	entered = [[Я вошел в тускло освещенную кабину]],
	nam = "В лифте",
	dsc = [[Я нахожусь в лифте и разглядываю кнопки. Часть этажей, судя по
	всему размещалась под землей. Почти все кнопки были подписаны, кроме трех.]],
	act = function (s, w)
		local transfer = {
			["-4"] = dorm1_floor,
			["-3"] = dorm2_floor,
			["-2"] = dorm3_floor,
			["-1"] = dorm4_floor,
			["G"] = library_floor,
			["1"] = cafeteria_floor,
			["2"] = studies1_floor,
			["3"] = studies2_floor,
			["4"] = studies3_floor,
			["5"] = studies4_floor,
			["6"] = studies5_floor,
			["7"] = studies6_floor,
			["8"] = hospital_floor,
			["9"] = x_floor,
			["10"] = y_floor,
			["11"] = z_floor,
		}
		p[[Кабина пришла в движение.]]
		walk(transfer[w])
		return
	end,
	obj = {
		vobj("-4", "{-4} Общежитие^"),
		vobj("-3", "{-3} Общежитие^"),
		vobj("-2", "{-2} Общежитие^"),
		vobj("-1", "{-1} Общежитие^"),
		vobj("G", [[{G} Библиотека^]]),
		vobj("1",[[{1} Кафетерий^]]),
		vobj("2",[[{2} Комнаты для занятий^]]),
		vobj("3",[[{3} Комнаты для занятий^]]),
		vobj("4",[[{4} Комнаты для занятий^]]),
		vobj("5",[[{5} Комнаты для занятий^]]),
		vobj("6",[[{6} Комнаты для занятий^]]),
		vobj("7",[[{7} Комнаты для занятий^]]),
		vobj("8",[[{8} Госпиталь^]]),
		vobj("9",[[{9}^]]),
		vobj("10",[[{10}^]]),
		vobj("11",[[{11}^]]),
	}
}

corridor = room {
	forcedsc = true,
	nam = "Коридор",
	dsc = [[Длинный коридор с высокими потолками освещен единственной
	тусклой лампочкой, свет от которой теряется где-то вверху, а на полу и
	на стенах видны прыгающие тени мотыльков.]],
	way = {
		'lobby',
	},
}

