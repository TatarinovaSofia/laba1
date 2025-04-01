
#!/bin/bash

# Определение путей к файлам
input_files=("/data/1.txt" "/data/2.txt")
output_file="/data/3.txt"

# Проверка существования файлов
for file in "${input_files[@]}"; do
    if [[ ! -f "$file" ]]; then
        echo "Файл $file не найден!"
        exit 1
    fi
    
    if [[ ! -s "$file" ]]; then
        echo "Какой-то текст для $file" > "$file"
    fi
done

# Обработка существующего выходного файла
if [[ -f "$output_file" ]]; then
    read -p "Файл $output_file уже существует. Перезаписать? (y/n) " -n 1 response
    echo
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        echo "Операция отменена пользователем."
        exit 1
    fi
fi

# Объединение файлов
{
    for file in "${input_files[@]}"; do
        echo "Содержимое $file"
        cat "$file"
        echo
    done
} > "$output_file"

echo "Файлы успешно объединены в $output_file"