<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="br.edu.catalogo.model.Brinquedo"%>
<%@ page import="br.edu.catalogo.dao.BrinquedoDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../../css/style.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="../../css/product-style.css" media="screen" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="shortcut icon" type="imagex/png"
	href="../../images/toyKids.ico">
<script src="../../js/product/redirect-to-details.js" defer></script>
<title>Item | ToyKids</title>
</head>
<body>
	<header>
		<nav
			class="navbar navbar-expand-sm navbar-toggleable-sm border-bottom box-shadow">
			<div class="container-fluid">
				<a class="navbar-brand text-dark p-3 typ-logo"
					style="font-size: 30px" href="../../index.jsp"> <img
					src="../../images/toyKids.png" />ToyKids<br> <span
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
							href="../../index.jsp"
							style="font-size: 20px; text-decoration: none">Home</a></li>
						<li class="nav-item na">
							<form method="post" action="../../ServletBrinquedo?cmd=cat"
								enctype="multipart/form-data">
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
						<li class="nav-item na"><a class="nav-link text-dark"
							href="../../jsp/showData/checkUserToAllToys.jsp"
							style="font-size: 20px; text-decoration: none">Administração</a></li>
						<li class="nav-item na"><a class="nav-link text-dark"
							href="../../jsp/sobre.jsp"
							style="font-size: 20px; text-decoration: none">Sobre</a></li>
					</ul>
				</div>
			</div>
			<a href="../authentication/login.jsp"><button type="button"
					class="btn btn-primary" style="margin-right: 20px">Login</button></a>
		</nav>
	</header>

	<section class="container" style="margin-top: 3%">
		<main role="main" class="pb-3">
			<%
			BrinquedoDAO daoToy = new BrinquedoDAO();
			int itemId = Integer.parseInt(request.getParameter("id"));
			Brinquedo toy = daoToy.procurarBrinquedo(itemId);
			%>
			<h1>
				Catálogo de Brinquedos |
				<%=toy.getCategoria()%>
				|
				<%=toy.getDescricao()%></h1>
			<p>Visualize abaixo as informações do item!</p>

			<div class="all-infos">
				<div class="infos" style="height: 55vh">
					<div class="d-flex" style="padding: 15px">
						<%
						String pathImage;
						if (toy.getImagem().contains("http")) {
							pathImage = toy.getImagem();
						} else if (!toy.getImagem().equals("")) {
							pathImage = "../../images/items/" + toy.getImagem();
						} else {
							pathImage = "https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg";
						}
						%>
						<img src="<%=pathImage%>" width="30%"
							style="margin-right: 20px; max-height: 225px; object-fit: cover" />
						<div>
							<p style="margin: 0">
								Código:
								<%=itemId%></p>
							<h2><%=toy.getDescricao()%></h2>
							<p>
								<b>R$ <%=toy.getValor()%></b>
							</p>
						</div>
					</div>
					<div></div>
					<textarea rows="4" cols="50"
						style="min-height: 250px; max-height: 295px; width: 100%; font-size: 20px; padding: 15px; text-align: justify;"
						disabled><%=toy.getDetalhes()%></textarea>
				</div>
			</div>
			<div class="d-flex justify-content-center w-100 text-center">
				<div>
					<a class="btn btn-dark" href="../../index.jsp"
						style="margin-right: 13px; width: 8rem;">Página Inicial</a>
				</div>
				<div>
					<a class="btn btn-dark"
						href="../../jsp/product/category/chooseCategory.jsp"
						style="width: 14rem;">Visualizar todas categorias</a>
				</div>
			</div>
		</main>
	</section>
	<footer style="position: absolute">
		<div class="container p-3">
			&copy; 2023 - <b>ToyKids</b> - 4ºC | ADS - <a href="../sobre.jsp"
				class="linkFooter">Conheça os desenvolvedores</a>
		</div>
	</footer>
</body>
</html>