let nameSort = document.getElementById('lexicographicalSort');
let seatsSort = document.getElementById('numSeatsSort');
let priceRangeSort = document.getElementById('priceRangeSort');
let regionSort = document.getElementById('regionSort');
let citySort = document.getElementById('citySort');

function toggleNameSort() {
    nameSort.style.display = 'inline';
    seatsSort.style.display = 'none';
    priceRangeSort.style.display = 'none';
    regionSort.style.display = 'none';
    citySort.style.display = 'none';
}

function toggleNumSeatsSort() {
    nameSort.style.display = 'none';
    seatsSort.style.display = 'inline';
    priceRangeSort.style.display = 'none';
    regionSort.style.display = 'none';
    citySort.style.display = 'none';
}

function togglePriceRangeSort() {
    nameSort.style.display = 'none';
    seatsSort.style.display = 'none';
    priceRangeSort.style.display = 'inline';
    regionSort.style.display = 'none';
    citySort.style.display = 'none';
}

function toggleRegionSort() {
    nameSort.style.display = 'none';
    seatsSort.style.display = 'none';
    priceRangeSort.style.display = 'none';
    regionSort.style.display = 'inline';
    citySort.style.display = 'none';
}

function toggleCitySort() {
    nameSort.style.display = 'none';
    seatsSort.style.display = 'none';
    priceRangeSort.style.display = 'none';
    regionSort.style.display = 'none';
    citySort.style.display = 'inline';
}