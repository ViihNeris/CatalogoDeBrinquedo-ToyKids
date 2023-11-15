/**
 * Atualizando dados dos itens
 * @author Daniel Isida, Mateus Donato e Vitoria Neris
 */

const fieldItem = document.getElementById('cod');
const fieldCat = document.getElementById('catValue');
const decimalInput = document.getElementById('txtValor');
const updateButton = document.getElementById('updateData');

updateButton.onclick = (e) => {
	e.preventDefault();
	formatDecimal(decimalInput);
	alert('Os dados do item "' + fieldItem.value + '" foram atualizados com sucesso.');
	document.getElementById("form-update").submit();
}

function formatDecimal(input) {
	// Remove caracteres não numéricos, exceto ponto e vírgula
	let sanitizedValue = input.value.replace(/[^0-9,.]/g, '');
	sanitizedValue = sanitizedValue.replace(',', '.');
	let numericValue = parseFloat(sanitizedValue);
	numericValue = isNaN(numericValue) ? 0 : numericValue.toFixed(2);
	input.value = numericValue;
}