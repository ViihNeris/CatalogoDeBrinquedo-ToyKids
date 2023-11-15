<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="br.edu.catalogo.model.Brinquedo"%>
<%@ page import="br.edu.catalogo.dao.BrinquedoDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/style.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="./css/carousel.css"
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
<link rel="shortcut icon" type="imagex/png" href="./images/toyKids.ico">
<script src="./js/carousel-script.js" defer></script>
<script src="./js/product/redirect-to-details.js" defer></script>
<title>Home | ToyKids</title>
</head>

<body>
	<header>
		<section class="initial-infos">
			<p>
				<i>Bem vindo(a) ao ToyKids!</i> Aceitamos <b>PIX</b>
			</p>
		</section>
		<nav
			class="navbar navbar-expand-sm navbar-toggleable-sm border-bottom box-shadow"
			style="position: fixed; left: 0; top: 0; min-width: 100%; margin-top: 3.5vh">
			<div class="container-fluid">
				<a class="navbar-brand text-dark p-3 typ-logo"
					style="font-size: 30px" href="./index.jsp"> <img
					src="./images/toyKids.png" />ToyKids<br> <span
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
						<li class="nav-item actualNav"><a class="nav-link text-dark"
							href="./index.jsp" style="font-size: 20px; text-decoration: none">Home</a></li>
						<li class="nav-item na">
							<form method="post" action="ServletBrinquedo?cmd=cat"
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
							href="./jsp/showData/checkUserToAllToys.jsp"
							style="font-size: 20px; text-decoration: none;">Administração</a>
						</li>
						<li class="nav-item na"><a class="nav-link text-dark"
							href="jsp/sobre.jsp"
							style="font-size: 20px; text-decoration: none">Sobre</a></li>
					</ul>
				</div>
			</div>
			<a href="./jsp/authentication/login.jsp"><button type="button"
					class="btn btn-primary" style="margin-right: 20px">Login</button></a>
		</nav>
	</header>
	<section id="home-img"></section>
	<main id="main-index" class="pt-4 text-center">
		<h1>Brinquedos em Destaque</h1>
		<section id="draggable-card-slider">
			<div class="wrapper">
				<i id="left" class="fa-solid fa-angle-left"></i>
				<ul class="carousel">
					<%
					BrinquedoDAO toyDAO = new BrinquedoDAO();
					List<Brinquedo> brinquedosDestaque = toyDAO.getBrinquedosDestaque();

					for (Brinquedo brinquedo : brinquedosDestaque) {

						String pathImage;
						if (brinquedo.getImagem().contains("http")) {
							pathImage = brinquedo.getImagem();
						} else if (!brinquedo.getImagem().equals("")) {
							pathImage = "images/items/" + brinquedo.getImagem();
						} else {
							pathImage = "https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg";
						}
					%>
					<li class="card"
						onclick="redirectToItem(<%=brinquedo.getCodigo()%>)"
						style="cursor: pointer">
						<div class="img">
							<img alt="<%=brinquedo.getDescricao()%>" src="<%=pathImage%>"
								draggable="false">
						</div>
						<h2
							style="max-width: 175px; overflow-y: auto; scroll-behavior: auto; max-height: 50px; min-height: 50px"><%=brinquedo.getDescricao()%></h2>
						<span>R$ <%=brinquedo.getValor()%></span>
					</li>
					<%
					}
					%>
				</ul>
				<i id="right" class="fa-solid fa-angle-right"></i>
			</div>
		</section>
		<img alt="gif divertido, boas vindas!" src="./images/welcome.webp"
			width="150vw" class="mb-5">
	</main>
	<footer style="position: relative;">
		<div class="container p-3">
			&copy; 2023 - <b>ToyKids</b> - 4ºC | ADS - <a href="./jsp/sobre.jsp"
				class="linkFooter">Conheça os desenvolvedores</a>
		</div>
	</footer>
</body>
</html>