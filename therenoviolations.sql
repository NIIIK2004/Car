-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Янв 22 2024 г., 08:33
-- Версия сервера: 10.4.28-MariaDB
-- Версия PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `therenoviolations`
--

-- --------------------------------------------------------

--
-- Структура таблицы `statements`
--

CREATE TABLE `statements` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `registration_number_car` varchar(255) DEFAULT NULL,
  `status` enum('NEW','CONFIRMED','REJECTED') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `statements`
--

INSERT INTO `statements` (`id`, `user_id`, `description`, `registration_number_car`, `status`) VALUES
(1, 1, 'asdas', 'asda', 'CONFIRMED'),
(2, 2, 'dasdasdasd', 'aasdas', 'REJECTED'),
(3, 2, '“Описание: Моя проблема в том что я неправильно припарковался возьмите с меня штраф пожалуйста\r\nЧестно говоря не знаю что еще сюда писать для объёмности текста пам”', 'F888FF', 'CONFIRMED'),
(4, 1, '', 'фывывфывфы', 'CONFIRMED'),
(5, 2, '', 'А777АА22', 'NEW'),
(6, 2, ' Короче не понял ничегоКороче не понял ничегоКороче не понял ничегоКороче не понял ничегоКороче не понял ничегоКороче не понял ничегоКороче не понял ничегоКороче не понял ничегоКороче не понял ничего', 'А777АА22', 'REJECTED'),
(7, 3, 'ArtemArtemArtemArtemArtemArtemArtemArtemArtemArtem', 'А777АА22', 'CONFIRMED'),
(8, 2, 'Короче наделал дел всем сор и респек\r\n', 'А777АА22', 'CONFIRMED'),
(9, 2, 'А777АА22А777АА22А777АА22А777АА22А777АА22', 'А777АА22', 'CONFIRMED');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `othesctvo` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `telefon` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `othesctvo`, `password`, `surname`, `telefon`, `username`) VALUES
(1, 'nikitaxxx840@gmail.com', 'Никита', 'Валерьевич', '$2a$10$zNosleOdb4s99jeElDzHDua82Ik0v/F0R1VnaqfKn1MZ4CQWYMI0u', 'Мешков', '79951828455', 'admin'),
(2, 'nikitaxxx840@gmail.com', 'Никита', 'Валерьевич', '$2a$10$6OUv/Jjd0ZuEV81U7qrYwu1rZOniSxLCRX.o3kejTugmV.VN1C7Jq', 'Мешков', '79995182845596', 'user'),
(3, 'nikitaxxx840@gmail.com', 'Артем', 'Юрьевич', '$2a$10$8IcK.mQoSnfULKSjk8NEk.naBIYRZT3Zmepyo2CQl6witz8nV2j6K', 'Сурин', '79951828455', 'Artem'),
(4, 'admi12n@gmail.com', 'Пользователь', 'Неважно', '$2a$10$cNQ8BG.Bpw84ugTvis7T0uOAUi4vcNmM5HWmUposTS2IOrjebYZmy', 'Новый', '79951828455', 'admin123');

-- --------------------------------------------------------

--
-- Структура таблицы `users_roles`
--

CREATE TABLE `users_roles` (
  `user_id` bigint(20) NOT NULL,
  `roles` enum('USER','ADMIN') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `roles`) VALUES
(1, 'ADMIN'),
(2, 'USER'),
(3, 'USER'),
(4, 'USER');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `statements`
--
ALTER TABLE `statements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK410sa0tqjk3c6544k8wxnwbrw` (`user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users_roles`
--
ALTER TABLE `users_roles`
  ADD KEY `FK2o0jvgh89lemvvo17cbqvdxaa` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `statements`
--
ALTER TABLE `statements`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `statements`
--
ALTER TABLE `statements`
  ADD CONSTRAINT `FK410sa0tqjk3c6544k8wxnwbrw` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
