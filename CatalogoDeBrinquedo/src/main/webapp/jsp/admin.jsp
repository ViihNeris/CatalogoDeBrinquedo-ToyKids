<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="br.edu.catalogo.model.Brinquedo"%>
<%@ page import="br.edu.catalogo.dao.BrinquedoDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/pages-table.css"
	media="screen" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="shortcut icon" type="imagex/png" href="../images/toyKids.ico">
<script src="../js/product/redirect-to-details.js" defer></script>
<title>Administração - Catálogo | ToyKids</title>
</head>
<body>
	<header>
		<nav
			class="navbar navbar-expand-sm navbar-toggleable-sm border-bottom box-shadow">
			<div class="container-fluid">
				<a class="navbar-brand text-dark p-3 typ-logo"
					style="font-size: 30px" href="../index.jsp"> <img
					src="../images/toyKids.png" />ToyKids<br> <span
					style="display: flex; font-size: 12px; color: rgb(221, 131, 32); justify-content: center; height: 1vh; padding-left: 2vw;">
						<b>Alegria em Brincar</b>
				</span>
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target=".navbar-collapse">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div
					class="navbar-collapse collapse d-sm-inline-flex justify-content-between">
					<ul class="navbar-nav flex-grow-1 menu">
						<li class="nav-item na"><a class="nav-link text-dark"
							href="../index.jsp"
							style="font-size: 20px; text-decoration: none">Home</a></li>
						<li class="nav-item">
							<form method="post" action="../ServletBrinquedo?cmd=cat" enctype="multipart/form-data">
								<%
								BrinquedoDAO daoClass = new BrinquedoDAO();
								List<String> categories = daoClass.getAllCategories();
								%>
								<select name="txtCategoria" onchange="handleChange(this)"
									style="font-size: 20px; text-transform: capitalize;">
									<option disabled selected>Categorias</option>
									<%
									for (String category : categories) {
									%>
									<option value="<%=category%>"><%=category%></option>
									<%
									}
									%>
									<option value="fixedOption"
										style="font-weight: 600; color: skyblue;">Todas</option>
								</select>
							</form>
						</li>
						<li class="nav-item actualNav"><a class="nav-link text-dark"
							href="./admin.jsp" style="font-size: 20px; text-decoration: none">Administração</a></li>
						<li class="nav-item na"><a class="nav-link text-dark"
							href="./sobre.jsp" style="font-size: 20px; text-decoration: none">Sobre</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<div class="container">
		<main role="main" class="pt-5">
			<%
			List<Brinquedo> lista = new ArrayList<Brinquedo>();
			lista = (ArrayList) request.getAttribute("brinquedoList");
			%>
			<h1>Lista de Brinquedos</h1>
			<p>
				Você está visualizando <b><span>TODOS</span></b> os
				itens cadastrados até o momento.
			</p>
			<table class="table table-hover table-striped" width="60%" border="1"
				style="background: #fff">
				<thead class="thead-light">
					<tr>
						<th scope="col" class="p-3 text-center"><b>Codigo</b></th>
						<th scope="col"><b>Descrição</b></th>
						<th scope="col"><b>Categoria</b></th>
						<th scope="col"><b>Marca</b></th>
						<th scope="col"><b>Imagem</b></th>
						<th scope="col" class="text-left"><b>Valor</b></th>
						<th scope="col"><b>Detalhes</b></th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Brinquedo a : lista) {
					%>
					<tr>
						<td class="text-center"><b><%=a.getCodigo()%></b></td>
						<td><%=a.getDescricao()%></td>
						<td><%=a.getCategoria()%></td>
						<td><%=a.getMarca()%></td>
						<td><img src="<%=a.getImagem()%>"></td>
						<td class="text-left">R$ <%=a.getValor()%></td>
						<td><%=a.getDetalhes()%></td>

					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<div class="d-flex mt-5 justify-content-center w-100 text-center">
				<div>
					<a class="btn btn-dark mt-5 mb-5" href="./index.jsp"
						style="width: 13rem">Página Inicial</a>
				</div>
			</div>
		</main>
	</div>
	<footer>
		<div class="container p-3">
			&copy; 2023 - <b>ToyKids</b> - 4ºC | ADS - <a href="./sobre.jsp"
				class="linkFooter">Conheça os desenvolvedores</a>
		</div>
	</footer>
</body>
</html>