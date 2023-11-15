/**
 * Redirecionando o usuário com base no ID do item
 * @author Daniel Isida, Mateus Donato e Vitoria Neris
 */

function redirectToItem(id) {
	window.location.href = "http://localhost:8080/CatalogoDeBrinquedo/jsp/product/product-details.jsp?id=" + id
}

function handleChange(select) {
	if (select.value === 'fixedOption') {
		window.location.href = 'http://localhost:8080/CatalogoDeBrinquedo/jsp/product/category/chooseCategory.jsp';
	} else {
		select.form.submit();
	}
}

function submitForm(categoryName) {
	var formId = 'form_' + categoryName;
	document.getElementById(formId).submit();
}