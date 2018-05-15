function cities = generate_cities(n)

cities = rand([2 n])
save('data.mat', 'cities')

end