#!/bin/bash

# Определяем количество чисел
num_count=150

# Создаем файл numbers.txt и записываем в него 150 случайных чисел
> numbers.txt
for ((i=0; i<num_count; i++)); do
  # Генерируем случайное число от 0 до 100
  random_number=$(od -An -N2 -tu2 /dev/random | tr -d ' ')
  # Записываем число в файл
  echo $random_number >> numbers.txt
done

echo "Файл numbers.txt создан с $num_count случайными числами."
