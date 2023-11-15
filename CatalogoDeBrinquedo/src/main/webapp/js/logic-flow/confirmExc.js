/**
 * Excluindo itens
 * @author Daniel Isida, Mateus Donato e Vitoria Neris
 */

const deleteButtons = document.querySelectorAll('.exc-item');

deleteButtons.forEach(deleteButton => {
	deleteButton.addEventListener('click', (e) => {
		e.preventDefault();
		const actualItem = e.target.parentElement.parentElement.querySelector('input[name="txtCodigo"]').value;
		const resposta = window.confirm("Deseja realmente deletar este produto?");

		if (resposta) {
			e.target.parentElement.parentElement.querySelector('#form-exc').submit();
			alert('O item "' + actualItem + '" foi deletado com sucesso.')
		}
	});
});