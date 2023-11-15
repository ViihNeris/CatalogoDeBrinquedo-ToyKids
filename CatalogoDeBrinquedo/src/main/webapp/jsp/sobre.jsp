<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="br.edu.catalogo.model.Brinquedo"%>
<%@ page import="br.edu.catalogo.dao.BrinquedoDAO"%>
<!DOCTYPE html>
<html>
<head>
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
<title>Sobre | ToyKids</title>
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
						<li class="nav-item na">
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
						<li class="nav-item na"><a class="nav-link text-dark"
							href="../jsp/showData/checkUserToAllToys.jsp"
							style="font-size: 20px; text-decoration: none">Administração</a></li>
						<li class="nav-item actualNav"><a class="nav-link text-dark"
							href="../jsp/sobre.jsp"
							style="font-size: 20px; text-decoration: none">Sobre</a></li>
					</ul>
				</div>
			</div>
			<a href="./authentication/login.jsp"><button type="button"
					class="btn btn-primary" style="margin-right: 20px">Login</button></a>
		</nav>
	</header>

	<section class="container" style="margin-top: 5%">
		<main role="main" class="pb-3">
			<h1>Conheça nossa Equipe</h1>
			<p>Saiba mais sobre os desenvolvedores deste projeto!</p>
			<section style="display: flex; margin-top: 10%">
				<div class="w-100 text-center">
					<img class="mb-3" style="width: 40%"
						src="../images/about/perfil2.png" />
					<p>
						<i>Daniel Augusto Isida | 29966591</i>
					</p>

					<section
						class="links d-flex text-center w-100 justify-content-center">
						<div
							style="display: flex; justify-content: space-around; width: 10vw;">
							<div style="display: block; height: 100px;">
								<a href="https://www.linkedin.com/in/daniel-isida/"
									class="img-icon" target="_blank"> <img
									class="mb-3 social-media" style="max-width: 20%;"
									src="../images/about/linkedin.webp" />
								</a>
								<p style="font-size: 12px; font-weight: bold;">Linkedin</p>
							</div>
						</div>
					</section>
				</div>
				<div class="w-100 text-center">
					<img class="mb-3" style="width: 40%"
						src="../images/about/perfil1.png" />
					<p>
						<i>Mateus Donato Vieira | 29917352</i>
					</p>

					<section
						class="links d-flex text-center w-100 justify-content-center">
						<div
							style="display: flex; justify-content: space-around; width: 10vw;">
							<div style="display: block; height: 100px;">
								<a href="https://www.linkedin.com/in/mateus-vieira-179129189/"
									class="img-icon" target="_blank"> <img
									class="mb-3 social-media" style="max-width: 20%;"
									src="../images/about/linkedin.webp" />
								</a>
								<p style="font-size: 12px; font-weight: bold;">Linkedin</p>
							</div>
						</div>
					</section>
				</div>

				<div class="w-100 text-center">
					<img class="mb-3" style="width: 40%"
						src="../images/about/perfil3.png" />
					<p>
						<i>Vitoria Neris Mendes da Silva | 29532132</i>
					</p>

					<section
						class="links d-flex text-center w-100 justify-content-center">
						<div
							style="display: flex; justify-content: space-around; width: 10vw;">
							<div style="display: block">
								<a href="https://github.com/ViihNeris" class="img-icon"
									target="_blank"> <img class="mb-3 social-media"
									style="max-width: 40%;" src="../images/about/github.png" />
								</a>
								<p style="font-size: 12px; font-weight: bold;">Github</p>
							</div>
							<div style="display: block; height: 100px;">
								<a href="https://www.linkedin.com/in/vitorianeris/"
									class="img-icon" target="_blank"> <img
									class="mb-3 social-media" style="max-width: 40%;"
									src="../images/about/linkedin.webp" />
								</a>
								<p style="font-size: 12px; font-weight: bold;">Linkedin</p>
							</div>
						</div>
					</section>
				</div>
		</main>
	</section>

	<footer style="position: absolute">
		<div class="container p-3">
			&copy; 2023 - <b>ToyKids</b> - 4ºC | ADS - <a href="./sobre.jsp"
				class="linkFooter">Conheça os desenvolvedores</a>
		</div>
	</footer>
</body>
</html>