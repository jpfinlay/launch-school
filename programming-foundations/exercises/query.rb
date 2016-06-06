# query.rb: a program to find items from an array of hashes

PRODUCTS = [
  { name: "Thinkpad x210", price: 220 },
  { name: "Thinkpad x220", price: 250 },
  { name: "Thinkpad x250", price: 979 },
  { name: "Thinkpad x230", price: 300 },
  { name: "Thinkpad x230", price: 330 },
  { name: "Thinkpad x230", price: 350 },
  { name: "Thinkpad x240", price: 700 },
  { name: "Macbook Leopard", price: 300 },
  { name: "Macbook Air", price: 600 },
  { name: "Macbook Pro", price: 700 },
  { name: "Macbook", price: 1449 },
  { name: "Dell Latitude", price: 200 },
  { name: "Dell Latitude", price: 650 },
  { name: "Dell Inspiron", price: 300 },
  { name: "Dell Inspiron", price: 450 }
]

# A couple of example search queries
query = {
  price_min: 240,
  price_max: 280,
  q: 'thinkpad'
}

query2 = {
  price_min: 300,
  price_max: 600,
  q: = 'dell'
}

# My original attempt... very long-winded. Poor solution
def bad_search(query)
  query[:q].capitalize!
  price_range = query[:price_min]..query[:price_max]

  results = []

  PRODUCTS.each do |product|
    if product[:name].split(' ')[0] == query[:q] && price_range.cover?(product[:price])
      results << product
    end
  end

  results.empty? ? "Sorry your query returned no results" : results
end

# Much better solution!
def search(query)
  PRODUCTS.select do |element|
    (query[:price_min]..query[:price_max]).include?(element[:price]) && (element[:name].downcase.include?(query[:q])
  end
end

search(query)
# [ { name: "Thinkpad x220", price: 250 } ]

search(query2)
# [ { name: "Dell Inspiron", price: 300 }, { name: "Dell Inspiron", price: 450 } ]
