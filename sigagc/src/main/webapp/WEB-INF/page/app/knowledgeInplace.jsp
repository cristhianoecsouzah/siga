<%@ include file="/WEB-INF/page/include.jsp"%>

<c:choose>
	<c:when test="${not empty conhecimentos}">
		<c:forEach var="conhecimento" items="${conhecimentos}">
			<c:if test="${cadastrante!=null}">
				<a style="float: right;" title="Editar conhecimento"
					href="${linkTo[AppController].editar}?sigla=${conhecimento[3]}&origem=${referer}"
					${popup?'target="_blank"':''}> <img
					src="/siga/css/famfamfam/icons/pencil.png">
				</a>
			</c:if>

			<p style="font-weight: bold">${conhecimento[1]}</p>
			${conhecimento[2]}
		</c:forEach>
	</c:when>
	<c:otherwise>
		<c:if test="${podeCriar}">
			<c:set var="url" scope="request">${linkTo[AppController].editar}?classificacao=${classificacao}&inftitulo=${titulo}&origem=${referer}</c:set>
			<a style="float: right;" title="Registrar um novo conhecimento"
				href="${url}" ${popup?'target="_blank"':''}> <img
				src="/siga/css/famfamfam/icons/add.png">
			</a>
			<c:choose>
				<c:when test="${msgvazio != null}">
					<p>${msgvazio.replaceAll("\\$1", url)}</p>
				</c:when>
				<c:otherwise>
					Nenhum conhecimento relacionado registrado. 
					Clique <a href="${lurl}" ${popup?'target="_blank" ':''}>aqui</a>
					para registrar um novo conhecimento.
				</c:otherwise>
			</c:choose>
		</c:if>
	</c:otherwise>
</c:choose>