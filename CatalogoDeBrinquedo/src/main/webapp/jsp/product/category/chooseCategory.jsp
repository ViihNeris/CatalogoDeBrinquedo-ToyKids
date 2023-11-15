<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="br.edu.catalogo.model.Brinquedo"%>
<%@ page import="br.edu.catalogo.model.Category"%>
<%@ page import="br.edu.catalogo.dao.BrinquedoDAO"%>
<%@ page import="br.edu.catalogo.dao.CategoryDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../../../css/style.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="../../../css/pages-table.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../../../css/carousel.css"
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
<link rel="shortcut icon" type="imagex/png"
	href="../../../images/toyKids.ico">
<script src="../../../js/product/redirect-to-details.js" defer></script>
<title>Categorias | ToyKids</title>
</head>
<body>
	<header>
		<nav
			class="navbar navbar-expand-sm navbar-toggleable-sm border-bottom box-shadow">
			<div class="container-fluid">
				<a class="navbar-brand text-dark p-3 typ-logo"
					style="font-size: 30px" href="../../../index.jsp"> <img
					src="../../../images/toyKids.png" />ToyKids<br> <span
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
							href="../../../index.jsp"
							style="font-size: 20px; text-decoration: none">Home</a></li>
						<li class="nav-item actualNav">
							<form method="post" action="../../../ServletBrinquedo?cmd=cat"
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
							href="../../../jsp/showData/checkUserToAllToys.jsp"
							style="font-size: 20px; text-decoration: none">Administração</a></li>
						<li class="nav-item na"><a class="nav-link text-dark"
							href="../../../jsp/sobre.jsp"
							style="font-size: 20px; text-decoration: none">Sobre</a></li>
					</ul>
				</div>
			</div>
			<a href="../../authentication/login.jsp"><button type="button"
					class="btn btn-primary" style="margin-right: 20px">Login</button></a>
		</nav>
	</header>
	<div class="container">
		<main role="main" class="pb-3"
			style="background: none; text-align: center; margin-top: 5%;">
			<h1>Categorias</h1>
			<p>Escolha uma das categorias abaixo e visualize seus respectivos
				itens.</p>

			<section class="grid-container">
				<%
				CategoryDAO categoryDAO = new CategoryDAO();
				List<Category> allCategories = categoryDAO.searchCategory();
				int count = 0;
				for (Category category : allCategories) {
				%>
				<div class="all-infos mt-5">
					<div class="infos" style="max-height: 200px">
						<div class="infos-object"
							onclick="submitForm('<%=category.getNameCategory()%>')"
							style="cursor: pointer; padding: 20px; background: white; width: 65%; border-radius: 8px; float: left; margin-right: 2%; height: 200px;">
							<img alt="<%=category.getImageCategory()%>"
								src="<%=category.getImageCategory()%>" width="120vw"
								height="200px" style="object-fit: cover" draggable="false">
							<div>
								<h2 style="font-size: 150%; margin-top: 8px"><%=category.getNameCategory()%></h2>
							</div>
						</div>
						<form id="form_<%=category.getNameCategory()%>" method="post"
							action="../../../ServletBrinquedo?cmd=categMural"
							enctype="multipart/form-data">
							<input type="hidden" name="categ-name"
								value="<%=category.getNameCategory()%>" />
						</form>
					</div>
				</div>
				<%
				}
				%>
			</section>
		</main>
	</div>

	<footer style="position: absolute">
		<div class="container p-3">
			&copy; 2023 - <b>ToyKids</b> - 4ºC | ADS - <a
				href="../../../jsp/sobre.jsp" class="linkFooter">Conheça os
				desenvolvedores</a>
		</div>
	</footer>
</body>
</html>