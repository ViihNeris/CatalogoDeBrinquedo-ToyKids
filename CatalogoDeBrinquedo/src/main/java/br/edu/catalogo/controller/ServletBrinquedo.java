package br.edu.catalogo.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import br.edu.catalogo.dao.BrinquedoDAO;
import br.edu.catalogo.dao.CategoryDAO;
import br.edu.catalogo.dao.UserDAO;
import br.edu.catalogo.model.Brinquedo;
import br.edu.catalogo.model.Category;
import br.edu.catalogo.model.User;

@WebServlet("/ServletBrinquedo")
@MultipartConfig
public class ServletBrinquedo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Brinquedo brinquedo = new Brinquedo();
	User user = new User();
	Category category = new Category();
	BrinquedoDAO brinquedoDAO;
	UserDAO userDAO;
	CategoryDAO categoryDAO;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		try {
			if (cmd.equals("checkUser") == false) {
				category.setNameCategory(request.getParameter("categ-name"));
				brinquedo.setCategoria(request.getParameter("txtCategoria"));
				brinquedo.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
				if (cmd.equals("incluir") || cmd.equals("atualizar")) {
					brinquedo.setDescricao(request.getParameter("txtDescricao"));
					brinquedo.setMarca(request.getParameter("txtMarca"));
					brinquedo.setValor(Double.parseDouble(request.getParameter("txtValor")));
					brinquedo.setDetalhes(request.getParameter("txtDetalhes"));
				}
			} else {
				user.setUser(request.getParameter("sign-in-user"));
				user.setPassword(request.getParameter("sign-in-password"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		try {
			brinquedoDAO = new BrinquedoDAO();
			userDAO = new UserDAO();
			categoryDAO = new CategoryDAO();
			RequestDispatcher rd = null;
			if (cmd.equalsIgnoreCase("incluir")) {
				rd = request.getRequestDispatcher("ServletBrinquedo?cmd=listar");
			} else if (cmd.equalsIgnoreCase("listar")) {
				List<Brinquedo> brinquedoList = brinquedoDAO.todosBrinquedos();
				request.setAttribute("brinquedoList", brinquedoList);
				rd = request.getRequestDispatcher("jsp/showData/showAllToys.jsp");
			} else if (cmd.equalsIgnoreCase("atu")) {
				brinquedo = brinquedoDAO.procurarBrinquedo(brinquedo.getCodigo());
				HttpSession session = request.getSession(true);
				session.setAttribute("brinquedo", brinquedo);
				rd = request.getRequestDispatcher("jsp/editarBrinquedo.jsp");
			} else if (cmd.equalsIgnoreCase("atualizar")) {
				brinquedoDAO.updateAll(brinquedo);
				rd = request.getRequestDispatcher("ServletBrinquedo?cmd=listar");
			} else if (cmd.equalsIgnoreCase("con")) {
				brinquedo = brinquedoDAO.procurarBrinquedo(brinquedo.getCodigo());
				HttpSession session = request.getSession(true);
				session.setAttribute("brinquedo", brinquedo);
				rd = request.getRequestDispatcher("jsp/consultarBrinquedo.jsp");
			} else if (cmd.equalsIgnoreCase("exc")) {
				brinquedo = brinquedoDAO.procurarBrinquedo(brinquedo.getCodigo());
				HttpSession session = request.getSession(true);
				session.setAttribute("brinquedo", brinquedo);
				rd = request.getRequestDispatcher("jsp/excluirBrinquedo.jsp");
			} else if (cmd.equalsIgnoreCase("excluir")) {
				brinquedoDAO.excluir(brinquedo);
				rd = request.getRequestDispatcher("ServletBrinquedo?cmd=listar");
			} else if (cmd.equalsIgnoreCase("cat")) {
				List<Brinquedo> brinquedoList = new ArrayList<>();
				if (request.getAttribute("categoryList") != null) {
					brinquedoList = brinquedoDAO.procurarCategoria(category.getNameCategory());
				} else {
					brinquedoList = brinquedoDAO.procurarCategoria(brinquedo.getCategoria());
				}
				request.setAttribute("brinquedoList", brinquedoList);
				rd = request.getRequestDispatcher("jsp/mostrarCat.jsp");
			} else if (cmd.equalsIgnoreCase("checkUser")) {
				User findUser = userDAO.searchUser(user);
				if (findUser != null) {
					request.setAttribute("user", findUser);
					HttpSession session = request.getSession(true);
					session.setAttribute("user", findUser);
					rd = request.getRequestDispatcher("ServletBrinquedo?cmd=listar");
				} else {
					response.setContentType("text/html");
					response.setCharacterEncoding("UTF-8");
					PrintWriter out = response.getWriter();
					out.println(
							"<script src=\"http://localhost:8080/CatalogoDeBrinquedo/js/login/authentication.js\">");
					out.println("</script>");
				}
			} else if (cmd.equalsIgnoreCase("categMural")) {
				List<Category> categoryList = categoryDAO.searchCategory();
				request.setAttribute("categoryList", categoryList);
				rd = request.getRequestDispatcher("ServletBrinquedo?cmd=cat");
			}
			// executa a ação de direcionar para a página JSP
			rd.forward(request, response);
		} catch (Exception e) {
			System.out.println("Erro durante a execução. Os dados não foram modificados e/ou acessados.");
			System.out.println(e.getMessage());
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Part filePart = request.getPart("txtImagem");

		if (filePart != null && filePart.getSize() > 0) {
			String fileName = filePart.getSubmittedFileName();
			System.out.println("FileName: " + fileName);
			InputStream fileContent = filePart.getInputStream();

			// Obtenha o diretório do projeto
			String projectDir = getProjectDirectory();
			System.out.println("Project Directory: " + projectDir);

			// Constrói o caminho para armazenar a imagem
			String pathToImage = buildImagePath(projectDir);
			System.out.println("Encaminhando para: " + pathToImage);

			try {
				Path filePath = Paths.get(pathToImage, fileName);
				Files.createDirectories(filePath.getParent());
				Files.copy(fileContent, filePath, StandardCopyOption.REPLACE_EXISTING);

				System.out.println("Imagem armazenada! >> " + filePath);
				brinquedo.setImagem(fileName);
				if (brinquedoDAO.codigoExists(brinquedo.getCodigo())) {
					System.out.println("\nID encontrado. \nAlteração de imagem requisitada.\nRealizando atualização...");
				} else {
					System.out.println("Inserindo novo item...");
					brinquedoDAO.salvarAll(brinquedo);
				}
				fileContent.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		processRequest(request, response);
	}

	private String getProjectDirectory() {
		try {
			File currentJavaFile = new File(
					ServletBrinquedo.class.getProtectionDomain().getCodeSource().getLocation().toURI());
			return currentJavaFile.getParent();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		return null;
	}

	private String buildImagePath(String projectDir) {
		int index = projectDir.indexOf(".metadata");
		String extractedPath = projectDir.substring(index);
		String remainingString = projectDir.replace(extractedPath, "");
		System.out.println("Extrato: " + extractedPath);
		System.out.println("RemainingString: " + remainingString);
		return remainingString + "CatalogoDeBrinquedo\\src\\main\\webapp\\images\\items";
	}
}