monthes = { 
  jan: 31,
  feb:  28,
  march: 31,
  apr: 30,
  may: 31,
  june: 30,
  july: 31,
  aug: 31,
  sept:30,
  oct: 31,
  nov: 30,
  dec: 31
}

monthes.each do |a, b|
	puts a, b if b == 30
end
