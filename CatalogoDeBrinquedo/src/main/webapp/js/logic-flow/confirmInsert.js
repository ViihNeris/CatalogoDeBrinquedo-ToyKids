/**
 * Inserindo itens
 * @author Daniel Isida, Mateus Donato e Vitoria Neris
 */

const fieldItem = document.getElementById('cod');
const decimalInput = document.getElementById('txtValor');
const insertButton = document.getElementById('insertButton');

insertButton.onclick = (e) => {
	e.preventDefault();
	formatDecimal(decimalInput);
	alert('O item "' + fieldItem.value + '" foi cadastrado com sucesso.');
	document.getElementById("form-white").submit();
}

function formatDecimal(input) {
	// Remove caracteres não numéricos, exceto ponto e vírgula
	let sanitizedValue = input.value.replace(/[^0-9,.]/g, '');
	sanitizedValue = sanitizedValue.replace(',', '.');
	let numericValue = parseFloat(sanitizedValue);
	numericValue = isNaN(numericValue) ? 0 : numericValue.toFixed(2);
	input.value = numericValue;
}