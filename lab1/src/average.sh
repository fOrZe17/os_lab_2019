#!/bin/bash

# Проверяем, что передано хотя бы один аргумент
if [ $# -eq 0 ]; then
  echo "Нет аргументов. Пожалуйста, передайте хотя бы один аргумент."
  exit 1
fi

# Инициализируем переменные для суммы и количества аргументов
sum=0
count=0

# Перебираем все аргументы
for arg in "$@"; do
  # Проверяем, что аргумент является числом
  if ! [[ "$arg" =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then
    echo "Аргумент '$arg' не является числом. Пожалуйста, передайте только числовые аргументы."
    exit 1
  fi

  # Добавляем аргумент к сумме
  sum=$(echo "$sum + $arg" | bc)
  count=$((count + 1))
done

# Вычисляем среднее арифметическое
average=$(echo "scale=2; $sum / $count" | bc)

# Выводим количество аргументов и среднее арифметическое
echo "Количество аргументов: $count"
echo "Среднее арифметическое: $average"